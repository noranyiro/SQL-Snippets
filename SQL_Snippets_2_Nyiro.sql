-- exercise 21 Calculate the total damage cost for each car_brand!
SELECT 
   car_brand, 
   SUM(damage)AS sum_damage
FROM
    accidents
GROUP BY car_brand
ORDER BY car_brand;

--Calculate the average total damage cost for each car_brand! List the top 10 brands by average total damage cost
SELECT 
   car_brand, 
   AVG(damage)AS avr_damage
FROM
    accidents
GROUP BY car_brand
ORDER BY avr_damage DESC
LIMIT 10;

--exercise 22_1
--In which cities did the most accidents occur?
SELECT 
   city, 
  COUNT(damage)AS num_accident
FROM
    accidents
GROUP BY city
ORDER BY num_accident DESC
LIMIT 10;

--exercise 22:2
--In which city is the total damage cost the highest?
SELECT 
   city, 
  SUM(damage)AS sum_damage
FROM
    accidents
GROUP BY city
ORDER BY sum_damage DESC
LIMIT 10;

--exercise 22_2
--In which city is the average damage cost the highest?
SELECT 
   city, 
  AVG(damage)AS avg_damage
FROM
    accidents
GROUP BY city
ORDER BY avg_damage DESC
LIMIT 10;

--exercise 23
--Calculate the average damage cost per country for the accidents in which the weather was 'Rainy' or 'Windy'!

SELECT 
   country, 
  AVG(damage) AS avg_damage
FROM
    accidents
WHERE
    weather = 'Rainy' OR weather = 'Windy'
GROUP BY country;

-- exercise 24
--In which 3 cities were the accidents reported to the police the most in 2008?

SELECT 
   city, 
 COUNT(*) AS count_reported
FROM
    accidents
WHERE
    accident_date BETWEEN '2008_01_01' and '2008_12_31'
    AND reported = 'true'
GROUP BY city
ORDER BY count_reported DESC
LIMIT 3;

-- extra exercise
--Count the number of damages by damage costs!

SELECT 
  damage,
  COUNT (*) AS count_lines
FROM accidents
GROUP BY damage
ORDER BY damage;


CREATE TABLE covered_by_insurance 
(
  accident_id   INT,
  paid          BOOL
);

COPY covered_by_insurance FROM '/home/dataguy/covered_by_insurance.csv' WITH CSV HEADER DELIMITER',';

CREATE TABLE date_table 
(
  accident_date   DATE,
  dow             TEXT
);

COPY date_table FROM '/home/dataguy/date_table.csv' WITH CSV HEADER DELIMITER',';


-- exercise 25
--Join the accidents and the date_table tables and select the first 10 rows!
SELECT *
FROM accidents
JOIN date_table
ON accidents.accident_date = date_table.accident_date
LIMIT 10;

--exercise 26
--Which day of the week had the most accidents overall?

SELECT dow,
COUNT (*) as count_accident
FROM accidents
JOIN date_table
ON accidents.accident_date = date_table.accident_date
GROUP BY dow
ORDER BY count_accident DESC
LIMIT 10;
--Fictional project: we have online products: users may send free-trees and super-trees that cost 1 dollar.
--Data basis are separate: user id and super_tree sends
--Business question 1: Do we have paying users?
SELECT registration.user_id, 
       COUNT (*) AS numb_super_tree_sends
FROM registration
JOIN super_tree
ON registration.user_id = super_tree.user_id
GROUP BY registration.user_id
LIMIT 100;

-- Business question 2: How much did the users pay in total through 2018-04-30?
SELECT SUM (Revenue_table.revenue_per_user)AS revenue
FROM
    (SELECT COUNT (*)-1 AS revenue_per_user
    FROM super_tree
    GROUP BY user_id)AS Revenue_table;

SELECT COUNT(user_id)-COUNT(DISTINCT(user_id)) AS revenue
FROM super_tree;









































How much did the users pay in total through 2018-04-30?























