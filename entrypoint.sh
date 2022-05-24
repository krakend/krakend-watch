#!/bin/sh
# Reruns a KrakenD command every time the configuration changes
# Pass KRAKEND_CONFIG with the filename you want to use as the configuration
# Pass KRAKEND_COMMAND if you want a different command than run

KRAKEND_CONFIG=${KRAKEND_CONFIG:-krakend.json}
FC_OUT=${FC_OUT:-out.json}

# Default KrakenD command
if [[ -z "${KRAKEND_COMMAND}" ]]; then
    KRAKEND_COMMAND="run -c /etc/krakend/${KRAKEND_CONFIG} -d"
fi


echo "Watching changes on files /etc/krakend/${KRAKEND_CONFIG}"

cd /etc/krakend


/usr/bin/reflex -g "*.*" -G "$FC_OUT" -s  -- /usr/bin/krakend $KRAKEND_COMMAND