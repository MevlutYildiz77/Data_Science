use SampleSales


--1. T�m bisikletler aras�nda en ucuz bisikletin ad� (FIRST_VALUE fonksiyonunu kullan�n�z)

SELECT DISTINCT FIRST_VALUE(product_name) OVER(ORDER BY list_price) AS F_V
FROM product.product


SELECT DISTINCT category_id 
			FIRST_VALUE(product_name) OVER(PARTITION BY list_price) AS F_V
FROM product.product









