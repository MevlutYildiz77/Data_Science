use SampleSales

DATE - format YYYY-MM-DD
DATETIME - format: YYYY-MM-DD HH:MI:SS
SMALLDATETIME - format: YYYY-MM-DD HH:MI:SS
TIMESTAMP - format: a unique number


select * from sale.orders

select getdate()


select date(order_date) as aa
from sale.orders

select *, DATEDIFF(day, shipped_date, getdate())
from sale.orders



select year(order_date) as year, count(order_id) as sum_of_order_id
from sale.orders
where year(order_date) = 2019
group by year(order_date)

-----------------------
select  top 1 [days],   max(sum_of_order_id)
from 
		(select  datename(dw, order_date) as [days], count(order_id) as sum_of_order_id
		from sale.orders
		group by  datename(dw, order_date)) as max_order_day
group by [days] 
order by max(sum_of_order_id) desc;

-----------------------

--datename ile yeni bir sütun oluþturma

select  datename(dw,order_date) as day_name, datename(d, order_date) [day], 
				  DATENAME(month, order_date) [month], datename(year, order_date) [year] 
from sale.orders


----------------

select concat(datename(dw,order_date), ' ', datename(d, order_date), ' ',
				  DATENAME(month, order_date), ' ', datename(year, order_date)) as concating
from sale.orders

--------------------
select order_date, dateadd(D, 10, order_date)
from sale.orders


select order_date, dateadd(m, 2, order_date)
from sale.orders


select order_date, dateadd(yy, 2, order_date)
from sale.orders


------------------

select 5, 7, 9
select '5'+ ' '+ '7' + ' ' + '9'

select * from sale.customer

select first_name + ' '+ last_name
from sale.customer


select concat(first_name, ' ', last_name)
from sale.customer

------------------------
select month(order_date )
from sale.orders










