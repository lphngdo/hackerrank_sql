SELECT CAST(
  CEILING(
    AVG(CAST(Salary AS FLOAT)) - AVG(CAST(REPLACE(Salary, 0, '') AS FLOAT))
  ) AS INTEGER
)
  FROM EMPLOYEES;
