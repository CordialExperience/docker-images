FROM node:9.11.2-alpine

ENV DATADIR /var/lib/kinesalite
ENV SHARDS_LIMIT 100

COPY ./docker-entrypoint.sh /usr/bin/docker-entrypoint.sh

RUN apk update \
    && apk upgrade \
    && apk --no-cache add --virtual .build-deps make g++ \
    && apk add -u py2-pip coreutils \
    && pip2 install awscli \
    && mkdir -p $DATADIR \
    && yarn global add kinesalite \
    && apk del --purge .build-deps \
    && chmod +x /usr/bin/docker-entrypoint.sh \
    && rm -rf /tmp/* /var/cache/apk/*

EXPOSE 4567

VOLUME $DATADIR

ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]
CMD ["create-kinesis-stream"]