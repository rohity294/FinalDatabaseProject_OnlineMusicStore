
#Answer to Q6 : List how many distinct albums each singer has.

USE mydb;

select id_singer, singer_name, count(singers_id_singer) as 'count of distinct albums of this singer' from albums
join singers on singers.id_singer = albums.Singers_id_singer
group by Singers_id_singer
;


