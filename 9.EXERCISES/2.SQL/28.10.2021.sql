use SampleSales

CREATE TABLE [dbo].[t_date_time](
	[A_time] [time](7) NULL,
	[A_date] [date] NULL,
	[A_smalldatetime] [smalldatetime] NULL,
	[A_datetime] [datetime] NULL,
	[A_datetime2] [datetime2](7) NULL,
	[A_datetimeoffset] [datetimeoffset](7) NULL
)

INSERT t_date_time
VALUES (GETDATE(),GETDATE(),GETDATE(),GETDATE(),GETDATE(),GETDATE())

------------DATEDIFF---------
SELECT *
FROM t_date_time


SELECT A_time, A_date, GETDATE(),
	DATEDIFF(MINUTE, A_time, GETDATE() )
FROM t_date_time






SELECT DATEDIFF(DAY, shipped_date, order_date)  DATE_DIFF, order_date, shipped_date
FROM sale.orders


SELECT	A_time, A_date, GETDATE(),
		DATEDIFF(MINUTE, A_time, GETDATE()) AS MINUTE_DIFF,
		DATEDIFF(WEEK, A_date, '2021-11-30') AS WEEK_DIFF
FROM t_date_time
---
SELECT	ABS(DATEDIFF(DAY, shipped_date, order_date)) DATE_DIFF, order_date, shipped_date
FROM	sale.orders
SELECT	DATEDIFF(MONTH, order_date, shipped_date) DATE_DIFF, order_date, shipped_date
FROM	sale.orders


--------------DATEADD----------

SELECT ORDER_DATE,
		DATEADD(YEAR, 5, ORDER_DATE) YEAR_ADD
FROM sale.orders



SELECT ORDER_DATE,
		DATEADD(YEAR, 5, order_date) YEAR_ADD,
		DATEADD(DAY, 10 , order_date) DAY_ADD
FROM sale.orders


SELECT GETDATE(), DATEADD(HOUR, 5, GETDATE())



------EMONTH---------

SELECT EOMONTH(GETDATE())

SELECT EOMONTH(GETDATE()), EOMONTH(GETDATE(),2)

SELECT ISDATE('2021-10-01')

SELECT ISDATE('SELECT')



SELECT *
FROM sale.orders



SELECT order_id, order_date, shipped_date,
    CASE
        WHEN shipped_date is null THEN 'Not Shipped'
        WHEN DATEDIFF(day, order_date, shipped_date)=0 THEN 'Fast'
        WHEN DATEDIFF(day, order_date, shipped_date)>=1 and DATEDIFF(day, order_date, shipped_date)<=2 THEN 'Normal'
		WHEN DATEDIFF(day, order_date, shipped_date)>2 THEN 'Slow'
    END AS shipping_situation
FROM sale.orders;


SELECT *,
	DATEDIFF(DAY, order_date, shipped_date) DIFF_SHIPPED_AND_ORDER
FROM sale.orders



WITH T1 As
(
select * ,
        DATEDIFF(day, order_date, shipped_date) Diff_Shipped_and_Order
from sale.orders
)
select order_date,
        shipped_date,
        case
            when Diff_Shipped_and_Order is null then ‘Not shipped’
            when Diff_Shipped_and_Order = 0 then ‘Fast’
            when Diff_Shipped_and_Order < 2 then ‘Normal’
            when Diff_Shipped_and_Order >= 2 then ‘Slow’
        end as Order_Label
from T1



WITH T1 AS
(
SELECT *,
		DATEDIFF(DAY, order_date, shipped_date) DIFF_SHIPPED_AND_ORDER
FROM	sale.orders
)
SELECT ORDER_DATE,
		shipped_date,
		CASE WHEN DIFF_SHIPPED_AND_ORDER IS NULL THEN 'Not Shipped'
			 WHEN DIFF_SHIPPED_AND_ORDER = 0 THEN 'Fast'
			 WHEN DIFF_SHIPPED_AND_ORDER <= 2 THEN 'Normal'
			 WHEN DIFF_SHIPPED_AND_ORDER > 2 THEN 'Slow'
		END AS Order_Label
FROM	T1

----2 günden geç tesslimedilen sipariþler------

