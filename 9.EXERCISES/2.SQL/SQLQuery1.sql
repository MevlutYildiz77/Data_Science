use SampleSales


SELECT REPLACE('CHARACTER STRING', ' ', '/')

SELECT REPLACE(114324241, 11, 99)

--COALESCE(Expression, [E2, .....En])
--NULLIF(Expression1, Expression2])--#ROUND(number, decimals,[opeartion]) #opretion default=0, 1 yazarsan alta yuvarlar.


SELECT LENGTH('AHMET')

SELECT *
FROM sale.customer

select 
   sum(case when patindex('%@yahoo%', patindex


select count(*)
from sale.customer
where email like '%@yahoo%'

select min(list_price) over()
from product.product


select category_id, min(list_price) over (partition by category_id)
from product.category


