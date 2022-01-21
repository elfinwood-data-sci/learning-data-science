-- Elfinwood Data Science Blog
-- Lesson 008 annotated listing of select statements
-- INSTRUCTIONS: this file is to be used with my-first-database. See the post here for more details: https://elfinwoodecology.org/2020/11/25/learning-data-science/
  -- Each statement is commented out using multi-line comments.
   /*This is a 
     multi-line comment*/
  -- To run each statement remove the slashes and asterisks from the beginning and end of each statement and then hit the execute button
  -- To run the next statement replace the slashes and asterisks on the current statement, and remove them from the next statement, and hit the execute button
  
-----LIMIT and OFFSET-----

-- 1) Returns the first 10 rows of the public.site table ordered by sample_id. In select statements LIMIT is applied after ORDER BY, hence the results are dependent on the sort order 
/*SELECT unique_id, study_value, sample_id, site_start_ts, slope_percent
FROM public.site
ORDER BY sample_id ASC
LIMIT 10;*/

-- 2) Returns the ten plots with the earliest start times by ordering the results in ascending order by site_start_ts.  
/*SELECT unique_id, study_value, sample_id, site_start_ts, slope_percent
FROM public.site
ORDER BY site_start_ts ASC
LIMIT 10;*/

-- 3) Returns the ten plots with the steepest slopes by ordering the results in descending order by slope_percent. 
-- For plots with the same slope the results are further ordered by sample_id
/*SELECT unique_id, study_value, sample_id, site_start_ts, slope_percent
FROM public.site
ORDER BY slope_percent DESC, sample_id ASC
LIMIT 10;*/

-- 4) OFFSET is used with LIMIT to specify the number of rows that are skipped before the LIMIT clause takes effect. 
-- For instance, the following select statement will return 10 rows starting from the 6th row ordered by slope_percent
/*SELECT unique_id, study_value, sample_id, site_start_ts, slope_percent
FROM public.site
ORDER BY slope_percent DESC, sample_id ASC
LIMIT 10 OFFSET 5;*/

-----ALIASES-----

-- 5) The SQL keyword AS can be used to assign column aliases. Aliases are useful for temporarily shortening column names in select statements.
-- For instance, in the following select statement the site_start_ts column is given an alias of st.
/*SELECT study_value, sample_id, site_start_ts AS st
FROM public.site
ORDER BY site_start_ts ASC
LIMIT 10;*/

-- 6) When assigning aliases the AS keyword is optional. Hence, the above statement can be written more succinctly as follows:
/*SELECT study_value, sample_id, site_start_ts st
FROM public.site
ORDER BY site_start_ts ASC
LIMIT 10;*/

-- 7) Aliases are also useful for temporarily providing more meaningful column names. For instance, if the results of a query will be used in a report table.
-- In the following select statement the sample_id and site_start_ts columns are assigned the aliases Sample ID and Plot Start Time.
-- Note that aliases need to be surrounded in double quotes if spaces are used, aliases start with a number, and/or if you want the alias to include capital letters in the output. 
/*SELECT sample_id AS "Sample ID", site_start_ts AS "Plot Start Time"
FROM public.site
ORDER BY site_start_ts ASC
LIMIT 10;*/

-----DATA TYPE CASTING-----

-- 8) Data type casting is a means by which to temporarily change the data type of an existing column in the output of a select statement.
-- For instance, in the following query the site_ph column is selected twice. 
-- The first time it's selected in its predetermined data type, numeric(28,16), and the second time it's cast to an integer data type.
/*SELECT sample_id, site_ph, site_ph::integer AS site_ph_integer
FROM public.site
ORDER BY sample_id ASC
LIMIT 10;*/

-- 9) Casting a numeric data type to a text data type
/*SELECT sample_id, site_ph, site_ph::text AS site_ph_text, site_field_note
FROM public.site
ORDER BY sample_id ASC
LIMIT 10;*/

-- 10) Attempting to cast a text data type to a numeric data type. An error will be thrown.
-- This is because a text data type can't be cast to a numeric data type *unless* the data in the text column contains only numbers, which is not the case for this example.
/*SELECT sample_id, site_ph, site_ph::text AS site_ph_integer, site_field_note::numeric(28,16)
FROM public.site
ORDER BY sample_id ASC
LIMIT 10;*/

-----CREATING COLUMNS ON-THE-FLY-----

-- 11) Creating a text column on-the-fly without specifying a table expression
/*SELECT 'I just created this column'::text AS new_column*/


-- 12) Creating a timestamp column displaying the current system date and time without specifying a table expression: 
/*SELECT NOW() AS current_timestamp*/

-- 13) Selecting several columns from the public.site table and creating a boolean column called "column_created_on_the_fly" and assigning the value TRUE.
/*SELECT study_value, sample_id, site_start_ts, TRUE::boolean AS column_created_on_the_fly
FROM public.site
ORDER BY sample_id ASC
LIMIT 10;*/

-----MATHEMATICAL OPERATIONS-----

-- 14) Performing addition on a single column
/*SELECT unique_id, unique_id + 1 AS unique_id_plus_one
FROM public.site
ORDER BY sample_id ASC
LIMIT 10;*/

-- 15) Performing multiplication on a single column
/*SELECT unique_id, unique_id * 1.543 AS unique_id_times_one
FROM public.site
ORDER BY sample_id ASC
LIMIT 10;*/

-- 16) Performing multiplication between columns
/*SELECT unique_id, surface_organic_thick_cm, (unique_id * 1.543) * surface_organic_thick_cm AS rubbish_and_hogwash
FROM public.site
ORDER BY sample_id ASC
LIMIT 10;*/