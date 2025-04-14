SELECT t1.orderDate, 
  t1.orderNumber, 
  quantityOrdered, 
  priceEach, 
  productName, 
  productLine, 
  buyPrice, 
  city, 
  country
FROM classicmodels.orders t1
INNER JOIN orderdetails t2 
ON t1.orderNumber = t2.orderNumber
INNER JOIN products t3
ON t2.productCode = t3.productCode
INNER JOIN customers t4
ON t1.customerNumber = t4.customerNumber
WHERE year(orderDate) = 2004

