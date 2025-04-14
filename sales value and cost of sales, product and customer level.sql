CREATE OR replace VIEW sales_data_for_power_bi AS 

SELECT  
ord.orderdate, 
ord.orderNumber,
pr.productName,
pr.productLine,
cu.customerName,
cu.country AS customer_country, 
ofc.country AS office_country, 
pr.buyPrice,
priceEach,
quantityOrdered,
quantityOrdered * priceEach AS sales_value,
quantityOrdered * buyPrice AS cost_of_sales
FROM orders ord
INNER JOIN orderdetails orddet
ON ord.orderNumber = orddet.orderNumber
INNER JOIN customers cu
ON ord.customerNumber = cu.customerNumber
INNER JOIN products pr
ON orddet.productCode = pr.productCode
INNER JOIN employees emp 
ON cu.salesRepEmployeeNumber = emp.employeeNumber
INNER JOIN offices ofc
ON emp.officeCode = ofc.officeCode
