#!/bin/sh
# Reruns a KrakenD command every time the configuration changes
FC_OUT=${FC_OUT:-out.json}

echo "Watching changes on files /etc/krakend/"
cd /etc/krakend
# Watch all extensions and ignore FC_OUT to avoid infinte loop
/usr/bin/reflex -G "$FC_OUT" -s  -- /usr/bin/krakend $@
