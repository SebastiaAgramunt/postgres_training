#! /usr/bin/env sh

PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -f "./scripts/setup/schema.sql"
