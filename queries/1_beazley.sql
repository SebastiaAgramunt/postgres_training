# Based on https://selectstarsql.com/beazley.html


# Find the first and last names and ages (age_at_exec) of inmates 25 or younger at time of execution.
SELECT first_name, last_name, age_at_exec 
FROM death_row
WHERE age_at_exec<=25;

# Find the row for Raymond Landry
SELECT *
FROM death_row
WHERE first_name='Raymond' AND last_name='Landry';


# Raymond Landry does not exist, but Landry Sr does. Here we learn bout LIKE, then using
# the wildcard _ will match 1 character, and % will match any. We wan to look for 
# 'anything Landry anything', so will use %. Actually 'Landry%' would work because the
# row is 'Landry Sr.'
SELECT *
FROM death_row
WHERE first_name='Raymond' AND last_name LIKE '%Landry%';

# Find Napoleon Beazley's last statement.
SELECT first_name, last_name, last_statement
FROM death_row
WHERE first_name LIKE '%Napoleon%' AND last_name LIKE '%Beazley%';
