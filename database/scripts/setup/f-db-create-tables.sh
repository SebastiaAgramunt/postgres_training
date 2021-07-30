#echo "creating tables schema ${DB_NAME}"

# investigate further this part
PGPASSWORD=${ADMIN_PASSWORD} psql -d ${DB_NAME} -U ${ADMIN_USER} -c "CREATE EXTENSION IF NOT EXISTS \"uuid-ossp\" WITH SCHEMA public;"
PGPASSWORD=${ADMIN_PASSWORD} psql -d ${DB_NAME} -U ${ADMIN_USER} -c "SET search_path TO ${DB_NAME},public;"


# drop table death row and create a new one
PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "DROP TABLE IF EXISTS death_row"
PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "CREATE TABLE IF NOT EXISTS death_row
        (id INT,
        date_of_birth DATE,
        date_of_offence DATE,
        highest_education DECIMAL,
        last_name VARCHAR(20),
        first_name VARCHAR(20),
        tdcj_number INT,
        age_at_exec INT,
        date_received DATE,
        execution_date DATE,
        race VARCHAR(20),
        county VARCHAR(20),
        eye_color VARCHAR(20),
        weight INT,
        height TEXT,
        native_county VARCHAR(20),
        native_state VARCHAR(20),
        last_statement TEXT,
        PRIMARY KEY (id));"


PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "COPY death_row
        (id,
        date_of_birth,
        date_of_offence,
        highest_education,
        last_name,
        first_name,
        tdcj_number,
        age_at_exec,
        date_received,
        execution_date,
        race,
        county,
        eye_color,
        weight,
        height,
        native_county,
        native_state,
        last_statement)
        FROM '/Users/sebas/Documents/github/postgres_training/data/dataset.csv'
        DELIMITER ','
        CSV HEADER;"


#fill the table with the downloaded csv
# PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "COPY death_row
#         (id,
#         date_of_birth,
#         date_of_offence,
#         highest_education,
#         last_name,
#         first_name,
#         tdcj_number,
#         age_at_exec,
#         date_received,
#         execution_date,
#         race,
#         county,
#         eye_color,
#         weight,
#         height,
#         native_county,
#         native_state,
#         last_statement)
#         FROM '/Users/sebas/Documents/github/postgres_training/data/dataset.csv'
#         DELIMITER ','
#         CSV HEADER;"



# PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "DROP TABLE IF EXISTS exercise_1"
# PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "CREATE TABLE IF NOT EXISTS exercise_1
#         (user_id INT,
#         page TEXT,
#         unix_timestamp INT);"

# # fill the table with the downloaded csv
# PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "COPY exercise_1
#         (user_id,
#         page,
#         unix_timestamp)
#         FROM '/tmp/dataset_1.csv'
#         DELIMITER ','
#         CSV HEADER;"



# PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "DROP TABLE IF EXISTS query_two_mobile"
# PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "CREATE TABLE IF NOT EXISTS query_two_mobile
#         (user_id INT,
#         page TEXT);"

# # fill the table with the downloaded csv
# PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "COPY query_two_mobile
#         (user_id,
#         page)
#         FROM '/tmp/query_two_mobile.csv'
#         DELIMITER ','
#         CSV HEADER;"


# PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "DROP TABLE IF EXISTS query_two_web"
# PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "CREATE TABLE IF NOT EXISTS query_two_web
#         (user_id INT,
#         page TEXT);"

# # fill the table with the downloaded csv
# PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "COPY query_two_web
#         (user_id,
#         page)
#         FROM '/tmp/query_two_web.csv'
#         DELIMITER ','
#         CSV HEADER;"


# # loading query three
# PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "DROP TABLE IF EXISTS query_three"
# PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "CREATE TABLE IF NOT EXISTS query_three
#         (user_id INT,
#         date DATE);"

# # fill the table with the downloaded csv
# PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "COPY query_three
#         (user_id,
#         date)
#         FROM '/tmp/query_three.csv'
#         DELIMITER ','
#         CSV HEADER;"

# query="SELECT * FROM query_three LIMIT 10;"
# PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c $query


# # loading query four
# PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "DROP TABLE IF EXISTS query_four_april"
# PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "CREATE TABLE IF NOT EXISTS query_four_april
#         (user_id INT,
#         date DATE,
#         transaction_amount INT);"


# PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "COPY query_four_april
#         (user_id,
#         date,
#         transaction_amount)
#         FROM '/tmp/query_four/query_four_april.csv'
#         DELIMITER ','
#         CSV HEADER;"

# query="SELECT * FROM query_four_april LIMIT 10;"
# PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c $query



# PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "DROP TABLE IF EXISTS query_four_march"
# PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "CREATE TABLE IF NOT EXISTS query_four_march
#         (user_id INT,
#         date DATE,
#         transaction_amount INT);"


# PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "COPY query_four_march
#         (user_id,
#         date,
#         transaction_amount)
#         FROM '/tmp/query_four/query_four_march.csv'
#         DELIMITER ','
#         CSV HEADER;"

# query="SELECT * FROM query_four_march LIMIT 10;"
# PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c $query





# PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "DROP TABLE IF EXISTS query_five_users"
# PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "CREATE TABLE IF NOT EXISTS query_five_users
#         (user_id INT,
#         sign_up_date DATE);"


# PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "COPY query_five_users
#         (user_id,
#         sign_up_date)
#         FROM '/tmp/query_five/query_five_users.csv'
#         DELIMITER ','
#         CSV HEADER;"

# query="SELECT * FROM query_five_users LIMIT 10;"
# PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c $query



# PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "DROP TABLE IF EXISTS query_five_transactions"
# PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "CREATE TABLE IF NOT EXISTS query_five_transactions
#         (user_id INT,
#          transaction_date DATE,
#          transaction_amount INT);"


# PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "COPY query_five_transactions
#         (user_id,
#         transaction_date,
#         transaction_amount)
#         FROM '/tmp/query_five/query_five_transactions.csv'
#         DELIMITER ','
#         CSV HEADER;"

# query="SELECT * FROM query_five_transactions LIMIT 10;"
# PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c $query




# PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "DROP TABLE IF EXISTS query_six"
# PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "CREATE TABLE IF NOT EXISTS query_six
#         (user_id INT,
#          created_at DATE,
#          country VARCHAR(20));"


# PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "COPY query_six
#         (user_id,
#         created_at,
#         country)
#         FROM '/tmp/query_six.csv'
#         DELIMITER ','
#         CSV HEADER;"

# query="SELECT * FROM query_six LIMIT 10;"
# PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c $query



