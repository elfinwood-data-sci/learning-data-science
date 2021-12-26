BEGIN;

-- Creating tables

CREATE TABLE IF NOT EXISTS public.site
(
    unique_id serial,
    study_value character varying(32),
    sample_id character varying(32),
    site_start_ts timestamp with time zone,
    site_observer_value character varying(32),
    physiography_value character varying(32),
    geomorph_value character varying(32),
    microtopo_value character varying(32),
    soil_restrict_layer_code character varying(32),
    depth_to_restrict_layer_cm numeric(28, 16),
    water_table_depth_cm numeric(28, 16),
    site_ph numeric(28, 16),
    site_ec_us_cm numeric(28, 16),
    slope_percent numeric(28, 16),
    aspect_degrees numeric(28, 16),
    surface_organic_thick_cm numeric(28, 16),
	depth_to_gt_fifteen_pct_frags_cm (28, 16),
    site_field_note text,
    site_office_note text,
    PRIMARY KEY (study_value,sample_id)
)
WITH (
    OIDS = FALSE
);

CREATE TABLE IF NOT EXISTS domains.dom_physiography
(
    unique_id serial,
    sort_order integer,
    data_value character varying(32),
    label character varying(255),
    definition text,
    note text,
    PRIMARY KEY (unique_id)
)
WITH (
    OIDS = FALSE
);

CREATE TABLE IF NOT EXISTS domains.dom_observer
(
    unique_id serial,
    sort_order integer,
    data_value character varying(32),
    label character varying(255),
    definition text,
    note text,
    PRIMARY KEY (unique_id)
)
WITH (
    OIDS = FALSE
);

CREATE TABLE IF NOT EXISTS domains.dom_geomorph
(
    unique_id serial,
    sort_order integer,
    data_value character varying(32),
    label character varying(255),
    definition text,
    note text,
    PRIMARY KEY (unique_id)
)
WITH (
    OIDS = FALSE
);

CREATE TABLE IF NOT EXISTS domains.dom_microtopo
(
    unique_id serial,
    sort_order integer,
    data_value character varying(32),
    label character varying(255),
    definition text,
    note text,
    PRIMARY KEY (unique_id)
)
WITH (
    OIDS = FALSE
);

CREATE TABLE IF NOT EXISTS domains.dom_soil_restrict_layer
(
    unique_id serial,
    sort_order integer,
    data_value character varying(32),
    label character varying(255),
    definition text,
    note text,
    PRIMARY KEY (unique_id)
)
WITH (
    OIDS = FALSE
);

CREATE TABLE IF NOT EXISTS public.vegetation
(
    unique_id serial,
    study_value character varying(32),
    sample_id character varying(32),
    veg_start_ts timestamp with time zone,
    veg_observer_value character varying(32),
    veg_community_value character varying(32),
    veg_field_note text,
    veg_office_note text,
    PRIMARY KEY (study_value,sample_id)
)
WITH (
    OIDS = FALSE
);

CREATE TABLE IF NOT EXISTS domains.dom_veg_community
(
    unique_id serial,
    sort_order numeric(28, 16),
    data_value character varying(32),
    label character varying(255),
    definition text,
    note text,
    PRIMARY KEY (unique_id)
)
WITH (
    OIDS = FALSE
);

-- Creating Table and Column Comments

-- public.site
COMMENT ON TABLE public.site
    IS 'This table is used to store plot-level information about the vegetation and abiotic ground cover at a site (e.g., vegetation community type).';

COMMENT ON COLUMN public.site.unique_id
    IS 'A unique identifier for each row.';

COMMENT ON COLUMN public.site.study_value
    IS 'The scientific study that the sample is associated with.';

COMMENT ON COLUMN public.site.sample_id
    IS 'Unique sample name.';

COMMENT ON COLUMN public.site.site_start_ts
    IS 'The date and time data collection began for the site data.';

