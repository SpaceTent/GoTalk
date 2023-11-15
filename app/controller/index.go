package controller

import (
	"errors"
	l "log/slog"
	"math/rand"
	"net/http"
	"time"

	"github.com/SpaceTent/GoTalk/pkg/metrics"
	"github.com/SpaceTent/GoTalk/pkg/web"
)

func Index(w http.ResponseWriter, r *http.Request) {

	tnow := time.Now()
	defer metrics.Log("controller", "Index", tnow)

	// Generates an error for 10% of the Traffic.
	if rand.Intn(100) < 10 {
		e := errors.New("less than 10% error")
		l.With("error", e).Error("less than 10 error")
		metrics.LogError("controller", "Index", e)
	}

	// Generates an error for 20% of the Traffic.
	if rand.Intn(10) < 2 {
		e := errors.New("less than 20% error")
		l.With("error", e).Error("less than 10 error")
		metrics.LogError("controller", "Index", e)
	}

	pageData := make(map[string]any)

	web.Render(w, r, pageData, "index.gohtml")

}
