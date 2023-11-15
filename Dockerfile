FROM golang:alpine as build
RUN apk add build-base
RUN apk update && apk add --no-cache git inotify-tools jq

COPY . /src

RUN go install -tags 'mysql' github.com/golang-migrate/migrate/v4/cmd/migrate@latest
RUN cd /src && GIT_COMMIT=$(git rev-list -1 HEAD) && VERSION=$(git describe --tags --abbrev=0) && CGO_ENABLED=1 GOOS=linux go build -o /bin/app -ldflags "-X main.GitCommit=$GIT_COMMIT -X main.VERSION=$VERSION" main.go

# Second stage: create the minimal runtime image
FROM golang:alpine as final

# Copy the built binary from the first stage
COPY --from=build /go/bin/migrate /bin/migrate
COPY --from=build /bin/app /bin/app
RUN chmod +x /bin/app
COPY --from=build /src/templates /templates
COPY --from=build /src/db /db

WORKDIR /
CMD ["/bin/sh", "-c", "/bin/migrate -verbose -source=file://db/migrations -database $DSN up && /bin/app"]

