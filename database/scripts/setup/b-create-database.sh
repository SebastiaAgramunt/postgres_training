#! /usr/bin/env sh

echo "creating database ${DB_NAME}"
createdb --template=template0 --locale=en_US.UTF-8 --encoding=UTF8 ${DB_NAME}

psql -d ${DB_NAME} -c "alter user ${ADMIN_USER} with encrypted password '${ADMIN_PASSWORD}';"
psql -d ${DB_NAME} -c "alter user ${ADMIN_USER} with superuser;"