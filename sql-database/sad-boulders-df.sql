\c mountain_project;

CREATE TABLE sad_boulders_df(
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

\copy sad_boulders_df FROM '/home/harrisonized/github/mountain-project-recommender/data/scraped-data/sad_boulders-df.csv' DELIMITER ',' CSV HEADER;
