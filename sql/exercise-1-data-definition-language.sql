-- Using PostgreSQL and pgAdmin, so flavor of SQL is set to that environment.
-- Basically all DDL:s are created using pgAdmin, so quite a lot of verbose SQL.

-- Exercise 1.1: Create a Database
CREATE
DATABASE school_management
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

COMMENT
ON DATABASE school_management
    IS 'Lexicon Practice Database';

-- Exercise 1.2: Create Tables
CREATE TABLE public.courses
(
    id          integer                NOT NULL GENERATED ALWAYS AS IDENTITY,
    course_name character varying(100) NOT NULL,
    credits     integer                NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.courses
    OWNER to postgres;