SELECT *,
		DATEDIFF(day, order_date, shipped_date)
FROM sale.orders
WHERE DATEDIFF(day,order_date,shipped_date) >2


------2 günden geç teslim edilen sipariþlerin haftanýn günlerine göre daðýlýmýný bulunuz----------
SELECT *,
		DATEDIFF(day, order_date, shipped_date)
FROM sale.orders
WHERE DATEDIFF(day,order_date,shipped_date) >2
datename(WEEKDAY, order_date)
CASE WHEN DIFF_SHIPPED_AND_ORDER IS NULL THEN 'Not Shipped'
			 WHEN DIFF_SHIPPED_AND_ORDER = 0 THEN 'Fast'
			 WHEN DIFF_SHIPPED_AND_ORDER <= 2 THEN 'Normal'
			 WHEN DIFF_SHIPPED_AND_ORDER > 2 THEN 'Slow'
		END AS Order_Label


SELECT *
FROM sale.orders;


SELECT order_date, DATENAME(WEEKDAY, order_date)
FROM sale.orders
WHERE DATEDIFF(day,order_date,shipped_date) >2



SELECT SUM(CASE WHEN DATENAME(WEEKDAY, order_date) = 'Monday' THEN 1 END) MONDAY_COUNT,
	   SUM(CASE WHEN DATENAME(WEEKDAY, order_date) = 'Tuesday' THEN 1 END) TUESDAY_COUNT,
		SUM(CASE WHEN DATENAME(WEEKDAY, order_date) = 'Wednesday' THEN 1 END) WEDNESDAY_COUNT,
		SUM(CASE WHEN DATENAME(WEEKDAY, order_date) = 'Thursday' THEN 1 END) THURSDAY_COUNT,
		SUM(CASE WHEN DATENAME(WEEKDAY, order_date) = 'Friday' THEN 1 END) FRIDAY_COUNT,
		SUM(CASE WHEN DATENAME(WEEKDAY, order_date) = 'Saturday' THEN 1 END) SATURDAY_COUNT,
		SUM(CASE WHEN DATENAME(WEEKDAY, order_date) = 'Sunday' THEN 1 END) SUNDAY_COUNT
FROM sale.orders
WHERE DATEDIFF(day,order_date,shipped_date) >2




SELECT CASE WHEN DATENAME(WEEKDAY, order_date = 'Monday' THEN 1 ELSE 0 END ) CNT
FROM sale.orders
WHERE DATEDIFF(day,order_date,shipped_date) >2





WITH T1 AS(
SELECT	*, DATEDIFF(DAY, order_date, shipped_date) Delivery_Time_Day
FROM	sale.orders),
T2 AS(
SELECT	*,
		CASE
		WHEN Delivery_Time_Day IS NULL THEN 'Not Shipped'
		WHEN Delivery_Time_Day = 0 THEN 'Fast'
		WHEN Delivery_Time_Day <= 2 THEN 'Normal'
		WHEN Delivery_Time_Day > 2 THEN 'Slow'
		END AS Order_Label
FROM	T1),
T3 AS(
SELECT	*
FROM	T2
WHERE	ORDER_LABEL = 'Slow'),
T4 AS(
SELECT	DATENAME(WEEKDAY, ORDER_DATE) DAY
FROM	T3)
SELECT	DAY, COUNT(T4.DAY)
FROM	T4
GROUP BY DAY




SELECT	SUM(CASE WHEN DATENAME(WEEKDAY, order_date) = 'Monday' THEN 1 END) MONDAY,
		SUM(CASE WHEN DATENAME(WEEKDAY, order_date) = 'Tuesday' THEN 1 END) Tuesday,
		SUM(CASE WHEN DATENAME(WEEKDAY, order_date) = 'Wednesday' THEN 1 END) Wednesday,
		SUM(CASE WHEN DATENAME(WEEKDAY, order_date) = 'Thursday' THEN 1 END) Thursday,
		SUM(CASE WHEN DATENAME(WEEKDAY, order_date) = 'Friday' THEN 1 END) Friday,
		SUM(CASE WHEN DATENAME(WEEKDAY, order_date) = 'Saturday' THEN 1 END) Saturday,
		SUM(CASE WHEN DATENAME(WEEKDAY, order_date) = 'Sunday' THEN 1 END) Sunday
