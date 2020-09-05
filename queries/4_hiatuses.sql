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


-- Build a table with the last execution date for each id.
SELECT
  id + 1 AS id_number,
  execution_date AS last_execution_date
FROM exercices.death_row
WHERE id < 553;


SELECT last_ex_date AS start, ex_date AS end, ex_date - last_ex_date AS day_difference
FROM exercices.death_row
JOIN previous
ON exercies.death_row.id = previous.ex_number;