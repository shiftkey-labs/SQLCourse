-- 1 Find the Title of each film
select title from movies;

-- 2 Find Title and Director of each film
select title, director from movies;

-- 3 Find the movie with Id equal 8
select * from movies where id = 8;

-- 4 Find movies released between year 2000 and 2008
select * from movies where year between 2000 and 2008;

-- 5 Find all the Movies with duration more than 100 minutes.
select * from movies where minutes > 100;

-- 6 Find all the movies released after date 9th Jan 2018.
select * from movies where year > '2018-01-09';

-- 7 Find the list of different directors for movies released after year 2004.
select DISTINCT director, year from movies where year > 2004;

-- 8 Find the list of movies directed by Brad Bird, Pete Docter and Andrew Stanton.
select * from movies where director IN ('Brad Bird', 'Pete Docter', 'Andrew Stanton');

-- 9 Find all the Directors who have made movies of duration more than 1.5 hours.
select director, title from movies where minutes > 90;

-- 10 Sort the movies by Minutes from shortest to longest movies.
select * from movies ORDER BY minutes;

-- 11 View the last 5 movies in the table.
select * from movies ORDER BY id DESC LIMIT 5;

-- 12 Find all the movies directed by Pete Doctor and Brad Bird.


-- 13 Find all the movies with id more than 6, directed by Dan Scanlon and duration being more than 95 minutes.


-- 14 Find the release years where more than 1 movie was released


-- 15 Find all movies with a sequel 


-- 16 Find all the employees and the department name they work for 


-- 17 Count the number of employees working in each department with the department name 


-- 18 Count the number of projects each employee is working on 


-- 19 Sum the total number of hours a department has worked on project for, also display the sum column as "total hours"


-- 20 Find all employees who belong to departments located in the "IT" department (using subqueries)


-- 21 List all employees who are earning the highest salary in the company 


-- 22 Get the average salary of all the employees in IT department 


-- 23 List employees who work on more than 2 projects 