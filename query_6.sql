-- CREATE TABLE city_population (
--     state VARCHAR(50),
--     city VARCHAR(50),
--     population INT
-- );

-- -- Insert the data
-- INSERT INTO city_population (state, city, population) VALUES ('haryana', 'ambala', 100);
-- INSERT INTO city_population (state, city, population) VALUES ('haryana', 'panipat', 200);
-- INSERT INTO city_population (state, city, population) VALUES ('haryana', 'gurgaon', 300);
-- INSERT INTO city_population (state, city, population) VALUES ('punjab', 'amritsar', 150);
-- INSERT INTO city_population (state, city, population) VALUES ('punjab', 'ludhiana', 400);
-- INSERT INTO city_population (state, city, population) VALUES ('punjab', 'jalandhar', 250);
-- INSERT INTO city_population (state, city, population) VALUES ('maharashtra', 'mumbai', 1000);
-- INSERT INTO city_population (state, city, population) VALUES ('maharashtra', 'pune', 600);
-- INSERT INTO city_population (state, city, population) VALUES ('maharashtra', 'nagpur', 300);
-- INSERT INTO city_population (state, city, population) VALUES ('karnataka', 'bangalore', 900);
-- INSERT INTO city_population (state, city, population) VALUES ('karnataka', 'mysore', 400);
-- INSERT INTO city_population (state, city, population) VALUES ('karnataka', 'mangalore', 200);

-- que: find highest and lowest populated city of each state
-- link: https://www.youtube.com/watch?v=WM2jN1gOs_8&list=PLBTZqjSKn0IfuIqbMIqzS-waofsPHMS0E&index=26

select * from city_population;

-- 1. using join and cte (group by)
with cte as (
select state , min(population) as min_population , max(population) as max_population
from city_population group by state
) select a.state , b.city as min_population_city , c.city as max_population_city
from cte a inner join city_population b on a.state=b.state and a.min_population=b.population
inner join city_population c on a.state=c.state and a.max_population=c.population;

-- 2. using rank















