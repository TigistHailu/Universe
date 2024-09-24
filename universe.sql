--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(30),
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(20,3),
    galaxy_types text,
    CONSTRAINT galaxy_galaxy_types_check CHECK ((length(galaxy_types) <= 50))
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
-- Name: life_form; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.life_form (
    life_form_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    type text
);


ALTER TABLE public.life_form OWNER TO freecodecamp;

--
-- Name: life_form_life_form_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.life_form_life_form_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.life_form_life_form_id_seq OWNER TO freecodecamp;

--
-- Name: life_form_life_form_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.life_form_life_form_id_seq OWNED BY public.life_form.life_form_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(20,3),
    has_water boolean,
    planet_id integer
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
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(20,3),
    planet_types text,
    star_id integer,
    CONSTRAINT planet_planet_types_check CHECK ((length(planet_types) <= 50))
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
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(20,3),
    has_planets boolean,
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
-- Name: life_form life_form_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life_form ALTER COLUMN life_form_id SET DEFAULT nextval('public.life_form_life_form_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13, 0.000, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10, 2.537, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 3, 3.000, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 13, 53.500, 'Elliptical');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 1, 23.200, 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 10, 28.000, 'Spiral');


--
-- Data for Name: life_form; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.life_form VALUES (1, 'Humans', 1, 'Intelligent');
INSERT INTO public.life_form VALUES (2, 'Martians', 2, 'Intelligent');
INSERT INTO public.life_form VALUES (3, 'Microbial Life', 3, 'Microorganism');
INSERT INTO public.life_form VALUES (4, 'Aquatic Creatures', 4, 'Aquatic');
INSERT INTO public.life_form VALUES (5, 'Titan Creatures', 5, 'Unknown');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 6, 0.384, true, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 0.001, false, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 0.000, false, 2);
INSERT INTO public.moon VALUES (4, 'Europa', 5, 628.000, true, 4);
INSERT INTO public.moon VALUES (5, 'Ganymede', 5, 628.000, true, 4);
INSERT INTO public.moon VALUES (6, 'Callisto', 5, 628.000, false, 4);
INSERT INTO public.moon VALUES (7, 'Titan', 5, 1222.000, true, 5);
INSERT INTO public.moon VALUES (8, 'Enceladus', 5, 1267.000, true, 5);
INSERT INTO public.moon VALUES (9, 'Miranda', 5, 1207.000, false, 6);
INSERT INTO public.moon VALUES (10, 'Ariel', 5, 1200.000, false, 6);
INSERT INTO public.moon VALUES (11, 'Triton', 5, 4500.000, true, 7);
INSERT INTO public.moon VALUES (12, 'Charon', 5, 1200.000, false, 8);
INSERT INTO public.moon VALUES (13, 'Rhea', 5, 1271.000, false, 5);
INSERT INTO public.moon VALUES (14, 'Iapetus', 5, 3560.000, false, 5);
INSERT INTO public.moon VALUES (15, 'Tethys', 5, 1071.000, false, 5);
INSERT INTO public.moon VALUES (16, 'Mimas', 5, 1181.000, false, 5);
INSERT INTO public.moon VALUES (17, 'Oberon', 5, 1583.000, false, 6);
INSERT INTO public.moon VALUES (18, 'Titania', 5, 1590.000, false, 6);
INSERT INTO public.moon VALUES (19, 'Ceres', 5, 413.000, true, 1);
INSERT INTO public.moon VALUES (20, 'Enceladus2', 5, 1267.000, true, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 5, 0.000, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (2, 'Mars', 5, 0.227, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (3, 'Venus', 5, 0.000, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', 5, 4.200, 'Gas Giant', 1);
INSERT INTO public.planet VALUES (5, 'Saturn', 5, 9.500, 'Gas Giant', 1);
INSERT INTO public.planet VALUES (6, 'Uranus', 5, 19.800, 'Ice Giant', 1);
INSERT INTO public.planet VALUES (7, 'Neptune', 5, 30.100, 'Ice Giant', 1);
INSERT INTO public.planet VALUES (8, 'Kepler-186f', 500, 490.000, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (9, 'HD 209458 b', 4, 7.300, 'Gas Giant', 3);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 5, 4.240, 'Terrestrial', 2);
INSERT INTO public.planet VALUES (11, 'Gliese 581g', 3, 20.300, 'Super-Earth', 2);
INSERT INTO public.planet VALUES (12, 'WASP-12b', 5, 9.500, 'Hot Jupiter', 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 5, 0.000, true, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 5, 4.240, true, 1);
INSERT INTO public.star VALUES (3, 'Sirius A', 200, 8.600, true, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 9, 642.000, false, 1);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 5, 4.370, true, 1);
INSERT INTO public.star VALUES (6, 'Vega', 455, 25.000, true, 1);
INSERT INTO public.star VALUES (7, 'Aldebaran', 65, 65.000, false, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: life_form_life_form_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.life_form_life_form_id_seq', 5, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: life_form life_form_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life_form
    ADD CONSTRAINT life_form_pkey PRIMARY KEY (life_form_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: life_form name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life_form
    ADD CONSTRAINT name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: life_form life_form_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life_form
    ADD CONSTRAINT life_form_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

