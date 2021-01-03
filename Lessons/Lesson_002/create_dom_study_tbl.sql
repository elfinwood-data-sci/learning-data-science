-- Table: domains.dom_study

-- DROP TABLE domains.dom_study;

CREATE TABLE domains.dom_study
(
    unique_id integer NOT NULL DEFAULT nextval('domains.dom_study_serial_seq'),
    sort_order numeric(28,16),
    data_value character varying(32) NOT NULL,
    label character varying(255),
    definition text,
    study_start_date date,
    study_end_date date,
    note text,
    CONSTRAINT dom_study_pkey PRIMARY KEY (unique_id),
    CONSTRAINT dom_study_data_value_ukey UNIQUE (data_value)
);

COMMENT ON TABLE domains.dom_study
  IS 'This table is for storing metadata about scientific studies.';

ALTER TABLE domains.dom_study
    OWNER to postgres;
