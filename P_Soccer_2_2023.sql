create Database fantasy_soccer;
show databases;
use fantasy_soccer;

CREATE TABLE players (
  player_id INT PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  position VARCHAR(255),
  team_id INT REFERENCES teams(team_id),
  points INT
);

CREATE TABLE teams (
  team_id INT PRIMARY KEY,
  name VARCHAR(255),
  city VARCHAR(255)
);

CREATE TABLE player_performance (
  performance_id INT PRIMARY KEY,
  player_id INT REFERENCES players(player_id),
  game_id INT REFERENCES games(game_id),
  goals INT,
  assists INT,
  shots INT,
  tackles INT,
  saves INT,
  yellow_cards INT,
  red_cards INT
);

INSERT INTO players (player_id, first_name, last_name, position, team_id, points)
VALUES (1, 'Lionel', 'Messi', 'MP', 1, 82);
show tables;

select * from players;

INSERT INTO players (player_id, first_name, last_name, position, team_id, points)
SELECT 2, "Erling", "Haaland", "DL", 2, 77
UNION
SELECT 3, "Neymar", "Jr","MP",1, 77
UNION
SELECT 4, "Martin", "Terrier", "DL", 3, 77
UNION
SELECT 5, "Kieran", "Trippier", "DF", 4, 77
UNION
SELECT 6, "Robert", "Lewandowski", "DL", 5, 76
UNION
SELECT 7, "Kylian", "Mbappé", "MP", 1, 76
UNION
SELECT 8, "Joshua", "Kimmich", "DF", 6, 76
UNION
SELECT 9, "Kevin", "De bruyne", "ME", 2, 76
UNION
SELECT 10, "Gabriel", "Jesus","MP",7, 75
UNION
SELECT 11, "Karim", "Benzema","DL", 8, 75
UNION
SELECT 12, "Khvicha", "Kvaratshelia", "MP", 9, 75
UNION
SELECT 13, "Harry", "Kane", "MP", 10, 74
UNION
SELECT 14, "Jude", "Bellingham", "ME", 11, 74
UNION
SELECT 15, "Jamal", "Musiala", "ME", 6, 74
UNION
SELECT 16, "Martin", "Odegaard", "MP", 7, 74
UNION
SELECT 17, "Niclas", "Füllkrug", "DL", 12, 74
UNION
SELECT 18, "Victor", "Osimhen", "DL", 9, 74
UNION
SELECT 19, "Christopher", "Nkunku", "ME", 13, 74
UNION
SELECT 20, "Dango", "Ouattara", "MP", 14, 74;

SELECT * FROM players;

update players set position = "MP" where player_id = 1;

Alter table players modify points float;

SELECT * from players;

update players set points = 8.2 where player_id = 1;
-- update players set points = cast( points as float)

update players set points = case
	when player_id = 3 THEN 7.73
    when player_id = 4 THEN 7.71
    when player_id = 5 THEN 7.71
    when player_id = 6 THEN 7.66
    when player_id = 7 THEN 7.64
    when player_id = 8 THEN 7.64
    when player_id = 9 THEN 7.62
    when player_id = 10 THEN 7.59
    when player_id = 11 THEN 7.56
    when player_id = 12 THEN 7.51
    when player_id = 13 THEN 7.49
    when player_id = 14 THEN 7.49
    when player_id = 15 THEN 7.48
    when player_id = 16 THEN 7.46
    when player_id = 17 THEN 7.45
    when player_id = 18 THEN 7.43
    when player_id = 19 THEN 7.43
    when player_id = 20 THEN 7.43
    end
WHERE player_id in (3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20) end;

INSERT INTO teams ( team_id, name, city)
SELECT 1, "PSG", "Paris"
UNION
SELECT 2,"Man City", "Manchester"
UNION
SELECT 3, "Rennes", "Rennes"
UNION
SELECT 4, "NewCastle", "Newcastle"
UNION
SELECT 5, "Barcelona", "Barcelona"
UNION
SELECT 6, "Bayern", "Bayern"
UNION
SELECT 7, "Arsenal", "Londres"
UNION
SELECT 8, "Real Madrid", "Madrid"
UNION
SELECT 9, "Napoli", "Nápoles"
UNION
SELECT 10, "Tottenham", "Londres"
UNION
SELECT 11, "Borussia Dortmund", "Dortmund"
UNION
SELECT 12, "Bremen", "Bremen"
UNION
SELECT 13, "RBL", "Leipzig"
UNION
SELECT 14, "Lorient", "Lorient";

select * from teams;

alter table player_performance 
change game_id Num_games INT;


INSERT INTO player_performance (performance_id ,player_id,Num_games, goals,assists,shots,tackles,saves,yellow_cards,red_cards)
SELECT 1,1,17,9,10,4.4,0,0,0,0
UNION
SELECT 2,2,18,25,3,3.9,0,0,3,0
UNION
SELECT 3,3,16,12,10,1.9,0,0,4,1
UNION
SELECT 4,4,16,9,4,2.9,0,0,0,0
UNION
SELECT 5,5,20,1,4,0.4,0,0,5,0
UNION
SELECT 6,6,17,3,3,1.2,0,0,3,0
UNION
SELECT 7,7,15,14,4,3.7,0,0,0,1
UNION
SELECT 8,8,18,3,11,2.4,0,0,1,0
UNION
SELECT 9,9,14,5,5,3.6,0,0,4,0
UNION
SELECT 10,10,17,13,2,4.0,0,0,3,0
UNION
SELECT 11,11,11,9,1,4.5,0,0,0,0
UNION
SELECT 12,12,15,7,8,2.8,0,0,0,0
UNION
SELECT 13,13,21,16,1,3.7,0,0,4,0
UNION
SELECT 14,14,17,4,3,2.0,0,0,5,0
UNION
SELECT 15,15,15,9,6,2.2,0,0,1,0
UNION
SELECT 16,16,18,8,5,2.7,0,0,3,0
UNION
SELECT 17,17,17,13,2,3.2,0,0,4,0
UNION
SELECT 18,18,15,14,3,4.1,0,0,2,0
UNION
SELECT 19,19,14,12,0,2.9,0,0,1,0
UNION
SELECT 20,20,18,6,5,2.9,0,0,1,1;
 
select * from player_performance;

show tables;


-- Joins, Group by, order by,  ---
SELECT p.player_id, p.first_name, p.last_name, r.goals from players p left join player_performance r on p.player_id = performance_id;
SELECT p.player_id, p.first_name, p.last_name, r.goals from players p right join player_performance r on p.player_id = performance_id;
SELECT p.player_id, p.first_name, p.last_name, r.goals, r.assists from players p inner join player_performance r on p.player_id = performance_id order by goals DESC;

SELECT players.player_id,first_name, last_name, player_performance.goals, player_performance.assists, SUM(players.points)
FROM players
LEFT JOIN player_performance
ON players.player_id = player_performance.player_id
GROUP BY players.player_id
ORDER BY SUM(players.points) DESC
LIMIT 10;
