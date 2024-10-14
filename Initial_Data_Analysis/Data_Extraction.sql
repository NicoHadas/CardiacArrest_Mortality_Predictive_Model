-- SQL file of the database scripts 


-- Table: raw_data.admissions

-- DROP TABLE IF EXISTS raw_data.admissions;

CREATE TABLE IF NOT EXISTS raw_data.admissions
(
    subject_id integer NOT NULL,
    hadm_id integer NOT NULL,
    admittime timestamp without time zone NOT NULL,
    dischtime timestamp without time zone,
    deathtime timestamp without time zone,
    admission_type character varying(40) COLLATE pg_catalog."default" NOT NULL,
    admit_provider_id character varying(10) COLLATE pg_catalog."default",
    admission_location character varying(60) COLLATE pg_catalog."default",
    discharge_location character varying(60) COLLATE pg_catalog."default",
    insurance character varying(255) COLLATE pg_catalog."default",
    language character varying(30) COLLATE pg_catalog."default",
    marital_status character varying(30) COLLATE pg_catalog."default",
    race character varying(80) COLLATE pg_catalog."default",
    edregtime timestamp without time zone,
    edouttime timestamp without time zone,
    hospital_expire_flag smallint,
    CONSTRAINT admissions_pkey PRIMARY KEY (hadm_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS raw_data.admissions
    OWNER to postgres;



-- Table: raw_data.chartevents

-- DROP TABLE IF EXISTS raw_data.chartevents;

CREATE TABLE IF NOT EXISTS raw_data.chartevents
(
    row_id integer NOT NULL DEFAULT nextval('raw_data.chartevents_row_id_seq'::regclass),
    subject_id integer,
    hadm_id integer,
    stay_id integer,
    caregiver_id integer,
    charttime timestamp without time zone,
    storetime timestamp without time zone,
    itemid integer,
    value character varying(200) COLLATE pg_catalog."default",
    valuenum double precision,
    valueuom character varying(20) COLLATE pg_catalog."default",
    warning smallint,
    CONSTRAINT chartevents_pkey PRIMARY KEY (row_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS raw_data.chartevents
    OWNER to postgres;



-- Table: raw_data.d_items

-- DROP TABLE IF EXISTS raw_data.d_items;

CREATE TABLE IF NOT EXISTS raw_data.d_items
(
    itemid integer NOT NULL,
    label character varying(200) COLLATE pg_catalog."default",
    abbreviation character varying(100) COLLATE pg_catalog."default",
    linksto character varying(50) COLLATE pg_catalog."default",
    category character varying(100) COLLATE pg_catalog."default",
    unitname character varying(100) COLLATE pg_catalog."default",
    param_type character varying(30) COLLATE pg_catalog."default",
    lownormvalue numeric,
    highnormvalue numeric,
    CONSTRAINT d_items_pkey PRIMARY KEY (itemid)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS raw_data.d_items
    OWNER to postgres;



-- Table: raw_data.diagnoses_icd

-- DROP TABLE IF EXISTS raw_data.diagnoses_icd;

CREATE TABLE IF NOT EXISTS raw_data.diagnoses_icd
(
    row_id integer NOT NULL DEFAULT nextval('raw_data.daignoses_icd_row_id_seq'::regclass),
    subject_id integer NOT NULL,
    hadm_id integer NOT NULL,
    seq_num integer NOT NULL,
    icd_code character varying(7) COLLATE pg_catalog."default",
    icd_version integer,
    CONSTRAINT diagnoses_icd_pkey PRIMARY KEY (row_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS raw_data.diagnoses_icd
    OWNER to postgres;



-- Table: raw_data.icustays

-- DROP TABLE IF EXISTS raw_data.icustays;

CREATE TABLE IF NOT EXISTS raw_data.icustays
(
    subject_id integer,
    hadm_id integer,
    stay_id integer NOT NULL,
    first_careunit character varying(50) COLLATE pg_catalog."default",
    last_careunit character varying(50) COLLATE pg_catalog."default",
    intime timestamp without time zone,
    outtime timestamp without time zone,
    los double precision,
    CONSTRAINT icustays_pkey PRIMARY KEY (stay_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS raw_data.icustays
    OWNER to postgres;



-- Table: raw_data.omr

-- DROP TABLE IF EXISTS raw_data.omr;

CREATE TABLE IF NOT EXISTS raw_data.omr
(
    row_id integer NOT NULL DEFAULT nextval('raw_data.omr_row_id_seq'::regclass),
    subject_id integer NOT NULL,
    chart_date date NOT NULL,
    seq_num integer NOT NULL,
    result_name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    result_value text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT omr_pkey PRIMARY KEY (row_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS raw_data.omr
    OWNER to postgres;
