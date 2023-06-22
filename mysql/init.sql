DROP DATABASE IF EXISTS reversi;

CREATE DATABASE reversi;

use reversi;

CREATE TABLE games (
  id int PRIMARY KEY auto_increment,
  started_at datetime NOT NULL
);

CREATE TABLE turns (
  id int PRIMARY KEY auto_increment,
  game_id int NOT NULL,
  turn_count int NOT NULL,
  next_disc int,
  end_at datetime NOT NULL,
  FOREIGN KEY (game_id) REFERENCES games (id),
  UNIQUE (game_id, turn_count)
);

CREATE TABLE moves (
  id int PRIMARY KEY auto_increment,
  turn_id int NOT NULL,
  disc int NOT NULL,
  x int NOT NULL,
  y int NOT NULL,
  FOREIGN KEY (turn_id) REFERENCES turns (id)
);

CREATE TABLE squares (
  id int PRIMARY KEY auto_increment,
  turn_id int NOT NULL,
  x int NOT NULL,
  y int NOT NULL,
  disc int NOT NULL,
  FOREIGN KEY (turn_id) REFERENCES turns (id),
  UNIQUE (turn_id, x, y)
);

CREATE TABLE game_results (
  id int PRIMARY KEY auto_increment,
  game_id int NOT NULL,
  winner_disc int NOT NULL,
  end_at datetime NOT NULL,
  FOREIGN KEY (game_id) REFERENCES games (id)
);

SELECT 'ok' as result;
