

CREATE view [dbo].[staff]  as
select staff_id, first_name, last_name, store_id, email
from sale.staff


alter view [dbo].[staff]  as
select staff_id, first_name, last_name, store_id, email, phone
from sale.staff

select * from staff



