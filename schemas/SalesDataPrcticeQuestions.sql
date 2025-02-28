select * from Sales_order;
select * from Customers;
select * from Products


-- Assignemts for Session 6:
-- 3) Find all orders for Planes, Ships and Trains which are neither Shipped nor In Process nor Resolved.
-- 4) Find customers whose phone number has either parenthesis "()" or a plus sign "+".
-- 5) Find customers whose phone number does not have any space.
-- 6) Fetch all the orders between Feb 2003 and May 2003 where the quantity ordered was an even number.
-- 7) Find orders which sold the product for price higher than its original price.
-- 8) Find the average sales order price
-- 9) Count total no of orders.
-- 10) Find the total quantity sold.
-- 11) Fetch the first order date and the last order date.


-- 3) Find all orders for Planes, Ships and Trains which are neither Shipped nor In Process nor Resolved.
Select * from Products
where product_line in ('Planes','Ships','Trains')

Select * from Sales_order
where status not in ('Shipped','In Process')


Select *
from Sales_order as so 
JOIN Products as p on p.product_code = so.product
WHERE product_line in ('Planes','Ships','Trains')
AND status not in ('Shipped','In Process')


-- 4) Find customers whose phone number has either parenthesis "()" or a plus sign "+".
Select *
from customers
Where phone LIKE '%(%)' or phone LIKE '%+%'

-- 5) Find customers whose phone number does not have any space.
Select *
from customers
Where phone not LIKE '% %'

-- 6) Fetch all the orders between Feb 2003 and May 2003 where the quantity ordered was an even number.

Select * 
From Sales_order
Where month_id between 2 and 5
and year_id=2003
and quantity_ordered%2=0

-- 7) Find orders which sold the product for price higher than its original price.

Select so.price_each,p.price 
from Sales_order as so 
JOIN products as p
ON so.product=p.product_code
Where so.price_each>p.price

-- 8) Find the average sales order price

Select avg(sales)
From Sales_order

-- 9) Count total no of orders.
Select count(1)
FROM Sales_order

-- 10) Find the total quantity sold.
Select sum(quantity_ordered)
From Sales_order

-- 11) Fetch the first order date and the last order date.
select 
	MIN(order_date) as min_date,
	MAX(order_date) as max_date
from sales_order









