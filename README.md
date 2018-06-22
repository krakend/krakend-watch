# KrakenD Configuration Watcher

This container allows you to monitor a KrakenD config file for changes and reload KrakenD with the new version.

### Build

Just run `make` and it will download reflex for alpine and build the container.

### Run

The container don't allow commands, just define the `ENV` var `KRAKEND_CONFIG` in the docker run with the name of your config file.
The default it's `krakend.json`.

Example:
```
docker run -e KRAKEND_CONFIG=krakend.json -p 8000:8000 -it -v $PWD:/etc/krakend devopsfaith/krakend:config-watcher
```
