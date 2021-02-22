--Constraint: public_sample_sample_type_code_fkey

--ALTER TABLE public.sample DROP CONSTRAINT public_sample_sample_type_code_fkey;

ALTER TABLE public.sample
    ADD CONSTRAINT public_sample_sample_type_code_fkey FOREIGN KEY (sample_type_code)
    REFERENCES domains.dom_sample_type (data_value) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

COMMENT ON CONSTRAINT public_sample_sample_type_code_fkey ON public.sample
    IS 'A foreign key between the sample.sample_type_code and dom_sample_type.data_value fields.';