FROM	sale.orders
WHERE	DATEDIFF(DAY, order_date, shipped_date) > 2



select  count(CASE
		WHEN datename(weekday, order_Date) = 'Monday' THEN 1
		END) AS MONDAY,
		 count(CASE
		WHEN datename(weekday, order_Date) = 'Tuesday' THEN 1
		END) AS Thuesday,
		 count(CASE
		WHEN datename(weekday, order_Date) = 'Wednesday' THEN 1
		END) AS Wednesday,
		 count(CASE
		WHEN datename(weekday, order_Date) = 'Thursday' THEN 1
		END) AS Thursday,
		 count(CASE
		WHEN datename(weekday, order_Date) = 'Friday' THEN 1
		END) AS Friday,
		 count(CASE
		WHEN datename(weekday, order_Date) = 'Saturday' THEN 1
		END) AS Saturday,
		 count(CASE
		WHEN datename(weekday, order_Date) = 'Sunday' THEN 1
		END) AS Sunday
from sale.orders
WHERE DATEDIFF (day, order_date, shipped_date) >2



select SUM(TT.a), SUM(TT.b), SUM(TT.c), SUM(TT.d), SUM(TT.e), SUM(TT.f), SUM(TT.g)
from 
(select case when datename(weekday, T1.order_date) = 'Monday' then 1 else 0 end a,
case when datename(weekday, T1.order_date) = 'Tuesday' then 1 else 0 end b,
case when datename(weekday, T1.order_date) = 'Wednesday' then 1 else 0 end c,
case when datename(weekday, T1.order_date) = 'Thursday' then 1 else 0 end d,
case when datename(weekday, T1.order_date) = 'Friday' then 1 else 0 end e,
case when datename(weekday, T1.order_date) = 'Saturday' then 1 else 0 end f,
case when datename(weekday, T1.order_date) = 'Sunday' then 1 else 0 end g
from
(select *, datediff(day, order_date, shipped_date) as gun
from sale.orders
where datediff(day, order_date, shipped_date) > 2) as T1) as TT


-----------------strýng------------

SELECT LEN(1231554575)
SELECT LEN('WELCOME')



----CHARINDEX--

SELECT CHARINDEX('C', 'CHARACTER')

SELECT CHARINDEX('C', 'CHARACTER')
SELECT CHARINDEX('C', 'CHARACTER', 2)
SELECT CHARINDEX('CT%', 'CHARACT%ER')


----PATINDEX----
SELECT PATINDEX('R' , 'CHARACTER')
SELECT PATINDEX('R%' , 'CHARACTER')
SELECT PATINDEX('%R%' , 'CHARACTER')
SELECT PATINDEX('%R' , 'CHARACTER')
SELECT PATINDEX('___R%' , 'CHARACTER')

SELECT PATINDEX('%E%' , 'CHARACTER')

SELECT PATINDEX('%E_' , 'CHARACTER')


------LEFT()-RIGHT()-SUBSTRING()

SELECT LEFT('MEHMET', 3)

SELECT LEFT(' MEHMET', 3)

SELECT LEFT(' CHARACTER', 3)

SELECT RIGHT(' CHARACTER', 3)


SELECT RIGHT(' CHARACTER', 1)

SELECT RIGHT(' CHARACTER ', 1)
SELECT RIGHT(' CHARACTER ', 3)

SELECT SUBSTRING('CHARACTER', 1,3)
SELECT SUBSTRING('CHARACTER', -1,3)



select upper(substring('clarusway', 1, 1)) + substring('clarusway', 2, len('clarusway'))

SELECT UPPER(LEFT('character',1))+LOWER(SUBSTRING('character',2,LEN('character')))


---STRRING_SPLIT-----
SELECT * FROM string_split('ALÝ, MEHMET, AYÞE', ',')

SELECT upper(SUBSTRING('character', 1,1)) + SUBSTRING('character', 2, LEN('character'))

------------TRIM, LTRIM, RTRIM----
SELECT TRIM('CHARA CTER')
SELECT TRIM('          CHARA  CTER')
SELECT TRIM('%&' FROM 'CHARACTER%&          CHARA  CTER')

