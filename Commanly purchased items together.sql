with prod_sales as 
(
SELECT 
  orderNumber, 
  t1.productCode, 
  productLine
FROM orderdetails t1
INNER JOIN products t2
on t1.productCode = t2.productCode
)

select distinct t1.orderNumber, 
  t1.productline as product_one, 
  t2.productline as product_two
from prod_sales t1
left join prod_sales t2
on t1.orderNumber = t2.orderNumber and t1.productLine <> t2.productLine


