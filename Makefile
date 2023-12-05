all: build

.EXPORT_ALL_VARIABLES:
SHELL := /bin/bash
VERSION :=$(shell curl -qs https://raw.githubusercontent.com/krakendio/krakend-ce/master/Makefile| grep ^VERSION | cut -d= -f2 | awk '{$$1=$$1};1')
GOLANG_VERSION :=$(shell curl -qs https://raw.githubusercontent.com/krakendio/krakend-ce/master/Makefile| grep ^GOLANG_VERSION | cut -d= -f2 | awk '{$$1=$$1};1')
ALPINE_VERSION :=$(shell curl -qs https://raw.githubusercontent.com/krakendio/krakend-ce/master/Makefile| grep ^ALPINE_VERSION | cut -d= -f2 | awk '{$$1=$$1};1')

build:
	./build.sh
