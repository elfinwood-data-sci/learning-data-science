-- SEQUENCE: public.sample_unique_id_serial_seq

-- DROP SEQUENCE public.sample_unique_id_serial_seq;

CREATE SEQUENCE public.sample_unique_id_serial_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.sample_unique_id_serial_seq
    OWNER TO postgres;