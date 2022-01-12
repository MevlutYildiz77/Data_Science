use SampleSales


select * from product.product

SELECT *,    CASE brand_id	WHEN 9 THEN 'Trek'    ELSE 'all the others'    END AS product_brandFROM product.product;

-------------------------------
select *,
case when list_price < 3000 then 'cheap'
     when list_price < 6000 then 'middle'
	 when list_price > 6000 then 'expensive'
end as price_category 
from product.product
where (case when list_price < 3000 then 'cheap'
     when list_price < 6000 then 'middle'
	 when list_price > 6000 then 'expensive'
	 end) = 'expensive'

----------------------------------------


with price_selection as(
select *,
case when list_price < 3000 then 'cheap'
     when list_price < 6000 then 'middle'
	 when list_price > 6000 then 'expensive'
end as price_category 
from product.product)
select *
from price_selection
where price_category = 'expensive'


--------------------------

select * from sale.orders


select *,
case when DATEDIFF(day, required_date, shipped_date) >0 then 'late_delivery'
	 when DATEDIFF(day, required_date, shipped_date) < 0 then 'early_delivery'
 when DATEDIFF(day, required_date, shipped_date) = 0 then 'on_time_delivery'
 end as shipping_situation
 from sale.orders

 ----------------------------------

 select *,
case when DATEDIFF(day, required_date, shipped_date) >0 then 'late_delivery' end,
case when DATEDIFF(day, required_date, shipped_date) < 0 then 'early_delivery' end,
case when DATEDIFF(day, required_date, shipped_date) = 0 then 'on_time_delivery' end
as shipping_situation
from sale.orders

-------------------------------
--update

create table employees (id int identity(1,1), gender varchar(max) )

insert into employees (gender)
select 'M'
union
select 'F'

select * from employees

update employees 
set gender = (case when gender = 'M' then 'Male'
                   when gender = 'F' then 'Female' end)
			

select * from employees

drop table employees

----------------------
--HAVÝNG

select * from sale.order_item

select * from product.product

select order_id,
sum(case when brand_name ='Electra' then 1 end) as Elektra,
sum(case when brand_name ='Trek' then 1 end) as Trek
from product.product p, product.brand b, sale.order_item o
where p.brand_id = b.brand_id and p.product_id= o.product_id and brand_name in ('Electra', 'Trek')
group by order_id
having  sum(case when brand_name ='Electra' then 1 end) > 1 and
		sum(case when brand_name ='Trek' then 1 end) >1 











