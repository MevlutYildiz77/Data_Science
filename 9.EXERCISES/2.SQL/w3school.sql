use SampleSales

--order by--

select list_price
from product.product 
where list_price >300
order by list_price;


--The following SQL statement lists the number of customers in each city:her �ehirdeki m��teri say�s�n� listeler:--

select count(customer_id) as cus_id, city
from sale.customer
group by city;


--lists the number of customers in each country, sorted high to low
--her �ehirdeki m��teri say�s�n� y�ksekten d����e s�ralayarak listeler

select count(customer_id) as customer_id, city
from sale.customer
group by city
order by count(customer_id) desc;






