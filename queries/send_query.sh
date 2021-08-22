#!/bin/bash

# load the confiuration
source ./scripts/db-config.sh

# command line execution:
# psql -h localhost -p 5432 -U postgres -f 0_basics.sql


# Exercise 1
###################################################################################################
###################################################################################################

# For each user_id, find the difference between the last action and the second last action. 
# Action here is defined as visiting a page. If the user has just one action, you can either remove 
# her from the final results or keep that user_id and have NULL as time difference between the two actions.

query="SELECT * FROM exercise_1 LIMIT 10;"
PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c ${query}
#psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c ${query}

#  user_id |     page     | unix_timestamp
# ---------+--------------+----------------
#     6684 | home_page    |     1451640067
#     8098 | home_page    |     1451647141
#     9440 | home_page    |     1451653638
#     1003 | home_page    |     1451611211
#     4272 | product_page |     1451628024
#     8067 | search       |     1451647070
#     1314 | home_page    |     1451612802
#      845 | home_page    |     1451610443
#     5263 | home_page    |     1451632737
#     7891 | search       |     1451646428



# Exercise 2
###################################################################################################
###################################################################################################

# We have two tables. One table has all mobile actions, i.e. all pages visited by the users 
# on mobile. The other table has all web actions, i.e. all pages visited on web by the users.
# Write a query that returns the percentage of users who only visited mobile, 
# only web and both. That is, the percentage of users who are only in the mobile table, 
# only in the web table and in both tables. The sum of the percentages should return 1.

query="SELECT * FROM exercise_2_web LIMIT 10;"
PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c $query

#  user_id |    page
# ---------+------------
#     1210 | page_1_web
#     1275 | page_1_web
#     1283 | page_4_web
#     1163 | page_4_web
#       96 | page_2_web
#     2000 | page_5_web
#      908 | page_1_web
#      180 | page_1_web
#      361 | page_7_web
#      333 | page_2_web

query="SELECT * FROM exercise_2_mobile LIMIT 10;"
PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c $query

#  user_id |     page
# ---------+---------------
#      128 | page_5_mobile
#     1324 | page_2_mobile
#     1343 | page_6_mobile
#      930 | page_3_mobile
#     1008 | page_6_mobile
#       87 | page_1_mobile
#     1729 | page_3_mobile
#     1184 | page_5_mobile
#     1961 | page_1_mobile
#      736 | page_3_mobile


# Exercise 3
###################################################################################################
###################################################################################################
# We define as power users those users who bought at least 10 products. Write a query that returns 
# for each user on which day they became a power user. That is, for each user, on which day they 
# bought the 10th item. The table below represents transactions. That is, each row means that the
# corresponding user has bought something on that date.

query="SELECT * FROM exercise_3 LIMIT 10;"
PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c $query


#  user_id |    date
# ---------+------------
#      675 | 2014-12-31
#     1967 | 2014-12-31
#       57 | 2014-12-31
#     1532 | 2014-12-31
#     1831 | 2014-12-31
#     1466 | 2014-12-31
#      731 | 2014-12-31
#     1919 | 2014-12-31
#     1232 | 2014-12-31
#      315 | 2014-12-31


# Exercise 4
###################################################################################################
###################################################################################################


# We have two tables. One table has all $ transactions from users during the month of March and one 
# for the month of April.

# Write a query that returns the total amount of money spent by each user. That is, the sum of the
# column transaction_amount for each user over both tables.

# Write a query that returns day by day the cumulative sum of money spent by each user. That is, 
# each day a user had a transcation, we should have how much money she has spent in total until 
# that day. Obviously, the last day cumulative sum should match the numbers 
# from the previous bullet point.

query="SELECT * FROM exercise_4_march LIMIT 10;"
PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c $query

#  user_id |    date    | transaction_amount
# ---------+------------+--------------------
#    13399 | 2015-03-01 |                 18
#    11934 | 2015-03-01 |                 63
#     3542 | 2015-03-01 |                 14
#    14479 | 2015-03-01 |                 21
#    19580 | 2015-03-01 |                122
#     4224 | 2015-03-01 |                 74
#     1375 | 2015-03-01 |                 53
#    15006 | 2015-03-01 |                 23
#    19040 | 2015-03-01 |                 96
#    18472 | 2015-03-01 |                 54


