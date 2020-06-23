#Analysis of availed discounts : which customers are availing which all documents, and the variation/ range of applied savings

use mydb;

drop view if exists myview;

create view myview as
(select id_client, client_name, id_order, discounts_id_discount, discount_description,discount_amount as 'Discount_Amount_in_CAD'
from discounts join orders_has_discounts on orders_has_discounts. Orders_id_order = discounts.id_discount
join orders on id_order = orders_has_discounts.Orders_id_order
join clients on clients.id_client = orders.Clients_id_client)
order by id_client
;

select * from myview; # shows all orders placed, details of client placing the order, and the relavant discount applicable along with discount amount

select avg(Discount_Amount_in_CAD),max(Discount_Amount_in_CAD), min(Discount_Amount_in_CAD) from myview; # shows statistical analysis of discounts such as maximum, minimum and average discounts





