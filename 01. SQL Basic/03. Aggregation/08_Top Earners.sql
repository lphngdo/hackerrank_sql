SELECT MAX(salary * months) AS Max_Salary, 
       COUNT(*) AS Count_Employee
  FROM Employee
 WHERE (salary * months) = (
  SELECT MAX(salary * months)
    FROM Employee
 );
