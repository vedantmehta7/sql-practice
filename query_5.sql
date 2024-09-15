-- CREATE TABLE seats (
--     id INT,
--     student VARCHAR(10)
-- );

-- INSERT INTO seats VALUES 
-- (1, 'Amit'),
-- (2, 'Deepa'),
-- (3, 'Rohit'),
-- (4, 'Anjali'),
-- (5, 'Neha'),
-- (6, 'Sanjay'),
-- (7, 'Priya');

-- que: swap seats of 2 consecutive students
-- link: https://www.youtube.com/watch?v=Sq1kM3jVU68&list=PLBTZqjSKn0IfuIqbMIqzS-waofsPHMS0E&index=28

select * from seats;

-- 1. using case when 

select id,student,
case when id = (select max(id) from seats) and id%2=1 then id
when id%2=1 then id+1 else id-1 end as new_seat
from seats;

-- 2 . using lead and lag
select id,student,
case 
when id%2=1 then lead(id,1,id) over(order by id) 
else lag(id,1,id) over(order by id) end as new_id
from seats;



