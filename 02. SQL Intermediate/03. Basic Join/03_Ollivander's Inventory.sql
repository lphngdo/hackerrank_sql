SELECT W.id, WP.age, W.coins_needed, W.power
  FROM Wands AS W
 INNER JOIN Wands_Property AS WP
 ON W.code = WP.code
 WHERE WP.is_evil = 0 AND W.coins_needed = (
                                            SELECT MIN(W_A.coins_needed)
                                              FROM Wands AS W_A
                                             INNER JOIN Wands_Property AS WP_B
                                             ON W_A.code = WP_B.code
                                             WHERE W.power = W_A.power AND WP.age = WP_B.age
                                           )
 ORDER BY W.power DESC, WP.age DESC;
