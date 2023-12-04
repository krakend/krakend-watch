#!/bin/bash

docker buildx build \
    --platform linux/arm64/v8,linux/amd64 \
    --build-arg KRAKEND_VERSION=${VERSION} \
    --build-arg GOLANG_VERSION=${GOLANG_VERSION} \
    --build-arg ALPINE_VERSION=${ALPINE_VERSION} \
    --tag devopsfaith/krakend:watch \
    --tag devopsfaith/krakend:${VERSION}-watch \
    --tag devopsfaith/krakend:${VERSION:0:1}-watch \
    --tag devopsfaith/krakend:${VERSION:0:3}-watch \
    --push .