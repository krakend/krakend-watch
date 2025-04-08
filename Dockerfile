FROM golang:tip-alpine3.21 as reflex

RUN go install github.com/cespare/reflex@latest


FROM krakend:latest

COPY --from=reflex /go/bin/reflex /usr/bin/reflex

ADD entrypoint.sh /

WORKDIR /etc/krakend

ENTRYPOINT [ "/entrypoint.sh" ]
