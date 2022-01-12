use SampleSales

select * from product.product
select * from product.brand
select * from sale.orders
select * from sale.customer
select * from sale.order_item
select * from product.product




select *, 
         (select AVG(list_price) as avg_list__price
		  from sale.order_item)  as gen_avg_price
from sale.order_item

-------------
select *, 
         (select AVG(list_price) as avg_list__price     --subqueryi istediðin her yerde kullanabilirsin.
		  from sale.order_item)  as gen_avg_price
from sale.customer                                  
-------------

select *, AVG(list_price) OVER() 
FROM sale.order_item
select *, 
         (select AVG(list_price) as avg_list__price
		  from sale.order_item)  as gen_avg_price
from sale.order_item




select  *, 
         (select AVG(list_price) as avg_list__price
		  from sale.order_item
		  where item_id = a.item_id
		  )
from sale.order_item a 

------------
select  brand_id, brand_name, 
         (select AVG(list_price) as avg_list__price
		  from product.product a
		  where a.brand_id = b.brand_id
		  )
from product.brand as b
-------------

select  brand_id, brand_name, 
         (select max(list_price) as avg_list__price
		  from product.product a
		  where a.brand_id = b.brand_id
		  ) as max_brand
from product.brand as b
order by max_brand DESC;

------------
--SUBQUERY FROM

-- staff_id'ye göre gruplama
SELECT store_id, AVG(total_orders) AS AVG_TOTAL_ORDERS
FROM
(select staff_id, store_id, COUNT(*) as total_orders
FROM sale.orders
GROUP BY staff_id, store_id
) as avg_orders
GROUP BY store_id



--datediff rd-sd



SELECT a.*, delivery_rank
FROM sale.customer a
INNER JOIN 
(SELECT *, DENSE_RANK() OVER(PARTITION BY store_id order by delivery_time) as delivery_rank
FROM 
(
SELECT *, DATEDIFF(day, required_date, shipped_date) as delivery_time
FROM sale.orders
) as subq_1
) as subq_2 
ON a.customer_id= subq_2.customer_id
AND delivery_rank= 1


----SUBQUERY IN WHERE 

SELECT COUNT(*)
FROM product.product
WHERE product_id NOT IN 
				(SELECT DISTINCT product_id
				 FROM sale.order_item)


SELECT *
FROM product.product
WHERE product_id NOT IN
				(SELECT DISTINCT product_id
				 FROM sale.order_item)

------------------------------
SELECT store_id, AVG(total_orders) AS AVG_TOTAL_ORDERS
FROM
(select staff_id, store_id, COUNT(*) as total_orders
FROM sale.orders
GROUP BY staff_id, store_id
) as avg_orders
GROUP BY store_id
HAVING AVG(total_orders) > 500

------------
SELECT *
FROM sale.staff as s
WHERE EXISTS
( 
SELECT store_id, AVG(total_orders) AS AVG_TOTAL_ORDERS
FROM
(select staff_id, store_id, COUNT(*) as total_orders
FROM sale.orders
GROUP BY staff_id, store_id
) as avg_orders
WHERE avg_orders.store_id= s.store_id
GROUP BY store_id
HAVING AVG(total_orders) > 500
);



SELECT *
FROM sale.staff as s
WHERE NOT EXISTS
( 
SELECT store_id, AVG(total_orders) AS AVG_TOTAL_ORDERS
FROM
(select staff_id, store_id, COUNT(*) as total_orders
FROM sale.orders
GROUP BY staff_id, store_id
) as avg_orders
WHERE avg_orders.store_id= s.store_id
GROUP BY store_id
HAVING AVG(total_orders) > 500
);
















