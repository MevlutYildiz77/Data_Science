use SampleSales


select *  from sale.staff

create view staff  as
select staff_id, first_name, last_name, store_id
from sale.staff

select * from staff

-- kullaným amacý
--1. sorgularý kolaylaþtýrmak, 2. Gizlilik-Görünmesi istenmeyen bilgileri çýkartmak 3. AGG functionlarý otomatikleþtirmek için
--view üzerinde update yaparsdasn orijinal tablo da deðiþir.

alter view staff  as
select staff_id, first_name, last_name, store_id, email
from sale.staff 

select * from staff

update staff set first_name ='Fabian' where staff_id = 1

select * from staff

delete from staff where staff_id = 1



----------------
create view personel as
select staff_id, first_name, last_name, store_name
from sale.staff a
left join sale.store b
on a.store_id = b.store_id


select * from personel

update personel set store_name ='Buffalo Bikes' where staff_id =5


select * from sale.store

update personel set first_name ='Fabian' where staff_id = 1

drop view if exists personel   --silme




