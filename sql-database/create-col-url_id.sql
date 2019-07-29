\c mountain_project;



ALTER TABLE buttermilks
ADD url_id INT;

UPDATE buttermilks
SET url_id = 
CAST(
   REGEXP_REPLACE (
      REPLACE (url, 'https://www.mountainproject.com/route/', ''), '/(?<=/).*', ''
      )
AS INT
);



ALTER TABLE druid_stones
ADD url_id INT;

UPDATE druid_stones
SET url_id = 
CAST(
   REGEXP_REPLACE (
      REPLACE (url, 'https://www.mountainproject.com/route/', ''), '/(?<=/).*', ''
      )
AS INT
);



ALTER TABLE happy_boulders
ADD url_id INT;

UPDATE happy_boulders
SET url_id = 
CAST(
   REGEXP_REPLACE (
      REPLACE (url, 'https://www.mountainproject.com/route/', ''), '/(?<=/).*', ''
      )
AS INT
);



ALTER TABLE sad_boulders
ADD url_id INT;

UPDATE sad_boulders
SET url_id = 
CAST(
   REGEXP_REPLACE (
      REPLACE (url, 'https://www.mountainproject.com/route/', ''), '/(?<=/).*', ''
      )
AS INT
);



ALTER TABLE joshua_tree
ADD url_id INT;

UPDATE joshua_tree
SET url_id = 
CAST(
   REGEXP_REPLACE (
      REPLACE (url, 'https://www.mountainproject.com/route/', ''), '/(?<=/).*', ''
      )
AS INT
);
