-- Constraint: public_sample_study_value_fkey

-- ALTER TABLE public.sample DROP CONSTRAINT public_sample_study_value_fkey;

ALTER TABLE public.sample
    ADD CONSTRAINT public_sample_study_value_fkey FOREIGN KEY (study_value)
    REFERENCES domains.dom_study (data_value) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

COMMENT ON CONSTRAINT public_sample_study_value_fkey ON public.sample
    IS 'A foreign key between the sample.study_value and dom_study.data_value fields.';

