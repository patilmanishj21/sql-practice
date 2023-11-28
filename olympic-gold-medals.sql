CREATE TABLE events (
ID int,
event varchar(255),
YEAR INt,
GOLD varchar(255),
SILVER varchar(255),
BRONZE varchar(255)
);

delete from events;

INSERT INTO events VALUES (1,'100m',2016, 'Amthhew Mcgarray','donald','barbara');
INSERT INTO events VALUES (2,'200m',2016, 'Nichole','Alvaro Eaton','janet Smith');
INSERT INTO events VALUES (3,'500m',2016, 'Charles','Nichole','Susana');
INSERT INTO events VALUES (4,'100m',2016, 'Ronald','maria','paula');
INSERT INTO events VALUES (5,'200m',2016, 'Alfred','carol','Steven');
INSERT INTO events VALUES (6,'500m',2016, 'Nichole','Alfred','Brandon');
INSERT INTO events VALUES (7,'100m',2016, 'Charles','Dennis','Susana');
INSERT INTO events VALUES (8,'200m',2016, 'Thomas','Dawn','catherine');
INSERT INTO events VALUES (9,'500m',2016, 'Thomas','Dennis','paula');
INSERT INTO events VALUES (10,'100m',2016, 'Charles','Dennis','Susana');
INSERT INTO events VALUES (11,'200m',2016, 'jessica','Donald','Stefeney');
INSERT INTO events VALUES (12,'500m',2016,'Thomas','Steven','Catherine');


select * from events;

SELECT gold AS player_name,COUNT(1) AS no_of_gold_medals 
FROM EVENTS 
WHERE gold NOT IN (SELECT silver FROM EVENTS UNION ALL SELECT bronze FROM EVENTS)
GROUP BY gold;

select * from events;

WITH cte as (
SELECT gold as player_name,'gold_medal' as medal FROM events
UNION ALL
SELECT silver,'silver_medal' FROM events
UNION ALL
SELECT bronze,'bronze_medal' FROM events
)
SELECT player_name,count(1) as no_of_gold FROM cte 
GROUP BY player_name
HAVING count(distinct medal)=1 --one kind of medal  
and max(medal)='gold_medal' 




WITH CTE AS (
SELECT player, SUM(CASE Medal WHEN 'GOLD' THEN 1 ELSE 0 END) as GOLD,
SUM(CASE Medal WHEN 'SILVER' THEN 1 ELSE 0 END) as SILVER,
SUM(CASE Medal WHEN 'BRONZE' THEN 1 ELSE 0 END) as BRONZE
FROM (SELECT GOLD as player, 'GOLD' as Medal
FROM events
UNION ALL
SELECT SILVER as player, 'SILVER' as Medal
FROM events
UNION ALL
SELECT BRONZE as player, 'BRONZE' as Medal
FROM events) XYZ
GROUP BY player)
Select player, GOLD
FROM CTE
WHERE SILVER = 0 AND BRONZE = 0;



select GOLD as player_name, count(GOLD) as no_of_medals from events
where GOLD not in 
(select Silver as S_Swimmers from events union all select Bronze as B_Swimmers from events )
group by GOLD;