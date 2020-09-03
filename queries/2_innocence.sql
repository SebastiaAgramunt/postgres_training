# Based on 
# https://selectstarsql.com/innocence.html


# How many people gave last statements?
# NULL is the value of an empty entry. This is different from the empty string 
# '' and the integer 0, both of which are not considered NULL
SELECT COUNT(first_name)
FROM exercices.death_row
WHERE last_statement IS NULL;


# Find the total number of executions in the dataset. The idea here is to pick one 
# of the columns that you're confident has no NULLs and count it.

# we find this query to be 0, so first_name does not contain NULLS
SELECT COUNT(first_name)
FROM exercices.death_row
WHERE first_name IS NULL;


# now we count 553 executions
SELECT COUNT(first_name)
FROM exercices.death_row;

# we can also count all the rows in the dataset
SELECT COUNT(*)
FROM exercices.death_row;


# now count the executions per county and sort in descending order
SELECT county, COUNT(*) AS executions
FROM exercices.death_row
GROUP BY county
ORDER BY executions DESC;

# now just for Harris county and Bexar county.
SELECT
    SUM(CASE WHEN county='Harris' THEN 1
        ELSE 0 END) as Harris_county,
    SUM(CASE WHEN county='Bexar' THEN 1
        ELSE 0 END) as Bexar_county
FROM exercices.death_row;

# Find how many inmates were over the age of 50 at execution time.
SELECT COUNT(first_name)
FROM exercices.death_row
WHERE age_at_exec>50;


# Find the number of inmates who have declined to give a last statement.
# For bonus points, try to do it in 3 ways:
# 1) With a WHERE block,
# 2) With a COUNT and CASE WHEN block,
# 3) With two COUNT functions.

SELECT COUNT(*)
FROM exercices.death_row
WHERE last_statement IS NULL;

SELECT SUM(CASE WHEN last_statement IS NULL THEN 1 ELSE 0 END) AS num_not_last_statement
FROM exercices.death_row;

SELECT COUNT(CASE WHEN last_statement IS NULL THEN 1 ELSE NULL END) AS num_not_last_statement
FROM exercices.death_row;

SELECT COUNT(*) - COUNT(last_statement) FROM exercices.death_row;


# Find the minimum, maximum and average age of inmates at the time of execution.
SELECT MAX(age_at_exec) AS max_age,
	   MIN(age_at_exec) AS min_age,
	   AVG(age_at_exec) AS avg_age
FROM exercices.death_row;


# Find the average length (based on character count) of last statements in the dataset.
SELECT LENGTH(last_statement) AS last_statement_len
FROM exercices.death_row
WHERE last_statement IS NOT NULL;

SELECT AVG(LENGTH(last_statement)) AS avg_last_statement_len
FROM exercices.death_row
WHERE last_statement IS NOT NULL;


# List all the counties in the dataset without duplication.
SELECT DISTINCT(county) AS counties
FROM exercices.death_row;


# Find the proportion of inmates with claims of innocence in their last statements.
SELECT
100.0 * COUNT(CASE WHEN last_statement LIKE '%innocen%' THEN 1 ELSE NULL END) / COUNT(*) AS prop_claim_innocence
FROM exercices.death_row;
