#! /usr/bin/env sh

if [ -z "${DB_NAME}" ]
then
    source ./scripts/db-config.sh
fi

FILE=$POSTGRES_DATA/postmaster.pid
if [ ! -f "$FILE" ]; then
    echo "starting database ${DB_NAME}"
    postgres -D $POSTGRES_DATA
else
    echo "database ${DB_NAME} already started"
fi
