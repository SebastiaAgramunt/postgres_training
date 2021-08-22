# Inspired by:
# https://selectstarsql.com/hiatuses.html

# On Joins!
# JOIN -> An inner join, preserves only matches
# LEFT JOIN -> Preserves all rows in left table and puts NULL to the matches in right
# RIGHT JOIN -> Same as LEFT JOIN but with the right table
# OUTER JOIN -> Preserves all rows from right and left even though there are no matches

-- Suppose we have tableA with 3 rows and tableB with 5 rows. All the following are TRUE
-- tableA JOIN tableB ON 1 returns 15 rows.
-- tableA JOIN tableB ON 0 returns 0 rows.
-- tableA LEFT JOIN tableB ON 0 returns 3 rows.
-- tableA OUTER JOIN tableB ON 0 returns 8 rows.
-- tableA OUTER JOIN tableB ON 1 returns 15 rows.


-- Dates
SELECT DATE('1993-08-10') - DATE('1989-07-07') AS day_difference;

-- Show the max id!
SELECT MAX(id) FROM death_row;
-- Build a table with the last execution date for each id.
SELECT
  id + 1 AS id_number,
  execution_date AS last_execution_date
FROM death_row
WHERE id < 553;


-- Make the table of the difference between current and last execution
CREATE TABLE day_difference_table AS
SELECT
  last_execution_date AS start,
  execution_date AS end,
  execution_date - last_execution_date AS day_difference
FROM death_row
JOIN (SELECT
	  id + 1 AS id_number,
	  execution_date AS last_execution_date
	  FROM death_row
	  WHERE id < 553) previous_query
ON death_row.id = previous_query.id_number
ORDER BY day_difference DESC;

SELECT *
FROM day_difference_table
ORDER BY day_difference DESC
LIMIT 40;

