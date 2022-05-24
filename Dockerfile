FROM devopsfaith/krakend:latest

LABEL maintainer="community@krakend.io"

ENV KRAKEND_CONFIG krakend.json
ENV USAGE_DISABLE 1

ADD reflex /usr/bin/reflex
ADD entrypoint.sh /

WORKDIR /etc/krakend

ENTRYPOINT [ "/entrypoint.sh" ]
