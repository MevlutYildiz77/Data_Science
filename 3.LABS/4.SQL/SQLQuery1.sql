use SampleSales


select *
from product.product

select *
from product.stock

select A.brand_id, avg(list_price) as avg_list_price
from product.brand A
left join product.product B
on A.brand_id=B.brand_id
group by A.brand_id
order by avg_list_price desc;

--Find the weekly order count for the city of San Angelo for the last 52 weeks, and also the cumulative total.
--Desired output: [week_start, order_count, cuml_order_count]

select datepart(week, A.order_date) as week_number, A.order_id
	   count(A.order_id) over(partition by datepart(week, A.order_date)) as week_total,
from sale.orders A, sale.store B
where A.store_id=B.store_id
	and B.city= 'San Angelo'
	and A.order_date between dateadd(week, -52, '2018-12-28') and  '2018-12-28'

	------
SELECT	DISTINCT DATEPART(WEEK, A.order_date) as week_number, --A.order_id,
		COUNT(A.order_id) OVER(PARTITION BY DATEPART(WEEK, A.order_date)) AS week_total,
		COUNT(A.order_id) OVER(ORDER BY DATEPART(WEEK, A.order_date)) cum_total
FROM	sale.orders A, sale.store B
WHERE	A.store_id = B.store_id
		AND B.city = 'San Angelo'
		AND A.order_date BETWEEN DATEADD(WEEK, -52, '2020-12-28') AND '2020-12-28'


select max(order_date)
from sale.orders

-----In the street column, clear the string characters that were accidentally added to the end of the initial numeric expression.

--street sütununda baþtaki rakamsal ifadenin sonuna yanlýþlýkla eklenmiþ string karakterleri temizleyin
--önce boþluða kadar olan kýsmý alýnýz
--sonra where ile sonunda harf olan kayýtlarý bulunuz
--bu harfi kaldýrýn 

SELECT	A.*, REPLACE(A.street, A.TARGET_CHARS, A.NUMERICAL_CHARS) new_column
FROM	(
		SELECT	street,
				LEFT(street, CHARINDEX(' ', street)-1) TARGET_CHARS,
				RIGHT(LEFT(street, CHARINDEX(' ', street)-1), 1) AS STRING_CHARS,
				LEFT(street, CHARINDEX(' ', street) -2) AS NUMERICAL_CHARS
		FROM	sale.customer
		WHERE	ISNUMERIC(RIGHT(LEFT(street, CHARINDEX(' ', street)-1), 1)) = 0
		) A






