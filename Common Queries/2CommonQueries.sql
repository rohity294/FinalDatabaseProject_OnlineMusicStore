
#Answer to Q2 : Display top sold products and least sold products over the last week

USE mydb;

drop view if exists myview1;

create view myview1 as 
select Albums_id_album,album_name,sum(Albums_purchased_quantity) as total_quantity_purchased from 
albums_has_orders join albums on albums_has_orders.Albums_id_album = albums.id_album 
join orders on orders.id_order = albums_has_orders.orders_id_order
where (  current_date() - date(orders.order_date)  ) <= 7
group by Albums_id_album;

select Albums_id_album, album_name, total_quantity_purchased as 'total quantity sold for this maximum selling product over the last week' 
from myview1 where total_quantity_purchased = (select max(total_quantity_purchased) from myview1);


drop view if exists myview2;

create view myview2 as 
select Albums_id_album,album_name,sum(Albums_purchased_quantity) as total_quantity_purchased from 
albums_has_orders join albums on albums_has_orders.Albums_id_album = albums.id_album 
join orders on orders.id_order = albums_has_orders.orders_id_order
where (  current_date() - date(orders.order_date)  ) <= 7
group by Albums_id_album;

select Albums_id_album, album_name, total_quantity_purchased as 'total quantity sold for this minimum selling product over the last week' 
from myview2 where total_quantity_purchased = (select min(total_quantity_purchased) from myview2);








END//

-- Change statement delimiter from double front slash to semicolon
DELIMITER ;
CALL top_and_least_sold_products_over_week();



