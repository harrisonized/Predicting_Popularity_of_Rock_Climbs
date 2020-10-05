\c mountain_project



ALTER TABLE routes
ADD COLUMN grade FLOAT;

UPDATE routes
SET grade =
    (SELECT grade
     FROM grades_converter
     WHERE routes.rating = grades_converter.rating)
;
