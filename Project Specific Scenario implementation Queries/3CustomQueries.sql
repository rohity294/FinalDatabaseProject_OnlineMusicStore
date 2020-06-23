#Analysing information to send feedback to customers to maximize their  savings.

use mydb;

drop view if exists myview;

create view myview as 
select orders_id_order, Discounts_id_discount, discount_description, discount_amount as 'Discount_Amount_in_CAD' from orders_has_discounts
join discounts on discounts.id_discount = Discounts_id_discount
where Orders_id_order in 
(
select orders_id_order from orders_has_discounts 
group by Orders_id_order 
having count(Discounts_id_discount) >= 2
)
order by Orders_id_order
;

select * from myview; # shows that the client making the order is simultaneosuly using multiple discounts on the same order
# clients can be encouraged to use multiple combination of discounts to maximize discounts
# using the client email-address , client date of birth, order-date, current-date fields, the system can send customized emails for consumer awareness, example : sending email alerts on new-years,
#on client birthday etc (using client date of birth field)

select orders_id_order, clients_id_client, client_name, client_EmailID, sum(Discount_Amount_in_CAD)
from myview join orders on orders.id_order = myview.orders_id_order
join clients on clients.id_client = orders.Clients_id_client
group by orders_id_order
order by orders_id_order
; # shows that the total sum discounted from all applicable discounts on the same order

