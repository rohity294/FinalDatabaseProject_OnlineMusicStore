use mydb;

insert into orders values(4,'2019-12-05',2);
insert into orders values(5,'2019-12-06',1);
insert into orders values(6,'2019-12-07',3);


insert into albums_has_orders values(4,3,2);
insert into albums_has_orders values(5,2,1);
insert into albums_has_orders values(6,2,2);

insert into orders_has_discounts values(4,3);
insert into orders_has_discounts values(5,2);
insert into orders_has_discounts values(6,1);