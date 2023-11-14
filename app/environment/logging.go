package environment

import (
	"fmt"
	l "log/slog"
	"os"
	"strings"
	"time"

	"github.com/lmittmann/tint"
)

var colourMap = map[string]string{
	"F-BLACK":   "\033[1;30m",
	"F-RED":     "\033[1;31m",
	"F-GREEN":   "\033[1;32m",
	"F-YELLOW":  "\033[1;33m",
	"F-BLUE":    "\033[1;34m",
	"F-MAGENTA": "\033[1;35m",
	"F-CYAN":    "\033[1;36m",
	"F-WHITE":   "\033[1;37m",
	"F-NORMAL":  "\033[0;37m", // Normal White (Not Bold )
	"F-RESET":   "\033[0m",
	"B-BLACK":   "\033[1;40m",
	"B-RED":     "\033[1;41m",
	"B-GREEN":   "\033[1;42m",
	"B-YELLOW":  "\033[1;43m",
	"B-BLUE":    "\033[1;44m",
	"B-MAGENTA": "\033[1;45m",
	"B-CYAN":    "\033[1;46m",
	"B-WHITE":   "\033[1;47m",
}

var show_colours = true

func SetUpLogging() {

	if GetEnvString("LOGGING", "text") == "text" {

		show_colours = true
		setUpConsoleLogging()

	} else {

		show_colours = false
		setUpJSONLogging()

	}
}

func setUpConsoleLogging() {

	extra := []l.Attr{}
	extra = append(extra, l.Attr{"version", l.StringValue(VERSION)})
	extra = append(extra, l.Attr{"host", l.StringValue(HOSTNAME)})

	handler := l.New(
		tint.NewHandler(os.Stdout, &tint.Options{
			AddSource:  true,
			Level:      l.LevelDebug,
			TimeFormat: time.DateTime,
			ReplaceAttr: func(groups []string, attr l.Attr) l.Attr {

				if attr.Key == "source" {
					line := strings.Split(attr.Value.String(), "/")
					out := line[len(line)-1]
					out = strings.ReplaceAll(out, ".go", "")
					out = strings.ReplaceAll(out, "}", "")

					attr.Value = l.StringValue(colourReplacement("[[F-GREEN]" + out + "[F-NORMAL]][[F-RED]" + fmt.Sprintf("%d", getGID()) + "[F-NORMAL]]"))
				}

				returnAttr := l.Attr{}
				returnAttr.Key = colourReplacement(attr.Key)
				returnAttr.Value = attr.Value
				return attr

			},
		}).WithAttrs(extra),
	)

	l.SetDefault(handler)

	// Orginal.
	// L = slog.New(slog.NewTextHandler(os.Stdout, &slog.HandlerOptions{AddSource: true, ReplaceAttr: replace}))

}
func setUpJSONLogging() {
	extra := []l.Attr{}
	extra = append(extra, l.Attr{"version", l.StringValue(VERSION)})
	extra = append(extra, l.Attr{"host", l.StringValue(HOSTNAME)})

	handler := l.New(l.NewJSONHandler(os.Stdout, &l.HandlerOptions{AddSource: true}).WithAttrs(extra))

	// set global logger with custom options
	l.SetDefault(handler)
}
func colourReplacement(LogEntryMessage string) string {

	// Does the LogEntryMessage contain any Strings
	// Loop through the ColourMap and Replace all the Strings

	for k, v := range colourMap {
		if show_colours {
			LogEntryMessage = strings.ReplaceAll(LogEntryMessage, "["+k+"]", v)
		} else {
			LogEntryMessage = strings.ReplaceAll(LogEntryMessage, "["+k+"]", "")
		}
	}
	return LogEntryMessage
}
