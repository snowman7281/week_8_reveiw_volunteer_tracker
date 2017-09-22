--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: projects; Type: TABLE; Schema: public; Owner: snowvilay
--

CREATE TABLE projects (
    id integer NOT NULL,
    name character varying,
    project_info text
);


ALTER TABLE projects OWNER TO snowvilay;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: snowvilay
--

CREATE SEQUENCE projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE projects_id_seq OWNER TO snowvilay;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: snowvilay
--

ALTER SEQUENCE projects_id_seq OWNED BY projects.id;


--
-- Name: volunteers; Type: TABLE; Schema: public; Owner: snowvilay
--

CREATE TABLE volunteers (
    id integer NOT NULL,
    name character varying,
    age integer,
    dob date,
    project_id integer
);


ALTER TABLE volunteers OWNER TO snowvilay;

--
-- Name: volunteers_id_seq; Type: SEQUENCE; Schema: public; Owner: snowvilay
--

CREATE SEQUENCE volunteers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE volunteers_id_seq OWNER TO snowvilay;

--
-- Name: volunteers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: snowvilay
--

ALTER SEQUENCE volunteers_id_seq OWNED BY volunteers.id;


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: snowvilay
--

ALTER TABLE ONLY projects ALTER COLUMN id SET DEFAULT nextval('projects_id_seq'::regclass);


--
-- Name: volunteers id; Type: DEFAULT; Schema: public; Owner: snowvilay
--

ALTER TABLE ONLY volunteers ALTER COLUMN id SET DEFAULT nextval('volunteers_id_seq'::regclass);


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: snowvilay
--

COPY projects (id, name, project_info) FROM stdin;
\.


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: snowvilay
--

SELECT pg_catalog.setval('projects_id_seq', 1, false);


--
-- Data for Name: volunteers; Type: TABLE DATA; Schema: public; Owner: snowvilay
--

COPY volunteers (id, name, age, dob, project_id) FROM stdin;
\.


--
-- Name: volunteers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: snowvilay
--

SELECT pg_catalog.setval('volunteers_id_seq', 1, false);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: snowvilay
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: volunteers volunteers_pkey; Type: CONSTRAINT; Schema: public; Owner: snowvilay
--

ALTER TABLE ONLY volunteers
    ADD CONSTRAINT volunteers_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

