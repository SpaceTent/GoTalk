package app

import (
    "context"
    "log/slog"
    l "log/slog"
    "net/http"
    _ "net/http/pprof"
    "time"
    
    "github.com/SpaceTent/GoTalk/app/controller"
    "github.com/SpaceTent/GoTalk/app/environment"
    
    "github.com/SpaceTent/GoTalk/pkg/web"
    
    mySQL "github.com/SpaceTent/db/mysql"
    "github.com/go-chi/chi"
    "github.com/go-chi/chi/v5/middleware"
    "github.com/go-chi/httplog"
)

type App struct {
    ctx        context.Context
    listenAddr string
}

func BootStrap(listenAddr string) *App {
    return &App{
        ctx:        context.Background(),
        listenAddr: listenAddr,
    }
}

func (A *App) Start() {
    
    l.Info("Starting GoTalk")
    
    mySQL.New(environment.GetEnvString("DSN", "DSN"), slog.Default())
    
    // Use the Chi Router.  I did use Mux until they announced they were no longer supporting it. Do I go back?
    R := chi.NewRouter()
    R.Use(middleware.RealIP)
    R.Use(middleware.Heartbeat("/health"))
    // Exclude Prometheus from the logging
    R.Use(web.ExcludePrometheus(environment.GetEnvString("PROMETHEUS_ENDPOINT", "/metrics")))
    // Add the TraceID to the request
    R.Use(web.AddTraceID)
    
    // Use the Extending Logging if Running In JSON Mode
    if environment.GetEnvString("LOGGING", "text") != "text" {
        logger := httplog.NewLogger("httplog", httplog.Options{
            JSON: true,
        })
        R.Use(httplog.RequestLogger(logger))
    } else {
        R.Use(middleware.Logger)
    }
    
    // R.Use(middleware.Recoverer)
    R.Use(middleware.Timeout(60 * time.Second))
    
    R.Get("/", controller.Index)
    R.Get("/postcodes", controller.Postcodes)
    R.Post("/postcodes", controller.Postcodes)
    R.Get("/postcodes/view/{id:[0-9]+}", controller.PostcodesView)
    R.Get("/postcodes/dog", controller.PostcodesDog)
    
    R.Handle("/static/*", http.StripPrefix("/static/", http.FileServer(http.Dir(environment.GetEnvString("TEMPLATE_PREFIX", "")+"templates/static"))))
    
    l.With("Bind", A.listenAddr).Info("Starting Server")
    
    svr := http.Server{
        Addr:              A.listenAddr,
        Handler:           R,
        ReadHeaderTimeout: 20 * time.Second,
        ReadTimeout:       15 * time.Second,
        WriteTimeout:      15 * time.Second,
        IdleTimeout:       60 * time.Second,
    }
    
    _ = svr.ListenAndServe()
    
}
