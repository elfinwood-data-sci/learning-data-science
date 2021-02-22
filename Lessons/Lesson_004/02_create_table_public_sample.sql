-- Table: public.sample

-- DROP TABLE public.sample;

CREATE TABLE public.sample
(
    unique_id integer NOT NULL DEFAULT nextval('sample_unique_id_serial_seq'::regclass),
    study_value character varying(32) NOT NULL,
    sample_id character varying(32) NOT NULL,
	sample_type_code character varying(32),
    latitude_dd double precision,
    longitude_dd double precision,
    location_accuracy_m integer,
    horz_datum_srid integer,
    elevation_m numeric(28,16),
    sample_note text,
    CONSTRAINT public_sample_pkey PRIMARY KEY (study_value, sample_id),
    CONSTRAINT public_sample_ukey UNIQUE (unique_id)
);

ALTER TABLE public.sample
    OWNER to postgres;

COMMENT ON TABLE public.sample
    IS 'This table is used to store information about scientific samples (e.g., plots, nets, nests, stations).';

COMMENT ON COLUMN public.sample.unique_id
    IS 'A unique identifier for each row.';

COMMENT ON COLUMN public.sample.study_value
    IS 'The scientific study that the sample is associated with.';

COMMENT ON COLUMN public.sample.sample_id
    IS 'Unique sample name.';

COMMENT ON COLUMN public.sample.sample_type_code
    IS 'The kind of sample (e.g., plot, net, nest, station).';

COMMENT ON COLUMN public.sample.latitude_dd
    IS 'The latitude of the plot in decimal degrees.';

COMMENT ON COLUMN public.sample.longitude_dd
    IS 'The longitude of the plot in decimal degrees.';

COMMENT ON COLUMN public.sample.location_accuracy_m
    IS 'The accuracy of the plot locations in meters as reported by the GPS unit used to record the latitude and longitude.';

COMMENT ON COLUMN public.sample.horz_datum_srid
    IS 'The geodetic datum (i.e., coordinate system) of the latitude and longitude recorded as spatial reference identifier (SRID) integer code (e.g. WGS84 = 4326).';

COMMENT ON COLUMN public.sample.elevation_m
    IS 'The elevation in meters at which the sample is located.';

COMMENT ON COLUMN public.sample.sample_note
    IS 'A field for entering free-form notes about each plot.';
