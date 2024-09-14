-- create table hospital (
--   emp_id char(2)
-- , action varchar(10)
-- , time datetime);

-- insert into hospital values ('1', 'in', '2019-12-22 09:00:00');
-- insert into hospital values ('1', 'out', '2019-12-22 09:15:00');
-- insert into hospital values ('2', 'in', '2019-12-22 09:00:00');
-- insert into hospital values ('2', 'out', '2019-12-22 09:15:00');
-- insert into hospital values ('2', 'in', '2019-12-22 09:30:00');
-- insert into hospital values ('3', 'out', '2019-12-22 09:00:00');
-- insert into hospital values ('3', 'in', '2019-12-22 09:15:00');
-- insert into hospital values ('3', 'out', '2019-12-22 09:30:00');
-- insert into hospital values ('3', 'in', '2019-12-22 09:45:00');
-- insert into hospital values ('4', 'in', '2019-12-22 09:45:00');
-- insert into hospital values ('5', 'out', '2019-12-22 09:40:00');

-- que: find total number of people present in the hospital
-- link: https://www.youtube.com/watch?v=oGYinDMDfnA&list=PLBTZqjSKn0IfuIqbMIqzS-waofsPHMS0E&index=3

-- 1 group by having
select distinct emp_id from (
select emp_id,
max(case when action='in' then time end) as in_time,
max(case when action='out' then time end) as out_time from hospital
group by emp_id
) a where in_time>out_time or out_time is null;

-- 2 group by having
select emp_id,
max(case when action='in' then time end) as in_time,
max(case when action='out' then time end) as out_time from hospital
group by emp_id
having max(case when action='in' then time end) > max(case when action='out' then time end) or max(case when action='out' then time end) is null;


-- 3 using join
with intime as (
select emp_id,max(time) as time from hospital where action = 'in'
group by emp_id
) , outtime as (
select emp_id,max(time) as time from hospital where action = 'out'
group by emp_id
) select distinct a.emp_id
from intime a left join outtime b on a.emp_id = b.emp_id
where a.time>b.time or b.emp_id is null;


-- 4. common sense
with maxtime as (
select emp_id , max(time) as time from hospital group by emp_id)
, maxintime as (
select emp_id , max(time) as time from hospital where action='in' group by emp_id)
select distinct a.emp_id from maxtime a inner join maxintime b on a.emp_id=b.emp_id and a.time=b.time;







