FROM python:3.8-alpine

LABEL org.opencontainers.image.source="https://github.com/Countingup/docker-moto_s3"

RUN apk add --no-cache --upgrade --virtual .build-deps gcc musl-dev python3-dev libffi-dev openssl-dev cargo && \
  pip3 install --no-cache-dir --upgrade "moto[server]~=1.3.0" && \
  apk del --no-network .build-deps && \
  rm -rf ~/.cargo/registry

RUN addgroup moto \
  && adduser -H -D -G moto moto

USER moto
EXPOSE 4567

ENTRYPOINT ["moto_server", "-p", "4567", "-H", "0.0.0.0", "s3"]
