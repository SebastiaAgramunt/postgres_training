# Postgres Example

This repository is a boilerplate for a postgresql project close to production. At the same time it serves as a tutorial with several examples from [Select Star SQL](https://selectstarsql.com/) and others.

## Quick init

### Install postgresql
Install postgresql if it is not installed in your system. If you are running the code on MacOS just execute `install_postrges_mac.sh`. If it is installed just type `which psql` and it will show where is your psql istalled.

### The database configuration

Configuration parameters of the database are in `database/scripts/db-config.sh`. This is, users, passwords and connection details that will be used on the set up. The database schema is on `database/scripts/setup/schema.sql`.


### Get the raw data
Raw data is compressed in `database/raw-data.zip`. To uncompress it go to `database` directory and type `raw-data.zip`. This will create a folder named `raw-data` inside the database directory with all the tables needed.

```bash
cd database
unzip raw-data.zip

```


### Setup the database
Drive to the folder `database` abd use make with the instruction `db-setup`

```bash
cd database
make db-setup
```

The logs of the process can be viewed at `database/db-setup.log`. 

This whole process is a bit complex and involves not only the initiation of the database but also the execution of many bash scripts calling postgres to grant access to users, create the schema and even uploading the data to the tables. After this step you should have a database running on your machine.

### Login to the command line prompt

Open a new terminal and type (if you haven't changed anything from `db-config.sh`)

```bash
psql -h localhost -p 5432 -d exercices -U usuari
```

then check that the data is in the tables by writing a simple query:

```bash
SELECT * FROM exercise_1 LIMIT 10;
```
which should give you

```
 user_id |     page     | unix_timestamp
---------+--------------+----------------
    6684 | home_page    |     1451640067
    8098 | home_page    |     1451647141
    9440 | home_page    |     1451653638
    1003 | home_page    |     1451611211
    4272 | product_page |     1451628024
    8067 | search       |     1451647070
    1314 | home_page    |     1451612802
     845 | home_page    |     1451610443
    5263 | home_page    |     1451632737
    7891 | search       |     1451646428
```

## Exercices

The database created is named `exercices` by default. There you can find several tables:

```
 Schema |          Name           | Type  | Owner
--------+-------------------------+-------+-------
 public | death_row               | table | admin
 public | exercise_1              | table | admin
 public | exercise_2_mobile       | table | admin
 public | exercise_2_web          | table | admin
 public | exercise_3              | table | admin
 public | exercise_4_april        | table | admin
 public | exercise_4_march        | table | admin
 public | exercise_5_transactions | table | admin
 public | exercise_5_users        | table | admin
 public | exercise_6              | table | admin

```

Death_row table is the table from the examples in [Select Star SQL](https://selectstarsql.com/). Then on `queries/more_queries.sql` there's a list of query questions for learning whose solutions are in the bottom of the file. All tables exercise_* are referred to this last query script.