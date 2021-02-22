-- SEQUENCE: domains.dom_sample_type_serial_seq
-- SQL for creating a sequence in PostgreSQL
-- DROP SEQUENCE domains.dom_sample_type_serial_seq;

CREATE SEQUENCE domains.dom_sample_type_serial_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE domains.dom_sample_type_serial_seq
    OWNER TO postgres;