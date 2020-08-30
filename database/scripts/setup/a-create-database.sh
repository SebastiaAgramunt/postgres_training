#! /usr/bin/env sh

echo "creating database ${DB_NAME}"
createdb --template=template0 --locale=en_US.UTF-8 --encoding=UTF8 ${DB_NAME}
