all: build

reflex:
	docker run --rm -it -v ${PWD}:/go/bin golang:1.10.2-alpine3.7 sh -c "apk add --no-cache git && go get github.com/cespare/reflex"

build: reflex
	docker build -t devopsfaith/krakend:config-test .
