# SQL JOINS
use joins;
# Perfrom cross join on users and groups table

SELECT * FROM joins.users t1 
JOIN
joins.groups t2;

# Perform inner join on membership and users 

SELECT * FROM joins.membership t1
INNER JOIN
joins.users t2 ON
t1.user_id = t2.user_id;

# Perform Left join on membership and users1 

SELECT * FROM joins.membership t1
LEFT JOIN
joins.users1 t2 ON
t1.user_id = t2.user_id;

# Perform Right join on membership and users1 

SELECT * FROM joins.membership t1
RIGHT JOIN
joins.users1 t2 ON
t1.user_id = t2.user_id;

# SQL Set Operations -> union, union all, intersect, except

# Perform UNION

SELECT * FROM joins.person1
UNION
SELECT * FROM joins.person2;

# Perform UNION ALL

SELECT * FROM joins.person1
UNION ALL 
SELECT * FROM joins.person2;

# Perform Intersect 

SELECT * FROM joins.person1
INTERSECT
SELECT * FROM joins.person2;

# Perform Except

SELECT * FROM joins.person1
EXCEPT
SELECT * FROM joins.person2;

# Perfrom Full Outer Join

SELECT * FROM joins.membership t1
LEFT JOIN
joins.users1 t2 ON
t1.user_id = t2.user_id
UNION 
SELECT * FROM joins.membership t1
RIGHT JOIN
joins.users1 t2 ON
t1.user_id = t2.user_id;

# Perform Self Join on users1 table

SELECT * FROM joins.users1 t1
JOIN
joins.users1 t2 ON
t1.emergency_contact = t2.user_id;

# Perform Joins on multiple columns

SELECT * FROM joins.students t1
JOIN
joins.class t2 ON
t1.class_id = t2.class_id
AND
t1.enrollment_year = t2.class_year;

# Perform Joins on three table

SELECT t1.order_id, t1.amount, t1.profit, t3.name FROM flipkart.order_details t1
JOIN flipkart.orders t2 ON
t1.order_id = t2.order_id 
JOIN
flipkart.users t3 ON
t2.user_id = t3.user_id;

# find order_id, name and city by joining users and orders

SELECT t1.order_id , t2.name, t2.city 
FROM flipkart.orders t1 
JOIN
flipkart.users t2 ON
t1.user_id = t2.user_id;

# find order_id and vertical by joinig order_details and category 
SELECT t2.order_id , t1.vertical FROM flipkart.category t1
JOIN 
flipkart.order_details t2 ON
t1.category_id = t2.category_id;

# Filtering Rows 

# Finding all the orders placed in pune 

SELECT * FROM flipkart.users t1
JOIN flipkart.orders t2 ON
t1.user_id = t2.user_id WHERE t1.city="pune" and t1.name="sarita";


# Finding all orders under chair category 

SELECT * FROM flipkart.order_details t1 
JOIN flipkart.category t2 ON
t1.category_id = t2.category_id WHERE t2.vertical = "chairs";

# Practice Questions 

# Find all profitable orders 

SELECT
    t1.order_id,
    SUM(t2.profit) AS total_profit
FROM flipkart.orders t1
JOIN flipkart.order_details t2
ON t1.order_id = t2.order_id
GROUP BY t1.order_id HAVING total_profit >0
ORDER BY t1.order_id;

# Find the customer who has placed max number of orders 

SELECT t2.name, COUNT(*) AS num_orders FROM flipkart.orders t1 
JOIN flipkart.users t2 ON
t1.user_id = t2.user_id 
GROUP BY t2.name ORDER BY num_orders DESC limit 1;

# which is the most profitable category(vertical means)

SELECT t2.vertical ,SUM(profit) AS profitable FROM flipkart.order_details t1 
JOIN flipkart.category t2 ON
t1.category_id = t2.category_id GROUP BY t2.vertical ORDER BY profitable DESC limit 1 ;


