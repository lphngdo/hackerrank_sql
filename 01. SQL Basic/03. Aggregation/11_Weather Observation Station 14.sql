SELECT CAST(ROUND(MAX(LAT_N), 4) AS DEC(10, 4))
  FROM STATION
 WHERE LAT_N < 137.2345;