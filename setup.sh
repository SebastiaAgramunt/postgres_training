#! /usr/bin/env sh

# download data
# POSTPROCESSING BEFORE UPLOADIG TO DB: one column is wrong. Delete "TDCJ Number" commas
# and delete the new line at this column (all column names must be in the fist line)
mkdir -p ./database/raw_data/
wget -nc -O ./database/raw_data/dataset.csv 'https://selectstarsql.com/data/tx_deathrow_full.csv'

# database configuration
# set -a
# source database/scripts/db-config.sh

# echo "exporting environment"
# rm .env

# echo "DB_NAME=${DB_NAME}" >> .env
# echo "DB_USER=${DB_USER}" >> .env
# echo "DB_PASSWORD=${DB_PASSWORD}" >> .env

# echo "ADMIN_USER=${ADMIN_USER}" >> .env
# echo "ADMIN_PASSWORD=${ADMIN_PASSWORD}" >> .env

#echo "running database service"
#eval docker-compose -f docker-compose.yml up #-d


# docker exec -it postgres bash
# psql -d exercices -U admin