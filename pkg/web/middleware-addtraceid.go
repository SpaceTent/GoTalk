package web

import (
	"context"
	"net/http"

	"github.com/google/uuid"
)

func AddTraceID(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		ctx := context.WithValue(r.Context(), "TraceID", uuid.New().String())
		next.ServeHTTP(w, r.WithContext(ctx))
	})
}
