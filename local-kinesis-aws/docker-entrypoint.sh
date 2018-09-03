#!/bin/sh

if [ "$1" = 'create-kinesis-stream' ]; then
    echo "Starting kinesalite..." > /dev/stdout
    echo "Creating stream $STREAM_NAME..." > /dev/stdout
    nohup sleep 5s && aws --region "$AWS_REGION" --endpoint-url http://localhost:4567/ kinesis create-stream --stream-name="$STREAM_NAME" --shard-count="$SHARDS_COUNT" > /dev/null 2>&1 &
    exec kinesalite --path "$DATADIR" --createStreamMs 0 --deleteStreamMs 0 --updateStreamMs 0
fi

exec "$@"