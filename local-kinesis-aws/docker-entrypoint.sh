#!/bin/sh

if [ "$1" = 'create-kinesis-stream' ]; then
    exec kinesalite --path "$DATADIR" --createStreamMs 0 --deleteStreamMs 0 --updateStreamMs 0 --shardLimit "$SHARDS_LIMIT"
    aws --region "$AWS_REGION" --endpoint-url http://localhost:4567/ kinesis create-stream --stream-name="$STREAM_NAME" --shard-count="$SHARDS_COUNT"
fi

exec "$@"