DROP TABLE IF EXISTS death_row;
CREATE TABLE IF NOT EXISTS death_row
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
PRIMARY KEY (id));

DROP TABLE IF EXISTS exercise_1;
CREATE TABLE IF NOT EXISTS exercise_1
(user_id INT,
page TEXT,
unix_timestamp INT);

DROP TABLE IF EXISTS exercise_2_mobile;
CREATE TABLE IF NOT EXISTS exercise_2_mobile
(user_id INT,
page TEXT);


DROP TABLE IF EXISTS exercise_2_web;
CREATE TABLE IF NOT EXISTS exercise_2_web
(user_id INT,
page TEXT);


DROP TABLE IF EXISTS exercise_3;
CREATE TABLE IF NOT EXISTS exercise_3
(user_id INT,
date DATE);


DROP TABLE IF EXISTS exercise_4_april;
CREATE TABLE IF NOT EXISTS exercise_4_april
(user_id INT,
date DATE,
transaction_amount INT);


DROP TABLE IF EXISTS exercise_4_march;
CREATE TABLE IF NOT EXISTS exercise_4_march
(user_id INT,
date DATE,
transaction_amount INT);


DROP TABLE IF EXISTS exercise_5_users;
CREATE TABLE IF NOT EXISTS exercise_5_users
(user_id INT,
sign_up_date DATE);


DROP TABLE IF EXISTS exercise_5_transactions;
CREATE TABLE IF NOT EXISTS exercise_5_transactions
(user_id INT,
 transaction_date DATE,
 transaction_amount INT);


DROP TABLE IF EXISTS exercise_6;
CREATE TABLE IF NOT EXISTS exercise_6
(user_id INT,
 created_at DATE,
 country VARCHAR(20));