SELECT F1.X, F1.Y
  FROM Functions AS F1
 INNER JOIN Functions AS F2
 ON F1.X = F2.Y AND F2.X = F1.Y AND F1.X < F2.X
 WHERE F1.X <> F1.Y
 UNION
SELECT X, Y
  FROM Functions AS F1
 WHERE X = Y 
   AND (
    SELECT COUNT(*)
      FROM Functions AS F2
     WHERE F2.X = F1.X AND F2.Y = F1.X
   ) > 1
 ORDER BY X;
