FROM hashicorp/packer:1.2.1

RUN apk update \
    && apk upgrade \
    && apk --no-cache add --virtual .build-deps curl \
    && apk --no-cache add -u py2-pip ca-certificates \
    && apk --no-cache add git \
    && pip install awscli \
    && apk del --purge .build-deps \
    && rm -rf /var/cache/apk/* \
    && aws --version

ENTRYPOINT ["/bin/sh", "-c"]