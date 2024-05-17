SELECT cus.customer_name,
       CAST(SUM(inv.total_price) AS DEC(9, 6)) AS amount_spent
  FROM customer AS cus
 INNER JOIN invoice AS inv
 ON cus.id = inv.customer_id
 GROUP BY cus.customer_name
 HAVING SUM(inv.total_price) < 0.25 * (
        SELECT AVG(total_price)
          FROM invoice
 )
 ORDER BY amount_spent DESC;
