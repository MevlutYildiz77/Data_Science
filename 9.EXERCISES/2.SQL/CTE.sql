use SampleSales

select * from product.product
select * from product.brand

with pn as
(
 select product_name, brand_id
 from product.product
 where brand_id =9

 )
 select product_name, brand_name
 from pn 
 inner join product.brand pb on pn.brand_id= pb.brand_id
 
 --------
 select * from sale.customer
 select * from sale.orders

 with equal_rs_date as
 (
 select count(*) as number  
 from sale.orders
 where required_date = shipped_date
 )
 select *
 from sale.customer as sc , equal_rs_date as erd     --karþýlaþtýrma için
 where sc.customer_id > erd.number

 --------------------------------------
 
 --
 select * from sale.orders

with late_delivery as 
(select *
from sale.orders
where shipped_date > required_date 
),
early_delivery as
(select *
from sale.orders
where shipped_date < required_date 
), 
equal_delivery as 
(
select *
from sale.orders
where shipped_date = required_date 
)
select *
from late_delivery as ld inner join early_delivery as ed on ld.store_id =ed.store_id  
inner join equl_delivery as eqd on ld.store_id = eqd.store_id

------------ALIAS------
--list_price> 1000
select * from sale.order_item


with list_price(order_number, Ankara) as 
(
select order_id, list_price
from sale.order_item
where list_price > 3000
)
select order_number, Ankara
from list_price
where Ankara > 5000


----recursive----
with CTE1 as
(select 1 as n         --n=1 de yazabilirsin
union all
select n + 4 
from CTE1
where n < 50
) 
select *
from CTE1

----FAKTÖRÝEL-------


with CTE1(n, fakt) as
(select n = 1, fakt = 1
union all
select n + 1, (n+1) * fakt 
from CTE1
where n < 8
) 
select *
from CTE1

----------
with days_of_week(n, [date]) as
(
select 0, DATENAME(dw, 6)
union all
select n+1, datename(dw, n+1)
from days_of_week
where n<10
)
select *
from days_of_week













