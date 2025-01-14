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

-- WHERE 
-- Find all movies with director Brad Bird
SELECT * from movies WHERE director = 'Brad Bird';
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

-- OPERATORS
-- AND 
-- All movies directed by brad bird in year 2004 or later
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
SELECT * from movies where title BETWEEN 'Toy Story' and 'WALL-E';

-- LIMIT OFFSET
-- Print all the rows from id 6 to 10
SELECT * from movies LIMIT 5 OFFSET 5;


-- Dealing with DATE datatype
SELECT * FROM movies WHERE year > 2000;
-- Return the date with format YYYY and YYYY-MM-DD

SELECT * FROM movies WHERE year > '2000-01-01';
-- Returns only dates with format YYYY-MM-DD








