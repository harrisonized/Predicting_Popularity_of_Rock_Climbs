\c mountain_project;

CREATE TABLE druid_stones(
  ind INT,
  route TEXT,
  location TEXT,
  url TEXT,
  avg_stars FLOAT,
  your_stars INT,
  route_type VARCHAR(15),
  rating VARCHAR(11),
  pitches INT,
  len FLOAT,
  area_latitude FLOAT,
  area_longitude FLOAT,
  star_ratings INT,
  suggested_ratings INT,
  on_to_do_lists INT,
  ticks INT
);

\copy druid_stones FROM '/home/harrisonized/github/mountain-project-recommender/data/scraped-data/druid_stones-df.csv' DELIMITER ',' CSV HEADER;
