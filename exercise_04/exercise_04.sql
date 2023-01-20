-- 01. Select the title of all movies.
SELECT Title FROM movies;

-- 02. Show all the distinct ratings in the database.
SELECT DISTINCT Rating FROM movies;

-- 03. Show all unrated movies.
SELECT Title FROM movies
WHERE Rating IS NULL;

