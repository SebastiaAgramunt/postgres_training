# Postgres Example

A demonstration of how to set up a postgresql database using the data and problems in [Select Star SQL](https://selectstarsql.com/). Using this repo you can start a docker instance of postgresql and another one for pgadmin so that you can monitor your database. 

## Quick Init

To start postgres and pgadmin run

```make start```

here you will be prompted into the bash command line from the postgres container. 

Then to stop

```make stop```

A more detailed description comes next.

## Start instance of postgres

Generate the environment variables first:

```./setup.sh```

the script will download [this]('https://selectstarsql.com/data/tx_deathrow_full.csv') dataset from SelectStarSQL webpage and place it into ```./data/dataset.csv```. Then set the environment variables (see file ```./database/scripts/db-config.sh```) to a file .env for docker to use later.

Start the docker for posgres by typing

```docker-compose -f docker-compose.yml up```

This will create the database with mandatory variables

```
POSTGRES_USER: 'postgres'
POSTGRES_PASSWORD: 'pgpass'
POSTGRES_DB: 'postgres'
```

and custom users and admins from ```db-config.sh```.

During this setup the docker also executes the files that have been mapped to ```/docker-entrypoint-initdb.d/``` in the container. This is, the files in ```./database/scripts/setup/``` and are executed by alphabetical order. So firts, we will create the database, then the admin role, the user, the schemas and finally the tables and its population (we will insert into table the previously downloaded csv here).

After the setup you can type

```
docker exec -it postgres bash
psql -d exercices -U admin
```

to open a bash terminal inside the postgres container and once there open the postgresql command line. Now you can execute simple queries:

```
SELECT date_of_birth,last_name,first_name, race, county, execution_date FROM exercices.death_row LIMIT 10;
```



## Start Pgadmin

Simply run the pgadmin docker on another terminal 

```docker-compose -f pgadmin.yml up```

Now go to [http://localhost:8080/](http://localhost:8080/) and open the admin. Type the email and the password in the web (same as the ones you have on the file ```pgadmin.yml```).

```
PGADMIN_DEFAULT_EMAIL: 'admin@example.com'
PGADMIN_DEFAULT_PASSWORD: 'admin'
```

Create a new connection by clicking ```Add New Server```,

```
Name: postgres_server
Host: postgres
Port: 5432
Username: admin
Password: 123
``` 

click save, and now you are connected!.
