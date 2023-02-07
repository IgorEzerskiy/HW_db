SELECT * FROM films 
ORDER BY imdb DESC;

SELECT films_name FROM films 
ORDER BY films_name DESC 
LIMIT 3;

SELECT DISTINCT films_name, release_year FROM films 
ORDER BY release_year;

SELECT DISTINCT films_name, release_year FROM films 
ORDER BY release_year DESC;

SELECT films_name, films.director_last_name, films.director_first_name FROM films 
INNER JOIN directors 
ON (directors.director_id = films.director_id);

SELECT films_name, films.director_last_name, films.director_first_name FROM films 
LEFT JOIN directors 
ON (directors.director_id = films.director_id);

SELECT films_name, films.director_last_name, films.director_first_name FROM films 
WHERE NOT EXISTS (SELECT * FROM directors WHERE films.director_id = directors.director_id);

SELECT films_name, films.director_last_name, films.director_first_name FROM films 
LEFT JOIN directors 
ON (directors.director_id = films.director_id) 
WHERE films.director_id IS NULL;

SELECT films_name, films.director_last_name, films.director_first_name FROM films 
RIGHT JOIN directors 
ON (directors.director_id = films.director_id);

SELECT films_name, films.director_last_name, films.director_first_name FROM films 
FULL JOIN directors 
ON (directors.director_id = films.director_id);