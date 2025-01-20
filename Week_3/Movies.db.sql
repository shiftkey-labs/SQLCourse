CREATE TABLE movies (
  Id INTEGER PRIMARY KEY AUTOINCREMENT,
  Title VARCHAR(25) NOT NULL,
  Director VARCHAR(25) NOT NULL,
  Minutes INTEGER DEFAULT 100,
  Year DATE
);

Select * from movies;

INSERT INTO movies (Title, Director, Year) VALUES ('Toy Story', 'John Lasseter', 1995);
INSERT INTO movies (Title, Director, Minutes, Year) VALUES ('Toy Story2', 'John Lasseter', 93, 1999);
INSERT INTO movies (Title, Director, Minutes, Year) VALUES ('Cars', 'John Lasseter',117, 2006);
INSERT INTO movies (Title, Director, Minutes, Year) VALUES ('Finding Nemo', 'Andrew Stanton',107, 2008);
INSERT INTO movies (Title, Director, Minutes, Year) VALUES ('WALL-E', 'Andrew Stanton',104, 1995);
INSERT INTO movies (Title, Director, Minutes, Year) VALUES ('Monsters, Inc.','Pete Docter', 92, 2001);
INSERT INTO movies (Title, Director, Minutes, Year) VALUES ('The Incredibles', 'Brad Bird', 116, 2004);
INSERT INTO movies (Title, Director, Minutes, Year) VALUES ('Ratatouille', 'Brad Bird', 115, 2007);
INSERT INTO movies (Title, Director, Minutes, Year) VALUES ('Up', 'Pete Docter', 101, 2009);
INSERT INTO movies (Title, Director, Minutes, Year) VALUES ('Toy Story 3', 'Lee Unkrich', 103, 2010);
INSERT INTO movies (Title, Director, Minutes, Year) VALUES ('Cars 2', 'John Lasseter', 120, 2011);
INSERT INTO movies (Title, Director, Minutes, Year) VALUES ('Brave', 'Brenda Chapman', 102, 2012);
INSERT INTO movies (Title, Director, Minutes, Year) VALUES ('A Bug''s Life', 'John Lasseter', 95, 1998);
INSERT INTO movies (Title, Director, Minutes, Year) VALUES ('Monsters University', 'Dan Scanlon', 110, 2013);

-- Inserting value of different date format
INSERT INTO movies (Title, Director, Minutes, Year) VALUES ('Monsters', 'Dan Scanlon', 120, '2018-01-09');

SELECT title, year from movies;
-- WHERE 
-- Find all movies with director Brad Bird
SELECT * from movies WHERE director = 'Brad Bird';

-- Find all the movies released in year 2008
SELECT * from movies where year = 2008;

-- DISTINCT
-- Find all the directors present in the table
SELECT DISTINCT director from movies;
SELECT DISTINCT year from movies;
-- if you want to print other columns then you'll need to use aggregate functions (covered in classes ahead)

-- ORDER BY
-- Sort all the movies alphabetically 
SELECT * from movies ORDER BY title;
-- Sort all the movies by length of movies in reverse order
SELECT * from movies ORDER BY minutes DESC;
-- Sort all the movies by the director name and by the duration of the movie 
SELECT * from movies ORDER BY minutes, director;

-- OPERATORS
-- AND 
-- All movies directed by brad bird in year 2000 or later
SELECT * FROM movies WHERE director = 'Brad Bird' AND year > 2000;

-- OR
-- Return all the movies directed by Brad Bird or Andrew Stanton
SELECT * from movies where director = 'Brad Bird' OR director = 'Andrew Stanton';

-- NOT
-- Find all the movies which are not directed by Andrew Stanton
SELECT * from movies WHERE NOT director = 'Andrew Stanton';

-- Find all movies that weren’t released between 2000 and 2004
SELECT * from movies WHERE year not BETWEEN 2000 and 2004;

-- Find all the movies which are not Toy Story movies
SELECT * from movies WHERE title NOT IN ('Toy Story', 'Toy Story 2', 'Toy Story 3');

-- GREATER THAN / LESS THAN
-- Find all the movies which start from T onwards
SELECT * from movies where title > 'T';

-- Find all movies released before 2008 and order them in the year they released
SELECT * from movies where year < 2008 order by year;

-- IN
-- Find all the movies directed in the year 2004, 2007, 2008, 1995
SELECT * from movies WHERE year IN (2004, 2007, 2008, 1995);

-- BETWEEN 
-- Find all movies released from 2000 to 2008
SELECT * from movies where year BETWEEN 2000 and 2008;

-- Find all movies which have duration between 90 minutes to 110 minutes
SELECT * from movies where minutes BETWEEN 90 and 110;

-- Find all movies starting with T to W
SELECT * from movies where title BETWEEN 'T' and 'W';

-- LIMIT OFFSET
-- Print all the rows from id 6 to 10
SELECT * from movies LIMIT 5 OFFSET 5;


-- Dealing with DATE datatype
SELECT * FROM movies WHERE year > 2000;
-- Return the date with format YYYY and YYYY-MM-DD

SELECT * FROM movies WHERE year > '2000-01-01';
-- Returns only dates with format YYYY-MM-DD

-----------------------------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------WEEK 3 CONTENT--------------------------------------------------------------- --
-----------------------------------------------------------------------------------------------------------------------------------------------

-- LIKE 
-- think of it has SQL regex
-- _ -> one character
-- % -> 0/1/multiple characters
-- Find all the movies starting with T
SELECT * from movies where title LIKE 'T%';

-- Find only the movies which have a 'Toy Story' and then a digit after it
SELECT * from movies where title LIKE 'Toy Story _' OR title LIKE 'Toy Story';


-- AGGREGATE FUNCTIONS
-- MIN and MAX -> Finds the minimum/ maximum of the column selected
-- SUM -> sums the values of the column 
-- COUNT -> counts the number of rows that satisfy the condition 
-- AVG -> average value of the column or selected columns is returned 

-- Find the movie with shortest duration
SELECT MIN(minutes), title from movies;

-- Find the latest movie released in the table
SELECT MAX(year), title from movies;

-- Find average length of all Toy Story movies
SELECT AVG(minutes) from movies where title LIKE 'Toy Story%';

-- Find the total duration of watching all the Toy Story movies in the table
SELECT SUM(minutes) from movies where title LIKE 'Toy Story%';

-- Find how many Toy story movies are there in the table
SELECT count(title) from movies where title LIKE 'Toy Story%';

-- How many movies have been directed by Dan Scanlon
SELECT count(title), director from movies where director = 'Dan Scanlon';

-- How many movies are more than 90 minutes in length


-- Query as expression 
-- +, -, /, *, ()
-- BODMAS rules apply
-- Want to see how many seconds long is each movie instead of minutes
SELECT title, director, minutes*60, year from movies;

-- AS (alias)
SELECT title, director, minutes*60 AS seconds, year from movies;

-- GROUP BY
-- Can't use it without an aggregate function
-- FInd how many movies a director has been a part of
SELECT COUNT(*), director from movies group by director;

-- HAVING 
-- Only used with group by, additional condition on the query
SELECT COUNT(*) AS Total_movies, director from movies group by director having Total_movies > 1;

-- GOOD PRACTICE 
-- Indent the code wherever keywords are use
-- Go to the next line before the keywords starts








