-- Table: domains.dom_sample_type

-- DROP TABLE domains.dom_sample_type;

CREATE TABLE domains.dom_sample_type
(
    unique_id integer NOT NULL DEFAULT nextval('domains.dom_sample_type_serial_seq'),
    sort_order numeric(28,16),
    data_value character varying(32) NOT NULL,
    label character varying(255),
    definition text,
    note text,
    CONSTRAINT dom_sample_type_pkey PRIMARY KEY (unique_id),
    CONSTRAINT dom_sample_type_data_value_ukey UNIQUE (data_value)
);

COMMENT ON TABLE domains.dom_sample_type
  IS 'This table is for storing metadata about the type of sample (e.g., plot, net, nest, station) where observations are recorded.';

ALTER TABLE domains.dom_sample_type
    OWNER to postgres;
