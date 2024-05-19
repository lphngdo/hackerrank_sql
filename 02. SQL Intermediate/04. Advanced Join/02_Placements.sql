SELECT S.Name
  FROM Students AS S
 INNER JOIN Friends AS F
 ON S.ID = F.ID
 INNER JOIN Packages AS PS
 ON S.ID = PS.ID
 INNER JOIN Packages AS PF
 ON F.Friend_ID = PF.ID
 WHERE PS.Salary < PF.Salary
 ORDER BY PF.Salary;
