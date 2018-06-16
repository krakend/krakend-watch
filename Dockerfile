FROM devopsfaith/krakend:latest

LABEL maintainer="dortiz@devops.faith"

ENV KRAKEND_CONFIG krakend.json

ADD reflex /usr/bin/reflex
ADD entrypoint.sh /

WORKDIR /etc/krakend

ENTRYPOINT [ "/entrypoint.sh" ]