COMMENT ON COLUMN public.site.site_observer_value
    IS 'The site observer''s initials.';

COMMENT ON COLUMN public.site.physiography_value
    IS 'General description of landscape unit and depositional process.';

COMMENT ON COLUMN public.site.geomorph_value
    IS 'The surface geologic unit.';

COMMENT ON COLUMN public.site.microtopo_value
    IS 'Microscale descriptor of surface form, evaluated in immediate vicinity of plot (meters to tens of meters).';

COMMENT ON COLUMN public.site.soil_restrict_layer_code
    IS 'Type of soil restrictive layer encountered (e.g., permafrost).';

COMMENT ON COLUMN public.site.depth_to_restrict_layer_cm
    IS 'Depth to restrictive layer in centimeters.';

COMMENT ON COLUMN public.site.water_table_depth_cm
    IS 'Depth to water table in centimeters.';

COMMENT ON COLUMN public.site.site_ph
    IS 'The pH of the soil or water at a site.';

COMMENT ON COLUMN public.site.site_ec_us_cm
    IS 'The electrical conductivity of the soil or water at a site (microsiemens/cm^2).';

COMMENT ON COLUMN public.site.slope_percent
    IS 'Slope angle (degrees).';

COMMENT ON COLUMN public.site.aspect_degrees
    IS 'Slope aspect (degrees),';

COMMENT ON COLUMN public.site.surface_organic_thick_cm
    IS 'The total thickness in centimeters of uninterrupted surface organic material from the soil surface.';

COMMENT ON COLUMN public.site.depth_to_gt_fifteen_pct_frags_cm
    IS 'The top depth in centimeters of the first soil layer with greater than 15% rock fragments.';

COMMENT ON COLUMN public.site.site_field_note
    IS 'Relevant notes regarding the site recorded in the field by vegetation observer.';

COMMENT ON COLUMN public.site.site_office_note
    IS 'Relevant notes regarding the site recorded in the office. Includes a history of any changes made to the field data that may occur during data quality control/quality assurance review.';

-- public.vegetation
COMMENT ON TABLE public.vegetation
    IS 'This table is used to store plot-level information about the vegetation and abiotic ground cover at a site (e.g., vegetation community type).';

COMMENT ON COLUMN public.vegetation.unique_id
    IS 'A unique identifier for each row.';

COMMENT ON COLUMN public.vegetation.study_value
    IS 'The scientific study that the sample is associated with.';

COMMENT ON COLUMN public.vegetation.sample_id
    IS 'Unique sample name.';

COMMENT ON COLUMN public.vegetation.veg_start_ts
    IS 'The date and time data collection began for the vegetation data.';

COMMENT ON COLUMN public.vegetation.veg_observer_value
    IS 'The veg observer''s initials.';

COMMENT ON COLUMN public.vegetation.veg_community_value
    IS 'The vegetation community type class.';

COMMENT ON COLUMN public.vegetation.veg_field_note
    IS 'Relevant notes regarding the vegetation recorded in the field by vegetation observer.';

COMMENT ON COLUMN public.vegetation.veg_office_note
    IS 'Relevant notes regarding the vegetation recorded in the office. Includes a history of any changes made to the field data that may occur during data quality control/quality assurance review.';

-- domains.dom_geomorph
COMMENT ON TABLE domains.dom_geomorph
    IS 'This table is for storing a domain list of surface geomorphic classes.';

COMMENT ON COLUMN domains.dom_geomorph.unique_id
    IS 'A unique identifier for each row.';

COMMENT ON COLUMN domains.dom_geomorph.sort_order
    IS 'The sort order for each data_value.';

COMMENT ON COLUMN domains.dom_geomorph.data_value
    IS 'The data values that will entered into the data tables.';

COMMENT ON COLUMN domains.dom_geomorph.label
    IS 'Descriptive titles for each data value.';

