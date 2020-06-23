
#Answer to Q1 : Display a list of clients that spent more than the average spent by client in the past month.


USE mydb;
DROP PROCEDURE IF EXISTS more_than_avg;
-- Change statement delimiter from semicolon to double front slash
DELIMITER //

CREATE PROCEDURE  more_than_avg()
BEGIN

DECLARE sum double;
DECLARE count int;
DECLARE average double;

select sum(albums_has_orders.Albums_purchased_quantity * albums.price - discounts.discount_amount) as chargable_amount  
from albums_has_orders join albums on albums_has_orders.Albums_id_album = albums.id_album 
join orders on orders.id_order = albums_has_orders.Orders_id_order
join clients on clients.id_client = orders.Clients_id_client
join orders_has_discounts on orders_has_discounts.orders_id_order = orders.id_order
join discounts on discounts.id_discount = orders_has_discounts.discounts_id_discount
where month(  month(current_date()) - month(orders.order_date)  ) <1
into sum
;


select count(*) as number_of_clients from
albums_has_orders join albums on albums_has_orders.Albums_id_album = albums.id_album 
join orders on orders.id_order = albums_has_orders.Orders_id_order
join clients on clients.id_client = orders.Clients_id_client
join orders_has_discounts on orders_has_discounts.orders_id_order = orders.id_order
join discounts on discounts.id_discount = orders_has_discounts.discounts_id_discount
where month(  month(current_date()) - month(orders.order_date)  ) <1
into count
;

select sum/count into average;

select client_name, sum(albums_has_orders.Albums_purchased_quantity * albums.price - discounts.discount_amount) as 'net_amount_spent' , average as 'average_spent'
from albums_has_orders join albums on albums_has_orders.Albums_id_album = albums.id_album 
join orders on orders.id_order = albums_has_orders.Orders_id_order
join clients on clients.id_client = orders.Clients_id_client
join orders_has_discounts on orders_has_discounts.orders_id_order = orders.id_order
join discounts on discounts.id_discount = orders_has_discounts.discounts_id_discount
where month(  month(current_date()) - month(orders.order_date)  ) <1 
group by client_name
having net_amount_spent > average_spent
;



END//

-- Change statement delimiter from double front slash to semicolon
DELIMITER ;
CALL more_than_avg();



