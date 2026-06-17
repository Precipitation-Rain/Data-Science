use ecommerce;

-- Three valued logic
SELECT * FROM customer
WHERE email != 'test@gmail.com';

-- operator precedance
SELECT * FROM customer
where city = 'Pune' or city = 'Delhi' and age > 30; 

SELECT * FROM customer
where (city = 'Pune' or city = 'Delhi') and age > 30;

SELECT * FROM customer
WHERE city = 'Pune' or city = 'Delhi'; 


-- paranthesis for grouping(Both will get differnet results)
SELECT * FROM customer
where city = 'Pune' or city = 'Delhi' and age > 30; 

SELECT * FROM customer
where (city = 'Pune' or city = 'Delhi') and age > 30;


-- NOT Rules

SELECT count(*) FROM customer
WHERE city != 'Mumbai';

SELECT count(*) FROM customer
WHERE NOT city = 'Mumbai';


SELECT * FROM customer
WHERE NOT city IN ('Mumbai' , 'Pune');

SELECT count(*) FROM customer
WHERE city NOT IN ('Mumbai' , 'Pune');

SELECT * FROM customer
WHERE  NOT email IS  NULL;

SELECT * FROM customer
WHERE  email IS NOT  NULL;

-- XOR OPERATOR

-- spaceship operator

-- THIS WILL WORK
SELECT * FROM customer
WHERE email IS NULL;
SELECT * FROM customer
WHERE email IS NOT NULL;

-- this will won't work
SELECT * FROM customer
WHERE email =  NULL;

SELECT * FROM customer
WHERE email !=  NULL;

-- how spaceship operator work
SELECT * FROM customer
WHERE email <=> NULL; 

-- IN VS EXISTS

(Select * from customer WHERE email IS NULL);

SELECT * FROM customer
WHERE email IN (Select email from customer );


-- Having Vs where

-- where with arithematic expression
SELECT * FROM employee
WHERE (salary / 2) > 30000;

-- where with string expression and function
SELECT * FROM employee 
WHERE length(name) > 13;

-- where with date expressions
SELECT * FROM employee
WHERE YEAR(hire_date) = 2020;

SELECT * FROM employee
WHERE hire_date < '2021-12-31' and hire_date > '2020-01-01';

-- Implicit Type Conversion
-- always compare two same data types

-- Multiple Conditions on Same Column
SELECT * FROM customer
WHERE age > 30 and age < 40;

-- NOT IN with NULL Trap — Critical
SELECT * FROM employee 
WHERE manager_id NOT IN (SELECT manager_id from employee);

-- BETWEEN Edge Cases

-- LIKE Edge Cases and ESCAPE

-- Combining Multiple Filter Types

