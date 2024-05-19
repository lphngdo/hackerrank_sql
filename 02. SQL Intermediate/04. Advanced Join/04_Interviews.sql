WITH CTE_View_Stats AS (
    SELECT challenge_id, 
           SUM(total_views) AS Total_Views, 
           SUM(total_unique_views) AS Total_Unique_Views
      FROM View_Stats
     GROUP BY challenge_id
),
CTE_Submission_Stats AS (
    SELECT challenge_id, 
           SUM(total_submissions) AS Total_Submissions, 
           SUM(total_accepted_submissions) AS Total_Accepted_Submissions
      FROM Submission_Stats
     GROUP BY challenge_id
)

SELECT A.contest_id, 
       A.hacker_id, 
       A.name, 
       COALESCE(SUM(E.total_submissions), 0) AS Total_Submissions, 
       COALESCE(SUM(E.total_accepted_submissions), 0) AS Total_Accepted_Submissions,
       COALESCE(SUM(D.total_views), 0) AS Total_Views,
       COALESCE(SUM(D.total_unique_views), 0) AS Total_Unique_Views
  FROM Contests AS A
 LEFT JOIN Colleges AS B
 ON A.contest_id = B.contest_id
 LEFT JOIN Challenges AS C
 ON B.college_id = C.college_id 
 LEFT JOIN CTE_View_Stats AS D 
 ON C.challenge_id = D.challenge_id 
 LEFT JOIN CTE_Submission_Stats AS E
 ON C.challenge_id = E.challenge_id
 GROUP BY A.contest_id, A.hacker_id, A.name
 HAVING (
    COALESCE(SUM(E.Total_Submissions), 0) + 
    COALESCE(SUM(E.Total_Accepted_Submissions), 0) + 
    COALESCE(SUM(D.Total_Views), 0) + 
    COALESCE(SUM(D.Total_Unique_Views), 0)
  ) > 0 
 ORDER BY A.contest_id;
