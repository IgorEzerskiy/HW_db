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
    actor_first_name character varying(128),
    actor_last_name character varying(128),
    dirthday_date date,
    director_id integer,
    film_id integer
);


ALTER TABLE public.actors OWNER TO postgres;

--
-- Name: actors_to_films; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actors_to_films (
    act_id integer,
    film_id integer
);


ALTER TABLE public.actors_to_films OWNER TO postgres;

--
-- Name: directors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directors (
    director_id integer NOT NULL,
    director_first_name character varying(128) NOT NULL,
    director_last_name character varying(128) NOT NULL,
    birthday_date date NOT NULL,
    film_amount integer NOT NULL,
    film_id integer NOT NULL,
    actor_id integer NOT NULL
);


ALTER TABLE public.directors OWNER TO postgres;

--
-- Name: directors_director_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directors_director_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directors_director_id_seq OWNER TO postgres;

--
-- Name: directors_director_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directors_director_id_seq OWNED BY public.directors.director_id;


--
-- Name: films; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.films (
    film_id integer NOT NULL,
    films_name character varying(128),
    director_last_name character varying(50),
    director_first_name character varying(50),
    release_year integer,
    imdb numeric,
    director_id integer,
    actor_id integer
);


ALTER TABLE public.films OWNER TO postgres;

--
-- Name: films_directors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.films_directors (
    film_id integer,
    director_id integer
);


ALTER TABLE public.films_directors OWNER TO postgres;

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
-- Name: directors director_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors ALTER COLUMN director_id SET DEFAULT nextval('public.directors_director_id_seq'::regclass);


--
-- Name: films film_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.films ALTER COLUMN film_id SET DEFAULT nextval('public.films_film_id_seq'::regclass);


--
-- Data for Name: actors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.actors (actor_id, actor_first_name, actor_last_name, dirthday_date, director_id, film_id) FROM stdin;
2	Leonardo	DiCaprio	1974-11-11	1	5
3	Brad	Pitt	1963-12-18	1	5
4	Daniel	Radcliffe	1989-07-23	1	5
1	Jason	Statham	1967-07-26	1	5
\.


--
-- Data for Name: actors_to_films; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.actors_to_films (act_id, film_id) FROM stdin;
1	4
2	5
3	6
4	7
\.


--
-- Data for Name: directors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directors (director_id, director_first_name, director_last_name, birthday_date, film_amount, film_id, actor_id) FROM stdin;
1	Ritchie	Guy	1968-10-09	14	4	1
2	Christopher	Nolan	1970-07-30	12	5	2
3	Martin	McDonagh	1970-03-26	5	7	3
\.


--
-- Data for Name: films; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.films (film_id, films_name, director_last_name, director_first_name, release_year, imdb, director_id, actor_id) FROM stdin;
4	Wrath of Man	Ritchie	Guy	2021	7.1	\N	\N
5	Revolver	Ritchie	Guy	2005	6.3	\N	\N
6	Inception	Nolan	Christopher	2010	8.8	\N	\N
7	Seven Psyhopaths	McDonagh	Martin	2012	7.1	\N	\N
\.


--
-- Data for Name: films_directors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.films_directors (film_id, director_id) FROM stdin;
4	1
5	1
6	2
7	3
\.


--
-- Name: directors_director_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directors_director_id_seq', 1, false);


--
-- Name: films_film_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.films_film_id_seq', 7, true);


--
-- Name: actors actors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_pkey PRIMARY KEY (actor_id);


--
-- Name: directors directors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_pkey PRIMARY KEY (director_id);


--
-- Name: films unique_film; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.films
    ADD CONSTRAINT unique_film UNIQUE (film_id);


--
-- Name: actors actors_film_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_film_id_fkey FOREIGN KEY (film_id) REFERENCES public.films(film_id);


--
-- Name: directors directors_actor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_actor_id_fkey FOREIGN KEY (actor_id) REFERENCES public.actors(actor_id);


--
-- Name: directors directors_film_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_film_id_fkey FOREIGN KEY (film_id) REFERENCES public.films(film_id);


--
-- Name: actors fk_actors_directors; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT fk_actors_directors FOREIGN KEY (director_id) REFERENCES public.directors(director_id);


--
-- Name: films fk_films_actors; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.films
    ADD CONSTRAINT fk_films_actors FOREIGN KEY (actor_id) REFERENCES public.actors(actor_id);


--
-- Name: films fk_films_directors; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.films
    ADD CONSTRAINT fk_films_directors FOREIGN KEY (director_id) REFERENCES public.directors(director_id);


--
-- PostgreSQL database dump complete
--

