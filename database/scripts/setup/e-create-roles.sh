#! /usr/bin/env sh

echo "creating role in schema ${DB_NAME}"


# readwrite role for DB_USER
PGPASSWORD=${ADMIN_PASSWORD} psql -d ${DB_NAME} -U${ADMIN_USER} -c "create role readwrite;"
PGPASSWORD=${ADMIN_PASSWORD} psql -d ${DB_NAME} -U${ADMIN_USER} -c "grant connect on database ${DB_NAME} to readwrite;"
PGPASSWORD=${ADMIN_PASSWORD} psql -d ${DB_NAME} -U${ADMIN_USER} -c "grant usage, create on schema ${DB_NAME} to readwrite;"
PGPASSWORD=${ADMIN_PASSWORD} psql -d ${DB_NAME} -U${ADMIN_USER} -c "grant select, insert, update, delete on all tables in schema ${DB_NAME} to readwrite;"
PGPASSWORD=${ADMIN_PASSWORD} psql -d ${DB_NAME} -U${ADMIN_USER} -c "alter default privileges in schema ${DB_NAME} grant select, insert, update, delete on tables to readwrite;"
PGPASSWORD=${ADMIN_PASSWORD} psql -d ${DB_NAME} -U${ADMIN_USER} -c "grant usage on all sequences in schema ${DB_NAME} to readwrite;"
PGPASSWORD=${ADMIN_PASSWORD} psql -d ${DB_NAME} -U${ADMIN_USER} -c "alter default privileges in schema ${DB_NAME} grant usage on sequences to readwrite;"
PGPASSWORD=${ADMIN_PASSWORD} psql -d ${DB_NAME} -U${ADMIN_USER} -c "alter default privileges grant all on functions to readwrite;"

PGPASSWORD=${ADMIN_PASSWORD} psql -d ${DB_NAME} -U${ADMIN_USER} -c "grant readwrite to ${DB_USER};"
