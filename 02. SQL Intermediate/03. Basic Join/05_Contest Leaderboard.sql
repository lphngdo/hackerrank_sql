SELECT S.hacker_id, 
       H.name, 
       SUM(S.Max_Score) AS Total_Score
  FROM (
    SELECT hacker_id, MAX(score) AS Max_Score
    FROM Submissions
    GROUP BY hacker_id, challenge_id
  ) AS S
 INNER JOIN Hackers AS H
 ON S.hacker_id = H.hacker_id
 GROUP BY S.hacker_id, H.name
 HAVING SUM(S.Max_Score) > 0
 ORDER BY Total_Score DESC, S.hacker_id
