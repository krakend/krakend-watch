ARG GOLANG_VERSION
ARG ALPINE_VERSION
ARG KRAKEND_VERSION
FROM golang:${GOLANG_VERSION}-alpine${ALPINE_VERSION} as reflex

RUN go install github.com/cespare/reflex@latest


FROM devopsfaith/krakend:${KRAKEND_VERSION}

LABEL maintainer="community@krakend.io"

ENV USAGE_DISABLE 1

COPY --from=reflex /go/bin/reflex /usr/bin/reflex
RUN apk add --no-cache jq

ADD entrypoint.sh /

WORKDIR /etc/krakend

ENTRYPOINT [ "/entrypoint.sh" ]