query="SELECT * FROM exercise_4_april LIMIT 10;"
PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c $query


#  user_id |    date    | transaction_amount
# ---------+------------+--------------------
#    15895 | 2015-04-01 |                 66
#      271 | 2015-04-01 |                 55
#     4677 | 2015-04-01 |                 73
#    16552 | 2015-04-01 |                 47
#     5151 | 2015-04-01 |                 53
#     6763 | 2015-04-01 |                 52
#     4576 | 2015-04-01 |                 62
#    14026 | 2015-04-01 |                 55
#     3919 | 2015-04-01 |                 47
#     1499 | 2015-04-01 |                 46





# Exercise 5
###################################################################################################
###################################################################################################
# We have two tables. One is user id and their signup date. The other one shows all transactions 
# done by those users, when the transaction happens and its corresponding dollar amount.

# Find the average and median transaction amount only considering those transactions that happen 
# on the same date as that user signed-up.



query="SELECT * FROM exercise_5_users LIMIT 10;"
PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c $query

#  user_id | sign_up_date
# ---------+--------------
#      121 | 2015-01-02
#      617 | 2015-01-02
#      619 | 2015-01-02
#      625 | 2015-01-02
#      753 | 2015-01-02
#     1384 | 2015-01-02
#     3364 | 2015-01-02
#     4820 | 2015-01-02
#     4853 | 2015-01-02
#     5209 | 2015-01-02



query="SELECT * FROM exercise_5_transactions LIMIT 10;"
PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c $query

#  user_id | transaction_date | transaction_amount
# ---------+------------------+--------------------
#   856898 | 2015-08-02       |                 49
#   703491 | 2015-07-04       |                 72
#   444167 | 2015-02-10       |                 65
#   972525 | 2015-04-21       |                 40
#   687406 | 2015-07-08       |                 42
#    55528 | 2015-07-23       |                 40
#   145626 | 2015-04-28       |                 33
#   817139 | 2015-05-21       |                 72
#   113831 | 2015-07-04       |                 30
#    35815 | 2015-06-01       |                 75


# Exercise 6
###################################################################################################
###################################################################################################
# We have a table with users, their country and when they created the account. We want to find:

# * The country with the largest and smallest number of users
# * A query that returns for each country the first and the last user who signed up (if that 
# country has just one user, it should just return that single user)

query="SELECT * FROM exercise_6 LIMIT 10;"
PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c $query

#  user_id | created_at |  country
# ---------+------------+------------
#        2 | 2015-02-28 | China
#       16 | 2015-02-28 | China
#       22 | 2015-02-28 | India
#       37 | 2015-02-28 | Vietnam
#       61 | 2015-02-28 | India
#       66 | 2015-02-28 | China
#      101 | 2015-02-28 | China
#      106 | 2015-02-28 | Nigeria
#      153 | 2015-02-28 | India
#      155 | 2015-02-28 | Bangladesh




# SOLUTIONS...
# **************************************************************************************************
# **************************************************************************************************
# **************************************************************************************************
# **************************************************************************************************
# **************************************************************************************************





# Solution Exercise 1
###################################################################################################
###################################################################################################

query="SELECT user_id,   
             unix_timestamp,  
             LAG(unix_timestamp, 1) OVER (PARTITION BY user_id ORDER BY unix_timestamp ASC) AS previous_time,  
             ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY unix_timestamp DESC) AS order_desc
       FROM exercise_1"
PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c $query



query="SELECT user_id, unix_timestamp - previous_time as DeltaSecondLastone 
FROM (SELECT user_id,   
             unix_timestamp,  
             LAG(unix_timestamp, 1) OVER (PARTITION BY user_id ORDER BY unix_timestamp) AS previous_time,  
             ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY unix_timestamp DESC) AS order_desc
       FROM exercise_1) tmp
       WHERE order_desc=1
       ORDER BY user_id
       LIMIT 5"
PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c $query

# user_id | deltasecondlastone
# ---------+--------------------
#        2 |
#        3 |                  2
#        4 |                  4
#        5 |
#        7 |



# Solution Exercise 2
###################################################################################################
###################################################################################################

# find total unique users with full outer join
query="SELECT COUNT(*) AS total_unique_users
       FROM (SELECT DISTINCT(user_id) AS user_id FROM exercise_2_web) as tablea
       FULL OUTER JOIN (SELECT DISTINCT(user_id) AS user_id FROM exercise_2_mobile) AS tableb
       ON tablea.user_id=tableb.user_id;"
PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c $query


# total_unique_users
#--------------------
#               1833

# find common users with inner join
query=" SELECT COUNT(tablea.user_id) as common_users
        FROM (SELECT DISTINCT(user_id) AS user_id FROM exercise_2_web) as tablea
        INNER JOIN (SELECT DISTINCT(user_id) AS user_id FROM exercise_2_mobile) AS tableb
        ON tablea.user_id=tableb.user_id;"
PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c $query


# common_users
#--------------
#          962

# find unique web users with left join and user_id null on mobile_users
query=" SELECT COUNT(tablea.user_id) AS unique_web_users
        FROM (SELECT DISTINCT(user_id) AS user_id FROM exercise_2_web) as tablea
        LEFT JOIN (SELECT DISTINCT(user_id) AS user_id FROM exercise_2_mobile) AS tableb
        ON tablea.user_id=tableb.user_id
        WHERE tableb.user_id IS NULL"
PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c $query


# unique_web_users
#------------------
#              294

# find unique mobile users with right join (same as left join but chaning names)
query=" SELECT COUNT(tableb.user_id) AS unique_mobile_users
        FROM (SELECT DISTINCT(user_id) AS user_id FROM exercise_2_web) as tablea
        RIGHT JOIN (SELECT DISTINCT(user_id) AS user_id FROM exercise_2_mobile) AS tableb
        ON tablea.user_id=tableb.user_id
        WHERE tablea.user_id IS NULL"
PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c $query

# unique_mobile_users
#---------------------
#                 577

# total unique users: 1833
# common users: 962
# unique_web_users: 294
# unique_mobile_users: 577


# to find the percentages we can do a full outer join with the two tables
query="SELECT web.user_id, mobile.user_id
       FROM (SELECT DISTINCT(user_id) AS user_id FROM exercise_2_web) as web
       FULL OUTER JOIN (SELECT DISTINCT(user_id) AS user_id FROM exercise_2_mobile) AS mobile
       ON web.user_id=mobile.user_id;"
PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c $query

#  user_id | user_id
# ---------+---------
#          |    1798
#     1489 |    1489
#     1269 |    1269
#      652 |     652
#     1989 |    1989
#      273 |     273
#       51 |      51
#     1560 |    1560
#          |    1587
#      951 |     951
#     1898 |    1898

# this is the expected solution query but won't work since empty values are not Null
# we should modify this query
query="SELECT 100*SUM(CASE WHEN m.user_id IS null THEN 1 ELSE 0 END)/COUNT(*) as WEB_ONLY,
       100*SUM(CASE WHEN w.user_id IS null THEN 1 ELSE 0 END)/COUNT(*) as MOBILE_ONLY,
       100*SUM(CASE WHEN m.user_id IS NOT null AND w.user_id IS NOT null THEN 1 ELSE 0 END)/COUNT(*) as BOTH
FROM
(SELECT distinct user_id FROM exercise_2_web ) w
FULL OUTER JOIN
(SELECT distinct user_id FROM exercise_2_mobile ) m
ON m.user_id = w.user_id;"
PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c $query

#  web_only | mobile_only | both
# ----------+-------------+------
#        16 |          31 |   52


# Solution Exercise 3
###################################################################################################
###################################################################################################



query=" SELECT user_id, 
        ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY date ASC) AS row_number,
        date
        FROM exercise_3;"
PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c $query


