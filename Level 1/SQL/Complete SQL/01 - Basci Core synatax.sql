use ecommerce;

-- 1.
SELECT name , city , state FROM customer;

-- 2.
SELECT product_name , price FROM product;

-- 3
SELECT * FROM customer
WHERE city = 'Mumbai';

-- 4
SELECT * FROM orders
WHERE status = 'delivered';

-- 5
SELECT * FROM product
WHERE price > 10000;

-- 6
SELECT * FROM customer
WHERE joined_date > '2023-01-01';

-- 7
SELECT * FROM employee
ORDER BY salary DESC;

-- 8
SELECT * FROM customer
ORDER BY customer_id LIMIT 10;

-- 9
SELECT * FROM product
WHERE stock_qty = 0;

-- 10
SELECT DISTINCT(city) FROM customer;

-- 11
SELECT * FROM customer
WHERE emaIl Is NULL;

-- 12
SELECT * FROM orders
WHERE order_date BETWEEN '2023-01-01' AND '2023-12-31';

-- 13
SELECT * FROM product 
ORDER BY price ASC;

-- 14
SELECT * FROM employee
WHERE department_id = 3;

-- 15
SELECT * FROM product
ORDER BY price DESC LIMIT  5;



-- Medium

-- 16.
SELECT * FROM customer
WHERE city IN ('Mumbai' , 'Delhi');

-- 17
SELECT * FROM product
WHERE price BETWEEN  500 AND 5000;

-- 18
SELECT * FROM employee
WHERE salary > 50000;

-- 19
SELECT * FROM orders
WHERE payment_mode = 'UPI';

-- 20
SELECT * FROM customer
WHERE (state = 'Maharashtra') and (city != 'Mumbai');

-- 21
SELECT * FROM product
WHERE product_name LIKE '%Shirt%';

-- 22.
SELECT * FROM customer
WHERE name LIKE 'A%';

-- 23
SELECT * FROM orders
WHERE order_date BETWEEN '2023-01-01' AND '2023-06-30';

-- 24
SELECT * FROM employee
WHERE salary BETWEEN  30000 AND 60000;

-- 25
SELECT * FROM product
WHERE stock_qty = 0 AND price > 5000;

-- 26
SELECT * FROM customer
WHERE email Like '%@gmail.com';

-- 27
SELECT * from orders
WHERE status != 'delivered' AND status != 'cancelled';

-- 28
SELECT * from employee
ORDER BY department_id ASC , salary DESC;

-- 29
SELECT * FROM customer
WHERE name Like '%Kumar';

-- 30
SELECT * FROM customer
ORDER BY age LIMIT 10;

-- 31
SELECT product_name , price , price + (price * 0.18) AS 'gst_price' FROM product;

-- 32
SELECT * FROM customer
WHERE phone IS NULL;

-- 33
SELECT * FROM product
WHERE price NOT BETWEEN 1000 and 10000;

-- 34
SELECT * FROM customer
WHERE city Like 'B%';

-- 35
SELECT * FROM product
WHERE stock_qty  BETWEEN 50 and 200;

-- 36
SELECT DISTINCT(state) FROM customer
ORDER BY state;

-- 37
select * from employee
WHERE manager_id IS NULL;

-- 38
SELECT * FROM orders
ORDER BY order_date DESC LIMIT 15;

-- 39
SELECT * FROM customer
WHERE name  LIKE '%SINGH%' or  '%Sharma%';

-- 40  List products whose name starts with a vowel — A, E, I, O, U using REGEXP
SELECT * FROM products WHERE product_name REGEXP '^[AEIOUaeiou]';

-- 41
SELECT * FROM customer 
WHERE phone LIKE '9%';

-- 42
SELECT * FROM employee
WHERE hire_date BETWEEN '2020-10-01' AND '2022-12-31'
ORDER BY hire_date;

-- 43
SELECT * FROM product
ORDER BY category_id ASC , price DESC;

-- 44
select * from orders
WHERE order_id BETWEEN 100 and 200  and status = 'pending';

-- 45
SELECT * FROM customer
WHERE state IN ('Rajasthan' , 'Gujarat')
ORDER BY city;

-- 46 Use REGEXP to find customers whose email is from yahoo.com
SELECT * FROM customers WHERE email REGEXP '@yahoo\\.com$';

-- 47  Find products where product name contains a number using REGEXP
SELECT * FROM products WHERE product_name REGEXP '[0-9]';

-- 48
SELECT * FROM products ORDER BY price DESC LIMIT 10 OFFSET 5;

-- 49 
SELECT * FROM employee
WHERE salary > 70000 or  hire_date < '2019-06-01';

-- 50 Find customers whose name is exactly 10 characters long using REGEXP or LIKE
SELECT * FROM customer
WHERE name like '__________';



