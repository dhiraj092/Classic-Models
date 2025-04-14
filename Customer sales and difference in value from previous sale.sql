# View showing customers sales and include a column which shows the difference in value forom their previous sale? I want to see if new customers who make their first purchase are likely to spend more.
with main_cte as 
(
Select ordernumber, orderdate, customernumber, sum(sales_value) as sales_value
FROM 

(SELECT t1.orderNumber, orderDate, customerNumber, productCode, quantityOrdered * priceEach as sales_value
FROM orders t1
inner join orderdetails t2
on t1.orderNumber = t2.orderNumber) main 

group by ordernumber, orderdate, customernumber
),

sales_query as 
(
select t1.*, customerName, row_number() over (partition by customerName order by orderdate) as purchase_number,
lag(sales_value) over (partition by customerName order by orderdate) prev_sales_value
from main_cte t1
inner join customers t2
on t1.customernumber = t2.customernumber
)

select *, sales_value-prev_sales_value as purchase_value_change 
from sales_query
where prev_sales_value is not null 