#!/bin/sh

KRAKEND_CFG=${KRAKEND_CONFIG:-krakend.json}

cd /etc/krakend
/usr/bin/reflex -g "$KRAKEND_CFG" -s  -- /usr/bin/krakend run -c /etc/krakend/${KRAKEND_CFG} -d
