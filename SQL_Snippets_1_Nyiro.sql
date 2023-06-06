
-- Car accident database with damage costs.
--TASK 1 : Calculate the average damage cost per country for the accidents in which the weather was 'Rainy' or 'Windy'!
SELECT country, 
  AVG (damage) AS avg_damage
  FROM accidents
  WHERE weather = 'Rainy' OR weather = 'Windy'
GROUP by country
ORDER by avg_damage DESC;

-- TASK 2 : In which 3 cities were the accidents reported to the police the most in 2008?
SELECT city, 
    COUNT (*) AS numb_reported_acc
    FROM accidents
    WHERE reported = 'true'
    AND accident_date BETWEEN '2008-01-01' AND '2008-12-31'
GROUP by city
ORDER by numb_reported_acc DESC;

--TASK 3: What day of the week had the most accidents covered by insurance?

SELECT dow, 
      COUNT (*) AS numb_accidents
    FROM accidents
    JOIN covered_by_insurance
    ON accidents.accident_id = covered_by_insurance.accident_id
    JOIN date_table
    ON accidents.accident_date = date_table.accident_date
WHERE covered_by_insurance.paid = 'true'
GROUP BY dow
ORDER BY numb_accidents DESC;

--TASK 4: How many cities had less than 40 incidents? (Solution with subquery)

SELECT COUNT(*)
FROM
    (SELECT city, COUNT (*) AS numb_accidents
    FROM accidents
    GROUP BY city
    ORDER BY numb_accidents)as new_table
WHERE numb_accidents < 40 ;

--TASK 4: How many cities had less than 40 incidenents? (Solution with HAVING)

SELECT COUNT(*)
FROM
    (SELECT city, COUNT (*)
    FROM accidents
    GROUP BY city
    HAVING COUNT(*) < 40)as new_table;



























































































































