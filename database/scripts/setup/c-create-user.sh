#! /usr/bin/env sh

echo "creating user named ${DB_USER}"
createuser ${DB_USER}

PGPASSWORD=${ADMIN_PASSWORD} psql -d ${DB_NAME} -U ${ADMIN_USER} -c "alter user ${DB_USER} with encrypted password '${DB_PASSWORD}';"
