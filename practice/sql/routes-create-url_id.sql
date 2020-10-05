\c mountain_project;



ALTER TABLE routes
ADD url_id INT;

UPDATE routes
SET url_id = 
CAST(
   REGEXP_REPLACE (
      REPLACE (url, 'https://www.mountainproject.com/route/', ''), '/(?<=/).*', ''
      )
AS INT
);
