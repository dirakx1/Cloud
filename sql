## varioues sql scripts.

CREATE TABLE celebs (id INTEGER, name TEXT, age INTEGER);


INSERT INTO celebs (id, name, age) VALUES (2, 'Beyonce Knowles', 33); 

INSERT INTO celebs (id, name, age) VALUES (3, 'Jeremy Lin', 26); 

INSERT INTO celebs (id, name, age) VALUES (4, 'Taylor Swift', 26);

SELECT name FROM celebs;


UPDATE celebs 
SET age = 22 
WHERE id = 1; 

SELECT * FROM celebs;

# Add a new column

ALTER TABLE celebs ADD COLUMN twitter_handle TEXT; 

SELECT * FROM celebs;

# update register

UPDATE celebs 
SET twitter_handle = '@taylorswift13' 
WHERE id = 4; 

SELECT * FROM celebs;

DELETE FROM celebs WHERE twitter_handle IS NULL;

SELECT name, imdb_rating FROM movies;

# filters
SELECT DISTINCT genre FROM movies;

SELECT * FROM movies WHERE imdb_rating > 8;

SELECT * FROM movies
WHERE name LIKE 'Se_en';


# jokers 
SELECT * FROM movies
WHERE name LIKE 'a%';

SELECT * FROM movies
WHERE name BETWEEN 'A' AND 'J';

SELECT * FROM movies
WHERE year BETWEEN 1990 AND 2000;

SELECT * FROM movies
WHERE year BETWEEN 1990 AND 2000
AND genre = 'comedy';

SELECT * FROM movies
WHERE genre = 'comedy'
OR year < 1980;


SELECT * FROM movies
ORDER BY imdb_rating DESC;

SELECT * FROM movies
ORDER BY imdb_rating ASC
LIMIT 3;

SELECT COUNT(*) FROM fake_apps;

SELECT COUNT(*) FROM fake_apps
WHERE price = 0;


SELECT * FROM movies
WHERE name LIKE '%man%';


SELECT price, COUNT(*) FROM fake_apps
GROUP BY price;

SELECT price, COUNT(*) FROM fake_apps
WHERE downloads > 20000
GROUP BY price;

SELECT SUM(downloads) FROM fake_apps;

SELECT category, SUM(downloads) FROM fake_apps
GROUP BY category;
