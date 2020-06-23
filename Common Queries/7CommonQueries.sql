
#Answer to Q7 : 7. List how many copies of an album are available of a particular singer.

USE mydb;

drop view if exists myview2;

create view myview2 as
select id_singer, singer_name, album_name, sum(album_inventory_quantity) as 'quantity_of_albums_of_this_singer_in_stock', 
sum(Albums_id_album) as 'total_albums_of_the_singer_ordered'
from singers join albums on albums.Singers_id_singer = singers.id_singer
join albums_has_orders on albums_has_orders.albums_id_album = albums.id_album
group by Singers_id_singer
;

select id_singer, singer_name, album_name, quantity_of_albums_of_this_singer_in_stock, total_albums_of_the_singer_ordered,
(quantity_of_albums_of_this_singer_in_stock - total_albums_of_the_singer_ordered) as 'total_available_copies_of_albums_for_this_singer'
from myview2
;


#select * from myview2;


