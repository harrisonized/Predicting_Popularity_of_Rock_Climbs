CREATE DATABASE mountain_project;

\c mountain_project;

CREATE TABLE routes(
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
  area_longitude FLOAT,
  url_id INT,
  grade FLOAT,
  area_name TEXT
);

CREATE TABLE ratings(
  id_ SERIAL PRIMARY KEY,
  url_id INT,
  star_ratings INT,
  suggested_ratings INT,
  on_to_do_lists INT,
  ticks INT
);

CREATE TABLE feature_transforms(
  id_ SERIAL PRIMARY KEY,
  url_id INT,
  log_star_ratings FLOAT,
  log_ticks FLOAT,
  log_avg_stars FLOAT,
  log_length FLOAT,
  log_grade FLOAT,
  log_on_to_do_lists FLOAT,
  sqrt_star_ratings FLOAT,
  sqrt_ticks FLOAT,
  sqrt_avg_stars FLOAT,
  sqrt_length FLOAT,
  sqrt_grade FLOAT
);



COPY routes (route, location, url, avg_stars, your_stars, route_type, rating, pitches, length_, area_latitude, area_longitude, url_id, grade, area_name)
FROM '/home/harrisonized/github/metis/mountain-project-recommender/data/buttermilks.csv'
WITH DELIMITER ',' CSV HEADER;

COPY routes (route, location, url, avg_stars, your_stars, route_type, rating, pitches, length_, area_latitude, area_longitude, url_id, grade, area_name)
FROM '/home/harrisonized/github/metis/mountain-project-recommender/data/druid_stones.csv'
WITH DELIMITER ',' CSV HEADER;

COPY routes (route, location, url, avg_stars, your_stars, route_type, rating, pitches, length_, area_latitude, area_longitude, url_id, grade, area_name)
FROM '/home/harrisonized/github/metis/mountain-project-recommender/data/happy_boulders.csv' 
WITH DELIMITER ',' CSV HEADER;

COPY routes (route, location, url, avg_stars, your_stars, route_type, rating, pitches, length_, area_latitude, area_longitude, url_id, grade, area_name)
FROM '/home/harrisonized/github/metis/mountain-project-recommender/data/sad_boulders.csv'
WITH DELIMITER ',' CSV HEADER;

COPY routes (route, location, url, avg_stars, your_stars, route_type, rating, pitches, length_, area_latitude, area_longitude, url_id, grade, area_name)
FROM '/home/harrisonized/github/metis/mountain-project-recommender/data/joshua_tree.csv'
WITH DELIMITER ',' CSV HEADER;



COPY ratings (url_id, star_ratings, suggested_ratings, on_to_do_lists, ticks)
FROM '/home/harrisonized/github/metis/mountain-project-recommender/data/buttermilks-ratings.csv'
WITH DELIMITER ',' CSV HEADER;

COPY ratings (url_id, star_ratings, suggested_ratings, on_to_do_lists, ticks)
FROM '/home/harrisonized/github/metis/mountain-project-recommender/data/druid_stones-ratings.csv'
WITH DELIMITER ',' CSV HEADER;

COPY ratings (url_id, star_ratings, suggested_ratings, on_to_do_lists, ticks)
FROM '/home/harrisonized/github/metis/mountain-project-recommender/data/happy_boulders-ratings.csv' 
WITH DELIMITER ',' CSV HEADER;

COPY ratings (url_id, star_ratings, suggested_ratings, on_to_do_lists, ticks)
FROM '/home/harrisonized/github/metis/mountain-project-recommender/data/sad_boulders-ratings.csv'
WITH DELIMITER ',' CSV HEADER;

COPY ratings (url_id, star_ratings, suggested_ratings, on_to_do_lists, ticks)
FROM '/home/harrisonized/github/metis/mountain-project-recommender/data/joshua_tree-ratings.csv'
WITH DELIMITER ',' CSV HEADER;



COPY feature_transforms (url_id, log_star_ratings, log_ticks, log_avg_stars, log_length, log_grade, log_on_to_do_lists, sqrt_star_ratings, sqrt_ticks, sqrt_avg_stars, sqrt_length, sqrt_grade)
FROM '/home/harrisonized/github/metis/mountain-project-recommender/data/buttermilks-transforms.csv'
WITH DELIMITER ',' CSV HEADER;

COPY feature_transforms (url_id, log_star_ratings, log_ticks, log_avg_stars, log_length, log_grade, log_on_to_do_lists, sqrt_star_ratings, sqrt_ticks, sqrt_avg_stars, sqrt_length, sqrt_grade)
FROM '/home/harrisonized/github/metis/mountain-project-recommender/data/druid_stones-transforms.csv'
WITH DELIMITER ',' CSV HEADER;

COPY feature_transforms (url_id, log_star_ratings, log_ticks, log_avg_stars, log_length, log_grade, log_on_to_do_lists, sqrt_star_ratings, sqrt_ticks, sqrt_avg_stars, sqrt_length, sqrt_grade)
FROM '/home/harrisonized/github/metis/mountain-project-recommender/data/happy_boulders-transforms.csv' 
WITH DELIMITER ',' CSV HEADER;

COPY feature_transforms (url_id, log_star_ratings, log_ticks, log_avg_stars, log_length, log_grade, log_on_to_do_lists, sqrt_star_ratings, sqrt_ticks, sqrt_avg_stars, sqrt_length, sqrt_grade)
FROM '/home/harrisonized/github/metis/mountain-project-recommender/data/sad_boulders-transforms.csv'
WITH DELIMITER ',' CSV HEADER;

COPY feature_transforms (url_id, log_star_ratings, log_ticks, log_avg_stars, log_length, log_grade, log_on_to_do_lists, sqrt_star_ratings, sqrt_ticks, sqrt_avg_stars, sqrt_length, sqrt_grade)
FROM '/home/harrisonized/github/metis/mountain-project-recommender/data/joshua_tree-transforms.csv'
WITH DELIMITER ',' CSV HEADER;
