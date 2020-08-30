#! /usr/bin/env sh

echo "creating user named ${DB_USER}"

PGPASSWORD=${ADMIN_PASSWORD} psql -d ${DB_NAME} -U${ADMIN_USER} -c "CREATE USER ${DB_USER} WITH PASSWORD '${DB_PASSWORD}';"

