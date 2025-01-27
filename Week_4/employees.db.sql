CREATE TABLE employees ( 
  id INTEGER PRIMARY KEY AUTOINCREMENT, 
  firstname varchar(20) NOT NULL, 
  lastname varchar(20) NOT NULL, 
  email varchar(25) NOT NULL UNIQUE, 
  phone varchar(25) UNIQUE, 
  salary INTEGER DEFAULT 10000, 
  joining_date DATE NOT NULL,
  dept_id INTEGER,
  FOREIGN KEY(dept_id) REFERENCES departments(dept_id)
);

CREATE table departments (
  dept_id INTEGER PRIMARY KEY,
  dept_name VARCHAR(25),
  super_id INTEGER,
  FOREIGN KEY(super_id) REFERENCES employees(id)
);

CREATE table projects (
  project_id INTEGER PRIMARY KEY,
  project_name VARCHAR(30),
  dept_id INTEGER,
  FOREIGN KEY(dept_id) REFERENCES departments(dept_id)
);

CREATE table working_on (
  emp_id INTEGER,
  project_id INTEGER,
  hours DECIMAL(4,2),
  PRIMARY KEY(emp_id, project_id),
  FOREIGN KEY(emp_id) REFERENCES employees(id),
  FOREIGN KEY(project_id) REFERENCES projects(project_id)
);

INSERT INTO employees (firstname, lastname, email, phone, salary, joining_date, dept_id) 
VALUES ('Mark', 'Hart', 'mark.h@abc.com', '9909099890', 60000, '1998-09-01', 1);

INSERT INTO employees (firstname, lastname, email, phone, salary, joining_date, dept_id) 
VALUES ('Joseph', 'Judge', 'joseph.j@abc.com', '9876789876', 80000, '2014-06-30', 1);

INSERT INTO employees (firstname, lastname, email, phone, salary, joining_date, dept_id) 
VALUES ('Bill', 'White', 'bill.w@abc.com', '7878790988', 90000, '2000-07-24', 2);

INSERT INTO employees (firstname, lastname, email, phone, salary, joining_date, dept_id) 
VALUES ('John', 'Wick', 'john.w@abc.com', '7383662987', 67000, '1999-12-01', 2);

INSERT INTO employees (firstname, lastname, email, phone, salary, joining_date, dept_id) 
VALUES ('Han', 'Dan', 'han.d@abc.com', '9903499820', 72000, '2006-07-01', 2);

INSERT INTO employees (firstname, lastname, email, phone, salary, joining_date, dept_id) 
VALUES ('Kelly', 'Ken', 'kelly.k@abc.com', '9877652356', 95000, '2002-04-15', 3);

INSERT INTO employees (firstname, lastname, email, phone, salary, joining_date, dept_id) 
VALUES ('Rose', 'Reddy', 'rose.r@abc.com', '7876544988', 100000, '2000-10-09', 3);

INSERT INTO employees (firstname, lastname, email, phone, salary, joining_date, dept_id) 
VALUES ('Dave', 'Young', 'dave.y@abc.com', '7764563646', 89000, '1999-11-03', 3);


INSERT INTO departments (dept_id, dept_name, super_id) VALUES
(1, 'HR', 6),
(2, 'IT', 3),
(3, 'Finance', 7);

INSERT INTO projects (project_id, project_name, dept_id) VALUES
(1, 'Employee Portal', 2),
(2, 'Recruitment Drive', 1),
(3, 'Financial Audit', 3),
(4, 'Analyse Product Sales', 3);

INSERT INTO working_on (emp_id, project_id, hours) VALUES
(1, 2, 120.50), -- Mark Hart working on Recruitment Drive
(2, 2, 80.25),  -- Joseph Judge working on Recruitment Drive
(3, 1, 150.75), -- Bill White working on Employee Portal
(4, 1, 95.00),  -- John Wick working on Employee Portal
(5, 1, 110.00), -- Han Dan working on Employee Portal
(6, 3, 50.25), -- Kelly Ken working on Financial Audit
(7, 3, 220.50), -- Rose Reddy working on Financial Audit
(8, 4, 190.00); -- Dave Young working on Analyse Product Sales 

SELECT * from employees;

SELECT * from departments;

SELECT * from projects;

SELECT * from working_on;

drop table employees;
drop table projects;
drop table departments;
drop TABLE working_on;

-- JOINS
-- INNER JOIN -- intersection
-- LEFT JOIN -- intersection and first table
-- RIGHT JOIN -- intersection and second table
-- FULL/OUTER JOIN -- first table, intersection and second table 



-- INNER JOIN using WHERE
-- List all the employees with their names and their department name
SELECT employees.firstname, employees.lastname, departments.dept_name 
from employees 
INNER join departments 
where employees.dept_id = departments.dept_id;

