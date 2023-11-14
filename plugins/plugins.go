package plugins

import (
	"net/url"

	"golang.org/x/text/cases"
	"golang.org/x/text/language"
)

var Plugin = make(map[string]any)

func init() {

	Plugin["IsNil"] = func(value any) string {
		if value != nil {
			return value.(string)
		} else {
			return ""
		}
	}

	Plugin["IsNilWithDefault"] = func(value any, defaultValue any) string {
		if value != nil {
			return defaultValue.(string)
		} else {
			return ""
		}
	}

	Plugin["Capitalise"] = func(in any) string { return cases.Title(language.English).String(in.(string)) }
	Plugin["URLEscape"] = func(in string) string { return url.QueryEscape(in) }
	Plugin["Inc"] = func(i int) int { return i + 1 }
	Plugin["Add"] = func(i1 int, i2 int) int { return i1 + i2 }
	Plugin["Div"] = func(i1 int, i2 int) int {
		if i1 == 0 {
			return 0
		}

		return i2 / i1
	}

}
