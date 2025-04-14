SELECT *, 
date_add(shippeddate, interval 3 day) AS latest_arrival, 
CASE WHEN date_add(shippeddate, interval 3 day) > requireddate THEN 1 ELSE 0 END AS late_flag
FROM orders
WHERE 
(CASE WHEN date_add(shippeddate, interval 3 day) > requireddate THEN 1 ELSE 0 END) =1
