#!/bin/bash
set -eo pipefail

[[ -z $DATA_DIR ]] && DATA_DIR=/data/db

[[ -d $DATA_DIR ]] || mkdir -p $DATA_DIR
chown -R mongodb:mongodb $DATA_DIR
chmod -R 700 $DATA_DIR

exec /sbin/setuser mongodb mongod --config /etc/mongodb/mongodb.yml

