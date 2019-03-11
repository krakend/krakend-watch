all: build

reflex:
	docker run --rm -it -v ${PWD}:/go/bin golang:1.12-alpine3.9 sh -c "apk add --no-cache git && go get github.com/cespare/reflex"

build: reflex
	docker build -t devopsfaith/krakend:config-watcher .
