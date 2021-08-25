default: build

all: clean build test

version := "0.1.0"

build:
	go mod tidy
	mkdir -p bin
	go build -o bin/demo cmd/main.go

test:
	go test -short -coverprofile=bin/cov.out ./...
	go tool cover -func=bin/cov.out

clean:
	rm -rf ./bin

start-sonar-scanner:
	docker container run \
		--rm \
		-e SONAR_HOST_URL="${SONAR_URL}" \
		-e SONAR_LOGIN="${SONAR_SECRET}" \
		-v ${SOURCE_PATH}:/usr/src \
		sonarsource/sonar-scanner-cli