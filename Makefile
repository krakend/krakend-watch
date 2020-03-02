all: build

reflex:
	docker run --rm -it -v ${PWD}:/go/bin golang:1.14.0 sh -c "go get github.com/cespare/reflex"

build: reflex
	docker build -t devopsfaith/krakend:config-watcher .
