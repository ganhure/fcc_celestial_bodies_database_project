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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    galaxy_type character varying(60) NOT NULL,
    galaxy_dist_to_earth_ly integer NOT NULL
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
    name character varying(60) NOT NULL,
    planet_id integer,
    moon_gravity numeric(4,1) NOT NULL,
    moon_radius_in_km integer NOT NULL,
    moon_orbital character varying(60) NOT NULL,
    is_spherical boolean
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
    name character varying(60),
    star_id integer,
    planet_gravity numeric(4,1),
    planet_orbital_period character varying(60),
    planet_radius_in_km integer,
    planet_length_of_day character varying(60),
    planet_has_life boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_more_info (
    planet_more_info_id integer NOT NULL,
    name character varying(60) NOT NULL,
    planet_more_info_discovered character varying(60) NOT NULL,
    planet_id integer
);


ALTER TABLE public.planet_more_info OWNER TO freecodecamp;

--
-- Name: planet_more_info_planet_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_more_info_planet_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_more_info_planet_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: planet_more_info_planet_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_more_info_planet_more_info_id_seq OWNED BY public.planet_more_info.planet_more_info_id;


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
    name character varying(30) NOT NULL,
    star_age_in_mil integer,
    star_dist_to_earth_ly numeric(4,1),
    star_surface_temp_in_k integer,
    star_constellation text,
    galaxy_id integer
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
-- Name: planet_more_info planet_more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_more_info ALTER COLUMN planet_more_info_id SET DEFAULT nextval('public.planet_more_info_planet_more_info_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'A dim fudge of light in the night sky', 'spiral', 2500000);
INSERT INTO public.galaxy VALUES (3, 'Pinwheel', 'A giant disk with a ball shaped nucleus and spiral arms', 'spiral', 21000000);
INSERT INTO public.galaxy VALUES (4, 'Hoag''s Object', 'The most perfect ring galaxy', 'ring', 613000000);
INSERT INTO public.galaxy VALUES (5, 'Cartwheel', 'A galaxy that looks like a wagon wheel in the night sky', 'lenticular', 489000000);
INSERT INTO public.galaxy VALUES (6, 'Messier 81', 'A very bright and massive galaxy with well defined spiral arms', 'spiral', 12000000);
INSERT INTO public.galaxy VALUES (7, 'Sombrero', 'A galaxy that looks like a sombrero hat in the night sky', 'spiral', 29000000);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'A hazy band of light seen in the night sky', 'spiral', 0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 9, 1.6, 1737, '27 days', true);
INSERT INTO public.moon VALUES (2, 'Ganymede', 2, 1.4, 2634, '172 hours', true);
INSERT INTO public.moon VALUES (3, 'Enceladus', 3, 0.1, 252, '33 hours', true);
INSERT INTO public.moon VALUES (4, 'Europa', 2, 1.3, 1561, '85 hours', true);
INSERT INTO public.moon VALUES (5, 'Titan', 3, 1.4, 2575, '16 days', true);
INSERT INTO public.moon VALUES (6, 'Iapetus', 3, 0.2, 735, '79 days', true);
INSERT INTO public.moon VALUES (7, 'Mimas', 3, 0.1, 198, '23 hours', true);
INSERT INTO public.moon VALUES (8, 'Phobos', 1, 0.0, 11, '8 hours', false);
INSERT INTO public.moon VALUES (9, 'Triton', 8, 0.8, 1353, '141 hours', true);
INSERT INTO public.moon VALUES (10, 'Callisto', 2, 1.2, 2410, '17 days', true);
INSERT INTO public.moon VALUES (11, 'Thebe', 2, 0.0, 49, '16 hours', false);
INSERT INTO public.moon VALUES (12, 'Adrastea', 2, 0.0, 8, '7 hours', true);
INSERT INTO public.moon VALUES (13, 'Themisto', 2, 0.0, 4, '130 days', true);
INSERT INTO public.moon VALUES (14, 'Nereid', 8, 0.1, 170, '360 days', true);
INSERT INTO public.moon VALUES (15, 'Herse', 2, 0.0, 1, '715 days', true);
INSERT INTO public.moon VALUES (16, 'Callirhoe', 2, 0.0, 4, '759 days', false);
INSERT INTO public.moon VALUES (17, 'Cyllene', 2, 0.0, 1, '738 days', true);
INSERT INTO public.moon VALUES (18, 'Puck', 6, 0.0, 81, '18 hours', true);
INSERT INTO public.moon VALUES (19, 'Oberon', 6, 0.4, 761, '13 days', true);
INSERT INTO public.moon VALUES (20, 'Himalia', 2, 0.1, 85, '248 days', false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mars', 2, 3.7, '687 days', 3390, '1d 0h 37m', false);
INSERT INTO public.planet VALUES (2, 'Jupiter', 3, 24.8, '12 years', 69911, '0d 9h 56m', false);
INSERT INTO public.planet VALUES (3, 'Saturn', 4, 10.4, '29 years', 58232, '0d 10h 34m', false);
INSERT INTO public.planet VALUES (4, 'Venus', 5, 8.9, '225 days', 6052, '243d 0h 0m', false);
INSERT INTO public.planet VALUES (5, 'Mercury', 6, 3.7, '88 days', 2440, '59d 0h 0m', false);
INSERT INTO public.planet VALUES (6, 'Uranus', 7, 8.9, '84 years', 25362, '0d 17h 14m', false);
INSERT INTO public.planet VALUES (8, 'Neptune', 2, 11.2, '165 years', 24622, '0d 16h 6m', false);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 4, 25.0, '290 days', 15290, NULL, false);
INSERT INTO public.planet VALUES (11, 'CoRoT-7b', 5, 19.0, '20 hours', 10009, NULL, false);
INSERT INTO public.planet VALUES (12, 'Gliese 667 cc', 6, 15.7, '28 days', 9811, NULL, false);
INSERT INTO public.planet VALUES (13, 'Kepler-62f', 7, 14.3, '267 days', 8983, NULL, false);
INSERT INTO public.planet VALUES (9, 'Earth', 3, 9.8, '365 days', 6371, '0d 24h 0m', true);


