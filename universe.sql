--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying NOT NULL,
    age_in_million_years numeric,
    distance_from_earth numeric,
    description text,
    has_life boolean,
    is_spherical boolean,
    num_planets_bill integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxies_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxies_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxies_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_star_combi; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_star_combi (
    galaxy_star_combi_id integer NOT NULL,
    galaxy_id integer,
    star_id integer,
    name character varying(30) NOT NULL
);


ALTER TABLE public.galaxy_star_combi OWNER TO freecodecamp;

--
-- Name: galaxy_star_combi_combi_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_star_combi_combi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_star_combi_combi_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_star_combi_combi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_star_combi_combi_id_seq OWNED BY public.galaxy_star_combi.galaxy_star_combi_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_million_years numeric,
    distance_from_earth numeric,
    has_life boolean,
    is_spherical boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_million_years numeric,
    distance_from_earth numeric,
    has_life boolean,
    is_spherical boolean,
    num_moon integer,
    star_id integer
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
    name character varying(30) NOT NULL,
    description text,
    age_in_million_years numeric,
    distance_from_earth numeric,
    has_life boolean,
    is_spherical boolean,
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

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxies_id_seq'::regclass);


--
-- Name: galaxy_star_combi galaxy_star_combi_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_combi ALTER COLUMN galaxy_star_combi_id SET DEFAULT nextval('public.galaxy_star_combi_combi_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 0, 'our home; a barred spiral galaxy with a central buldge and massive spiral arms', true, false, 400);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 25, 'The largest neighbor; a massive spiral galaxy on a collision course with us', false, false, 1000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 10000, 29, 'A smaller spiral galaxy; the third-largest member of our Local Group', false, false, 100);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 13000, 11, 'A lenticular galaxy known for its massive black hole and intense radio jets', false, false, 100);
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 13000, 53, 'A giant elliptical galaxy; home to the first-ever black hole to be imaged', false, true, 10000);
INSERT INTO public.galaxy VALUES (6, 'GN-z11', 13400, 3200, 'One of the oldest and most distant galaxies ever observed by Hubble', false, false, 0);


