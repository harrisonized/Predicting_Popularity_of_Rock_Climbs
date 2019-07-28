\c mountain_project;

CREATE TABLE joshua_tree_df(
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

\copy joshua_tree_df FROM '/home/harrisonized/github/mountain-project-recommender/data/scraped-data/joshua_tree-df.csv' DELIMITER ',' CSV HEADER;
