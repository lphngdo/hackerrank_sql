SELECT CONCAT(Name, '(', LEFT(Occupation, 1), ')')
  FROM OCCUPATIONS
 ORDER BY Name;

SELECT CONCAT('There are a total of ', CAST(COUNT(Occupation) AS VARCHAR(10)), ' ', LOWER(Occupation), 's.')
  FROM OCCUPATIONS
 GROUP BY Occupation
 ORDER BY COUNT(Occupation), Occupation;
