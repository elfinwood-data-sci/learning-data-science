BEGIN;
DELETE FROM domains.dom_study
	WHERE data_value = 'arcn_lc'
RETURNING *;