/* Concepts:

DAY 2 — FILTERING AND CONDITIONS

Three-Valued Logic (TRUE / FALSE / UNKNOWN)
This is the most important concept in filtering. SQL does not work on two values like programming — it works on three. Any condition involving NULL does not return FALSE, it returns UNKNOWN. And WHERE only keeps rows where the condition is TRUE. UNKNOWN rows are excluded silently. This is why WHERE email != 'test@gmail.com' will not return rows where email is NULL — the comparison returns UNKNOWN, not TRUE.

Operator Precedence
SQL evaluates conditions in a fixed order when you mix operators. NOT is evaluated first, then AND, then OR. This means WHERE city = 'Mumbai' OR city = 'Delhi' AND age > 25 is interpreted as WHERE city = 'Mumbai' OR (city = 'Delhi' AND age > 25) — not what most people intend. Always use parentheses when mixing AND and OR to make your intent explicit and avoid silent logic bugs.
NOT → evaluated first
AND → evaluated second
OR → evaluated last


Parentheses for Grouping
Parentheses override default operator precedence. They are not optional when mixing AND with OR — they are mandatory for correct logic.
WHERE (city = 'Mumbai' OR city = 'Delhi') AND age > 25 → age filter applies to both cities
WHERE city = 'Mumbai' OR (city = 'Delhi' AND age > 25) → age filter applies only to Delhi
These two queries return completely different results


NOT Operator — All Variations
NOT negates a condition. Know all its forms:
WHERE NOT city = 'Mumbai' → same as WHERE city != 'Mumbai' but excludes NULLs
WHERE city != 'Mumbai' → also excludes NULLs (UNKNOWN for NULL rows)
WHERE NOT city IN ('Mumbai', 'Delhi') → same as NOT IN
WHERE NOT age BETWEEN 18 AND 30 → same as NOT BETWEEN
WHERE NOT name LIKE 'A%' → same as NOT LIKE
WHERE NOT email IS NULL → same as IS NOT NULL
Key trap: NOT IN with a subquery that returns any NULL will return zero rows. Critical interview question.


XOR Operator
MySQL specific. Returns TRUE only when exactly one of the conditions is true, not both.
WHERE condition1 XOR condition2
TRUE XOR FALSE → TRUE
TRUE XOR TRUE → FALSE
FALSE XOR FALSE → FALSE
Rarely used in real work but occasionally asked conceptually


NULL-Safe Equality Operator <=>(Spaceship Operator)
MySQL specific. Unlike =, this returns TRUE when both sides are NULL.
WHERE email <=> NULL → returns rows where email IS NULL, same as IS NULL
WHERE col1 <=> col2 → returns TRUE even when both are NULL
Regular = returns UNKNOWN when either side is NULL
Mostly used in JOIN conditions when NULL equality matters


IN vs EXISTS
Both check if a value exists somewhere, but they work differently.
IN:
Evaluates the full subquery first, builds a list, then checks each row against that list
WHERE customer_id IN (SELECT customer_id FROM orders)
If the subquery returns any NULL value, NOT IN returns zero rows — critical trap
Better when the subquery result is small

EXISTS:
Runs the subquery for each row of the outer query, stops as soon as it finds one match
WHERE EXISTS (SELECT 1 FROM orders WHERE orders.customer_id = customers.customer_id)
Not affected by NULLs in the subquery
Better when the subquery result is large
EXISTS is generally faster on large datasets because of short-circuit evaluation
Short-circuit evaluation: EXISTS stops scanning the inner table the moment it finds one matching row. IN does not short-circuit.


HAVING vs WHERE
Both filter rows but at completely different stages of execution.
WHERE:
Runs before GROUP BY and aggregation
Filters individual raw rows
Cannot use aggregate functions like COUNT(), SUM(), AVG()
WHERE salary > 50000

HAVINGRuns after GROUP BY and aggregation
Filters groups, not individual rows
Can use aggregate functions
HAVING COUNT(*) > 5
HAVING without GROUP BY applies the filter to the entire result as a single group

Common interview question: Can you use HAVING without GROUP BY? Yes — it treats the entire result as one group.
Can you use WHERE and HAVING in the same query? Yes — WHERE filters raw rows first, then GROUP BY groups them, then HAVING filters the groups.


WHERE with Arithmetic Expressions
You can perform calculations directly inside a WHERE clause.
WHERE price * quantity > 10000 → filter on computed value
WHERE salary * 12 > 600000 → annual salary filter
WHERE price * 1.18 < 5000 → price with GST under 5000
Avoid applying functions on indexed columns in WHERE — it prevents index usage


WHERE with String Expressions
You can use string functions directly inside WHERE, but this prevents index usage.
WHERE LOWER(city) = 'mumbai' → case-insensitive match (MySQL is case-insensitive by default so often unnecessary)
WHERE LENGTH(name) > 10 → filter on string length
WHERE TRIM(email) IS NOT NULL → filter after trimming spaces


WHERE with Date Expressions
Filtering on date columns and computed date values.
WHERE YEAR(joined_date) = 2023 → rows from 2023 (avoids using index)
WHERE joined_date >= '2023-01-01' AND joined_date < '2024-01-01' → better, uses index
WHERE MONTH(order_date) = 12 → December orders
WHERE DATEDIFF(CURDATE(), joined_date) < 365 → joined within last year
Always prefer range conditions over functions on date columns for performance


Implicit Type Conversion
MySQL silently converts types when you compare a column to a different type. This can cause unexpected results.
WHERE customer_id = '5' → MySQL converts '5' to integer, works but bad practice
WHERE phone = 9876543210 → phone is VARCHAR, comparing to integer causes full table scan
Always match the data type of the column in your WHERE condition
Mismatched types can silently prevent index usage


Multiple Conditions on Same Column
Multiple conditions on the same column can often be simplified.
WHERE age > 18 AND age < 60 → can use BETWEEN: WHERE age BETWEEN 19 AND 59
WHERE city = 'Mumbai' OR city = 'Delhi' OR city = 'Pune' → use IN: WHERE city IN ('Mumbai','Delhi','Pune')
WHERE salary > 30000 AND salary < 50000 AND salary != 40000 → complex range with exclusion


NOT IN with NULL Trap — Critical
This is the most commonly tested NULL trap in SQL interviews.
If a subquery used with NOT IN returns even one NULL value, the entire NOT IN returns zero rows
WHERE customer_id NOT IN (SELECT customer_id FROM orders WHERE customer_id IS NULL) → returns nothing
Solution: always add WHERE column IS NOT NULL inside the subquery when using NOT IN
This is why EXISTS / NOT EXISTS is safer than IN / NOT IN with subqueries


BETWEEN Edge Cases
BETWEEN is always inclusive on both ends: BETWEEN 10 AND 20 includes 10 and 20
Works on strings alphabetically: WHERE name BETWEEN 'A' AND 'M' returns names starting with A through M
Works on dates: WHERE order_date BETWEEN '2023-01-01' AND '2023-12-31'
For DATETIME columns: BETWEEN '2023-01-01' AND '2023-12-31' misses anything after midnight on Dec 31. Use < '2024-01-01' instead
NOT BETWEEN excludes both endpoints


LIKE Edge Cases and ESCAPE
% matches zero or more characters — 'A%' matches 'A', 'Amit', 'Arjun'
_ matches exactly one character — 'A_' matches 'Aj', 'Am' but not 'Amit'
To search for a literal % or _ in data, use ESCAPE: WHERE discount LIKE '10\%' ESCAPE '\' searches for the string '10%'
LIKE is case-insensitive in MySQL by default for standard collations
LIKE on large tables without an index is a full table scan — slow


Combining Multiple Filter Types
Real queries combine everything together. Knowing how they interact matters.
WHERE city IN ('Mumbai','Pune') AND age BETWEEN 25 AND 40 AND email IS NOT NULL AND name LIKE 'A%'
SQL evaluates all AND conditions, applies NOT, then OR
Each condition narrows the result set further
Ordering conditions from most selective to least selective is a performance best practice


*/










