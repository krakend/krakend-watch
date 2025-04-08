# KrakenD Configuration Watcher
A Docker image to reload KrakenD when the configuration in the disk changes.

[Documentation](https://www.krakend.io/docs/developer/hot-reload/)

### Run

The container uses the same parameters as the regular krakend Docker image.

Example:
```
docker run -p 8000:8000 -it -v "$PWD:/etc/krakend" krakend:watch run -c krakend.json
```

### Build

```
docker build -t krakend:watch .
```