--
-- Data for Name: planet_more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_more_info VALUES (1, 'Mars', '1610', 1);
INSERT INTO public.planet_more_info VALUES (2, 'Jupiter', '1610', 2);
INSERT INTO public.planet_more_info VALUES (3, 'Saturn', '1610', 3);
INSERT INTO public.planet_more_info VALUES (4, 'Venus', 'October 1610', 4);
INSERT INTO public.planet_more_info VALUES (5, 'Mercury', '1600', 5);
INSERT INTO public.planet_more_info VALUES (6, 'Uranus', '13 March 1781', 6);
INSERT INTO public.planet_more_info VALUES (7, 'Neptune', '23 September 1846', 8);
INSERT INTO public.planet_more_info VALUES (8, 'Kepler-22b', '5 December 2011', 10);
INSERT INTO public.planet_more_info VALUES (9, 'CoRoT-7b', '3 February 2009', 11);
INSERT INTO public.planet_more_info VALUES (10, 'Gliese 667 cc', '21 November 2011', 12);
INSERT INTO public.planet_more_info VALUES (11, 'Kepler-62f', '18 April 2013', 13);
INSERT INTO public.planet_more_info VALUES (12, 'Earth', '4.5 billion years ago', 9);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Arcturus', 7105000, 36.7, 4290, 'Bootes', 2);
INSERT INTO public.star VALUES (3, 'Sirius', 230, 8.6, 9940, 'Canis Major', 3);
INSERT INTO public.star VALUES (4, 'Aldebaran', 6605000, 65.2, 3910, 'Taurus', 4);
INSERT INTO public.star VALUES (5, 'Altair', 1000, 16.7, 7700, 'Aquila', 5);
INSERT INTO public.star VALUES (6, 'Mu Arae', 4400, 50.6, 5820, 'Ara', 6);
INSERT INTO public.star VALUES (7, 'Alpha Cephei', 670, 49.1, 7740, 'Cepheus', 7);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_more_info_planet_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_more_info_planet_more_info_id_seq', 12, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet_more_info planet_more_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_more_info
    ADD CONSTRAINT planet_more_info_name_key UNIQUE (name);


--
-- Name: planet_more_info planet_more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_more_info
    ADD CONSTRAINT planet_more_info_pkey PRIMARY KEY (planet_more_info_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


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
-- Name: planet_more_info planet_more_info_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_more_info
    ADD CONSTRAINT planet_more_info_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

