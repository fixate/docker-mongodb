#!/bin/bash
set -eo pipefail

[[ -z $DATA_DIR ]] && DATA_DIR=/var/mongodb/data
# Starts up mongodb within the container.
[[ -d $DATA_DIR ]] || mkdir -p $DATA_DIR
chown -R mongodb:mongodb $DATA_DIR
chmod -R 700 $DATA_DIR

[[ -z $LOGDIR ]] && LOGDIR=/var/mongodb/log
[[ -d $LOGDIR ]] || mkdir -p $LOGDIR
chown -R mongodb:mongodb $LOGDIR
echo "Mongodb logs in $LOGDIR"

exec /sbin/setuser mongodb mongod --config /etc/mongodb/mongodb.conf >> $LOGDIR/mongodb.log 2>&1

