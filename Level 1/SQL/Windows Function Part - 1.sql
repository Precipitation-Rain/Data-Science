--  windpows functions


-- aggregate functions as windows function

use students;

SELECT * , 
AVG(marks) OVER(PARTITION BY branch) 
FROM student_marks;

SELECT *,
AVG(marks) OVER(),
MAX(marks) OVER(PARTITION BY branch) AS 'max_marks',
MIN(marks) OVER(PARTITION BY branch) AS 'min_marks',
SUM(marks) OVER(PARTITION BY branch) AS 'sum_marks',
COUNT(marks) OVER(PARTITION BY branch) AS 'no_of__marks'
FROM student_marks;

-- find those students whose marks are less than branch avg marks

SELECT  * FROM (SELECT * ,
AVG(marks) OVER(PARTITION BY branch) AS 'avg_marks_per_branch'
FROM student_marks) t
WHERE t.marks < t.avg_marks_per_branch;



--  RANK

SELECT * ,
RANK() OVER(ORDER BY marks DESC) AS 'rank'
FROM student_marks;

-- dense rank

SELECT * ,
DENSE_RANK() OVER(PARTITION BY branch ORDER BY marks DESC) AS 'rank'
FROM student_marks;

-- Find top 2 most paying customers of each month

use zomato;


-- row number (used to number each row uniquely)alter

SELECT * ,
ROW_NUMBER() OVER(PARTITION BY branch) as 'student_id'
FROM student_marks;

-- Create roll no from branch and marks

SELECT * ,
concat(branch , '-' , ROW_NUMBER() OVER(PARTITION BY branch)) AS 'roll_no'
FROM student_marks;



-- FIRST VALUE AND LAST VALUE

SELECT *,
FIRST_VALUE(name) OVER(ORDER BY marks DESC)
FROM student_marks;


SELECT *,
LAST_VALUE(name) OVER(ORDER BY marks DESC
ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS 'NAME'
FROM student_marks;


-- NTH VALUE

SELECT *,
NTH_VALUE(name , 6) OVER(partition by branch ORDER BY marks DESC
ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
FROM student_marks;

SELECT * ,
NTH_VALUE(name , 3) OVER(PARTITION BY branch ORDER BY marks DESC
ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
FROM student_marks;

-- find the brach toppers

SELECT * ,
FIRST_VALUE(name) OVER(PARTITION BY branch ORDER BY marks DESC)
FROM student_marks;

SELECT * FROM (SELECT * ,
LAST_VALUE(name) OVER w AS 'TOPPER_name',
LAST_VALUE(marks) OVER w as 'TOPPER_marks'
FROM student_marks
WINDOW w AS (PARTITION BY branch ORDER BY marks ASC
ROWS BETWEEN UNBOUNDED PRECEDING AND unbounded following)) t

WHERE t.name = TOPPER_name AND t.marks = TOPPER_marks ;

-- find the brach LAST GUY

SELECT * ,
LAST_VALUE(name) OVER(PARTITION BY branch ORDER BY marks DESC
ROWS BETWEEN UNBOUNDED PRECEDING AND unbounded following)
FROM student_marks;

-- WAY 2

SELECT * ,
FIRST_VALUE(name) OVER(PARTITION BY branch ORDER BY marks ASC
ROWS BETWEEN UNBOUNDED PRECEDING AND unbounded following)
FROM student_marks;


-- way 3

SELECT * FROM (SELECT * ,
LAST_VALUE(name) OVER w AS 'last_name',
LAST_VALUE(marks) OVER w as 'last_marks'
FROM student_marks
WINDOW w AS (PARTITION BY branch ORDER BY marks DESC
ROWS BETWEEN UNBOUNDED PRECEDING AND unbounded following)) t

WHERE t.name = last_name AND t.marks = last_marks;



-- LEAD AND LAG

SELECT * ,
LAG(marks) OVER() 
FROM student_marks;

SELECT * ,
LEAD(marks) OVER() 
FROM student_marks;

USE zomato;

SELECT monthNAME(date) , SUM(amount) as 'total' , 
( (SUM(amount) - LAG(SUM(amount)) OVER()) / LAG(SUM(amount)) OVER()) *100
FROM orders 
GROUP BY MONTHNAME(date);


 






















