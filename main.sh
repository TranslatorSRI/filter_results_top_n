#!/usr/bin/env bash
uvicorn app.server:APP --host 0.0.0.0 --port $PORT
