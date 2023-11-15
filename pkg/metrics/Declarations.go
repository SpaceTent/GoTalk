package metrics

import (
	"github.com/prometheus/client_golang/prometheus"
)

var Timing = prometheus.NewGaugeVec(
	prometheus.GaugeOpts{
		Namespace: "SpaceTent",
		Subsystem: "GoTalk",
		Name:      "Timings",
		Help:      "General Timings across the platform",
	},
	[]string{"area", "method"},
)

var RunningErrors = prometheus.NewCounterVec(
	prometheus.CounterOpts{
		Namespace: "SpaceTent",
		Subsystem: "GoTalk",
		Name:      "Errors",
		Help:      "General Errors across the platform",
	},
	[]string{"area", "method", "error"},
)

var LogEvent = prometheus.NewCounterVec(
	prometheus.CounterOpts{
		Namespace: "SpaceTent",
		Subsystem: "GoTalk",
		Name:      "Counters",
		Help:      "General Counters across the platform",
	},
	[]string{"area", "method"},
)

func init() {
	prometheus.MustRegister(Timing)
	prometheus.MustRegister(RunningErrors)
	prometheus.MustRegister(LogEvent)
}
