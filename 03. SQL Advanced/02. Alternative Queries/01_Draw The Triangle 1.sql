DECLARE @temp_num INT;
SET @temp_num = 21;

WITH CTE_Numbers AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1
      FROM CTE_Numbers
     WHERE n < @temp_num
)
SELECT REPLICATE('* ', @temp_num - n)
  FROM CTE_Numbers
OPTION (MAXRECURSION 0);
