# moto_s3

[![Docker Automated build](https://img.shields.io/docker/build/countingup/moto_s3.svg)](https://hub.docker.com/r/countingup/moto_s3/builds/)

A docker image using [Moto](https://github.com/spulec/moto) in [Stand-alone Server Mode](https://github.com/spulec/moto#stand-alone-server-mode), to provide a Python based implementation of [Amazon S3](https://aws.amazon.com/s3/). This can then be used in development and testing.

Built on the `python:3.8-alpine` library image from Docker Hub.

Supports passing options (with the exception of `service`) to `moto_server` (also see the [Moto docs](http://docs.getmoto.org/en/latest/docs/server_mode.html):

```
$ docker run countingup/moto_s3 --help

usage: moto_server [-h] [-H HOST] [-p PORT] [-r] [-s] [-c SSL_CERT]
                   [-k SSL_KEY]
                   [service]

positional arguments:
  service

optional arguments:
  -h, --help            show this help message and exit
  -H HOST, --host HOST  Which host to bind
  -p PORT, --port PORT  Port number to use for connection
  -r, --reload          Reload server on a file change
  -s, --ssl             Enable SSL encrypted connection with auto-generated
                        certificate (use https://... URL)
  -c SSL_CERT, --ssl-cert SSL_CERT
                        Path to SSL certificate
  -k SSL_KEY, --ssl-key SSL_KEY
                        Path to SSL private key
```

## Build locally

```
$ cd docker-moto_s3
$ docker build -t countingup/moto_s3 .
```

## Run (will pull from dockerhub)

```
# Default
$ docker run -d -p 4567:4567 countingup/moto_s3

# With additional options
$ docker run -d -p 4567:4567 countingup/moto_s3 --reload
```

## Usage in Docker Compose

```
moto_s3:
  image: countingup/moto_s3
  ports:
    # container port should be 4567
    - "4567:4567"
```
