-- Elfinwood Data Science Blog
-- Lesson 007 annotated listing of select statements
-- INSTRUCTIONS: this file is to be used with my-first-database. See the post here for more details: https://elfinwoodecology.org/2020/11/25/learning-data-science/
  -- each statement is commented out using multi-line comments.
  -- /*This is a line comment*/
  -- To run each statement remove the slashes and asterisks from the beginning and end of each statement and then hit the execute button
  -- To run the next statement replace the slashes and asterisks on the current statement, and remove them from the next statement, and hit the execute button
  
-- Selects all rows and columns from the public.sample table. The asterisk is shorthand for all columns.
/*SELECT * FROM public.sample;*/

-- Selects all rows and columns from the public.sample table. The result will be the same as above, the only difference is that the columns are explicitly listed in the below select statement.
/*SELECT unique_id, study_value, sample_id, sample_type_code,     
   latitude_dd, longitude_dd, location_accuracy_m,     
   horz_datum_srid, elevation_m, sample_note
FROM public.sample;*/

-- SELECT a subset of columns from the public.sample table
/*SELECT
   study_value,
   sample_id,
   elevation_m
FROM public.sample*/

-- Selects all columns from the public.site table and the rows that match the filter in the WHERE clause, i.e., rows that have a value 'permafrost' in the soil_restrict_layer_code column
/*SELECT * FROM public.site
	WHERE soil_restrict_layer_code = 'permafrost'*/

-- SELECT 3 columns from the public.sample table and the rows that match the filter in the WHERE clause, i.e., rows that have a value of elevation_m that is greater than or equal to 1000 meters
/*SELECT
  study_value,
  sample_id,
  elevation_m
FROM public.sample
WHERE elevation_m >= 1000;*/

--Returns the same results as the above select statement except that the results are sorted by elevation_m in ascending order (i.e., smallest to largest)
/*SELECT
  study_value,
  sample_id,
  elevation_m
FROM public.sample
WHERE elevation_m >= 1000
  ORDER BY elevation_m ASC;*/
  
--SELECT 5 columns from the public.site table and the rows that match the filter in the WHERE clause, i.e., rows that have a physiography_value equal to l. 
--The results are ordered first by geomorph_value in ascending order, and then by depth_to_restrict_layer_cm in descending (largest to smallest) order.
/*SELECT
    study_value, sample_id, physiography_value, 
    geomorph_value,depth_to_restrict_layer_cm
FROM public.site
WHERE physiography_value = 'l'
  ORDER BY geomorph_value ASC, depth_to_restrict_layer_cm DESC;*/



