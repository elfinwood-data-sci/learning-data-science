-- A script for adding comments to each column in the dom_study table

COMMENT ON COLUMN domains.dom_study.unique_id
    IS 'A unique identifier for each row.';
COMMENT ON COLUMN domains.dom_study.sort_order
    IS 'The sort order for each data_value.';
COMMENT ON COLUMN domains.dom_study.data_value
    IS 'The data values that will entered into the data tables.';
COMMENT ON COLUMN domains.dom_study.label
    IS 'Descriptive titles for each data value.';
COMMENT ON COLUMN domains.dom_study.definition
    IS 'The definition or description of each data value.';
COMMENT ON COLUMN domains.dom_study.study_start_date
    IS 'The start date of each study.';
COMMENT ON COLUMN domains.dom_study.study_end_date
    IS 'The end date of each study.';
COMMENT ON COLUMN domains.dom_study.note
    IS 'A free-form notes field.';
