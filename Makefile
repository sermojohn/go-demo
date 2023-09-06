GO_COVER_FILE ?= "coverage.out"

test:
	go test ./... --count=1

test-cover:
	[ ! -e $(GO_COVER_FILE) ] || rm $(GO_COVER_FILE)
	go test ./... --count=1 -race -covermode=atomic -coverprofile=$(GO_COVER_FILE)
	go tool cover -func $(GO_COVER_FILE)

docker-build:
	docker build --tag sermojohn/go-demo .

docker-run:
	docker run -d -p 8080:8080 --name go-demo sermojohn/go-demo:latest