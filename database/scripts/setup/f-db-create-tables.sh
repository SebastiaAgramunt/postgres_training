echo "creating tables schema ${DB_NAME}"

# investigate further this part
PGPASSWORD=${ADMIN_PASSWORD} psql -d ${DB_NAME} -U${ADMIN_USER} -c "CREATE EXTENSION IF NOT EXISTS \"uuid-ossp\" WITH SCHEMA public;"
PGPASSWORD=${ADMIN_PASSWORD} psql -d ${DB_NAME} -U${ADMIN_USER} -c "SET search_path TO ${DB_NAME},public;"


# drop table death row and create a new one
PGPASSWORD=${ADMIN_PASSWORD} psql -d ${DB_NAME} -U${ADMIN_USER} -c "DROP TABLE IF EXISTS ${DB_NAME}.death_row"
PGPASSWORD=${ADMIN_PASSWORD} psql -d ${DB_NAME} -U${ADMIN_USER} -c "CREATE TABLE IF NOT EXISTS ${DB_NAME}.death_row
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

# fill the table with the downloaded csv
PGPASSWORD=${ADMIN_PASSWORD} psql -d ${DB_NAME} -U${ADMIN_USER} -c "COPY exercices.death_row
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
        FROM '/tmp/dataset.csv'
        DELIMITER ','
        CSV HEADER;"

