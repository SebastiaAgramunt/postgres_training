#! /usr/bin/env sh

echo "creating admin ${ADMIN_USER}"

psql -d ${DB_NAME} -c "CREATE USER ${ADMIN_USER} WITH PASSWORD '${ADMIN_PASSWORD}';"
psql -d ${POSTGRES_DB} -c "alter user ${ADMIN_USER} with encrypted password '${ADMIN_PASSWORD}';"
psql -d ${POSTGRES_DB} -c "alter user ${ADMIN_USER} with superuser;"