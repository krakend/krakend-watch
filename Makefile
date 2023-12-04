all: build

KRAKEND_VERSION :=$(shell curl -qs https://raw.githubusercontent.com/krakendio/krakend-ce/master/Makefile| grep ^VERSION | cut -d= -f2 | awk '{$$1=$$1};1')
GOLANG_VERSION :=$(shell curl -qs https://raw.githubusercontent.com/krakendio/krakend-ce/master/Makefile| grep ^GOLANG_VERSION | cut -d= -f2 | awk '{$$1=$$1};1')
ALPINE_VERSION :=$(shell curl -qs https://raw.githubusercontent.com/krakendio/krakend-ce/master/Makefile| grep ^ALPINE_VERSION | cut -d= -f2 | awk '{$$1=$$1};1')

build:
	docker buildx build \
    --platform linux/arm64/v8,linux/amd64 \
    --build-arg KRAKEND_VERSION=${KRAKEND_VERSION} \
    --build-arg GOLANG_VERSION=${GOLANG_VERSION} \
    --build-arg ALPINE_VERSION=${ALPINE_VERSION} \
    --tag devopsfaith/krakend:watch \
    --tag devopsfaith/krakend:${VERSION}-watch \
    --tag devopsfaith/krakend:${VERSION:0:1}-watch \
    --tag devopsfaith/krakend:${VERSION:0:3}-watch \
    --push .
