WITH 
cte_sales AS 
(
SELECT t1.orderDate,
	t1.orderNumber,
	t3.customerNumber,
	t3.customerName,
	t2.productCode,
	t3.creditLimit, 
	quantityOrdered * priceEach AS sales_value
FROM orders t1 
INNER JOIN orderdetails t2
ON t1.orderNumber = t2.orderNumber
INNER JOIN customers t3
ON t3.customerNumber = t1.customerNumber
),

running_total_sales_cte as 
(
SELECT *, lead(orderdate) over (partition BY customernumber ORDER BY orderdate) AS next_order_date 
FROM 
	(
	SELECT 
	orderDate,
	orderNumber,
	customerNumber,
	customerName,
	creditLimit,
	sum(sales_value) AS sales_value
	FROM cte_sales
	GROUP BY 
	orderDate,
	orderNumber,
	customerNumber,
	customerName,
	creditLimit
	) subquery
)
,

payments_cte AS
(
SELECT *
FROM payments
),

main_cte AS 
(
SELECT t1.*,
sum(sales_value) over (partition BY t1.customernumber ORDER BY orderdate) AS running_total_sales,
sum(amount) over (partition BY t1.customernumber ORDER BY orderdate) AS running_total_payments 
FROM running_total_sales_cte t1
LEFT JOIN payments_cte t2
ON t1.customernumber = t2.customernumber AND t2.paymentdate BETWEEN t1.orderdate AND CASE WHEN t1.next_order_date IS NULL THEN current_date else next_order_date end
)

SELECT *, running_total_sales- running_total_payments AS money_owed,
creditlimit - (running_total_sales- running_total_payments) AS difference
FROM main_cte
