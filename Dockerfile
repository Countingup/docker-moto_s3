FROM alpine:3.11

RUN apk --no-cache --update add build-base libffi-dev openssl-dev python3-dev python3 && \
  pip3 install --no-cache-dir --upgrade "moto[server]~=1.3.0"

RUN addgroup moto \
    && adduser -H -D -G moto moto

USER moto
EXPOSE 4567

ENTRYPOINT ["moto_server", "-p", "4567", "-H", "0.0.0.0", "s3"]
