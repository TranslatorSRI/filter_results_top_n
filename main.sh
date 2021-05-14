#!/usr/bin/env bash

PORT=7092

# https://stackoverflow.com/a/14203146
POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -p|--port)
    PORT="$2"
    shift # past argument
    shift # past value
    ;;
    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done

if [[ -z $DEPLOYMENT ]]; then
    uvicorn app.server:APP --reload --host 0.0.0.0 --port $PORT
else
    gunicorn app.server:APP -w 4 -k uvicorn.workers.UvicornWorker -b 0.0.0.0:$PORT
fi
