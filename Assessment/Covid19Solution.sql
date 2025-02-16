-- Comment the above query before writing the answer for first query
-- Answer for query 1
SELECT * FROM countries WHERE total_cases > 100000;

-- Answer for query 2
SELECT * FROM countries WHERE first_covid_date BETWEEN '2019-12-31' AND '2020-01-31';

-- Answer for query 3
SELECT * FROM continents WHERE continent_name LIKE 'A%';

-- Answer for query 4
SELECT * 
FROM countries 
ORDER BY population DESC 
LIMIT 5;

-- Answer for query 5
SELECT * FROM countries WHERE total_deaths > 10000 AND population < 100000000;

-- Answer for query 6
SELECT * 
FROM countries 
ORDER BY total_cases, country_name 
LIMIT 3;

-- Answer for query 7
SELECT continent_id, SUM(population) AS total_population 
FROM countries 
GROUP BY continent_id;

-- Answer for query 8
SELECT income_class_id, AVG(total_deaths) AS avg_deaths 
FROM countries 
GROUP BY income_class_id
HAVING avg_deaths > 20000;

-- Answer for query 9
SELECT country_name,(total_cases - total_deaths) AS 'survivors' 
FROM countries 
ORDER BY survivors;

-- Answer for query 10
SELECT country_name, (total_cases - total_deaths) AS 'survivors' 
FROM countries 
ORDER BY survivors DESC 
LIMIT 1;

-- Answer for query 11
SELECT country_name, (total_deaths / population * 100) AS death_rate
FROM countries
ORDER BY death_rate DESC
LIMIT 1;

-- Answer for query 12
SELECT c.country_name, con.continent_name
FROM countries c
JOIN continents con ON c.continent_id = con.continent_id;

-- Answer for query 13
SELECT ic.income_class_name, COUNT(c.country_id) AS total_countries
FROM countries c
JOIN income_classes ic ON c.income_class_id = ic.income_class_id
GROUP BY ic.income_class_name;

-- Answer for query 14
SELECT continent_name 
FROM continents 
WHERE total_deaths = (SELECT MAX(total_deaths) FROM continents);

-- Answer for query 15
SELECT country_name, total_deaths, continent_id
FROM countries
WHERE continent_id = 2
  AND total_deaths > (
      SELECT AVG(total_deaths)
      FROM countries
      WHERE continent_id = 2
  );

-- Answer for query 16
SELECT ic.income_class_name, c.country_name, c.total_deaths
FROM income_classes ic
JOIN countries c ON ic.income_class_id = c.income_class_id
WHERE ic.total_deaths = (SELECT MAX(total_deaths) FROM income_classes);

-- Answer for query 17
SELECT 
    ic.income_class_name,
    c.country_name,
    c.total_deaths,
    c.population,
    (c.total_deaths / c.population) * 100 AS death_rate
FROM countries c
JOIN income_classes ic ON c.income_class_id = ic.income_class_id
WHERE ic.total_deaths = (
    SELECT MAX(total_deaths)
    FROM income_classes
);
