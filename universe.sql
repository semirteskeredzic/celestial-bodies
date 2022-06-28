--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: comets; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comets (
    comets_id integer NOT NULL,
    name character varying(30),
    size integer,
    designation integer NOT NULL
);


ALTER TABLE public.comets OWNER TO freecodecamp;

--
-- Name: comets_comets_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comets_comets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comets_comets_id_seq OWNER TO freecodecamp;

--
-- Name: comets_comets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comets_comets_id_seq OWNED BY public.comets.comets_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    description text,
    designation integer,
    galaxy_color character varying(30) DEFAULT 'White'::character varying NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    size numeric(9,3),
    planet_id integer,
    designation integer,
    surface character varying(30) DEFAULT 'Rocky'::character varying NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    population integer,
    number_of_moons integer,
    is_inhabited boolean,
    has_water boolean,
    star_id integer,
    designation integer,
    core character varying(30) DEFAULT 'Hot'::character varying NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    description text,
    galaxy_id integer,
    designation integer,
    phase character varying(30) DEFAULT 'Dormant'::character varying NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comets comets_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comets ALTER COLUMN comets_id SET DEFAULT nextval('public.comets_comets_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comets; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comets VALUES (1, 'Halleys Comet', 1543, 100);
INSERT INTO public.comets VALUES (2, 'Hyakutake', 800, 101);
INSERT INTO public.comets VALUES (3, 'Hale Bopp', 15000, 102);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', NULL, NULL, 'White');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', NULL, NULL, 'White');
INSERT INTO public.galaxy VALUES (3, 'Magellanic Clouds', NULL, NULL, 'White');
INSERT INTO public.galaxy VALUES (4, 'Canis Major Dwarf Galaxy', NULL, NULL, 'White');
INSERT INTO public.galaxy VALUES (5, 'Cygnus A', NULL, NULL, 'White');
INSERT INTO public.galaxy VALUES (6, 'Virgo A', NULL, NULL, 'White');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 1737.400, 1, NULL, 'Rocky');
INSERT INTO public.moon VALUES (2, 'Io', 2000.000, 5, 200, 'Rocky');
INSERT INTO public.moon VALUES (3, 'Europa', 15000.000, 5, 201, 'Ice');
INSERT INTO public.moon VALUES (4, 'Ganymede', 4432.000, 5, 202, 'Rocky');
INSERT INTO public.moon VALUES (5, 'Callisto', 1322.000, 5, 203, 'Rocky');
INSERT INTO public.moon VALUES (6, 'Adrastea', 300.000, 5, 204, 'Rocky');
INSERT INTO public.moon VALUES (7, 'Aitne', 1000.000, 5, 205, 'Rocky');
INSERT INTO public.moon VALUES (8, 'Amalthea', 4000.000, 5, 206, 'Rocky');
INSERT INTO public.moon VALUES (9, 'Ananke', 609.000, 5, 207, 'Rocky');
INSERT INTO public.moon VALUES (10, 'Aoede', 8777.000, 5, 208, 'Rocky');
INSERT INTO public.moon VALUES (11, 'Arche', 2000.000, 5, 209, 'Rocky');
INSERT INTO public.moon VALUES (12, 'Autonoe', 15000.000, 5, 210, 'Ice');
INSERT INTO public.moon VALUES (13, 'Callirrhoe', 4432.000, 5, 211, 'Rocky');
INSERT INTO public.moon VALUES (14, 'Carme', 1322.000, 5, 212, 'Rocky');
INSERT INTO public.moon VALUES (15, 'Carpo', 300.000, 5, 213, 'Rocky');
INSERT INTO public.moon VALUES (16, 'Dia', 1000.000, 5, 214, 'Rocky');
INSERT INTO public.moon VALUES (17, 'Eirene', 4000.000, 5, 215, 'Rocky');
INSERT INTO public.moon VALUES (18, 'Elara', 609.000, 5, 216, 'Rocky');
INSERT INTO public.moon VALUES (19, 'Ersa', 8777.000, 5, 217, 'Rocky');
INSERT INTO public.moon VALUES (20, 'Kore', 2000.000, 5, 218, 'Rocky');
INSERT INTO public.moon VALUES (21, 'Kale', 15000.000, 5, 219, 'Ice');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 7, 1, true, true, 2, NULL, 'Hot');
INSERT INTO public.planet VALUES (2, 'Mercury', 0, 0, false, false, 2, 1, 'Hot');
INSERT INTO public.planet VALUES (3, 'Venus', 0, 0, false, false, 2, 2, 'Hot');
INSERT INTO public.planet VALUES (4, 'Mars', 0, 2, false, true, 2, 4, 'Cold');
INSERT INTO public.planet VALUES (5, 'Jupiter', 0, 66, false, false, 2, 5, 'Cold');
INSERT INTO public.planet VALUES (6, 'Saturn', 0, 62, false, false, 2, 6, 'Cold');
INSERT INTO public.planet VALUES (7, 'Uranus', 0, 27, false, false, 2, 7, 'Cold');
INSERT INTO public.planet VALUES (8, 'Neptune', 0, 14, false, false, 2, 8, 'Cold');
INSERT INTO public.planet VALUES (9, 'PA-99-N2', 0, 0, false, false, 1, 9, 'Cold');
INSERT INTO public.planet VALUES (10, 'Kepler-7b', 0, 0, false, false, 4, 10, 'Hot');
INSERT INTO public.planet VALUES (11, 'Kepler-5b', 0, 5, false, false, 4, 11, 'Hot');
INSERT INTO public.planet VALUES (12, 'Kepler-8b', 0, 15, false, false, 4, 12, 'Cold');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Deneb', 'Eighteenth brightest star in the night sky', 1, NULL, 'Dormant');
INSERT INTO public.star VALUES (2, 'Sun', 'The largest object in solar system', 1, NULL, 'Dormant');
INSERT INTO public.star VALUES (3, 'V766 Centauri Aa', 'Rare variable yellow supergiant', 1, NULL, 'Dormant');
INSERT INTO public.star VALUES (4, 'WOH G64', 'Surrounded by a large dust cloud', 3, NULL, 'Dormant');
INSERT INTO public.star VALUES (5, 'LGGS J004124.80+411634.7', 'Nothing special', 2, NULL, 'Dormant');
INSERT INTO public.star VALUES (6, 'LI-LMC 60', 'Nothing special', 3, NULL, 'Dormant');


--
-- Name: comets_comets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comets_comets_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comets comets_designation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comets
    ADD CONSTRAINT comets_designation_key UNIQUE (designation);


--
-- Name: comets comets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comets
    ADD CONSTRAINT comets_pkey PRIMARY KEY (comets_id);


--
-- Name: galaxy galaxy_designation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_designation_key UNIQUE (designation);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_designation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_designation_key UNIQUE (designation);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_designation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_designation_key UNIQUE (designation);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_designation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_designation_key UNIQUE (designation);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

