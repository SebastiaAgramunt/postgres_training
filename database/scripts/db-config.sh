#!/bin/bash

export DB_NAME=exercices

export DB_USER=usuari
export DB_PASSWORD=LrDwb53E7DmFc2j4qw77n4pUUfKtULDVh4vrHjWw

export ADMIN_USER=admin
export ADMIN_PASSWORD=LrDwb53E7DmFc2j4qw77n4pUUfKtULDVh4vrHjWw

export READWRITE_ROLE=readwrite

export PGSSLMODE=disable
export POSTGRES_DEBUG=true
export POSTGRES_DATA=db-data # docker default env is: /var/lib/postgresql/data

export RAW_DATA=$PWD/raw-data
