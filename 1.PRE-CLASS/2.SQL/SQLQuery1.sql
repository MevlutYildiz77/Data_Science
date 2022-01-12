use SampleSales


select * from product.stock

SELECT store_id, product_id,  SUM(quantity) OVER (PARTITION BY store_id, product_id) as total_quantity
from product.stock
-- group by store_id, product_id,  quantity;


SELECT store_id, product_id,  SUM(quantity) OVER (PARTITION BY product_id) as total_quantity
from product.stock


SELECT product_id,  SUM(quantity)  as total_quantity
from product.stock
group by product_id
order by product_id;



SELECT store_id, product_id,  SUM(quantity)  as total_quantity
from product.stock
group by store_id, product_id ;


SELECT product_id,  min(list_price)  as min_price
from product.product
group by product_id
order by 1 desc;


