#! /usr/bin/env sh
if [ -z "${DB_NAME}" ]
then
    source ./scripts/db-config.sh $1
fi



./scripts/db-stop.sh

rm -rf $POSTGRES_DATA
mkdir -p $POSTGRES_DATA
initdb -D ${POSTGRES_DATA}

./scripts/db-start.sh $1 &
sleep 1

./scripts/setup/a-create-admin.sh
./scripts/setup/b-create-database.sh
./scripts/setup/c-create-user.sh
./scripts/setup/d-create-schema.sh
./scripts/setup/e-create-roles.sh
./scripts/setup/f-db-create-tables.sh

# ./scripts/setup/c-db-create-user.sh
# ./scripts/setup/d-db-create-schema.sh
# ./scripts/setup/e-db-create-roles.sh

# echo "database ${PPML_DB_NAME} setup complete"

# sleep 1
# ./scripts/db-stop.sh $1