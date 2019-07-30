\c mountain_project



UPDATE buttermilks
SET avg_stars = 
CAST (
    REPLACE ( CAST (avg_stars AS TEXT), '-1', '0')
AS FLOAT
);



UPDATE druid_stones
SET avg_stars = 
CAST (
    REPLACE ( CAST (avg_stars AS TEXT), '-1', '0')
AS FLOAT
);



UPDATE happy_boulders
SET avg_stars = 
CAST (
    REPLACE ( CAST (avg_stars AS TEXT), '-1', '0')
AS FLOAT
);



UPDATE sad_boulders
SET avg_stars = 
CAST (
    REPLACE ( CAST (avg_stars AS TEXT), '-1', '0')
AS FLOAT
);



UPDATE joshua_tree
SET avg_stars = 
CAST (
    REPLACE ( CAST (avg_stars AS TEXT), '-1', '0')
AS FLOAT
);
