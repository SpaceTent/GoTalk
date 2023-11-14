package web

import (
	"fmt"
	l "log/slog"
	"net/http"
	"os"
	"path/filepath"
	"strings"
	"text/template"
	"time"

	"github.com/SpaceTent/GoTalk/app/environment"
	"github.com/SpaceTent/GoTalk/pkg/metrics"
	"github.com/SpaceTent/GoTalk/plugins"
)

func findAndParseTemplates(templateDirectory string, funcMap template.FuncMap) (*template.Template, error) {

	cleanRoot := filepath.Clean(templateDirectory)
	pfx := len(cleanRoot) + 1
	AllTemplates := template.New("")

	err := filepath.Walk(cleanRoot, func(path string, info os.FileInfo, e1 error) error {
		if !info.IsDir() && strings.HasSuffix(path, ".gohtml") {
			if e1 != nil {
				return e1
			}

			b, e2 := os.ReadFile(path)
			if e2 != nil {
				return e2
			}

			name := path[pfx:]
			t := AllTemplates.New(name).Funcs(funcMap)
			_, e2 = t.Parse(string(b))
			if e2 != nil {
				l.With("error", e2).With("template", name).Error("Error parsing template")
				return e2
			}
		}
		return nil
	})

	return AllTemplates, err
}

func Render(w http.ResponseWriter, r *http.Request, pageData map[string]any, templateFile string) {

	tnow := time.Now()
	defer metrics.Log("web-render", templateFile, tnow)

	templateDirectory := environment.GetEnvString("TEMPLATE_PREFIX", "") + "templates"

	templates, err := findAndParseTemplates(templateDirectory, plugins.Plugin)
	if err != nil {
		l.With("error", err).Error("Error loading templates")
		_ = WriteJSON(w, 500, err.Error())
		return
	}

	if pageData == nil {
		pageData = make(map[string]any)
	}

	// Add a Random Seed to Each Render
	pageData["RAND"] = "NoCache"
	if environment.VERSION == "Development" {
		pageData["RAND"] = time.Now().UnixNano()
	}
	pageData["VERSION"] = environment.VERSION

	DebugInfo := ""
	for key, value := range pageData { // range over map
		DebugInfo = DebugInfo + fmt.Sprintf(" K:[F-MAGENTA]%s[F-NORMAL] V:[F-MAGENTA]%v[F-NORMAL]", key, value)
	}

	err = templates.ExecuteTemplate(w, templateFile, pageData)
	if err != nil {
		l.With("error", err).With("templatefile", templateFile).Error("Error loading templates")
		_ = WriteJSON(w, 500, err.Error())
		return
	}
}
