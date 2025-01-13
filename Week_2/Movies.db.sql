CREATE TABLE movies (
  Id INTEGER PRIMARY KEY AUTOINCREMENT,
  Title VARCHAR(25) NOT NULL,
  Director VARCHAR(25) NOT NULL,
  Minutes INTEGER DEFAULT 100,
  Year DATE
);

Select * from movies;

INSERT INTO movies (Title, Director, Year) VALUES ('Toy Story', 'John Lasseter', 1995);
INSERT INTO movies (Title, Director, Minutes, Year) VALUES ('Toy Story 2', 'John Lasseter', 93, 1999);
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