--
-- Data for Name: galaxy_star_combi; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_star_combi VALUES (1, 1, 1, 'Combi 1');
INSERT INTO public.galaxy_star_combi VALUES (2, 2, 2, 'Combi 2');
INSERT INTO public.galaxy_star_combi VALUES (3, 3, 3, 'Combi 3');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 'Our constant companion, tidally locked to Earth', 4500, 384400, false, true, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Heavily cratered and doomed, it is slowly spiraling into Mars', 4500, 9377, false, false, 7);
INSERT INTO public.moon VALUES (3, 'Io', 'Most voicanically active body in the solar system', 4500, 421700, false, true, 8);
INSERT INTO public.moon VALUES (4, 'Deimos', 'Smaller than Phovos, looks like a smooth, dusty aestroid', 4500, 23460, false, false, 7);
INSERT INTO public.moon VALUES (5, 'Europa', 'Icy shell hiding a massive subsurface saltwater ocean', 4500, 670900, false, true, 8);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'The largest moon, bigger than the planet Mercury', 4500, 1070400, false, true, 8);
INSERT INTO public.moon VALUES (7, 'Callisto', 'The most cratered object in the solar system, very cold surface', 4500, 1882700, false, true, 8);
INSERT INTO public.moon VALUES (8, 'Mimas', 'Nichnamed the "Death Star" due to the massive Herschel Crater', 4500, 185520, false, true, 9);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Famous for its icy plumes that spray ocean water into space', 1000, 238020, false, true, 9);
INSERT INTO public.moon VALUES (10, 'Tethys', 'Features a giant canyon, lthaca Chasma, 2,000 km long', 4500, 294660, false, true, 9);
INSERT INTO public.moon VALUES (11, 'Dione', 'Has "wispy terrain" which is actually giant ice cliffs', 4500, 377400, false, true, 9);
INSERT INTO public.moon VALUES (12, 'Rhea', 'Heavily cratered, may have its own very faint ring system', 4500, 527040, false, false, 9);
INSERT INTO public.moon VALUES (13, 'Titan', 'Massive atmosphere, has lakes and rivers of liquid methane', 4500, 1221830, false, true, 9);
INSERT INTO public.moon VALUES (14, 'Laptus', 'The "ying-yang" moon, one half is dark, the other is bright', 4500, 3561300, false, true, 9);
INSERT INTO public.moon VALUES (15, 'Miranda', 'Looks like it was broken apart and put back together wrong', 4500, 129390, false, true, 11);
INSERT INTO public.moon VALUES (16, 'Ariel', 'Has the brightest surface of all Uranian moons', 4500, 191020, false, true, 11);
INSERT INTO public.moon VALUES (17, 'Titania', 'The largest moon of Uranus, features cheap deep canyons', 4500, 435910, false, true, 11);
INSERT INTO public.moon VALUES (18, 'Triton', 'Orbits backward (retrograde), likely a captured Kuiper Belt object', 4500, 354760, false, true, 12);
INSERT INTO public.moon VALUES (19, 'Nereid', 'One of the most eccentric (looping) orbits of any moon', 4500, 5513400, false, false, 12);
INSERT INTO public.moon VALUES (20, 'Charon', 'So large compared to Pluto that they orbit each other', 4500, 19591, false, true, 17);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'The only known planet with liquid surface water', 4540, 0, true, true, 1, 1);
INSERT INTO public.planet VALUES (7, 'Mars', 'The red planet, a cold, desert world with a thin atmosphere', 4500, 140000000, false, true, 2, 1);
INSERT INTO public.planet VALUES (8, 'Jupiter', 'A massive han twice as heavy as all other planets combined', 4600, 390000000, false, true, 95, 1);
INSERT INTO public.planet VALUES (9, 'Saturn', 'Famous for its complex and dazzling ring system made of ice and rock', 4500, 250000000, false, true, 16, 1);
INSERT INTO public.planet VALUES (10, 'Neptune', 'The most distant major planet, a dark, cold, and incredibly windy ice giant', 4500, 790000000, false, true, 146, 1);
INSERT INTO public.planet VALUES (11, 'Venus', 'Earth"s evil twin, it has a runaway greenhouse effect and high heat', 4500, 250900000, false, true, 0, 1);
INSERT INTO public.planet VALUES (12, 'PA-99-N2 b', 'A candidate gas giant, the first planet ever suspected in Andromeda', 100, 25000000, false, true, 0, 2);
INSERT INTO public.planet VALUES (13, 'Andro-P1', 'A theoritical rocky world likely stripped of atmosphere by V1"s pulses', 110, 2500000, false, true, 0, 2);
INSERT INTO public.planet VALUES (14, 'Tri-P1', 'A massive "super-jupiter" candidate orbiting this hyperjiant star', 10, 2900000, false, true, 0, 3);
INSERT INTO public.planet VALUES (15, 'Tri-P2', 'A theoritical planetesimal (baby planet) currently forming in the star"s disk', 5, 3000000, false, true, 0, 3);
INSERT INTO public.planet VALUES (16, 'M87-P1', 'A massice world likely being blasted by the galaxy"s active jet radiation', 500, 3100000, false, true, 0, 4);
INSERT INTO public.planet VALUES (17, 'Hebe-Prime', 'A theoretical "primordial" planet made of only basic gases', 10, 320000000000, false, true, 0, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'A yellow dwarf star; the center of our solar system', 4600, 0.000015, true, true, 1);
INSERT INTO public.star VALUES (2, 'V1', 'A Cepheid variable used by Edwin Hubble to prove othe galaxies exist', 100, 2500000, false, true, 2);
INSERT INTO public.star VALUES (3, 'B324', 'One of the most luminours stars known; a massive hypergiant', 10, 2900000, false, true, 3);
INSERT INTO public.star VALUES (4, 'SN 1986G', 'Technically a type of Supernove, an exploding star discovered here', 0, 11000000, false, true, 4);
INSERT INTO public.star VALUES (5, 'M87-V1', 'A very rare, extremely bright variable star detected by Hubble', 500, 53000000, false, true, 5);
INSERT INTO public.star VALUES (6, 'Hebe', 'A potential population III star-one of the very first stars ever born.', 10, 32000000, false, true, 6);


--
-- Name: galaxy_galaxies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxies_id_seq', 6, true);


--
-- Name: galaxy_star_combi_combi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_star_combi_combi_id_seq', 3, true);


--
-- Name: moon_moon_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 17, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_star_combi galaxy_star_combi_combi_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_combi
    ADD CONSTRAINT galaxy_star_combi_combi_id_key UNIQUE (galaxy_star_combi_id);


--
-- Name: galaxy_star_combi galaxy_star_combi_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_combi
    ADD CONSTRAINT galaxy_star_combi_pkey PRIMARY KEY (galaxy_star_combi_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_uni_dis; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_uni_dis UNIQUE (distance_from_earth);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_distance_from_earth_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_distance_from_earth_key UNIQUE (distance_from_earth);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy uni_gal_dis; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT uni_gal_dis UNIQUE (distance_from_earth);


--
-- Name: planet unique_distance; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_distance UNIQUE (distance_from_earth);


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

