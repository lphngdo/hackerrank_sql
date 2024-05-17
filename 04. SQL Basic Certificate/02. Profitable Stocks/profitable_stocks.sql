SELECT today.stock_code
  FROM price_today AS today
 INNER JOIN price_tomorrow AS tomorrow
 ON today.stock_code = tomorrow.stock_code
 WHERE today.price < tomorrow.price
 ORDER BY today.stock_code;
