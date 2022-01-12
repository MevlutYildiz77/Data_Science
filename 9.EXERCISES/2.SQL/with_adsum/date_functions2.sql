use SampleSales

select * from ORDER_TBL

----------------
select * from Movie

select [Year], convert(varchar (4),[Year], 3) as convertedDate from Movie

----------------------
select * from sale.orders

select datepart(weekday, order_date)
from sale.orders

-------------------------
select order_date, dateadd(day, 5, order_date)
from sale.orders


select order_date, dateadd(month, 5, order_date)
from sale.orders
------------------------------------

select order_date, datename(weekday, order_date)
from sale.orders

-------------------
select order_date, shipped_date, datediff(day, order_date, shipped_date) day_gap
from sale.orders


-------------------------
select getdate(), datepart(second, getdate()), datepart(millisecond, getdate())


select getdate(), getutcdate(), CURRENT_TIMESTAMP

select DATEFROMPARTS(2021, 12, 16)

select DATETIME2FROMPARTS(2021,12,16,10,21,15,10,05)

select DATETIMEFROMPARTS(2021,12,16,10,45,15,5)

select SMALLDATETIMEFROMPARTS(2021,12,16,10,35)

select ISDATE(2020-12-05)  -- 1 veya 0 döndürür

select ISDATE(05-12-2020)    -- 0 döndürdü

select ISDATE('05-12-2020')   --1 döndürdü, pythondaki isistance'nýn karþýlýðý


select year(order_date) from sale.orders
select month(order_date) from sale.orders
select day(order_date) from sale.orders




