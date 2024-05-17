SELECT H.hacker_id, 
       H.name, 
       COUNT(C.challenge_id) AS Count_Challenge
  FROM Hackers AS H
 INNER JOIN Challenges AS C 
 ON C.hacker_id = H.hacker_id
 GROUP BY H.hacker_id, H.name
 HAVING COUNT(C.challenge_id) = (
                                  SELECT COUNT(C1.challenge_id) AS Max_Challenge
                                    FROM Challenges AS C1
                                   GROUP BY C1.hacker_id
                                   ORDER BY Max_Challenge DESC 
                                   OFFSET 0 ROWS
                                   FETCH FIRST 1 ROWS ONLY
                                )
    OR COUNT(C.challenge_id) IN (
                                  SELECT DISTINCT Compare_Challenge AS Unique_Challenge
                                    FROM (
                                           SELECT H1.hacker_id, 
                                                  H1.name, 
                                                  COUNT(C2.challenge_id) AS Compare_Challenge
                                             FROM Hackers AS H1
                                            INNER JOIN Challenges AS C2 
                                            ON C2.hacker_id = H1.hacker_id
                                            GROUP BY H1.hacker_id, H1.name
                                ) AS Counts
     GROUP BY Compare_Challenge
     HAVING COUNT(Compare_Challenge) = 1)
 ORDER BY Count_Challenge DESC, H.hacker_id;
