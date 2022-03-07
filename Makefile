all: build

GOLANG_VERSION :=$(shell curl -qs https://raw.githubusercontent.com/devopsfaith/krakend-ce/master/Makefile| grep ^GOLANG_VERSION | cut -d= -f2 | awk '{$$1=$$1};1')
ALPINE_VERSION :=$(shell curl -qs https://raw.githubusercontent.com/devopsfaith/krakend-ce/master/Makefile| grep ^ALPINE_VERSION | cut -d= -f2 | awk '{$$1=$$1};1')

reflex:
	docker run --rm -it -v ${PWD}:/go/bin golang:${GOLANG_VERSION}-alpine${ALPINE_VERSION} sh -c "go install github.com/cespare/reflex@latest"

build: reflex
	docker build -t devopsfaith/krakend:config-watcher .
