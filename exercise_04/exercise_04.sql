-- 01. Select the title of all movies.
SELECT Title FROM movies;

-- 02. Show all the distinct ratings in the database.
SELECT DISTINCT Rating FROM movies;

-- 03. Show all unrated movies.
SELECT Title FROM movies
WHERE Rating IS NULL;

-- 04. Select all movie theaters that are not currently showing a movie.
SELECT Name FROM movietheaters
WHERE Movie IS NULL;

-- 05. Select all data from all movie theaters and, additionally, the data from the movie that is being shown in the theater (if one is being shown).
SELECT * FROM movietheaters t
LEFT JOIN movies m
ON t.Movie = m.Code;

-- 06. Select all data from all movies and, if that movie is being shown in a theater, show the data from the theater.
SELECT * FROM movies m
LEFT JOIN movietheaters t
ON t.Movie = m.Code;

-- 07. Show the titles of movies not currently being shown in any theaters.
SELECT m.Title FROM movies m
LEFT JOIN movietheaters t
ON t.Movie = m.Code
WHERE t.Name IS NULL;

-- 08. Add the unrated movie "One, Two, Three".
INSERT INTO movies(Code,Title,Rating)
VALUE (10, "One, Two, Three", NULL);

-- 09. Set the rating of all unrated movies to "G".
-- SET SQL_SAFE_UPDATES = 0;
UPDATE movies
SET Rating = "G"
WHERE Rating IS NULL;

-- 10. Remove movie theaters projecting movies rated "NC-17".
DELETE FROM movietheaters
WHERE Movie IN (
	SELECT Code FROM movies
    WHERE Rating = "NC-17"
);


