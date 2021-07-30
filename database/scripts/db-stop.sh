#! /usr/bin/env sh
if [ -z "${DB_NAME}" ]
then
    source ./scripts/db-config.sh $1
fi

FILE=$POSTGRES_DATA/postmaster.pid
if test -f "$FILE"; then
    echo "stopping database ${DB_NAME}"
    pg_ctl -D $POSTGRES_DATA stop
else
    echo "database ${DB_NAME} was not started"
fi
