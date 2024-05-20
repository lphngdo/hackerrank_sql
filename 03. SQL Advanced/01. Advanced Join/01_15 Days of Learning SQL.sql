WITH CTE_Submission_Count AS (
    SELECT S1.submission_date,
           COUNT(DISTINCT S2.hacker_id) AS Unique_Hackers
      FROM Submissions AS S1
     INNER JOIN Submissions AS S2 
     ON S1.submission_date = S2.submission_date
     WHERE (
        SELECT COUNT(DISTINCT S3.submission_date) 
          FROM submissions AS S3 
         WHERE S3.hacker_id = S2.hacker_id 
           AND S3.submission_date < S1.submission_date) = DATEDIFF(DAY, '2016-03-01', S1.submission_date)
     GROUP BY S1.submission_date
),
CTE_Top_Hacker AS (
    SELECT S2.submission_date,
           S2.hacker_id,
           ROW_NUMBER() OVER (PARTITION BY S2.submission_date ORDER BY COUNT(S2.submission_id) DESC, S2.hacker_id) AS row_number
      FROM 
        Submissions AS S2
     GROUP BY S2.submission_date, 
              S2.hacker_id
)
SELECT S1.submission_date,
       SC.Unique_Hackers,
       TH.hacker_id,
       H.NAME
 FROM (
    SELECT DISTINCT submission_date 
     FROM submissions
  ) S1
 LEFT JOIN CTE_Submission_Count AS SC 
 ON S1.submission_date = SC.submission_date
 LEFT JOIN CTE_Top_Hacker AS TH 
 ON S1.submission_date = TH.submission_date AND TH.row_number = 1
 LEFT JOIN Hackers AS H 
 ON TH.hacker_id = H.hacker_id
 ORDER BY  S1.submission_date;

