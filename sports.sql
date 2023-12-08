

DROP DATABASE IF EXISTS sports;

CREATE DATABASE sports;

\c sports;




CREATE TABLE teams
(
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE player
(
  id SERIAL PRIMARY KEY,
  name TEXT,
  team_id INT REFERENCES teams(id)
);

CREATE TABLE games
(
  id SERIAL PRIMARY KEY,
  home_team_id INT REFERENCES teams(id),
  away_team_id INT REFERENCES teams(id),
  date DATE
);

CREATE TABLE goals
(
  id SERIAL PRIMARY KEY,
  game_id INT REFERENCES games(id),
  player_id INT REFERENCES player(id)
)

CREATE TABLE referees
(
  id SERIAL PRIMARY KEY,


)


