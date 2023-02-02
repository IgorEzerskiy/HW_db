--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Ubuntu 15.1-1.pgdg22.04+1)
-- Dumped by pg_dump version 15.1 (Ubuntu 15.1-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: actors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actors (
    actor_id integer NOT NULL,
    actor_last_name character varying(50),
    actor_first_name character varying(50),
    birthday_date date
);


ALTER TABLE public.actors OWNER TO postgres;

--
-- Name: actors_actor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.actors_actor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actors_actor_id_seq OWNER TO postgres;

--
-- Name: actors_actor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.actors_actor_id_seq OWNED BY public.actors.actor_id;


--
-- Name: directors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directors (
    directors_id integer NOT NULL,
    director_last_name character varying(50),
    director_first_name character varying(50),
    birthday_date date,
    films_amount smallint
);


ALTER TABLE public.directors OWNER TO postgres;

--
-- Name: directors_directors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directors_directors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directors_directors_id_seq OWNER TO postgres;

--
-- Name: directors_directors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directors_directors_id_seq OWNED BY public.directors.directors_id;


--
-- Name: films; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.films (
    film_id integer NOT NULL,
    film_name character varying(255),
    director character varying(100),
    release_year date,
    imdb numeric
);


ALTER TABLE public.films OWNER TO postgres;

--
-- Name: films_film_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.films_film_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.films_film_id_seq OWNER TO postgres;

--
-- Name: films_film_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.films_film_id_seq OWNED BY public.films.film_id;


--
-- Name: actors actor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors ALTER COLUMN actor_id SET DEFAULT nextval('public.actors_actor_id_seq'::regclass);


--
-- Name: directors directors_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors ALTER COLUMN directors_id SET DEFAULT nextval('public.directors_directors_id_seq'::regclass);


--
-- Name: films film_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.films ALTER COLUMN film_id SET DEFAULT nextval('public.films_film_id_seq'::regclass);


--
-- Data for Name: actors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.actors (actor_id, actor_last_name, actor_first_name, birthday_date) FROM stdin;
\.


--
-- Data for Name: directors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directors (directors_id, director_last_name, director_first_name, birthday_date, films_amount) FROM stdin;
1	Cameron	James	1954-08-16	9
2	Kubrick	Stanley	1928-07-26	12
\.


--
-- Data for Name: films; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.films (film_id, film_name, director, release_year, imdb) FROM stdin;
\.


--
-- Name: actors_actor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.actors_actor_id_seq', 1, false);


--
-- Name: directors_directors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directors_directors_id_seq', 2, true);


--
-- Name: films_film_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.films_film_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

