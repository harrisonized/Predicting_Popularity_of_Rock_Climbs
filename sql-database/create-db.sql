CREATE DATABASE mountain_project;

\c mountain_project;

CREATE TABLE buttermilks(
  id_ SERIAL PRIMARY KEY,
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
  id_ SERIAL PRIMARY KEY,
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
  id_ SERIAL PRIMARY KEY,
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
  id_ SERIAL PRIMARY KEY,
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
  id_ SERIAL PRIMARY KEY,
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

COPY buttermilks (route, location, url, avg_stars, your_stars, route_type, rating, pitches, length_, area_latitude, area_longitude)
FROM '/home/harrisonized/github/mountain-project-recommender/data/downloads/buttermilks.csv'
WITH DELIMITER ',' CSV HEADER;

COPY druid_stones (route, location, url, avg_stars, your_stars, route_type, rating, pitches, length_, area_latitude, area_longitude)
FROM '/home/harrisonized/github/mountain-project-recommender/data/downloads/druid_stones.csv'
WITH DELIMITER ',' CSV HEADER;

COPY happy_boulders (route, location, url, avg_stars, your_stars, route_type, rating, pitches, length_, area_latitude, area_longitude)
FROM '/home/harrisonized/github/mountain-project-recommender/data/downloads/happy_boulders.csv' 
WITH DELIMITER ',' CSV HEADER;

COPY sad_boulders (route, location, url, avg_stars, your_stars, route_type, rating, pitches, length_, area_latitude, area_longitude)
FROM '/home/harrisonized/github/mountain-project-recommender/data/downloads/sad_boulders.csv'
WITH DELIMITER ',' CSV HEADER;

COPY joshua_tree (route, location, url, avg_stars, your_stars, route_type, rating, pitches, length_, area_latitude, area_longitude)
FROM '/home/harrisonized/github/mountain-project-recommender/data/downloads/joshua_tree.csv'
WITH DELIMITER ',' CSV HEADER;
