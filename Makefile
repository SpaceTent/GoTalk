PROJECT := GoTalk
VERSION := $(shell git describe --tag --abbrev=0)
NEXT_VERSION:=$(shell git describe --tags --abbrev=0 | awk -F . '{OFS="."; $$NF+=1; print}')
SHA1 := $(shell git rev-parse HEAD)
NOW := $(shell date -u +'%Y%m%d-%H%M%S')
DSN := $(shell cat .env | grep DSN | awk -F '=' '{print $$2}')
MIGRATE_DSN := "mysql://$(DSN)?multiStatements=true"

test: fmt
	@go test  -v -coverprofile=profile.cov ./...
	@go tool cover -func profile.cov


stress:
	@ab -n 10000 -c 100 http://localhost:8080/

fmt:
	@go mod tidy
	@go fmt ./...
	@goimports -w .
	@gofmt -w -s .
	@go clean ./...

watch: fmt
	@gow -c run .

run: fmt
	@go run .

build:
	@go generate
	@go build -o bin/$(PROJECT) -ldflags "-X main.GITCOMMIT=$(SHA1) -X main.VERSION=$(VERSION) -X main.BUILDTIME=$(NOW)"


commitpush: fmt
	@git commit -a -m "$(m)"
	@git tag -a $(NEXT_VERSION) -m "Release $(NEXT_VERSION)"
	@git push --all
	@git push --tags


echo:
	@echo $(MIGRATE_DSN)


dockerup:
	@docker-compose -f docker/docker-compose.yml up -d

dockerdown:
	@docker-compose -f docker/docker-compose.yml down

migrate-up:
	@migrate -path ./db/migrations -database $(MIGRATE_DSN) up

migrate-down:
	@migrate -path ./db/migrations -database $(MIGRATE_DSN) down

migrate-force:
	@migrate -path ./db/migrations -database $(MIGRATE_DSN) force $(v)


