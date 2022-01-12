
use workshop

--1. How many rows in the sales dataset?

select count(*)
from sales

--1.1.How many columns in the sales dataset?

select * from workshop.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME= 'sales'
select * from workshop.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME= 'currency_rates'
select count(column_name) from workshop.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME= 'sales'
select count(column_name) from workshop.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME= 'currency_rates'


--2. What is the total number of seller?
select count(distinct seller_id)
from sales

--3. What is the total value of sales in EUR?

update currency_rates set [date] = CONVERT(date, [date])

update sales set [date] = CONVERT(date, [date])

select sum(cast(a.price as float) / cast(b.rate as float))
from sales as a
inner join currency_rates as b
on a.currency= b.currency and a.date = b.currency and a.date = b.date

select *
from sales

select *
from currency_rates

--4. Which brand has the highest number of purchases during the period?

select count(*) from sales where brand = ' '

update sales set brand 'Unknown' where brand= ' '

select brand, count(brand)
from sales
group by brand
where brand ='zumira'


select  top 2  brand, count(brand)
from sales
group by brand
order by count(brand) desc;

--5. How many items in the "Jewellery" category have no brand assciateed with them?

select count(category)
from sales
where category = 'Jewellery' and brand= ' '

--6. How many brands have between 35 and 55 transactions (inclusive)? 



--7. How many pairs of shoes were purchased by Australian (AU) buyers?

select count(product_code)
from sales 
where buyer_country ='AU' AND category ='Shoes'


--8. Which brand has the highest average transaction value? Bring all values in Euros. 
----iþlem sayýsý olarak en fazla olan
select top 2 brand, count(brand) as total
from sales
where brand != 'Unknown'
group by brand
order by count(brand) desc


--tutara göre en fazla olan
select top 1 brand, avg(cast(price as float) / cast(rate as float), 0) as avg_value
from sales a
inner join currency_rates b on a.currency=b.currency and a.date=b.date
group by brand
order by avg_value desc

--9. What is the total value of items purchased by GB buyers from GB sellers?

select * 
from sales



--10. What percentage of US sellers' transactions were purchased by US buyers?
----alýþ veriþ sayýsý olarak



--11. Which country made the highest value of international purchases?


--12. Which day has the highest value of purchases?



--13. Which category has 2,324 transactions on 7 August?



--14. What percentage of global sales value on 4 August came from US sellers?



--15. How many sellers in the US has more than 75 sales?



--16. Which seller in the US sold the most in terms of value?




--17. Which brand had the largest absolute € difference in average transaction value between domestic and international?




