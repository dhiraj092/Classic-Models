## breakdown of each customer and their sales, but include a money owed column as I would like to see if any customers have gone over their credit limit. 
with 
cte_sales as 
(
SELECT 
t1.orderDate,
t1.orderNumber,
t3.customerNumber,
t3.customerName,
t2.productCode,
t3.creditLimit, 
quantityOrdered * priceEach as sales_value
FROM orders t1 
inner join orderdetails t2
on t1.orderNumber = t2.orderNumber
inner join customers t3
on t3.customerNumber = t1.customerNumber
),

running_total_sales_cte as 
(
	Select *, lead(orderdate) over (partition by customernumber order by orderdate) as next_order_date 
	from 
	(
	SELECT 
	orderDate,
	orderNumber,
	customerNumber,
	customerName,
	creditLimit,
	sum(sales_value) as sales_value
	FROM cte_sales
	group by 
	orderDate,
	orderNumber,
	customerNumber,
	customerName,
	creditLimit
	) subquery
)
,

payments_cte as 
(
Select *
from payments
),

main_cte as 
(
select t1.*,
sum(sales_value) over (partition by t1.customernumber order by orderdate) as running_total_sales,
sum(amount) over (partition by t1.customernumber order by orderdate) as running_total_payments 
from running_total_sales_cte t1
left join payments_cte t2
on t1.customernumber = t2.customernumber and t2.paymentdate between t1.orderdate and case when t1.next_order_date is null then current_date else next_order_date end
)

SELECT *, running_total_sales- running_total_payments as money_owed,
creditlimit - (running_total_sales- running_total_payments) as difference
from main_cte