# KrakenD watch image
A Docker image to reload **KrakenD Community Edition** when the configuration in the disk changes. Enterprise users might pull the `:watch` tag instead.

[Documentation](https://www.krakend.io/docs/developer/hot-reload/)


### Build
To use the `krakend:watch` image clone this repository and run the following command:

```
docker build -t krakend:watch .
```

**Note**: If you want to pin a specific KrakenD version, replace the `:latest` string on the `Dockerfile` with your desired version before building.

### Use
The watch image uses the same parameters as the regular `krakend:latest` Docker image. Example:

```
docker run -p 8000:8000 -it -v "$PWD:/etc/krakend" krakend:watch run -c krakend.json
```