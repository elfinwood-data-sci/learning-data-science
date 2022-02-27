-- Elfinwood Data Science Blog
-- Lesson 009 annotated listing of queries demonstrating advanced filtering using WHERE
-- INSTRUCTIONS: this file is to be used with my-first-database. See the post here for more details: https://elfinwoodecology.org/2020/11/25/learning-data-science/
  -- Each statement is commented out using multi-line comments.
   /*This is a 
     multi-line comment*/
  -- To run each statement remove the slashes and asterisks from the beginning and end of each statement and then hit the execute button
  -- To run the next statement replace the slashes and asterisks on the current statement, and remove them from the next statement, and hit the execute button
 
-- Basic WHERE clause using the equal sign. Returns only those rows where the soil_restrict_layer_code column equals 'permafrost'
/*SELECT * FROM public.site
	WHERE soil_restrict_layer_code = 'permafrost'*/

-- Basic WHERE clause using the greater than or equal to sign. Returns only those rows where the elevation_m column contains a value greater than or equal to 1000
/*SELECT
  study_value,
  sample_id,
  elevation_m
FROM public.sample
WHERE elevation_m >= 1000;*/

-- WHERE clause using the AND operator. Returns only those rows where the elevation_m column is greater than or equal to 1000 and less than or equal to 1200
/*SELECT
  study_value,
  sample_id,
  elevation_m
FROM public.sample
WHERE elevation_m >= 1000 AND elevation_m <= 1200
ORDER BY elevation_m ASC;*/

-- WHERE clause using the BETWEEN comparison predicate to express the range of values we are interested in filtering on. 
-- This query will return the same results as the previous query. 
-- BETWEEN is inclusive of the upper and lower bounds specified in the WHERE clause, meaning the results will include rows where elevation_m equals 1000 or 1200
/*SELECT
  study_value,
  sample_id,
  elevation_m
FROM public.sample
WHERE elevation_m BETWEEN 1000 AND 1200
ORDER BY elevation_m ASC;*/

-- WHERE clause using the IS NOT NULL predicate. The results will contain only those rows for which the site_field_note column has a value (i.e., is not null).
-- In database lingo NULL means that data does not exist, meaning there is no value. Because there is no value, standard comparison operators (e.g., =, >, <) won't work with NULL. 
/*SELECT study_value, sample_id, site_field_note
FROM public.site
WHERE site_field_note IS NOT NULL*/

-- WHERE clause using the OR operator. The following query will return only those rows where the physiography_value column equals a or u.
/*SELECT study_value, sample_id, physiography_value
FROM public.site
WHERE physiography_value = 'a' OR physiography_value = 'u'*/

-- WHERE clause using the IN operator. The IN operator uses a set of one or more values as the evaluation criteria. 
-- Rows that contain one of the values in the set will be returned in the query.
-- The below query will return all rows where the physiography value equals a or u. The results will be the same as the previous query
/*SELECT study_value, sample_id, physiography_value
FROM public.site
WHERE physiography_value IN ('a','u')*/

-- WHERE clause using the IN operator with the NOT operator, i.e., NOT IN, which is the converse of IN. 
-- The below query will return all rows for physiography_value except those that equal a or u.
/*SELECT study_value, sample_id, physiography_value
FROM public.site
WHERE physiography_value NOT IN ('a','u')*/

-- WHERE clause using the LIKE operator with the percent wildcard character following the literal characters. 
-- The percent sign wildcard character matches any sequence of zero or more characters
-- This query will return all rows for which the value in the sample_id column starts with GAAR and ends with zero or more characters.
/*SELECT study_value, sample_id
FROM public.sample
WHERE sample_id LIKE 'GAAR%'*/

-- WHERE clause using the LIKE operator with the percent wildcard character preceding the literal characters. 
-- This query will return rows for which the value in the sample_id column ends with 2007 and is preceded by zero or more characters
/*SELECT study_value, sample_id
FROM public.sample
WHERE sample_id LIKE '%2007'*/

-- WHERE clause using the LIKE operator with the percent wildcard character preceding and following the literal characters. 
-- This query will return rows for which the value in the sample_id column contains T01 that is preceded and/or followed by zero or more characters
/*SELECT study_value, sample_id
FROM public.sample
WHERE sample_id LIKE '%T01%'*/

-- WHERE clause using the LIKE operator with the underscore wildcard character preceding and following a literal character.
-- Underscore wildcard characters match any single character
-- This query will return rows for which the value in the geomorph_value column is 3 characters long, with b as the second character
/*SELECT study_value, sample_id, geomorph_value
FROM public.site
WHERE geomorph_value LIKE '_b_'*/

-- WHERE clause using the LIKE operator with the underscore wildcard character preceding and the percent sign following a literal character.
-- The rows returned will include those for which the value in the microtopo_value column starts with a single character followed by an r and ending with zero or more characters
/*SELECT study_value, sample_id, microtopo_value
FROM public.site
WHERE microtopo_value LIKE '_r%'*/

-- If you want to match a literal underscore or percent sign without matching other characters then 
-- the character of interest must be preceded with an escape character. The default escape character is a backslash.
-- The following select statement will find only those rows in the public.site table where the site_field_note column contains a percent sign
/*SELECT study_value, sample_id,site_field_note
FROM public.site
WHERE site_field_note LIKE '%\%%'*/

-- Following from the preceding example, if the same query is used except that the escape character is excluded then
-- the result includes all rows where the site_field_note contains any number of characters
/*SELECT study_value, sample_id,site_field_note
FROM public.site
WHERE site_field_note LIKE '%%%'*/

-- SQL expressions follow an order of operations or precedence rules similar to mathematical expressions. 
-- In brief, expressions within parentheses take precedence over expressions outside parentheses and AND takes precedence over OR. 
-- For example the following 2 select statements will return different results even though they look similar superficially

-- Select Statement 1: Without Parentheses
-- In this select statement the AND is processed first, and the OR is processed second.
-- The result includes all rows where physiography_value equals 'l' and site_ec_us_cm is greater than or equal to 300, 
-- plus all the rows (regardless of physiography_value) with a site_ph greater than or equal to 7.0. 
/*SELECT sample_id, physiography_value, site_ec_us_cm, site_ph
FROM public.site
WHERE physiography_value = 'l' AND site_ec_us_cm >= 300 OR site_ph >=7.0
ORDER BY sample_id*/

-- Select Statement 2: With Parentheses
-- In this select statement the expression within the parentheses is evaluated first, followed by the expression before the AND operator.
-- Therefore this query will first find all the rows where site_ec_us_cm is greater than or equal to 300 or site_ph is greater than or equal to 7.0, 
-- and then within that set will return only those rows that satisfy the physiography_value criteria
/*SELECT sample_id, physiography_value, site_ec_us_cm, site_ph FROM public.site
WHERE physiography_value = 'l' AND (site_ec_us_cm >= 300 OR site_ph >=7.0)
ORDER BY sample_id*/