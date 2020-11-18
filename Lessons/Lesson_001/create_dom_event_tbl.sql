-- Table: domains.dom_event

-- DROP TABLE domains.dom_event;

CREATE TABLE domains.dom_event
(
    serial integer NOT NULL DEFAULT nextval('domains.dom_event_serial_seq'),
    sort_order numeric(28,16),
    id character varying(32) NOT NULL,
    label character varying(255),
    definition text,
    note text,
    CONSTRAINT dom_event_pkey PRIMARY KEY (serial),
    CONSTRAINT dom_event_event_id_key UNIQUE (id)
)
