PROJECT := GoTalk
VERSION := $(shell git describe --tag --abbrev=0)
NEXT_VERSION:=$(shell git describe --tags --abbrev=0 | awk -F . '{OFS="."; $$NF+=1; print}')
SHA1 := $(shell git rev-parse HEAD)
NOW := $(shell date -u +'%Y%m%d-%H%M%S')

test: fmt lint
	@go test  -v -coverprofile=profile.cov ./...
	@go tool cover -func profile.cov

fmt:
	@go mod tidy
	@goimports -w .
	@gofmt -w -s .
	@go clean ./...

watch: fmt
	@gow -c run .

run:
	@go run .


lint:
	@go fmt ./...
	@go vet ./...
	@goimports -w .

build:
	go generate
	go build -o bin/$(PROJECT) -ldflags "-X main.GITCOMMIT=$(SHA1)" -ldflags "-X main.VERSION=$(VERSION)" -ldflags "-X main.BUILDTIME=$(NOW)"

commitmaster: fmt
	@git commit -a -m "Update $(NOW)"
	@git tag -a $(NEXT_VERSION) -m "Release $(NEXT_VERSION)"
	@git push --all
	@git push --tags


all:
	@echo $(NEXT_VERSION)

