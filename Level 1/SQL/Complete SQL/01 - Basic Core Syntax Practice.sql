use ecommerce;

SHOW TABLES;

DESC orders;

-- select quetries

SELECT * FROM customer;
SELECT name , state FROM customer;
SELECT quantity * unit_price AS 'total' FROM order_item;
SELECT 4 * 4 AS 'result';

-- From
SELECT * FROM orders o;

-- where
SELECT * FROM customer 
WHERE age < 20 ;

SELECT * FROM customer 
WHERE age >= 50;

SELECT * FROM customer 
WHERE age >= 50;

SELECT name as 'Name' , city as 'City' , phone as 'Mobile Number'
FROM customer 
WHERE age <= 20;

-- AND / OR / NOT

SELECT * FROM customer
WHERE city = 'Pune' AND age > 40;

SELECT name , phone  FROM customer
WHERE city = 'Mumbai' or city = 'Pune';

SELECT name , phone  FROM customer
WHERE city = 'Mumbai' or city = 'Pune' AND age > 50;

SELECT name , phone  FROM customer
WHERE (city = 'Mumbai' or city = 'Pune') AND (age > 50);

SELECT name , city FROM customer
WHERE NOT city = 'Pune';

SELECT COUNT(*) FROM customer
WHERE NOT age > 50;
 
SELECT COUNT(*) FROM customer
WHERE  age <= 50;

-- IN / NOT IN => Replacement of the multiple subqueries
-- without in
SELECT COUNT(*) FROM customer
WHERE city = 'Pune' or city = 'Mumbai' or city = 'Delhi' or city = 'Chennai';

-- with in
SELECT COUNT(*) FROM customer
WHERE city IN ('Pune' , 'Mumbai' , 'Delhi' , 'Chennai');

SELECT COUNT(*) FROM customer
WHERE city NOT IN ('Pune' , 'Mumbai' , 'Delhi' , 'Chennai');

SELECT * FROM customer 
WHERE customer_id IN (SELECT customer_id FROM customer
WHERE age > 50);


# single line comment
-- BETWEEN / NOT BETWEEN 

SELECT * FROM customer
WHERE  age BETWEEN 30 and 40;

SELECT * FROM customer
WHERE joined_date BETWEEN '2020-01-01' and '2020-12-31';

SELECT * FROM customer
WHERE joined_date NOT BETWEEN '2020-01-01' and '2020-12-31';



-- LIKE / NOT LIKE
SELECT * FROM customer
WHERE name LIKE 'R%';

SELECT * FROM customer
WHERE name LIKE '%r';

SELECT * FROM customer
WHERE name LIKE 'A%';

SELECT * FROM customer
WHERE name LIKE 'A____ _____';

SELECT * FROM customer
WHERE name NOT LIKE '100\%';



-- REGEXP/RLIKE
-- starts with A
SELECT * FROM customer
WHERE name REGEXP '^A';

-- ends with an
SELECT * FROM customer
WHERE name REGEXP 'an$';



-- IS NULL / IS NOT NULL
SELECT * FROM customer
WHERE email IS NOT NULL;

SELECT * FROM customer
WHERE phone IS  NULL;



-- DISTINCT
SELECT DISTINCT(city) FROM customer;

SELECT distinct city , state FROM customer;

SELECT COUNT(Distinct city) AS 'City' FROM customer;



-- ORDER BY
SELECT * FROM customer
ORDER BY age;

-- null does not get count
select COUNT(*) FROM customer
WHERE phone IS NULL;

SELECT * FROM customer
ORDER BY city ASC , age DESC;

SELECT name , phone FROM customer
ORDER BY 2;

SELECT name , age AS 'AGE' from customer
ORDER BY AGE;



-- LIMIT / OFFSET (Controls how many rows to be returned , always use with order by)alter
SELECT * FROM customer
ORDER BY age LIMIT 10;

SELECT * FROM customer
ORDER BY age LIMIT 2 OFFSET 2;

SELECT * FROM customer
ORDER BY age LIMIT 2,2;



-- alisas
SELECT name 'Name' FROM customer;

SELECT name AS 'Name' FROM customer;

SELECT quantity * unit_price AS 'Total' FROM order_item;



-- arithematc on alisas
SELECT quantity * unit_price AS 'Total' FROM order_item;



-- 






















-- 





