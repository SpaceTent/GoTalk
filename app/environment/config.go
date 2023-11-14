package environment

import (
	"bytes"
	l "log/slog"
	"os"
	"runtime"
	"strconv"

	_ "github.com/joho/godotenv/autoload"
)

var HOSTNAME, _ = os.Hostname()
var GITCOMMIT string
var VERSION string
var BUILDTIME string

func SetUpEnv(GitCommit string, Version string, BuildTime string) {

	GITCOMMIT = GitCommit
	VERSION = Version
	BUILDTIME = BuildTime

	if GetEnvString("DSN", "DSN") == "DSN" {
		// The DSN is not set, I don't know how to connect to the database.
		l.Error("DSN is not set, I don't know how to connect to the database.")
		os.Exit(1)
	}

	SetUpLogging()

}

func GetEnvString(key string, EnvDefault string) string {
	if os.Getenv(key) != "" {
		return os.Getenv(key)
	}
	return EnvDefault
}

func GetEnvInt(key string, EnvDefault int) int {
	if os.Getenv(key) != "" {
		i, err := strconv.Atoi(os.Getenv(key))
		if err != nil {
			l.With("error", err).Error("Error converting env to int")
			return EnvDefault
		}
		return i
	}
	return EnvDefault
}

func getGID() uint64 {
	b := make([]byte, 64)
	b = b[:runtime.Stack(b, false)]
	b = bytes.TrimPrefix(b, []byte("goroutine "))
	b = b[:bytes.IndexByte(b, ' ')]
	n, _ := strconv.ParseUint(string(b), 10, 64)
	return n
}
