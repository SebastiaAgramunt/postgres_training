#! /usr/bin/env sh


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
        FROM '${RAW_DATA}/dataset.csv'
        DELIMITER ','
        CSV HEADER;"

# fill the table with the downloaded csv
PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "COPY exercise_1
        (user_id,
        page,
        unix_timestamp)
        FROM '${RAW_DATA}/dataset_1.csv'
        DELIMITER ','
        CSV HEADER;"



# fill the table with the downloaded csv
PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "COPY exercise_2_mobile
        (user_id,
        page)
        FROM '${RAW_DATA}/dataset_2/query_two_mobile.csv'
        DELIMITER ','
        CSV HEADER;"



# fill the table with the downloaded csv
PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "COPY exercise_2_web
        (user_id,
        page)
        FROM '${RAW_DATA}/dataset_2/query_two_web.csv'
        DELIMITER ','
        CSV HEADER;"


# fill the table with the downloaded csv
PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "COPY exercise_3
        (user_id,
        date)
        FROM '${RAW_DATA}/dataset_3.csv'
        DELIMITER ','
        CSV HEADER;"


PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "COPY exercise_4_april
        (user_id,
        date,
        transaction_amount)
        FROM '${RAW_DATA}/dataset_4/query_four_april.csv'
        DELIMITER ','
        CSV HEADER;"


PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "COPY exercise_4_march
        (user_id,
        date,
        transaction_amount)
        FROM '${RAW_DATA}/dataset_4/query_four_march.csv'
        DELIMITER ','
        CSV HEADER;"


PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "COPY exercise_5_users
        (user_id,
        sign_up_date)
        FROM '${RAW_DATA}/dataset_5/query_five_users.csv'
        DELIMITER ','
        CSV HEADER;"


PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "COPY exercise_5_transactions
        (user_id,
        transaction_date,
        transaction_amount)
        FROM '${RAW_DATA}/dataset_5/query_five_transactions.csv'
        DELIMITER ','
        CSV HEADER;"


PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c "COPY exercise_6
        (user_id,
        created_at,
        country)
        FROM '${RAW_DATA}/dataset_6.csv'
        DELIMITER ','
        CSV HEADER;"


