use ecommerce;

-- 1
SELECT * FROM customer
WHERE city != 'Mumbai';

-- 2.Show all products where stock_qty is not 0
SELECT * FROM product
WHERE stock_qty = 0;

-- 3.List orders that are not in Delivered status
SELECT * FROM orders 
WHERE status != 'Delivered';

-- 4.Find employees who do not belong to department 1 or department 2
SELECT name from employee
WHERE department_id NOT IN (1,2);

-- 5. Show all customers where email is NOT NULL and phone is NOT NULL
SELECT name FROM customer
WHERE (email IS NOT NULL AND phone IS NOT NULL);

-- 6.Find all products where price is not between 500 and 5000
SELECT product_name FROM product
WHERE price NOT BETWEEN 500 and 5000;

-- 7.List customers who joined before 2021-01-01
SELECT name from customer
WHERE joined_date < '2021-01-01';

-- 8.Show all orders that are not paid by Cash on Delivery
SELECT * FROM orders 
WHERE payment_mode != 'Cash on Delivery';

-- 9.Find employees whose salary is not between 30000 and 60000
SELECT name FROM employee
WHERE salary NOT BETWEEN 30000 and 60000;

-- 10.List customers from cities that are not Mumbai, Delhi, or Bangalore
SELECT name , city FROM customer
WHERE city NOT IN ('Mumbai' , 'Delhi' , 'Bengalore');

-- 11.Show products where category_id is not 1 and price is above 1000
SELECT * FROM product
WHERE category_id != 1 AND price > 1000;

-- 12.Find all orders placed before 2022-06-01 or after 2024-01-01
SELECT count(*) FROM orders
WHERE order_date NOT BETWEEN '2022-06-01' AND '2024-01-01';

SELECT count(*) FROM orders
WHERE order_date < '2022-06-01' or order_date > '2024-01-01';

-- 13.List employees whose hire_date is not in 2020
SELECT * FROM employee
WHERE hire_date < '2020-01-01' or hire_date > '2020-12-31'
ORDER BY hire_date;

-- 14.Show customers where age is not between 25 and 35
SELECT * FROM customer
WHERE age NOT BETWEEN 25 AND 35;

-- 15.Find all products where stock_qty is 0 and price is above 10000
select * FROM product
WHERE stock_qty = 0 AND price > 10000;

-- 16.Find customers from Maharashtra OR customers younger than 25 — but not both (XOR)
SELECT * FROM customer
WHERE state = 'Maharashtra' XOR age < 25;

-- 17.List products where price is above 1000 AND stock is below 100 AND category_id is not 3
SELECT * FROM product
WHERE price > 1000 and stock_qty < 100 and category_id != 3;

-- 18.Show customers from Mumbai or Delhi who are older than 30
SELECT * from customer
WHERE (city = 'Mumbai' or city = 'Delhi') AND age > 30;

-- 19.Find orders placed in 2022 that are either Pending or Processing
SELECT * FROM orders
WHERE (order_date > '2021-12-31' and order_date < '2023-01-01') and status NOT In ('Pending' , 'Processing');

-- 20.List employees in department 1 or 2 with salary above 60000
SELECT * FROM employee
WHERE department_id IN (1 , 2) AND salary > 60000;

-- 21.Show customers whose name starts with A and city is not Mumbai
SELECT * FROM customer
WHERE name LIKE 'A%' AND city != 'Mumbai';

-- 22.Find products whose name contains either Chair or Table (not in dataset — adapt to Shirt or Shoes)
SELECT * FROM product
WHERE product_name LIKE '%Shirt%'  or product_name LIKE '%Shoes%';

-- 23.List employees hired after 2021-01-01 and salary below 40000
SELECT * from employee
WHERE hire_date > '2021-01-01' AND salary < 40000;

-- 24 .Show orders from customer_id between 50 and 100 that are not Cancelled
SELECT * FROM orders
WHERE (customer_id BETWEEN 50 and 100 ) and (status != 'Cancelled');

-- 25.Find customers from Karnataka or Tamil Nadu sorted by city
SELECT * FROM customer
WHERE state IN ('Karnataka' , 'Tamil Nadu')
ORDER BY city;

-- 26.List products with price above 5000 or stock_qty above 500
SELECT * FROM product
WHERE price > 5000 AND stock_qty > 500;

-- 27.Show orders placed in December of any year using MONTH()
SELECT * FROM orders
WHERE MONTHNAME(order_date) = 'December';

-- 28.Find customers whose age is above 50 or joined before 2021-01-01
SELECT COUNT(*) FROM customer
WHERE (age > 50) AND (joined_date < '2021-01-01');

-- 29.List employees with salary above 70000 who are not in Technology department
SELECT * FROM employee
WHERE salary > 70000 AND department_id != 3;

-- 30.Show customers whose email contains neither gmail nor yahoo — find customers using other email domains
SELECT * FROM customer
WHERE email NOT LIKE '%@gmail.com' AND email NOT LIKE '%@yahoo.com';

-- 31.Find products where price multiplied by stock_qty is above 500000 — total inventory value filter
SELECT * FROM product 
WHERE price * stock_qty  > 500000;

-- 32.List orders placed on weekdays only using DAYOFWEEK() — 1 is Sunday, 7 is Saturday

-- 33.Show customers from cities starting with N or M
SELECT * FROM customer
WHERE city LIKE 'N%' OR city LIKE 'M%';

-- 34.Find employees where manager_id is NULL OR salary is above 100000
SELECT * FROM employee
WHERE manager_id IS NULL or salary > 100000;

-- 35.List products where price is above 20000 and category is Electronics — category_id = 1
SELECT * FROM product
WHERE price > 20000 AND category_id = 1;


