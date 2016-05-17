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

