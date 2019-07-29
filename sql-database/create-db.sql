CREATE DATABASE mountain_project;

\c mountain_project;

CREATE TABLE buttermilks(
  route TEXT,
  location TEXT,
  url TEXT,
  avg_stars FLOAT,
  your_stars INT,
  route_type TEXT,
  rating TEXT,
  pitches INT,
  length_ FLOAT,
  area_latitude FLOAT,
  area_longitude FLOAT
);

CREATE TABLE druid_stones(
  route TEXT,
  location TEXT,
  url TEXT,
  avg_stars FLOAT,
  your_stars INT,
  route_type TEXT,
  rating TEXT,
  pitches INT,
  length_ FLOAT,
  area_latitude FLOAT,
  area_longitude FLOAT
);

CREATE TABLE happy_boulders(
  route TEXT,
  location TEXT,
  url TEXT,
  avg_stars FLOAT,
  your_stars INT,
  route_type TEXT,
  rating TEXT,
  pitches INT,
  length_ FLOAT,
  area_latitude FLOAT,
  area_longitude FLOAT
);

CREATE TABLE sad_boulders(
  route TEXT,
  location TEXT,
  url TEXT,
  avg_stars FLOAT,
  your_stars INT,
  route_type TEXT,
  rating TEXT,
  pitches INT,
  length_ FLOAT,
  area_latitude FLOAT,
  area_longitude FLOAT
);

CREATE TABLE joshua_tree(
  route TEXT,
  location TEXT,
  url TEXT,
  avg_stars FLOAT,
  your_stars INT,
  route_type TEXT,
  rating TEXT,
  pitches INT,
  length_ FLOAT,
  area_latitude FLOAT,
  area_longitude FLOAT
);

\copy buttermilks FROM '/home/harrisonized/github/mountain-project-recommender/data/downloads/buttermilks.csv' DELIMITER ',' CSV HEADER;
\copy druid_stones FROM '/home/harrisonized/github/mountain-project-recommender/data/downloads/druid_stones.csv' DELIMITER ',' CSV HEADER;
\copy happy_boulders FROM '/home/harrisonized/github/mountain-project-recommender/data/downloads/happy_boulders.csv' DELIMITER ',' CSV HEADER;
\copy sad_boulders FROM '/home/harrisonized/github/mountain-project-recommender/data/downloads/sad_boulders.csv' DELIMITER ',' CSV HEADER;
\copy joshua_tree FROM '/home/harrisonized/github/mountain-project-recommender/data/downloads/joshua_tree.csv' DELIMITER ',' CSV HEADER;
