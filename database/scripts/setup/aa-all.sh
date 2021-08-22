#! /usr/bin/env sh

echo "creating admin ${ADMIN_USER}"
createuser ${ADMIN_USER}

echo "creating database ${DB_NAME}"
createdb --template=template0 --locale=en_US.UTF-8 --encoding=UTF8 ${DB_NAME}

PGPASSWORD=${ADMIN_PASSWORD} psql -d ${DB_NAME} -c "alter user ${ADMIN_USER} with encrypted password '${ADMIN_PASSWORD}';"
PGPASSWORD=${ADMIN_PASSWORD} psql -d ${DB_NAME} -c "alter user ${ADMIN_USER} with superuser;"

echo "creating user named ${DB_USER}"
createuser ${DB_USER}

PGPASSWORD=${ADMIN_PASSWORD} psql -d ${DB_NAME} -U ${ADMIN_USER} -c "alter user ${DB_USER} with encrypted password '${DB_PASSWORD}';"

echo "creating schema ${DB_NAME}"
PGPASSWORD=${ADMIN_PASSWORD} psql -d ${DB_NAME} -U ${ADMIN_USER} -c "DROP SCHEMA IF EXISTS ${DB_NAME} CASCADE;"
PGPASSWORD=${ADMIN_PASSWORD} psql -d ${DB_NAME} -U ${ADMIN_USER} -c "CREATE SCHEMA IF NOT EXISTS ${DB_NAME} AUTHORIZATION ${DB_USER};"


echo "creating role in schema ${DB_NAME}"


# readwrite role for DB_USER
# PGPASSWORD=${ADMIN_PASSWORD} psql -d ${DB_NAME} -U ${ADMIN_USER} -c "create role readwrite;"
# PGPASSWORD=${ADMIN_PASSWORD} psql -d ${DB_NAME} -U ${ADMIN_USER} -c "grant connect on database ${DB_NAME} to readwrite;"
# PGPASSWORD=${ADMIN_PASSWORD} psql -d ${DB_NAME} -U ${ADMIN_USER} -c "grant usage, create on schema ${DB_NAME} to readwrite;"
# PGPASSWORD=${ADMIN_PASSWORD} psql -d ${DB_NAME} -U ${ADMIN_USER} -c "grant select, insert, update, delete on all tables in schema ${DB_NAME} to readwrite;"
# PGPASSWORD=${ADMIN_PASSWORD} psql -d ${DB_NAME} -U ${ADMIN_USER} -c "alter default privileges in schema ${DB_NAME} grant select, insert, update, delete on tables to readwrite;"
# PGPASSWORD=${ADMIN_PASSWORD} psql -d ${DB_NAME} -U ${ADMIN_USER} -c "grant usage on all sequences in schema ${DB_NAME} to readwrite;"
# PGPASSWORD=${ADMIN_PASSWORD} psql -d ${DB_NAME} -U ${ADMIN_USER} -c "alter default privileges in schema ${DB_NAME} grant usage on sequences to readwrite;"
# PGPASSWORD=${ADMIN_PASSWORD} psql -d ${DB_NAME} -U ${ADMIN_USER} -c "alter default privileges grant all on functions to readwrite;"
# PGPASSWORD=${ADMIN_PASSWORD} psql -d ${DB_NAME} -U ${ADMIN_USER} -c "grant readwrite to ${DB_USER};"

# PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "DROP TABLE IF EXISTS death_row"
# PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "CREATE TABLE IF NOT EXISTS death_row
#         (id INT,
#         date_of_birth DATE,
#         date_of_offence DATE,
#         highest_education DECIMAL,
#         last_name VARCHAR(20),
#         first_name VARCHAR(20),
#         tdcj_number INT,
#         age_at_exec INT,
#         date_received DATE,
#         execution_date DATE,
#         race VARCHAR(20),
#         county VARCHAR(20),
#         eye_color VARCHAR(20),
#         weight INT,
#         height TEXT,
#         native_county VARCHAR(20),
#         native_state VARCHAR(20),
#         last_statement TEXT,
#         PRIMARY KEY (id));"

# #GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO usuari;
# export USER=sebas2
# export DB_NAME=exercices

# CREATE USER sebas2 WITH PASSWORD '1234';
# GRANT CONNECT ON DATABASE exercices TO sebas2;
# GRANT USAGE ON SCHEMA exercices TO sebas2;
# GRANT SELECT ON ALL TABLES IN SCHEMA exercices TO sebas2;
# ALTER DEFAULT PRIVILEGES IN SCHEMA exercices GRANT SELECT ON TABLES TO sebas2;


# CREATE USER ${USER} WITH PASSWORD '1234';
# GRANT CONNECT ON DATABASE ${DB_NAME} TO ${USER};
# GRANT USAGE ON SCHEMA ${DB_NAME} TO ${USER};
# GRANT SELECT ON ALL TABLES IN SCHEMA ${DB_NAME} TO ${USER};
# ALTER DEFAULT PRIVILEGES IN SCHEMA ${DB_NAME} GRANT SELECT ON TABLES TO ${USER};