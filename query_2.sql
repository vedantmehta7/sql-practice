-- use practice;
-- CREATE TABLE events (
-- ID int,
-- event varchar(255),
-- YEAR INt,
-- GOLD varchar(255),
-- SILVER varchar(255),
-- BRONZE varchar(255)
-- );

-- INSERT INTO events VALUES (1,'100m',2016, 'Amthhew Mcgarray','donald','barbara');
-- INSERT INTO events VALUES (2,'200m',2016, 'Nichole','Alvaro Eaton','janet Smith');
-- INSERT INTO events VALUES (3,'500m',2016, 'Charles','Nichole','Susana');
-- INSERT INTO events VALUES (4,'100m',2016, 'Ronald','maria','paula');
-- INSERT INTO events VALUES (5,'200m',2016, 'Alfred','carol','Steven');
-- INSERT INTO events VALUES (6,'500m',2016, 'Nichole','Alfred','Brandon');
-- INSERT INTO events VALUES (7,'100m',2016, 'Charles','Dennis','Susana');
-- INSERT INTO events VALUES (8,'200m',2016, 'Thomas','Dawn','catherine');
-- INSERT INTO events VALUES (9,'500m',2016, 'Thomas','Dennis','paula');
-- INSERT INTO events VALUES (10,'100m',2016, 'Charles','Dennis','Susana');
-- INSERT INTO events VALUES (11,'200m',2016, 'jessica','Donald','Stefeney');
-- INSERT INTO events VALUES (12,'500m',2016,'Thomas','Steven','Catherine');

-- Que: write a query to find number of gold medals per swimmer (swimmers who only won gold medals)
-- video link: https://www.youtube.com/watch?v=dOLBRfwzYcU&list=PLBTZqjSKn0IfuIqbMIqzS-waofsPHMS0E
-- solution 1
select gold as player_name, count(*) as total_gold_medals from events 
where gold not in (select silver from events union all select bronze from events)
group by gold; 

-- solution 2

select player_name , count(1) as number_of_gold_medals from (
select gold as player_name, 'gold' as medal from events
union all
select silver as player_name,'silver' as medal from events
union all
select bronze as player_name,'bronze' as medal from events
) a group by player_name having count(distinct medal)=1 and max(medal) = 'gold'

















