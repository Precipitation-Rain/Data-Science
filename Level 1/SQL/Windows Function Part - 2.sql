-- windows functions part 2

use campusx;

-- ranking
SELECT * FROM (SELECT BattingTeam , batter ,SUM(batsman_run) ,
DENSE_RANK() OVER(PARTITION BY BattingTeam ORDER BY SUM(batsman_run) DESC) AS 'batsman_rank'
FROM ipl
GROUP BY BattingTeam , batter) t
WHERE t.batsman_rank < 6 ;

-- cumulative sum

SELECT 
CONCAT('Match - ' , CAST(ROW_NUMBER() OVER(ORDER BY ID) AS CHAR)) AS 'match_no',
SUM(batsman_run),
SUM(SUM(batsman_run)) OVER(ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS 'run_scored_till_that_match'
FROM ipl
WHERE batter = 'V Kohli'
GROUP BY ID;


-- CUMULATIVE AVEGRAGE

SELECT 
CONCAT('Match - ' , CAST(ROW_NUMBER() OVER(ORDER BY ID) AS CHAR)) AS 'match_no',
SUM(batsman_run),
AVG(SUM(batsman_run)) OVER(ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS 'cumulative avg'
FROM ipl
WHERE batter = 'V Kohli'
GROUP BY ID;


-- running average(average of last 5 / 10 matches)

SELECT COUNT(*) FROM (SELECT 
CONCAT('Match - ' , CAST(ROW_NUMBER() OVER(ORDER BY ID) AS CHAR)) AS 'match_no',
SUM(batsman_run),
AVG(SUM(batsman_run)) OVER(ROWS BETWEEN 5 PRECEDING AND CURRENT ROW) AS 'running_avg'
FROM ipl
WHERE batter = 'V Kohli'
GROUP BY ID) T;


-- percent total

use zomato;

    SELECT f.f_id , f.f_name , total ,
     (total / SUM(total) OVER() ) * 100 AS 'percent_change'
    FROM (SELECT f_id , SUM(amount) AS 'total' FROM orders t1
    JOIN order_details t2
    ON t1.order_id = t2.order_id
    WHERE r_id = 2
    group by f_id) t
    JOIN food f
    ON t.f_id = f.f_id
    order by percent_change desc

 
