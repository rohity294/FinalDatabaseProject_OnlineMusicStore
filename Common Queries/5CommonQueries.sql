
#Answer to Q5 : List how many products the store has sold for a particular month

USE mydb;

select Albums_id_album as 'album id', sum(albums_purchased_quantity) as 'total number of albums sold in last month' from albums_has_orders
join orders on orders.id_order = albums_has_orders.Orders_id_order
where month(  month(current_date()) - month(orders.order_date)  ) < 1
group by Albums_id_album with rollup
;




