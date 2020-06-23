
#Answer to Q3 : The maximum price of products in the same category (for example, rock, pop, country, hip-hop). Use group by to list all the categories and their maximum price.

USE mydb;

select id_album, album_name, genre_name, max(price) 
from albums 
join songs on albums.id_album = songs.Albums_id_album
join genres on genres.id_genre = songs.Genres_id_genre
group by genre_name
;




