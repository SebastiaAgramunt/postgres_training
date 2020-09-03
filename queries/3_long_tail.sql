# Inspired by
# https://selectstarsql.com/longtail.html

# Find the number of executions per county
SELECT county, COUNT(county) AS counts
FROM exercices.death_row
GROUP BY county;


# Count the number of inmates aged 50 or older that were executed in each county.
SELECT county, COUNT(county) as num_exec_larger_50
FROM exercices.death_row
WHERE age_at_exec>=50
GROUP BY county;

# List the counties in which more than 2 inmates aged 50 or older have been executed.
SELECT county, COUNT(county) as num_exec_larger_50
FROM exercices.death_row
WHERE age_at_exec>=50
GROUP BY county
HAVING COUNT(*)>2;

# List all the distinct counties in the dataset. (do not use distinct, but group by)
SELECT county
FROM exercices.death_row
GROUP BY county;


# Find the first and last name of the the inmate with the longest 
# last statement (by character count).