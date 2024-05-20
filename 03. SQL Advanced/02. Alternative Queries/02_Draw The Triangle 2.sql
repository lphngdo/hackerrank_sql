DECLARE @temp_num INT = 0;

WITH CTE_Numbers AS (
    SELECT 1 AS Number
    UNION ALL
    SELECT Number + 1
      FROM CTE_Numbers
     WHERE Number < 20
)
SELECT REPLICATE('* ', Number)
  FROM CTE_Numbers
OPTION (MAXRECURSION 20);
