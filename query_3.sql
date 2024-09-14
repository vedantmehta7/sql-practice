-- create table tickets
-- (
-- ticket_id varchar(10),
-- create_date date,
-- resolved_date date
-- );

-- insert into tickets values
-- (1,'2022-08-01','2022-08-03')
-- ,(2,'2022-08-01','2022-08-12')
-- ,(3,'2022-08-01','2022-08-16');

-- create table holidays
-- (
-- holiday_date date
-- ,reason varchar(100)
-- );

-- insert into holidays values
-- ('2022-08-11','Rakhi'),('2022-08-15','Independence day');

-- que: Write a SQL to find the Business Day between create date and resolved date by excluding 
-- link: https://www.youtube.com/watch?v=FZ0GCcnIIWA&list=PLBTZqjSKn0IfuIqbMIqzS-waofsPHMS0E&index=2
-- 1. weekends

with cte as (
select *,
 datediff(resolved_date,create_date) as number_of_days,
 weekofyear(create_date) as created_week,
 weekofyear(resolved_date) as resolved_week
 from tickets
 ) select ticket_id,create_date,resolved_date , number_of_days - 2 *(resolved_week-created_week) as number_of_b_days
 from cte;

-- 2. weekends and public holidays

with cte as (
select a.*,b.holiday_date from tickets a left join holidays b on b.holiday_date between create_date and resolved_date
),cte2 as ( select ticket_id , count(distinct holiday_date) as number_of_holidays from cte
group by ticket_id) , cte3 as (
select a.*,
 datediff(resolved_date,create_date) as number_of_days,
 number_of_holidays,
 weekofyear(create_date) as created_week,
 weekofyear(resolved_date) as resolved_week
 from tickets a inner join cte2 b on a.ticket_id=b.ticket_id
 ) select ticket_id,create_date,resolved_date , number_of_days - 2 *(resolved_week-created_week) - number_of_holidays as number_of_b_days
 from cte3;


















