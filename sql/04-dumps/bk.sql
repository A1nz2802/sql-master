-- Table: public.country

-- DROP TABLE IF EXISTS public.country_bk;

CREATE TABLE IF NOT EXISTS public.country_bk
(
    code character(3) COLLATE pg_catalog."default" NOT NULL,
    name text COLLATE pg_catalog."default" NOT NULL,
    continent text COLLATE pg_catalog."default" NOT NULL,
    region text COLLATE pg_catalog."default" NOT NULL,
    surfacearea real NOT NULL,
    indepyear smallint,
    population integer NOT NULL,
    lifeexpectancy real,
    gnp numeric(10,2),
    gnpold numeric(10,2),
    localname text COLLATE pg_catalog."default" NOT NULL,
    governmentform text COLLATE pg_catalog."default" NOT NULL,
    headofstate text COLLATE pg_catalog."default",
    capital integer,
    code2 character(2) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT country_bk_pkey PRIMARY KEY (code),
    CONSTRAINT country_bk_continent_check CHECK (continent = 'Asia'::text OR continent = 'South America'::text OR continent = 'North America'::text OR continent = 'Oceania'::text OR continent = 'Antarctica'::text OR continent = 'Africa'::text OR continent = 'Europe'::text OR continent = 'Central America'::text),
    CONSTRAINT country_bk_surfacearea_check CHECK (surfacearea >= 0::double precision)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.country_bk
    OWNER to alumno;