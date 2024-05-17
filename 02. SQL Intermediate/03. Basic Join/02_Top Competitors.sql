SELECT S.hacker_id, H.name
  FROM Hackers AS H
 INNER JOIN Submissions AS S
 ON H.hacker_id = S.hacker_id
 INNER JOIN Challenges AS C
 ON S.challenge_id = C.challenge_id
 INNER JOIN Difficulty AS D
 ON C.difficulty_level = D.difficulty_level
 WHERE D.score = S.score AND D.difficulty_level = C.difficulty_level
 GROUP BY S.hacker_id, H.name
 HAVING COUNT(S.hacker_id) > 1
 ORDER BY COUNT(S.hacker_id) DESC, S.hacker_id;
