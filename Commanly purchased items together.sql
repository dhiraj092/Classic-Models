WITH prod_sales AS 
(
SELECT orderNumber, 
  t1.productCode, 
  productLine
FROM orderdetails t1
INNER JOIN products t2
on t1.productCode = t2.productCode
)

SELECT DISTINCT t1.orderNumber, 
  t1.productline AS product_one, 
  t2.productline AS product_two
FROM prod_sales t1
LEFT JOIN prod_sales t2
ON t1.orderNumber = t2.orderNumber AND t1.productLine <> t2.productLine


