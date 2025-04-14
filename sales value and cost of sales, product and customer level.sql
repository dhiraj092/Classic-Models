## sales value and cost of sales at a product and customer level, for power bi
create or replace view sales_data_for_power_bi as 

SELECT  
ord.orderdate, 
ord.orderNumber,
pr.productName,
pr.productLine,
cu.customerName,
cu.country as customer_country, 
ofc.country as office_country, 
pr.buyPrice,
priceEach,
quantityOrdered,
quantityOrdered * priceEach as sales_value,
quantityOrdered * buyPrice as cost_of_sales
FROM orders ord
inner join orderdetails orddet
on ord.orderNumber = orddet.orderNumber
inner join customers cu
on ord.customerNumber = cu.customerNumber
inner join products pr
on orddet.productCode = pr.productCode
inner join employees emp 
on cu.salesRepEmployeeNumber = emp.employeeNumber
inner join offices ofc
on emp.officeCode = ofc.officeCode