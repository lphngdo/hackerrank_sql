/* Option 1: Using the NOT LIKE */
SELECT DISTINCT CITY
  FROM STATION
 WHERE (
        CITY NOT LIKE 'a%'
    AND CITY NOT LIKE 'o%'
    AND CITY NOT LIKE 'e%'
    AND CITY NOT LIKE 'u%'
    AND CITY NOT LIKE 'i%'
 )
  AND (
       CITY NOT LIKE '%a'
   AND CITY NOT LIKE '%o'
   AND CITY NOT LIKE '%e'
   AND CITY NOT LIKE '%u'
   AND CITY NOT LIKE '%i'
);

/* Option 2: Using the NOT IN */
SELECT DISTINCT CITY
  FROM STATION
 WHERE LEFT(CITY, 1) NOT IN ('a', 'o', 'e', 'u', 'i')
   AND RIGHT(CITY, 1) NOT IN('a', 'o', 'e', 'u', 'i');
