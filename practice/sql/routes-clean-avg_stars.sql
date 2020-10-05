\c mountain_project



UPDATE routes
SET avg_stars = 
CAST (
    REPLACE ( CAST (avg_stars AS TEXT), '-1', '0')
AS FLOAT
);
