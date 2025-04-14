SELECT *, 
date_add(shippeddate, interval 3 day) as latest_arrival, 
case when date_add(shippeddate, interval 3 day) > requireddate then 1 else 0 end as late_flag
FROM orders
WHERE 
(case when date_add(shippeddate, interval 3 day) > requireddate then 1 else 0 end) =1
