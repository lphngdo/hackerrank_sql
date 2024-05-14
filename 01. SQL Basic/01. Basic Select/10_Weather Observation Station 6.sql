/* Option 1: Using the LIKE */
SELECT DISTINCT CITY
  FROM STATION
 WHERE CITY LIKE 'a%' 
    OR CITY LIKE 'o%' 
    OR CITY LIKE 'e%' 
    OR CITY LIKE 'u%' 
    OR CITY LIKE 'i%';

/* Option 2: Using the IN */
SELECT DISTINCT CITY
  FROM STATION
 WHERE LEFT(CITY, 1) IN ('a', 'o', 'e', 'u', 'i');
