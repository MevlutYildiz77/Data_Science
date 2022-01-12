use SampleSales


select * from sale.orders

select order_date, DATENAME(day, required_date) as day_no
from sale.orders

select order_date, DATENAME(day, '2018-01-03') as day_no
from sale.orders







