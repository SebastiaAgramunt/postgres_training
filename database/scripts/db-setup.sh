#! /usr/bin/env sh

echo "db-setup log..."
if [ -z "${DB_NAME}" ]
then
    source ./scripts/db-config.sh
fi

# stop database if initiated
./scripts/db-stop.sh
sleep 5

# remove the entire database and initiate a new one
rm -rf $POSTGRES_DATA
mkdir -p $POSTGRES_DATA
initdb -D ${POSTGRES_DATA}

# start the database
./scripts/db-start.sh &
sleep 5

./scripts/setup/a-create-admin.sh
./scripts/setup/b-create-database.sh
./scripts/setup/c-create-user.sh
./scripts/setup/d-create-schema.sh
./scripts/setup/e-create-roles.sh
./scripts/setup/f-db-create-tables.sh
./scripts/setup/g-fill-tables.sh

echo "database setup finished, now running..."