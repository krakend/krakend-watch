#!/bin/sh
# Reruns a KrakenD command every time the configuration changes
# Pass KRAKEND_CONFIG with the filename you want to use as the configuration
# Pass KRAKEND_COMMAND if you want a different command than run

KRAKEND_CONFIG=${KRAKEND_CONFIG:-krakend.json}

# Default KrakenD command
if [[ -z "${KRAKEND_COMMAND}" ]]; then
    KRAKEND_COMMAND="run -c /etc/krakend/${KRAKEND_CONFIG} -d"
fi

echo "Watching changes on files /etc/krakend/${KRAKEND_CONFIG}"

cd /etc/krakend

# Run without flexible configuration
if [[ -z "${FC_ENABLE}" ]]; then
  /usr/bin/reflex -g "*.*" -s  -- /usr/bin/krakend $KRAKEND_COMMAND
else
# Run with flexible configuration values in ENV
	FC_ENABLE=1 \
    FC_SETTINGS="$FC_SETTINGS" \
    FC_PARTIALS="$FC_PARTIALS" \
    FC_TEMPLATES="$FC_TEMPLATES" \
    FC_OUT="$FC_OUT" \
    /usr/bin/reflex -g "*.*" -s  -- /usr/bin/krakend $KRAKEND_COMMAND
fi