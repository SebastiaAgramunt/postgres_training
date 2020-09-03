# based on tutorial
# https://www.tutorialspoint.com/postgresql/

# LOGIN TO POSTGRES COMMAND LINE #######################################################
# connect to database in localhost running on port 5432 user postgres and
# database dbname
#psql -h localhost -p 5432 -U postgres dbname


# DATABASES ############################################################################
# list of databases
\l

# create a database from bash command line (host, port, user, databasename)
#createdb -h localhost -p 5432 -U postgres dbname

# create a database from postgres prompt
CREATE DATABASE dbname;

# login to postgres command line to specific database
#psql -h localhost -p 5432 -U postgres dbname

# connect to testdb database with user postgres
\c dbname postgres;

# drop database from bash command line
#dropdb -h localhost -p 5432 -U postgress dbname

# drop database, first disconnect from current
\c postgres postgres
DROP DATABASE IF EXISTS dbname;

# TABLES ###############################################################################

# the following can be executed when we are already connected to a database
# list of tables
\dt
# with more details
\dt+

# create a table called company
CREATE TABLE tablename(
   ID INT PRIMARY KEY     NOT NULL,
   NAME           TEXT    NOT NULL,
   AGE            INT     NOT NULL,
   ADDRESS        CHAR(50),
   SALARY         REAL
);

# create table on command line
#createdb -h localhost -p 5432 -U postgres tablename

# describe the table
\d dbname.tablename
# and with more details...
\d+ dbname.tablename

# insert values to the tables
INSERT INTO tablename (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (0, 'Juanito', 33, 'Carrer del Campanar 30', 25000.0);

INSERT INTO tablename (ID,NAME,AGE,ADDRESS,SALARY) 
VALUES (1, 'Pepito', 32, 'Ronda Sant Pere 8', 20000.00);


# drop table
DROP TABLE IF EXISTS dbname.tablename;


# SCHEMAS ##############################################################################
# Schemas are analogous to directores in operating systems. It is simply a named
# collection of tables. 
CREATE SCHEMA schemaname;

# create a table within the schema
create table schemaname.new_tablename(
   ID   INT              NOT NULL,
   NAME VARCHAR (20)     NOT NULL,
   AGE  INT              NOT NULL,
   ADDRESS  CHAR (25),
   SALARY   DECIMAL (18, 2),
   PRIMARY KEY (ID)
);

# Run a basic query to select the first 10 rows with selected columns we use
# the table uploaded in the repo
SELECT date_of_birth,last_name,first_name, race, county, execution_date 
FROM exercices.death_row
LIMIT 10;

