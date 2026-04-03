
use students;


-- percent change

-- percentile_disc

-- percentile_cont


-- segmentation

SELECT * ,
NTILE(3) OVER(ORDER BY marks DESC) AS 'buckets'
FROM student_marks;

use campusx;

SELECT brand_name , model , price ,
CASE
	WHEN bucket = 1 THEN 'Premium'
    WHEN bucket = 2 THEN 'Mid-range'
    WHEN bucket = 3 THEN 'budget'
    
END AS 'case type'
FROM (select brand_name , model , price , 
NTILE(3) OVER(ORDER BY price DESC) AS 'bucket'
from smartphones) t ;

-- cumulative distribution (way to calculate percentile)
use students;

select *,
CUME_DIST() OVER(ORDER BY marks) *100
From student_marks;

-- you can do partition by on multiple columns




 
