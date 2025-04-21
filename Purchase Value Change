WITH main_cte AS 
(
Select ordernumber, 
  orderdate, 
  customernumber, 
  sum(sales_value) AS sales_value
FROM 
  
(SELECT t1.orderNumber, 
  orderDate, 
  customerNumber, 
  productCode, 
  quantityOrdered * priceEach AS sales_value
FROM orders t1
INNER JOIN orderdetails t2
ON t1.orderNumber = t2.orderNumber) main 

GROUP BY ordernumber, 
  orderdate, 
  customernumber
),

sales_query AS 
(
SELECT t1.*, 
  customerName, 
  row_number() over (partition BY customerName ORDER BY orderdate) AS purchase_number,
  lag(sales_value) over (partition BY customerName ORDER BY orderdate) prev_sales_value
FROM main_cte t1
INNER JOIN customers t2
ON t1.customernumber = t2.customernumber
)
SELECT *, 
  sales_value-prev_sales_value AS purchase_value_change 
FROM sales_query
WHERE prev_sales_value IS NOT NULL 
