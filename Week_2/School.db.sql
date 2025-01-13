CREATE TABLE student (
	student_id INT PRIMARY KEY,
	fname VARCHAR(25),
	lname VARCHAR(25),
	gpa DECIMAL(4,2),
	leader_id INT
);

SELECT * from student;

INSERT INTO student values(1, 'John', 'Doe', 4.67, NULL);
INSERT INTO student values(2, 'Mark', 'Name', 6, 1);
INSERT INTO student values(3, 'Joey', 'Hun', 7, 1);
INSERT INTO student values(4, 'Dan', 'Smith', 7, 1);
INSERT INTO student values(5, 'Kart', 'Doe', 8, 1);

DROP table student;