query="SELECT user_id, date
       FROM (SELECT user_id,
             ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY date ASC) AS row_number, 
             date 
             FROM exercise_3) AS tmp
       WHERE row_number=10;"
PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c $query


# Solution Exercise 4
###################################################################################################
###################################################################################################



query="SELECT tmp.user_id as user_id, SUM(tmp.transaction_amount) AS transaction_amount
       FROM (SELECT * FROM exercise_4_march UNION ALL SELECT * FROM exercise_4_april) as tmp
       GROUP BY tmp.user_id
       ORDER BY tmp.user_id;"
PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c $query



# Solution Exercise 5
###################################################################################################
###################################################################################################


# see if there is only sign_up date per user (sanity check)
query="SELECT * 
       FROM (SELECT COUNT(sign_up_date) AS count FROM exercise_5_users GROUP BY user_id) AS tmp
       WHERE count>1;"
PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c $query



query="SELECT tmp.user_id, tmp.sign_up_date, tmp2.transaction_amount, tmp2.transaction_date
       FROM exercise_5_users AS tmp
       LEFT JOIN exercise_5_transactions AS tmp2
       ON tmp.sign_up_date=tmp2.transaction_date AND tmp.user_id=tmp2.user_id
       WHERE tmp2.transaction_date IS NOT NULL"
PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c $query



query="SELECT tmp.user_id, AVG(tmp2.transaction_amount) AS average_transaction
       FROM exercise_5_users AS tmp
       LEFT JOIN exercise_5_transactions AS tmp2
       ON tmp.sign_up_date=tmp2.transaction_date AND tmp.user_id=tmp2.user_id
       WHERE tmp2.transaction_date IS NOT NULL
       GROUP BY tmp.user_id"
PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c $query

#  user_id | average_transaction
# ---------+---------------------
#     6701 | 77.0000000000000000
#     7302 | 61.0000000000000000
#     7864 | 63.0000000000000000
#     8116 | 65.0000000000000000
#     8143 | 54.0000000000000000
#     8608 | 31.0000000000000000
#     8675 | 60.0000000000000000
#     9230 | 47.0000000000000000


# Solution Exercise 6
###################################################################################################
###################################################################################################


# solution to first question
query="(SELECT COUNT(DISTINCT(user_id)) AS n_users, country
FROM exercise_6
GROUP BY country
ORDER BY n_users ASC
LIMIT 1)
UNION ALL
(SELECT COUNT(DISTINCT(user_id)) AS n_users, country
FROM exercise_6
GROUP BY country
ORDER BY n_users DESC
LIMIT 1)"
PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c $query

#  n_users | country
# ---------+---------
#        1 | Vietnam
#    18350 | China


# exploring second question, you can see first and last values using window functions
# with this query you can clearly see that first and last user can be many (e.g. on the last
# day there may be more than one user on that country)
query="SELECT country,
              FIRST_VALUE(user_id) OVER(PARTITION BY country ORDER BY created_at) AS first_user,
              LAST_VALUE(user_id) OVER(PARTITION BY country ORDER BY created_at) AS last_user
        FROM exercise_6
"
PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c $query


# we just want to pick one, so we calculate row numbers and giet first and last
query=" SELECT country,
              created_at,
              user_id,
              ROW_NUMBER() OVER(PARTITION BY country ORDER BY created_at ASC) AS ascending_ord,
              ROW_NUMBER() OVER(PARTITION BY country ORDER BY created_at DESC) AS descending_ord
              FROM exercise_6;
"
PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c $query


# and now just select those for which ascending or descending order is 1
query=" SELECT created_at, user_id, country
        FROM (SELECT country,
              created_at,
              user_id,
              ROW_NUMBER() OVER(PARTITION BY country ORDER BY created_at ASC) AS ascending_ord,
              ROW_NUMBER() OVER(PARTITION BY country ORDER BY created_at DESC) AS descending_ord
              FROM exercise_6) AS tmp
        WHERE ascending_ord=1 OR descending_ord=1;
"
PGPASSWORD=${ADMIN_PASSWORD} psql -h localhost -p 5432 -d ${DB_NAME} -U ${ADMIN_USER} -c $query


