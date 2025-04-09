#!/bin/sh
# Reruns a KrakenD command every time the configuration changes
FC_OUT=${FC_OUT:-out.json}
IGNORE_GLOB_EXPRESSION=$(basename $FC_OUT)

echo "Watching changes on files /etc/krakend/"
echo "Ignoring saves to file $IGNORE_GLOB_EXPRESSION"
# Watch all extensions and ignore FC_OUT filename to avoid infinte loop
/usr/bin/reflex -G "$IGNORE_GLOB_EXPRESSION" -s  -- /usr/local/bin/docker-entrypoint.sh $@
