WITH sales AS 
(
SELECT t1.orderNumber, 
 t1.customerNumber, 
 productCode, 
 quantityOrdered,
 priceEach, 
 priceEach * quantityOrdered as sales_value, 
 creditLimit
FROM ORDERS t1
INNER JOIN orderdetails t2
ON t1.orderNumber = t2.orderNumber
INNER JOIN customers t3
ON t1.customerNumber = t3.customerNumber
)

SELECT ordernumber, 
 customerNumber, 
CASE WHEN creditlimit < 75000 THEN 'a: less than $75k'
WHEN creditlimit BETWEEN 75000 AND 100000 THEN 'b: $75k - $100k'
WHEN creditlimit BETWEEN 100000 AND 150000 THEN 'c: $100k - $150K'
WHEN creditlimit > 150000 THEN 'd: over $150k'
ELSE 'Other'
END AS creditlimit_group,
 
sum(sales_value) AS sales_value
FROM sales
GROUP BY ordernumber, 
 customerNumber, 
 creditlimit_group
