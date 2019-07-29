\c mountain_project



ALTER TABLE buttermilks
ADD COLUMN grade FLOAT;

UPDATE buttermilks
SET grade =
    (SELECT grade
    FROM rating_to_grade
    WHERE buttermilks.rating = rating_to_grade.rating);



ALTER TABLE druid_stones
ADD COLUMN grade FLOAT;

UPDATE druid_stones
SET grade =
    (SELECT grade
    FROM rating_to_grade
    WHERE druid_stones.rating = rating_to_grade.rating);



ALTER TABLE happy_boulders
ADD COLUMN grade FLOAT;

UPDATE happy_boulders
SET grade =
    (SELECT grade
    FROM rating_to_grade
    WHERE happy_boulders.rating = rating_to_grade.rating);



ALTER TABLE sad_boulders
ADD COLUMN grade FLOAT;

UPDATE sad_boulders
SET grade =
    (SELECT grade
    FROM rating_to_grade
    WHERE sad_boulders.rating = rating_to_grade.rating);



ALTER TABLE joshua_tree
ADD COLUMN grade FLOAT;

UPDATE joshua_tree
SET grade =
    (SELECT grade
    FROM rating_to_grade
    WHERE joshua_tree.rating = rating_to_grade.rating);
