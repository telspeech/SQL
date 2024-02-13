SELECT track_name, duration 
FROM track    
ORDER BY duration DESC
LIMIT 1;

SELECT track_name
FROM track
WHERE track_duration >= 210;

SELECT compilation_name
FROM compilation
WHERE compilation_year BETWEEN 2018 AND 2020;   

SELECT singer_name
FROM singer
WHERE singer_name Not Like '% %';

SELECT track_name
FROM track
WHERE track_name LIKE '%мой%' OR '%my%';


SELECT genre_name, count(singer_id)
FROM genre
JOIN singers_genres_list ON genre.genre_id = singers_genres_list.genre_id        
GROUP BY genre_name;

SELECT count(album_name)
FROM track
JOIN album ON track.album_id = album.album_id     
WHERE album_year >= '20190101' and album_year <= '20201231';    

select album_name, avg(track_duration) 
from track
join album on track.album_id = album.album_id
group by album_name;

SELECT singer_name
FROM singer
WHERE singer_id NOT IN (
SELECT DISTINCT singer_id
FROM album
WHERE album_year = 2020
);

SELECT compilation_name
FROM compilation
WHERE compilation_id IN (
SELECT DISTINCT compilation_id
FROM singer
WHERE singer_name = 'Eminem'
);