-- INNER JOIN using ON
-- List all the employees with their names and their department name
SELECT firstname, lastname, dept_name 
from employees 
INNER join departments ON employees.dept_id = departments.dept_id;

-- List all the employees with their names and their department name being 'Finanace'
SELECT firstname, lastname, dept_name 
from employees 
INNER join departments ON employees.dept_id = departments.dept_id 
where departments.dept_name = 'Finance';

-- another example here

-- List all the managers name with the department they are managing 
SELECT employees.firstname, employees.lastname, departments.dept_name
FROM departments 
INNER JOIN employees WHERE employees.id = departments.super_id;

-- List all the projects an employee is working on with the name of the project
-- well this will only give me project id
select firstname, lastname, working_on.project_id
FROM employees
INNER JOIN working_on ON employees.id = working_on.emp_id;

-- to get the project name, I need to join projects table as well
select firstname, lastname, project_name
FROM employees
INNER JOIN working_on ON employees.id = working_on.emp_id
INNER JOIN projects ON working_on.project_id = projects.project_id;

-- find total numbers of hours worked on one project by all the employees working on it
select project_name, sum(hours) AS total_hours
FROM employees
INNER JOIN working_on ON employees.id = working_on.emp_id
INNER JOIN projects ON working_on.project_id = projects.project_id
GROUP BY project_name;




-- LEFT JOIN 
-- When  you want to find rows that don't have any information in other table 
-- Find all the employees without a project 
INSERT INTO employees (firstname, lastname, email, phone, salary, joining_date, dept_id) 
VALUES ('Kevin', 'Mac', 'kevin.m@abc.com', '9909672890', 75000, '2008-10-08', 3);

select *
FROM employees
INNER JOIN working_on ON employees.id = working_on.emp_id
INNER JOIN projects ON working_on.project_id = projects.project_id;

SELECT * from employees;

select *
FROM employees
LEFT JOIN working_on ON employees.id = working_on.emp_id
LEFT JOIN projects ON working_on.project_id = projects.project_id;





-- RIGHT JOIN 
-- Let's find projects nobody is working on, that aren't active 
INSERT INTO projects (project_id, project_name, dept_id) VALUES
(5, 'Robotics Development', 2);

select *
FROM employees
RIGHT JOIN working_on ON employees.id = working_on.emp_id
RIGHT JOIN projects ON working_on.project_id = projects.project_id;

-- to just view if any department is working on the project
select *
FROM working_on
RIGHT JOIN projects ON working_on.project_id = projects.project_id;





-- FULL (OUTER) JOIN
-- Returns all the row values from the tables which either match or not
-- Find all the employees who are working or not working on a project and also find all the projects which are either assigned to someone or not 
select *
FROM employees
FULL JOIN working_on ON employees.id = working_on.emp_id
FULL JOIN projects ON working_on.project_id = projects.project_id;






-- SELF JOIN
-- List all the employees with their name and their managers
-- here we use alias AS, to identify the table columns and rename them to make it easier for us to understand
SELECT 
    e.firstname AS Employee_Firstname, 
    e.lastname AS Employee_Lastname,
    m.firstname AS Manager_Firstname, 
    m.lastname AS Manager_Lastname
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id
LEFT JOIN employees m ON d.super_id = m.id;




-----------------------------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------ SUBQUERIES --------------------------------------------------------------- --
-----------------------------------------------------------------------------------------------------------------------------------------------


--Find all employees whose salary is higher than the average salary in the company.
SELECT id, firstname, lastname, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);


-- Find employees who joined after the earliest joining date



-- Find all the projects for department of Finance 
SELECT *
from projects
WHERE dept_id IN (SELECT dept_id from departments where dept_name = 'Finance');

-- Find employees that have no projects assigned 
SELECT id, firstname, lastname, email
FROM employees
WHERE id NOT IN (
    SELECT emp_id
    FROM working_on
);


-- Find all employees who have worked less than 70 hours on a project they are assigned 
SELECT *
from employees
where (SELECT hours from working_on where employees.id = working_on.emp_id) < 70;

-- OR

SELECT *
from employees
where id IN (SELECT emp_id from working_on where hours < 70);

-- Find employees earning more than the average salary in their department.
select *
from employees e
where salary > (select AVG(salary) from employees where employees.dept_id = e.dept_id);

select AVG(salary) from employees GROUP by dept_id;


-- what are the projects that employees has worked for more than 200 hours in total








SELECT project_name
FROM projects p
WHERE (SELECT SUM(hours) from working_on WHERE project_id = p.project_id) > 200;

SELECT SUM(hours) from working_on group by project_id;

select * from working_on;


-- Find the department with the maximum number of employees
SELECT dept_name
FROM departments
WHERE dept_id = (
    SELECT dept_id
    FROM employees
    GROUP BY dept_id
    ORDER BY COUNT(id) DESC
    LIMIT 1
);

-- Retrieve the name of the project with the highest total hours worked


