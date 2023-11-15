package metrics

import (
    "time"
    
    "github.com/prometheus/client_golang/prometheus"
)

func Log(area string, method string, t time.Time) {
    
    Timing.With(prometheus.Labels{"area": area, "method": method}).Set(float64(time.Since(t).Milliseconds()))
}

func LogError(area string, method string, err error) {
    
    RunningErrors.With(prometheus.Labels{"area": area, "method": method, "error": err.Error()}).Inc()
    
}

func LogEventCounter(area string, method string) {
    
    LogEvent.With(prometheus.Labels{"area": area, "method": method}).Inc()
    
}
