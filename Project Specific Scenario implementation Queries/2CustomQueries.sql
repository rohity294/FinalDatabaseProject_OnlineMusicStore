use mydb;

select discount_description, count(discounts_id_discount) from orders_has_discounts join discounts on discounts.id_discount = orders_has_discounts.Orders_id_order
group by Discount_description
; # shows which discounts are applied how many times; here we can see 'black-friday' discount has maximum application

select * from orders_has_discounts;
select * from discounts;