COMMENT ON COLUMN domains.dom_geomorph.definition
    IS 'The definition or description of each data value.';

COMMENT ON COLUMN domains.dom_geomorph.note
    IS 'A free-form notes field.';

-- domains.dom_physiography
COMMENT ON TABLE domains.dom_physiography
    IS 'This table is for storing a domain list of physiography classes.';

COMMENT ON COLUMN domains.dom_physiography.unique_id
    IS 'A unique identifier for each row.';

COMMENT ON COLUMN domains.dom_physiography.sort_order
    IS 'The sort order for each data_value.';

COMMENT ON COLUMN domains.dom_physiography.data_value
    IS 'The data values that will entered into the data tables.';

COMMENT ON COLUMN domains.dom_physiography.label
    IS 'Descriptive titles for each data value.';

COMMENT ON COLUMN domains.dom_physiography.definition
    IS 'The definition or description of each data value.';

COMMENT ON COLUMN domains.dom_physiography.note
    IS 'A free-form notes field.';

-- domains.dom_microtopo
COMMENT ON TABLE domains.dom_microtopo
    IS 'This table is for storing a domain list of microtopography classes.';

COMMENT ON COLUMN domains.dom_microtopo.unique_id
    IS 'A unique identifier for each row.';

COMMENT ON COLUMN domains.dom_microtopo.sort_order
    IS 'The sort order for each data_value.';

COMMENT ON COLUMN domains.dom_microtopo.data_value
    IS 'The data values that will entered into the data tables.';

COMMENT ON COLUMN domains.dom_microtopo.label
    IS 'Descriptive titles for each data value.';

COMMENT ON COLUMN domains.dom_microtopo.definition
    IS 'The definition or description of each data value.';

COMMENT ON COLUMN domains.dom_microtopo.note
    IS 'A free-form notes field.';

-- domains.dom_observer
COMMENT ON TABLE domains.dom_observer
    IS 'This table is for storing a domain list of field observers.';

COMMENT ON COLUMN domains.dom_observer.unique_id
    IS 'A unique identifier for each row.';

COMMENT ON COLUMN domains.dom_observer.sort_order
    IS 'The sort order for each data_value.';

COMMENT ON COLUMN domains.dom_observer.data_value
    IS 'The data values that will entered into the data tables.';

COMMENT ON COLUMN domains.dom_observer.label
    IS 'Descriptive titles for each data value.';

COMMENT ON COLUMN domains.dom_observer.definition
    IS 'The definition or description of each data value.';

COMMENT ON COLUMN domains.dom_observer.note
    IS 'A free-form notes field.';

-- domains.dom_soil_restrict_layer
COMMENT ON TABLE domains.dom_soil_restrict_layer
    IS 'This table is for storing a domain list of soil restrictive layer classes.';

COMMENT ON COLUMN domains.dom_soil_restrict_layer.unique_id
    IS 'A unique identifier for each row.';

COMMENT ON COLUMN domains.dom_soil_restrict_layer.sort_order
    IS 'The sort order for each data_value.';

COMMENT ON COLUMN domains.dom_soil_restrict_layer.data_value
    IS 'The data values that will entered into the data tables.';

COMMENT ON COLUMN domains.dom_soil_restrict_layer.label
    IS 'Descriptive titles for each data value.';

COMMENT ON COLUMN domains.dom_soil_restrict_layer.definition
    IS 'The definition or description of each data value.';

COMMENT ON COLUMN domains.dom_soil_restrict_layer.note
    IS 'A free-form notes field.';

-- domains.dom_veg_community
COMMENT ON TABLE domains.dom_veg_community
    IS 'This table is for storing a domain list of vegetation community type classes.';

COMMENT ON COLUMN domains.dom_veg_community.unique_id
    IS 'A unique identifier for each row.';

COMMENT ON COLUMN domains.dom_veg_community.sort_order
    IS 'The sort order for each data_value.';

