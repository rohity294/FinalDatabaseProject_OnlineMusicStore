
#Answer to Q4 : List how many customers the system has by location (Country, Province, and City), and then sort them.

USE mydb;

select count(client_Address_Country), count(client_address_province), count(client_address_city)
from Clients
group by client_Address_Country
;




