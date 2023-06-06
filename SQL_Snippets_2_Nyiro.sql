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