COMMENT ON COLUMN domains.dom_veg_community.data_value
    IS 'The data values that will entered into the data tables.';

COMMENT ON COLUMN domains.dom_veg_community.label
    IS 'Descriptive titles for each data value.';

COMMENT ON COLUMN domains.dom_veg_community.definition
    IS 'The definition or description of each data value.';

COMMENT ON COLUMN domains.dom_veg_community.note
    IS 'A free-form notes field.';

-- create unique keys
ALTER TABLE IF EXISTS public.site
	 ADD CONSTRAINT public_site_ukey UNIQUE (unique_id);

ALTER TABLE IF EXISTS public.vegetation
   ADD CONSTRAINT public_vegetation_ukey UNIQUE (unique_id);

ALTER TABLE IF EXISTS domains.dom_geomorph
	 ADD CONSTRAINT dom_geomorph_data_value_ukey UNIQUE (data_value);

ALTER TABLE IF EXISTS domains.dom_microtopo
   ADD CONSTRAINT dom_microtopo_data_value_ukey UNIQUE (data_value);

ALTER TABLE IF EXISTS domains.dom_observer
   ADD CONSTRAINT dom_observer_data_value_ukey UNIQUE (data_value);

ALTER TABLE IF EXISTS domains.dom_physiography
   ADD CONSTRAINT dom_physiography_data_value_ukey UNIQUE (data_value);

ALTER TABLE IF EXISTS domains.dom_soil_restrict_layer
   ADD CONSTRAINT dom_soil_restrict_layer_data_value_ukey UNIQUE (data_value);

ALTER TABLE IF EXISTS domains.dom_veg_community
   ADD CONSTRAINT dom_veg_community_data_value_ukey UNIQUE (data_value);


-- creating foreign keys

ALTER TABLE IF EXISTS public.site
    ADD CONSTRAINT site_sample_id_fkey FOREIGN KEY (sample_id, study_value)
    REFERENCES public.sample (sample_id, study_value) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
	
ALTER TABLE IF EXISTS public.vegetation
    ADD CONSTRAINT vegetation_sample_id_fkey FOREIGN KEY (sample_id, study_value)
    REFERENCES public.sample (sample_id, study_value) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
	
ALTER TABLE IF EXISTS public.site
    ADD FOREIGN KEY (study_value)
    REFERENCES domains.dom_study (data_value)
    NOT VALID;

ALTER TABLE IF EXISTS public.site
    ADD FOREIGN KEY (site_observer_value)
    REFERENCES domains.dom_observer (data_value)
    NOT VALID;

ALTER TABLE IF EXISTS public.site
    ADD FOREIGN KEY (physiography_value)
    REFERENCES domains.dom_physiography (data_value)
    NOT VALID;

ALTER TABLE IF EXISTS public.site
    ADD FOREIGN KEY (geomorph_value)
    REFERENCES domains.dom_geomorph (data_value)
    NOT VALID;

ALTER TABLE IF EXISTS public.site
    ADD FOREIGN KEY (microtopo_value)
    REFERENCES domains.dom_microtopo (data_value)
    NOT VALID;

ALTER TABLE IF EXISTS public.site
    ADD FOREIGN KEY (soil_restrict_layer_code)
    REFERENCES domains.dom_soil_restrict_layer (data_value)
    NOT VALID;

ALTER TABLE IF EXISTS public.vegetation
    ADD FOREIGN KEY (veg_observer_value)
    REFERENCES domains.dom_observer (data_value)
    NOT VALID;

ALTER TABLE IF EXISTS public.vegetation
    ADD FOREIGN KEY (study_value)
    REFERENCES domains.dom_study (data_value)
    NOT VALID;

ALTER TABLE IF EXISTS public.vegetation
    ADD FOREIGN KEY (veg_community_value)
    REFERENCES domains.dom_veg_community (data_value)
    NOT VALID;
	
END; -- commits the current transaction