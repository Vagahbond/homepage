--
-- PostgreSQL database dump
--

\restrict avlRtpqi89aZSOuJCd3RqDZWFdIRPSQYRGOvviaLHa8pxhgjegqfzGyGBvlZddN

-- Dumped from database version 17.7
-- Dumped by pg_dump version 17.7

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: _locales; Type: TYPE; Schema: public; Owner: homepage
--

CREATE TYPE public._locales AS ENUM (
    'en',
    'fr'
);


ALTER TYPE public._locales OWNER TO homepage;

--
-- Name: enum_contact_page_data_bottom_right_links_icon; Type: TYPE; Schema: public; Owner: homepage
--

CREATE TYPE public.enum_contact_page_data_bottom_right_links_icon AS ENUM (
    'mail',
    'linkedin',
    'github',
    'arrow',
    'close',
    'code',
    'contact',
    'doc',
    'projects',
    'repo',
    'resume',
    'toggle',
    'try'
);


ALTER TYPE public.enum_contact_page_data_bottom_right_links_icon OWNER TO homepage;

--
-- Name: enum_projects_links_icon; Type: TYPE; Schema: public; Owner: homepage
--

CREATE TYPE public.enum_projects_links_icon AS ENUM (
    'mail',
    'linkedin',
    'github',
    'arrow',
    'close',
    'code',
    'contact',
    'doc',
    'projects',
    'repo',
    'resume',
    'toggle',
    'try'
);


ALTER TYPE public.enum_projects_links_icon OWNER TO homepage;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: contact_page_data; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.contact_page_data (
    id integer NOT NULL,
    updated_at timestamp(3) with time zone,
    created_at timestamp(3) with time zone
);


ALTER TABLE public.contact_page_data OWNER TO homepage;

--
-- Name: contact_page_data_bottom_right_links; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.contact_page_data_bottom_right_links (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    icon public.enum_contact_page_data_bottom_right_links_icon
);


ALTER TABLE public.contact_page_data_bottom_right_links OWNER TO homepage;

--
-- Name: contact_page_data_bottom_right_links_locales; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.contact_page_data_bottom_right_links_locales (
    label character varying,
    id integer NOT NULL,
    _locale public._locales NOT NULL,
    _parent_id character varying NOT NULL,
    url character varying
);


ALTER TABLE public.contact_page_data_bottom_right_links_locales OWNER TO homepage;

--
-- Name: contact_page_data_bottom_right_links_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: homepage
--

CREATE SEQUENCE public.contact_page_data_bottom_right_links_locales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contact_page_data_bottom_right_links_locales_id_seq OWNER TO homepage;

--
-- Name: contact_page_data_bottom_right_links_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homepage
--

ALTER SEQUENCE public.contact_page_data_bottom_right_links_locales_id_seq OWNED BY public.contact_page_data_bottom_right_links_locales.id;


--
-- Name: contact_page_data_id_seq; Type: SEQUENCE; Schema: public; Owner: homepage
--

CREATE SEQUENCE public.contact_page_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contact_page_data_id_seq OWNER TO homepage;

--
-- Name: contact_page_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homepage
--

ALTER SEQUENCE public.contact_page_data_id_seq OWNED BY public.contact_page_data.id;


--
-- Name: contact_page_data_locales; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.contact_page_data_locales (
    top_left_title character varying NOT NULL,
    top_left_text jsonb NOT NULL,
    id integer NOT NULL,
    _locale public._locales NOT NULL,
    _parent_id integer NOT NULL,
    top_right_title character varying NOT NULL,
    top_right_text jsonb NOT NULL,
    bottom_left_title character varying NOT NULL,
    bottom_left_text jsonb NOT NULL,
    bottom_right_title character varying NOT NULL,
    bottom_right_email character varying NOT NULL
);


ALTER TABLE public.contact_page_data_locales OWNER TO homepage;

--
-- Name: contact_page_data_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: homepage
--

CREATE SEQUENCE public.contact_page_data_locales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contact_page_data_locales_id_seq OWNER TO homepage;

--
-- Name: contact_page_data_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homepage
--

ALTER SEQUENCE public.contact_page_data_locales_id_seq OWNED BY public.contact_page_data_locales.id;


--
-- Name: home_page_data; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.home_page_data (
    id integer NOT NULL,
    updated_at timestamp(3) with time zone,
    created_at timestamp(3) with time zone
);


ALTER TABLE public.home_page_data OWNER TO homepage;

--
-- Name: home_page_data_id_seq; Type: SEQUENCE; Schema: public; Owner: homepage
--

CREATE SEQUENCE public.home_page_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.home_page_data_id_seq OWNER TO homepage;

--
-- Name: home_page_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homepage
--

ALTER SEQUENCE public.home_page_data_id_seq OWNED BY public.home_page_data.id;


--
-- Name: home_page_data_locales; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.home_page_data_locales (
    title character varying NOT NULL,
    location character varying NOT NULL,
    id integer NOT NULL,
    _locale public._locales NOT NULL,
    _parent_id integer NOT NULL
);


ALTER TABLE public.home_page_data_locales OWNER TO homepage;

--
-- Name: home_page_data_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: homepage
--

CREATE SEQUENCE public.home_page_data_locales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.home_page_data_locales_id_seq OWNER TO homepage;

--
-- Name: home_page_data_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homepage
--

ALTER SEQUENCE public.home_page_data_locales_id_seq OWNED BY public.home_page_data_locales.id;


--
-- Name: media; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.media (
    id integer NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    url character varying,
    thumbnail_u_r_l character varying,
    filename character varying,
    mime_type character varying,
    filesize numeric,
    width numeric,
    height numeric,
    focal_x numeric,
    focal_y numeric
);


ALTER TABLE public.media OWNER TO homepage;

--
-- Name: media_id_seq; Type: SEQUENCE; Schema: public; Owner: homepage
--

CREATE SEQUENCE public.media_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.media_id_seq OWNER TO homepage;

--
-- Name: media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homepage
--

ALTER SEQUENCE public.media_id_seq OWNED BY public.media.id;


--
-- Name: media_locales; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.media_locales (
    alt character varying NOT NULL,
    id integer NOT NULL,
    _locale public._locales NOT NULL,
    _parent_id integer NOT NULL
);


ALTER TABLE public.media_locales OWNER TO homepage;

--
-- Name: media_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: homepage
--

CREATE SEQUENCE public.media_locales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.media_locales_id_seq OWNER TO homepage;

--
-- Name: media_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homepage
--

ALTER SEQUENCE public.media_locales_id_seq OWNED BY public.media_locales.id;


--
-- Name: payload_kv; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.payload_kv (
    id integer NOT NULL,
    key character varying NOT NULL,
    data jsonb NOT NULL
);


ALTER TABLE public.payload_kv OWNER TO homepage;

--
-- Name: payload_kv_id_seq; Type: SEQUENCE; Schema: public; Owner: homepage
--

CREATE SEQUENCE public.payload_kv_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payload_kv_id_seq OWNER TO homepage;

--
-- Name: payload_kv_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homepage
--

ALTER SEQUENCE public.payload_kv_id_seq OWNED BY public.payload_kv.id;


--
-- Name: payload_locked_documents; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.payload_locked_documents (
    id integer NOT NULL,
    global_slug character varying,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.payload_locked_documents OWNER TO homepage;

--
-- Name: payload_locked_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: homepage
--

CREATE SEQUENCE public.payload_locked_documents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payload_locked_documents_id_seq OWNER TO homepage;

--
-- Name: payload_locked_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homepage
--

ALTER SEQUENCE public.payload_locked_documents_id_seq OWNED BY public.payload_locked_documents.id;


--
-- Name: payload_locked_documents_rels; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.payload_locked_documents_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    users_id integer,
    media_id integer,
    projects_id integer
);


ALTER TABLE public.payload_locked_documents_rels OWNER TO homepage;

--
-- Name: payload_locked_documents_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: homepage
--

CREATE SEQUENCE public.payload_locked_documents_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payload_locked_documents_rels_id_seq OWNER TO homepage;

--
-- Name: payload_locked_documents_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homepage
--

ALTER SEQUENCE public.payload_locked_documents_rels_id_seq OWNED BY public.payload_locked_documents_rels.id;


--
-- Name: payload_migrations; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.payload_migrations (
    id integer NOT NULL,
    name character varying,
    batch numeric,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.payload_migrations OWNER TO homepage;

--
-- Name: payload_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: homepage
--

CREATE SEQUENCE public.payload_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payload_migrations_id_seq OWNER TO homepage;

--
-- Name: payload_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homepage
--

ALTER SEQUENCE public.payload_migrations_id_seq OWNED BY public.payload_migrations.id;


--
-- Name: payload_preferences; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.payload_preferences (
    id integer NOT NULL,
    key character varying,
    value jsonb,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.payload_preferences OWNER TO homepage;

--
-- Name: payload_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: homepage
--

CREATE SEQUENCE public.payload_preferences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payload_preferences_id_seq OWNER TO homepage;

--
-- Name: payload_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homepage
--

ALTER SEQUENCE public.payload_preferences_id_seq OWNED BY public.payload_preferences.id;


--
-- Name: payload_preferences_rels; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.payload_preferences_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    users_id integer
);


ALTER TABLE public.payload_preferences_rels OWNER TO homepage;

--
-- Name: payload_preferences_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: homepage
--

CREATE SEQUENCE public.payload_preferences_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payload_preferences_rels_id_seq OWNER TO homepage;

--
-- Name: payload_preferences_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homepage
--

ALTER SEQUENCE public.payload_preferences_rels_id_seq OWNED BY public.payload_preferences_rels.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    image_id integer,
    date timestamp(3) with time zone
);


ALTER TABLE public.projects OWNER TO homepage;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: homepage
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.projects_id_seq OWNER TO homepage;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homepage
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: projects_links; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.projects_links (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    url character varying,
    icon public.enum_projects_links_icon
);


ALTER TABLE public.projects_links OWNER TO homepage;

--
-- Name: projects_links_locales; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.projects_links_locales (
    label character varying,
    id integer NOT NULL,
    _locale public._locales NOT NULL,
    _parent_id character varying NOT NULL
);


ALTER TABLE public.projects_links_locales OWNER TO homepage;

--
-- Name: projects_links_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: homepage
--

CREATE SEQUENCE public.projects_links_locales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.projects_links_locales_id_seq OWNER TO homepage;

--
-- Name: projects_links_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homepage
--

ALTER SEQUENCE public.projects_links_locales_id_seq OWNED BY public.projects_links_locales.id;


--
-- Name: projects_locales; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.projects_locales (
    name character varying NOT NULL,
    description jsonb NOT NULL,
    id integer NOT NULL,
    _locale public._locales NOT NULL,
    _parent_id integer NOT NULL
);


ALTER TABLE public.projects_locales OWNER TO homepage;

--
-- Name: projects_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: homepage
--

CREATE SEQUENCE public.projects_locales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.projects_locales_id_seq OWNER TO homepage;

--
-- Name: projects_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homepage
--

ALTER SEQUENCE public.projects_locales_id_seq OWNED BY public.projects_locales.id;


--
-- Name: projects_page_data; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.projects_page_data (
    id integer NOT NULL,
    updated_at timestamp(3) with time zone,
    created_at timestamp(3) with time zone
);


ALTER TABLE public.projects_page_data OWNER TO homepage;

--
-- Name: projects_page_data_id_seq; Type: SEQUENCE; Schema: public; Owner: homepage
--

CREATE SEQUENCE public.projects_page_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.projects_page_data_id_seq OWNER TO homepage;

--
-- Name: projects_page_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homepage
--

ALTER SEQUENCE public.projects_page_data_id_seq OWNED BY public.projects_page_data.id;


--
-- Name: projects_page_data_locales; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.projects_page_data_locales (
    title character varying NOT NULL,
    subtitle character varying NOT NULL,
    id integer NOT NULL,
    _locale public._locales NOT NULL,
    _parent_id integer NOT NULL
);


ALTER TABLE public.projects_page_data_locales OWNER TO homepage;

--
-- Name: projects_page_data_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: homepage
--

CREATE SEQUENCE public.projects_page_data_locales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.projects_page_data_locales_id_seq OWNER TO homepage;

--
-- Name: projects_page_data_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homepage
--

ALTER SEQUENCE public.projects_page_data_locales_id_seq OWNED BY public.projects_page_data_locales.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.users (
    id integer NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    email character varying NOT NULL,
    reset_password_token character varying,
    reset_password_expiration timestamp(3) with time zone,
    salt character varying,
    hash character varying,
    login_attempts numeric DEFAULT 0,
    lock_until timestamp(3) with time zone
);


ALTER TABLE public.users OWNER TO homepage;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: homepage
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO homepage;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homepage
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users_sessions; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.users_sessions (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    created_at timestamp(3) with time zone,
    expires_at timestamp(3) with time zone NOT NULL
);


ALTER TABLE public.users_sessions OWNER TO homepage;

--
-- Name: contact_page_data id; Type: DEFAULT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.contact_page_data ALTER COLUMN id SET DEFAULT nextval('public.contact_page_data_id_seq'::regclass);


--
-- Name: contact_page_data_bottom_right_links_locales id; Type: DEFAULT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.contact_page_data_bottom_right_links_locales ALTER COLUMN id SET DEFAULT nextval('public.contact_page_data_bottom_right_links_locales_id_seq'::regclass);


--
-- Name: contact_page_data_locales id; Type: DEFAULT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.contact_page_data_locales ALTER COLUMN id SET DEFAULT nextval('public.contact_page_data_locales_id_seq'::regclass);


--
-- Name: home_page_data id; Type: DEFAULT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.home_page_data ALTER COLUMN id SET DEFAULT nextval('public.home_page_data_id_seq'::regclass);


--
-- Name: home_page_data_locales id; Type: DEFAULT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.home_page_data_locales ALTER COLUMN id SET DEFAULT nextval('public.home_page_data_locales_id_seq'::regclass);


--
-- Name: media id; Type: DEFAULT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.media ALTER COLUMN id SET DEFAULT nextval('public.media_id_seq'::regclass);


--
-- Name: media_locales id; Type: DEFAULT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.media_locales ALTER COLUMN id SET DEFAULT nextval('public.media_locales_id_seq'::regclass);


--
-- Name: payload_kv id; Type: DEFAULT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.payload_kv ALTER COLUMN id SET DEFAULT nextval('public.payload_kv_id_seq'::regclass);


--
-- Name: payload_locked_documents id; Type: DEFAULT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.payload_locked_documents ALTER COLUMN id SET DEFAULT nextval('public.payload_locked_documents_id_seq'::regclass);


--
-- Name: payload_locked_documents_rels id; Type: DEFAULT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.payload_locked_documents_rels ALTER COLUMN id SET DEFAULT nextval('public.payload_locked_documents_rels_id_seq'::regclass);


--
-- Name: payload_migrations id; Type: DEFAULT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.payload_migrations ALTER COLUMN id SET DEFAULT nextval('public.payload_migrations_id_seq'::regclass);


--
-- Name: payload_preferences id; Type: DEFAULT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.payload_preferences ALTER COLUMN id SET DEFAULT nextval('public.payload_preferences_id_seq'::regclass);


--
-- Name: payload_preferences_rels id; Type: DEFAULT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.payload_preferences_rels ALTER COLUMN id SET DEFAULT nextval('public.payload_preferences_rels_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: projects_links_locales id; Type: DEFAULT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.projects_links_locales ALTER COLUMN id SET DEFAULT nextval('public.projects_links_locales_id_seq'::regclass);


--
-- Name: projects_locales id; Type: DEFAULT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.projects_locales ALTER COLUMN id SET DEFAULT nextval('public.projects_locales_id_seq'::regclass);


--
-- Name: projects_page_data id; Type: DEFAULT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.projects_page_data ALTER COLUMN id SET DEFAULT nextval('public.projects_page_data_id_seq'::regclass);


--
-- Name: projects_page_data_locales id; Type: DEFAULT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.projects_page_data_locales ALTER COLUMN id SET DEFAULT nextval('public.projects_page_data_locales_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: contact_page_data; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.contact_page_data (id, updated_at, created_at) FROM stdin;
1	2025-12-28 00:36:18.016+13	2025-12-28 00:36:03.765+13
\.


--
-- Data for Name: contact_page_data_bottom_right_links; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.contact_page_data_bottom_right_links (_order, _parent_id, id, icon) FROM stdin;
1	1	69575e522f047c3e56db46a0	mail
2	1	6955d90585bcb935b4b1d05b	resume
3	1	6955d91385bcb935b4b1d05d	github
4	1	69575d1c2f047c3e56db469e	linkedin
\.


--
-- Data for Name: contact_page_data_bottom_right_links_locales; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.contact_page_data_bottom_right_links_locales (label, id, _locale, _parent_id, url) FROM stdin;
email	116	en	69575e522f047c3e56db46a0	mailto:contact@yoni-firroloni.com
E-mail	117	fr	69575e522f047c3e56db46a0	mailto:contact@vagahbond.com
Resume	118	en	6955d90585bcb935b4b1d05b	https://nuage.vagahbond.com/s/KnYmaAF75B4dHWd
CV	119	fr	6955d90585bcb935b4b1d05b	https://nuage.vagahbond.com/s/KnYmaAF75B4dHWd
Github	120	en	6955d91385bcb935b4b1d05d	https://github.com/Vagahbond
Github	121	fr	6955d91385bcb935b4b1d05d	https://github.com/Vagahbond
Linkedin	122	en	69575d1c2f047c3e56db469e	https://nz.linkedin.com/in/yoni-firroloni-%F0%9F%92%BB-a5002b153
Linkedin	123	fr	69575d1c2f047c3e56db469e	https://nz.linkedin.com/in/yoni-firroloni-%F0%9F%92%BB-a5002b153
\.


--
-- Data for Name: contact_page_data_locales; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.contact_page_data_locales (top_left_title, top_left_text, id, _locale, _parent_id, top_right_title, top_right_text, bottom_left_title, bottom_left_text, bottom_right_title, bottom_right_email) FROM stdin;
Simple solutions to complex problems	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "In an era where it is increasingly common to seek ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "simplicity", "type": "text", "style": "", "detail": 0, "format": 17, "version": 1}, {"mode": "normal", "text": " in processes, we tend to forget the importance of ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "simple", "type": "text", "style": "", "detail": 0, "format": 17, "version": 1}, {"mode": "normal", "text": " solutions delivery.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "My philosophy is that any problem, however ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "complex", "type": "text", "style": "", "detail": 0, "format": 17, "version": 1}, {"mode": "normal", "text": ", has a relatively ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "simple", "type": "text", "style": "", "detail": 0, "format": 17, "version": 1}, {"mode": "normal", "text": " and ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "clear", "type": "text", "style": "", "detail": 0, "format": 17, "version": 1}, {"mode": "normal", "text": " solution.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "While having your priorities respected, get delivered simple, streamlined solutions with a strong anticipation for technical debt and maintenance needs.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Contact me today for an efficient, and organic approach to understanding your projects and making them a reality.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	47	en	1	Educated and self taught	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "As important as theory can be in many fields of computer science, real-life experience cannot be replaced.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "As powerful as experience can be for understanding problems, finding innovative solutions is hard without backing it with strong theory.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "With a master's degree and more than 5 years of a diverse professional experience, I have the versatility to tackle most software development needs and get up to speed quickly in tech stacks that I have never worked with before.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Constant practice through diverse projects entertains an interest in techs and provides a positive mindset and a curiosity that are needed to make the most out of this expertise.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	More about me	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "I am a 26 year old software engineer with an active, lazy mindset.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "When I have to do something, I like to find ways to be able to get the same result with less effort the next time.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This mentality led me to becoming a programmer with a strong interest in \\"things as code\\". As an example, nix (IaS) is probably the language I have spent the most time on within my latest personal projects.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "I am also interested in privacy online and freedom in tech.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	Find me on the internet	contact@yoni-firroloni.com
Des solutions simples à des problèmes complexes	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dans une ère ou la recherche de simplicité dans les processus, on tend à oublier l'importance de la simplicité des solutions.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Ma philosophie est que tout problème, aussi complexe qu'il soit, a une solution simple.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Tout en respectant vos priorités, je produit des livrables simples et efficaces, avec une forte attention portée à la dette technique et la réduction du besoin de maintenance.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Faites appel à mes services pour une approche plus humaine et efficace à la compréhension de vos projets et à leur réalisation. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	48	fr	1	Dipplomé et auto-didacte	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Aussi importante que puisse être la théorie en informatique, elle ne peut pas remplacer l'experience du terrain.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "De son côté, si l'experience aide à comprendre les besoins des clients, elle ne suffit pas à apporter des solutions innovantes qui necessitent des compétences théoriques.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Avec un master en architecture logicielle et 5 ans d'expérience à divers postes, j'ai la polyvalence necessaire pour travailler sur et m'adapter à toute sorte de projets, y compris avec des technologies et outils que je ne connais pas initialement.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Avec une veille constante à travers des projets personnels, j'entretiens un fort interêt pour la tech et une attitude positive pour mettre cette expertise en pratique dans les meilleurs conditions possible.  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	À propos de moi	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Je suis un développeur de 26 ans, actif et paresseux : Quand je dois faire quelque chose, j'aime m'assurer que la tâche sera plus simple la fois suivante.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Cette mentalité m'a poussé à devenir un développeur, avec aujourd'hui un fort interêt pour les choses ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "as code", "type": "text", "style": "", "detail": 0, "format": 16, "version": 1}, {"mode": "normal", "text": ". Par exemple, ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "nix", "type": "text", "style": "", "detail": 0, "format": 16, "version": 1}, {"mode": "normal", "text": " (IaS) est probablement un des langages que je manipule le plus.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Je m'interesse aussi beaucoup à la protection de la vie privée et la liberté en ligne.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	Me trouver en ligne	contact@vagahbond.com
\.


--
-- Data for Name: home_page_data; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.home_page_data (id, updated_at, created_at) FROM stdin;
1	2025-12-28 19:48:05.22+13	2025-12-28 19:48:05.22+13
\.


--
-- Data for Name: home_page_data_locales; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.home_page_data_locales (title, location, id, _locale, _parent_id) FROM stdin;
Software engineer	New Zealand	2	en	1
Développeur	Nouvelle Zélande	3	fr	1
\.


--
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.media (id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y) FROM stdin;
1	2025-12-18 22:23:26.455+13	2025-12-18 22:23:26.455+13	\N	\N	6e9131314ed1b8a733eca19e0dcde755c021aa24.jpg	image/jpeg	19763913	4096	3072	50	50
2	2025-12-18 22:25:12.853+13	2025-12-18 22:25:12.852+13	\N	\N	b4a3d7025c3c0beac12a0cb60a71d09266be62e4.jpg	image/jpeg	7044188	4096	2731	50	50
3	2025-12-18 22:25:56.112+13	2025-12-18 22:25:56.112+13	\N	\N	icon-only.ico	image/x-icon	196252	\N	\N	\N	\N
4	2025-12-18 22:26:54.312+13	2025-12-18 22:26:54.312+13	\N	\N	Screen Shot 2025-11-18 at 17.27.22.png	image/png	235841	1440	3202	50	50
5	2025-12-18 22:27:45.612+13	2025-12-18 22:27:45.612+13	\N	\N	Screenshot 2025-12-12 at 20-52-43 Search - Odo.png	image/png	847814	2820	4454	50	50
6	2025-12-28 00:27:13.194+13	2025-12-28 00:27:13.194+13	\N	\N	PXL_20241012_045445199.jpg	image/jpeg	1882373	4080	3072	50	50
7	2026-01-02 20:11:25.685+13	2026-01-02 20:11:25.685+13	\N	\N	20260102_201044.png	image/png	155896	2256	1312	50	50
8	2026-01-14 09:59:47.314+13	2026-01-14 09:59:47.314+13	\N	\N	Diagram.png	image/png	29561	1767	991	50	50
9	2026-01-14 10:05:23.63+13	2026-01-14 10:05:23.63+13	\N	\N	image.png	image/png	174253	1767	991	50	50
10	2026-01-14 10:31:53.056+13	2026-01-14 10:29:16.334+13	/api/media/file/image-1.png	\N	image-1.png	image/png	106897	1392	744	50	50
12	2026-02-12 20:29:59.076+13	2026-02-12 20:28:02.129+13	/api/media/file/2025-02-02T0006431407956621100.webp	\N	2025-02-02T0006431407956621100.webp	image/webp	70312	2194	1462	50	50
11	2026-02-12 20:30:52.792+13	2026-02-12 20:13:25.647+13	/api/media/file/guncraft-screenshot-1028168036.jpg	\N	guncraft-screenshot-1028168036.jpg	image/jpeg	55303	1020	574	50	50
13	2026-02-12 20:33:44.989+13	2026-02-12 20:33:44.989+13	\N	\N	Screenshot 2026-02-12 at 20-32-20 Introduction Uni-verse.png	image/png	709313	2146	2408	50	50
14	2026-02-12 20:53:07.497+13	2026-02-12 20:53:07.497+13	\N	\N	Screenshot 2026-02-12 at 20-51-45 Advent of Code 2023.png	image/png	433941	2524	1782	50	50
15	2026-02-12 21:10:10.995+13	2026-02-12 21:10:10.994+13	\N	\N	Screenshot 2026-02-12 at 21-09-48 spreadsheet-to-invoiceshelf_README.md at master · Vagahbond_spreadsheet-to-invoiceshelf.png	image/png	153620	2076	996	50	50
16	2026-02-12 21:20:37.363+13	2026-02-12 21:20:37.363+13	\N	\N	Screenshot 2026-02-12 at 21-20-23 Rustlings.png	image/png	339105	2018	1206	50	50
17	2026-02-12 21:34:24.308+13	2026-02-12 21:34:24.308+13	\N	\N	98485695.png	image/png	5782	120	120	50	50
18	2026-02-12 21:40:09.669+13	2026-02-12 21:40:09.669+13	\N	\N	Screenshot 2026-02-12 at 21-39-52 Vagahbond_hyprspace Woooooooooaaaa hyprland in spaaaaace.png	image/png	1259490	1620	1080	50	50
19	2026-02-12 21:46:49.589+13	2026-02-12 21:46:49.588+13	\N	\N	Screenshot 2026-02-12 at 21-46-26 cours-example_Chapter-1_MentorD.yml at master · Vagahbond_cours-example.png	image/png	86890	1814	472	50	50
20	2026-02-12 21:57:31.981+13	2026-02-12 21:57:31.981+13	\N	\N	1_dGEwUHQvBY3bAddEyczVEw.webp	image/webp	43354	1400	788	50	50
21	2026-02-12 22:02:18.551+13	2026-02-12 22:02:18.551+13	\N	\N	Screenshot 2026-02-12 at 22-02-04 megumin-lang_main.mg at master · Vagahbond_megumin-lang.png	image/png	62163	2456	520	50	50
\.


--
-- Data for Name: media_locales; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.media_locales (alt, id, _locale, _parent_id) FROM stdin;
Image of the interface used to fill up this website	1	en	7
A diagram of my nix architecture	2	en	8
Nix configuration diagram	3	en	9
Nix diagram	5	en	10
Diagramme de Nix	6	fr	10
My rice made using rice-cooker	9	en	12
Ma rice faite avec nix-cooker	10	fr	12
A screenshot of Guncraft, the inspiration for Guncruft	11	en	11
Une capture d'écran de Guncraft, dont est inspiré Guncruft	12	fr	11
Uni-verse's documentation	13	en	13
Advent of Code	14	en	14
A template for using spreadsheet-to-invoiceshelf	15	en	15
Rustlings	16	en	16
A Piet code image	17	en	17
A screenshot of what Hyprspace did	18	fr	18
A MentoreD configuraiton file	19	fr	19
A blockchain schema	20	en	20
Megumin code snippet	21	fr	21
\.


--
-- Data for Name: payload_kv; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.payload_kv (id, key, data) FROM stdin;
\.


--
-- Data for Name: payload_locked_documents; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.payload_locked_documents (id, global_slug, updated_at, created_at) FROM stdin;
\.


--
-- Data for Name: payload_locked_documents_rels; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.payload_locked_documents_rels (id, "order", parent_id, path, users_id, media_id, projects_id) FROM stdin;
\.


--
-- Data for Name: payload_migrations; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.payload_migrations (id, name, batch, updated_at, created_at) FROM stdin;
1	dev	-1	2026-02-12 19:40:26.628+13	2025-12-17 21:14:43.66+13
\.


--
-- Data for Name: payload_preferences; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.payload_preferences (id, key, value, updated_at, created_at) FROM stdin;
2	collection-projects	{"limit": 10, "editViewType": "default"}	2025-12-17 21:26:21.012+13	2025-12-17 21:25:02.699+13
3	collection-media	{"editViewType": "default"}	2025-12-18 22:23:07.491+13	2025-12-18 22:23:00.699+13
5	collection-contactPageData	{"limit": 10, "editViewType": "default"}	2025-12-28 00:05:07.333+13	2025-12-27 23:36:57.387+13
6	global-contactPageData	{"editViewType": "default"}	2025-12-28 00:09:21.078+13	2025-12-28 00:09:21.079+13
1	collection-users	{"limit": 10}	2025-12-28 00:24:13.138+13	2025-12-17 21:15:05.108+13
8	global-homePageData	{"editViewType": "default"}	2025-12-28 19:47:06.152+13	2025-12-28 19:47:06.154+13
9	global-projectsPageData	{"editViewType": "default"}	2025-12-28 19:54:40.332+13	2025-12-28 19:54:40.333+13
7	locale	"fr"	2026-02-12 22:11:16.876+13	2025-12-28 00:25:16.154+13
\.


--
-- Data for Name: payload_preferences_rels; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.payload_preferences_rels (id, "order", parent_id, path, users_id) FROM stdin;
4	\N	2	user	1
6	\N	3	user	1
78	\N	7	user	1
11	\N	5	user	1
12	\N	6	user	1
13	\N	1	user	1
30	\N	8	user	1
32	\N	9	user	1
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.projects (id, updated_at, created_at, image_id, date) FROM stdin;
7	2026-02-12 19:58:42.992+13	2026-01-02 20:12:03.553+13	7	2026-01-03 01:00:00+13
9	2026-02-12 20:16:31.192+13	2026-02-12 20:13:28.712+13	11	2025-04-13 00:00:00+12
10	2026-02-12 20:29:24.475+13	2026-02-12 20:22:40.761+13	12	2024-05-09 00:00:00+12
11	2026-02-12 20:41:04.02+13	2026-02-12 20:38:12.84+13	13	2024-07-21 00:00:00+12
12	2026-02-12 21:00:11.637+13	2026-02-12 20:48:16.186+13	14	2024-12-02 01:00:00+13
13	2026-02-12 21:13:01.775+13	2026-02-12 21:06:51.026+13	15	2024-12-06 01:00:00+13
14	2026-02-12 21:22:25.297+13	2026-02-12 21:21:41.467+13	16	2024-10-21 01:00:00+13
15	2026-02-12 21:35:25.321+13	2026-02-12 21:34:47.132+13	17	2022-02-17 01:00:00+13
16	2026-02-12 21:41:57.473+13	2026-02-12 21:41:11.754+13	18	2023-11-09 01:00:00+13
17	2026-02-12 21:50:42.73+13	2026-02-12 21:49:25.312+13	19	2023-02-10 01:00:00+13
18	2026-02-12 21:57:55.6+13	2026-02-12 21:55:45.989+13	20	2022-02-23 01:00:00+13
19	2026-02-12 22:06:08.417+13	2026-02-12 22:04:55.562+13	21	2020-02-07 01:00:00+13
8	2026-02-12 22:11:20.54+13	2026-01-07 21:33:08.324+13	10	2026-01-14 01:00:00+13
\.


--
-- Data for Name: projects_links; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.projects_links (_order, _parent_id, id, url, icon) FROM stdin;
1	12	698d85ac1f9c6b0b47e99ced	https://github.com/Vagahbond/AoC-2024	github
2	12	698d85c31f9c6b0b47e99cef	https://github.com/Vagahbond/advent-of-code/tree/main/2023	github
1	13	698d8b1c1f9c6b0b47e99cf1	https://github.com/Vagahbond/spreadsheet-to-invoiceshelf	repo
1	14	698d8d5c1f9c6b0b47e99cf3	https://github.com/Vagahbond/rustlings	repo
1	15	698d90931f9c6b0b47e99cf5	https://github.com/NFpieT	repo
1	16	698d911b1f9c6b0b47e99cf7	https://github.com/Vagahbond/hyprspace	repo
1	17	698d93031f9c6b0b47e99cf9	https://github.com/Vagahbond/CoursesFrontend	repo
1	18	698d949a1f9c6b0b47e99cfb	https://github.com/Vagahbond/simple-blockchain	repo
1	19	698d96c81f9c6b0b47e99cfd	https://github.com/Vagahbond/megumin-lang	repo
1	8	6966b30b726b707b07249145	https://github.com/Vagahbond/nix-config	github
2	8	6966b42f726b707b07249147	https://vagahbond.github.io/nix-config/	doc
1	7	695770178e408a69ec2e8a0a	https://github.com/Vagahbond/homepage	repo
2	7	6957707d8e408a69ec2e8a0c	https://yoni-firroloni.com	try
1	9	698d7dab1f9c6b0b47e99ce3	https://github.com/Vagahbond/guncruft	github
1	10	698d800b1f9c6b0b47e99ce5	https://github.com/Vagahbond/nix-cooker	github
1	11	698d83411f9c6b0b47e99ce7	https://github.com/uni-verse-fm	repo
2	11	698d83dc1f9c6b0b47e99ceb	https://uni-verse-fm.github.io/	doc
\.


--
-- Data for Name: projects_links_locales; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.projects_links_locales (label, id, _locale, _parent_id) FROM stdin;
Repo	71	en	698d7dab1f9c6b0b47e99ce3
Repo	72	fr	698d7dab1f9c6b0b47e99ce3
Repo	75	en	698d800b1f9c6b0b47e99ce5
Repo	76	fr	698d800b1f9c6b0b47e99ce5
Organisation	81	en	698d83411f9c6b0b47e99ce7
Organisation	82	fr	698d83411f9c6b0b47e99ce7
Documentation	83	en	698d83dc1f9c6b0b47e99ceb
Documentation	84	fr	698d83dc1f9c6b0b47e99ceb
2024	96	en	698d85ac1f9c6b0b47e99ced
2024	97	fr	698d85ac1f9c6b0b47e99ced
2023	98	en	698d85c31f9c6b0b47e99cef
2023	99	fr	698d85c31f9c6b0b47e99cef
Repo	102	en	698d8b1c1f9c6b0b47e99cf1
Repo	103	fr	698d8b1c1f9c6b0b47e99cf1
Repo	105	en	698d8d5c1f9c6b0b47e99cf3
Repo	106	fr	698d8d5c1f9c6b0b47e99cf3
Organization	108	en	698d90931f9c6b0b47e99cf5
Repo	109	fr	698d90931f9c6b0b47e99cf5
Repo	113	en	698d911b1f9c6b0b47e99cf7
Repo	114	fr	698d911b1f9c6b0b47e99cf7
Repo	118	en	698d93031f9c6b0b47e99cf9
Repo	119	fr	698d93031f9c6b0b47e99cf9
Sources	66	en	695770178e408a69ec2e8a0a
Code source	67	fr	695770178e408a69ec2e8a0a
Production	68	en	6957707d8e408a69ec2e8a0c
Production	69	fr	6957707d8e408a69ec2e8a0c
Repo	131	en	698d949a1f9c6b0b47e99cfb
Repo	132	fr	698d949a1f9c6b0b47e99cfb
Repo	136	en	698d96c81f9c6b0b47e99cfd
Repo	137	fr	698d96c81f9c6b0b47e99cfd
Github	138	en	6966b30b726b707b07249145
Github	139	fr	6966b30b726b707b07249145
Doc	140	en	6966b42f726b707b07249147
Doc	141	fr	6966b42f726b707b07249147
\.


--
-- Data for Name: projects_locales; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.projects_locales (name, description, id, _locale, _parent_id) FROM stdin;
Simple blockchain	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "For fun and for science I took the challenge to implement ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"id": "698d954c2da38925783ffda6", "type": "link", "fields": {"url": "https://levelup.gitconnected.com/learn-blockchain-by-building-it-f2f8ccc54892", "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "this tutorial", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"mode": "normal", "text": " in C++.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "It consists in implementing a simplified blockchain system.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	95	en	18
Simple blockchain	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Pour le plaisir et pour la science, j'ai relevé le défi de mettre en œuvre ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"id": "698d95bf2da38925783ffdad", "type": "link", "fields": {"url": "https://levelup.gitconnected.com/learn-blockchain-by-building-it-f2f8ccc54892", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "ce tutoriel", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"mode": "normal", "text": " en C++.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Il consiste à mettre en œuvre un système de blockchain simplifié.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	96	fr	18
Homepage	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This project is the website you are currently looking at. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Made with ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"id": "6957712949eaafa084a46f1d", "type": "link", "fields": {"url": "https://svelte.dev/docs/kit/introduction", "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "SvelteKit", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"mode": "normal", "text": " for the frontend, and ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"id": "6957715149eaafa084a46f1e", "type": "link", "fields": {"url": "https://payloadcms.com/", "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "PayloadCMS", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"mode": "normal", "text": " for the backend. Sveltekit allows building fully bundled static websites with prefetched assets and data.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "It is packaged using the nix package manager, that runs the CMS and the frontend's build in an isolated environment and outputs a static website that is then served by a nginx instance.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	37	en	7
Rustlings	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Rustlings is an interesting project to start learning Rust with practical challenges.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "As thousands of people, I completed it in order to start working with Rust. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	69	en	14
Rustlings	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Rustlings est un projet intéressant pour commencer à apprendre Rust à travers des défis pratiques.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Comme des milliers d'autres personnes, je l'ai terminé afin de pouvoir commencer à travailler avec Rust. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	70	fr	14
MentoreD	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "MentoreD is a concept of courses as code. It allows creating courses as Github Repo, with markdown files for content and yml configuration files for authorization.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "It include creating course content and exercises.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	82	en	17
MentoreD	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "MentoreD est un concept de cours sous forme de code. Il permet de créer des cours sous forme de dépôt Github, avec des fichiers Markdown pour le contenu et des fichiers de configuration YML pour l'autorisation.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Il comprend la création du contenu du cours et des exercices.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	83	fr	17
Site vitrine	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Ce projet est le site que vous avez sous les yeux. Fait avec ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"id": "6957712949eaafa084a46f1d", "type": "link", "fields": {"url": "https://svelte.dev/docs/kit/introduction", "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "SvelteKit", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"mode": "normal", "text": " pour le frontend, et ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"id": "6957715149eaafa084a46f1e", "type": "link", "fields": {"url": "https://payloadcms.com/", "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "PayloadCMS", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"mode": "normal", "text": " pour le backend.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Sveltekit permet de générer des sites statiques léger et rapides grâce à des systèmes de pré-requêtes.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Il est mis en production grâce à nix. Celui-ci fait tourner PayloadCMS en arrière plan et prépare le frontend dans un environnement isolé, puis produit un site statique servi par NginX. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	38	fr	7
NFpieT	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "During the blockchain and NFT bubble, there was a blockchain assignment at my uni. I created this decentralized app on the Etherum network. NFpieT is a NFT that is runnable. Each token is an image that represents Piet code (images that represent code). For technical reasons, those NFTs are stored as JSON and I had to implement a parser for it from scratch in the Sol language, as it was all new at the time.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	72	en	15
NFpieT	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Pendant la bulle blockchain et NFT, il y avait un devoir sur la blockchain à mon université. J'ai créé cette application décentralisée sur le réseau Ethereum. NFpieT est un NFT exécutable. Chaque jeton est une image qui représente le code Piet (des images qui représentent du code). Pour des raisons techniques, ces NFT sont stockés au format JSON et j'ai dû implémenter un analyseur syntaxique pour cela à partir de zéro dans le langage Sol, car tout cela était nouveau à l'époque.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	73	fr	15
Megumin-lang	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "MeguminLang is a programming language that I created as a language theory assessment at the uni, using Python and yacc.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "It is inspired by a character from KonoSuba, an anime.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	100	en	19
Megumin-lang	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "MeguminLang est un langage de programmation que j'ai créé dans le cadre d'un examen théorique sur les langages à l'université, à l'aide de Python et de yacc.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Il s'inspire d'un personnage de l'anime KonoSuba.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	101	fr	19
Guncruft	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "As a fan of Guncraft, an old discontinued video-game, I decided to re-create something similar. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This project is still work in progress. It is relying on ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"id": "698d7d4a2da38925783ffda3", "type": "link", "fields": {"url": "https://bevy.org/", "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Bevy", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"mode": "normal", "text": ", written in Rust. This stack allows for a very optimized game that should run on most hardware, while reproducing the nervous and snappy experience of the original Guncraft game. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	41	en	9
Guncruft	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "En tant que fan de Guncraft, un ancien jeu vidéo qui n'est plus commercialisé, j'ai décidé de recréer quelque chose de similaire.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Ce projet est encore en cours de développement. Il s'appuie sur Bevy, écrit en Rust. Cette stack permet d'obtenir un jeu très optimisé qui devrait fonctionner sur la plupart des matériels, tout en reproduisant l'expérience nerveuse et rapide du jeu Guncraft original. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	42	fr	9
Nix-cooker	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Nix-cooker allows managing rices (Customized linux desktop interfaces) in a tidy way in a multi-host nix configuration.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "It provides a module to define color schemes, GTK themes, wallpapers, fonts, configuration file templates, and many other.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "It is currently usable but meant to be completed in order to be used instead of home-manager as a minimalist alternative. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	46	en	10
Rice-cooker	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Nix-cooker permet de gérer les rice (interfaces de bureau Linux personnalisées) de manière ordonnée dans une configuration Nix multi-hôtes.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Il fournit un module permettant de définir des schémas de couleurs, des thèmes GTK, des fonds d'écran, des polices, des modèles de fichiers de configuration et bien d'autres éléments.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Il est actuellement utilisable, mais devrait être complété afin de pouvoir remplacer home-manager en tant qu'alternative minimaliste.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	47	fr	10
Uni-verse	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Uni-verse is a uni project that was made in a team. It is a music platform replicating Soundcloud's features, with the addition of an audio-fingerprinting feature (Similar to Shazam). It has a back-end REST API, a front-end web app, and a mobile semi-native app, associated with a fingerprinting service relying on RabbitMQ.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "I periodically pick this project up, adding documentation and trying to make it functional and viable again.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	51	en	11
uni-verse	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Uni-verse est un projet universitaire réalisé en équipe. Il s'agit d'une plateforme musicale reproduisant les fonctionnalités de Soundcloud, avec en plus une fonctionnalité d'empreinte audio (similaire à Shazam). Elle dispose d'une API REST back-end, d'une application web front-end et d'une application mobile semi-native, associées à un service d'empreinte audio s'appuyant sur RabbitMQ.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Je reprends régulièrement ce projet, j'ajoute de la documentation et j'essaie de le rendre à nouveau fonctionnel et viable.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Traduit avec DeepL.com (version gratuite)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	52	fr	11
Nix configuration	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "I rely on a diverse infrastructure, with, at a point , 2 laptops, a desktop PC and a VPS. With a great interest in customization, and reluctance to do things several times, nix allowed me to have a single repository managing all of my machines. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This project is the code that defines all the infrastructure I use.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	102	en	8
Advent of code	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Yearly, the advent of code opens its doors. It is the opportunity to test and to improve problem solving skills. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "When I have the necessary spare time, I like to tackle this challenge.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "In 2023, I took the challenge to solve every day with a different language.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	59	en	12
Advent of Code	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Chaque année, le calendrier de l'avent du code ouvre ses portes. C'est l'occasion de tester et d'améliorer ses compétences en matière de résolution de problèmes. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Lorsque j'ai le temps nécessaire, j'aime relever ce défi.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "En 2023, j'ai relevé le défi de résoudre chaque jour avec un langage différent.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	60	fr	12
Configuration nix	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Pour mon travail, je dépend d'une architecture diverse, avec au plus haut 2 PC portables, 1 PC fixe, et un VPS. Mon interêt pour la customisation et mon désinterêt pour la répétition m'ont poussé à créer un répo nix qui gère tous mes postes. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Ce projet contient le code qui définit toute mon infrastructure.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	103	fr	8
HyprSpace	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The Hyprland (A Wayland Tiling Compositor) community organized a competition for the most creative Rice (Custom Linux desktop interface). I created this plugin for this competition, using C++, that transforms windows in comets.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	77	en	16
HyprSpace	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "La communauté Hyprland (un compositeur de mosaïque Wayland) a organisé un concours pour récompenser le Rice (interface de bureau Linux personnalisée) le plus créatif. J'ai créé ce plugin pour ce concours, en utilisant C++, qui transforme les fenêtres en comètes.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	78	fr	16
spreadsheet-to-invoiceshelf	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "InvoiceShelf is a self-hostable web app for creating and storing invoices as a small business. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "During one onf my previous contracts, I was constrained to logging my time on an Excel file. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "I created this CLI tool with rust so I could transform my Excel file into InvoiceShelf format so I could import it.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	66	en	13
Spreadsheet-to-invoiceshelf	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "InvoiceShelf est une application web auto-hébergée permettant aux petites entreprises de créer et de stocker leurs factures.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Au cours d'un de mes précédents contrats, j'étais obligé d'enregistrer mes heures de travail dans un fichier Excel.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "J'ai créé cet outil CLI avec Rust afin de pouvoir convertir mon fichier Excel au format InvoiceShelf et l'importer.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	67	fr	13
\.


--
-- Data for Name: projects_page_data; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.projects_page_data (id, updated_at, created_at) FROM stdin;
1	2025-12-28 19:55:39.968+13	2025-12-28 19:55:39.968+13
\.


--
-- Data for Name: projects_page_data_locales; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.projects_page_data_locales (title, subtitle, id, _locale, _parent_id) FROM stdin;
Practice makes perfect	Constantly building the expertise your enterprise needs.	24	en	1
C'est en forgeant qu'on devient forgeron.	Un travail constant, pour livrer des solutions qualitatives.	25	fr	1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.users (id, updated_at, created_at, email, reset_password_token, reset_password_expiration, salt, hash, login_attempts, lock_until) FROM stdin;
1	2026-01-14 09:30:03.775+13	2025-12-17 21:15:02.465+13	vagahbond@pm.me	\N	\N	075999745062ba90e8efe7be679ca1ec3bacb49e92d4dd33c3ca31ea653c7b55	879d584ba8c7e013c0c82ed50da3e77c6b22921c1f62759ab5d371e657a2cb483e478c06aaebd101f59dc5e0d2c0009a13010f7ac6ebc227279845439e478de58b941624899ded3ecd420163b7942b748cd925c56917f73a94e9d355997a85da74f24ec9b2ea0b5d338d4d53496e4f20dd25dac7aabb3bd7da0c0af034344137fca899a2bb4fc907144fb5c72b55749627209a6b1ba43dbd9b425533eb151f2741ecbed4f6a1d0f1074790afd1391af01c2b641e3bffa3919791cc7d5069daa7a2d24cf6c80679e4c8af0586e5c3da551d866a9bd5a0d06bd5c8dc6d73f24481cf24a3dbf32aaa14e88b6a75739a6d3771d19f307b4c38a10a30f3552236521e19a7b9af119db69bd448cc4f3859db8adedb66e65c058c5ec45650f4cea261e27a0d9f0a3d0dcafcf4ba41a6cd8c3c885ef56ff09c149042a9fed53c27177b155a04ed89c1346663b04f7c94b4f051d3e59eb0ac4a4bd91882c3f4f675a58b5e1214227cd0c2a1caf4c06e678fa5206dcdea4b1fa4f99ae30de5ea3267e94989ad12fec1c61db5369017b6c5e23a825f7e1928bc585b94331e8516efcfb55fb50c10ff7fbf9fcc1adf97a4610bdb5f583f53a6b631e02eb58531cba74e47dc011105891f5ddf1535ed94f9540c9263578cb42de0acedec7c23bca0428067264cd52e498f7ed9ef96846ad43b559e7c7e7b4579a66628852672522e51cb8f4d90	0	\N
\.


--
-- Data for Name: users_sessions; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.users_sessions (_order, _parent_id, id, created_at, expires_at) FROM stdin;
1	1	e140961d-46f9-4a12-9784-230ae768e7cf	2026-02-12 19:28:01.731+13	2026-02-12 23:26:08.492+13
\.


--
-- Name: contact_page_data_bottom_right_links_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.contact_page_data_bottom_right_links_locales_id_seq', 123, true);


--
-- Name: contact_page_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.contact_page_data_id_seq', 1, true);


--
-- Name: contact_page_data_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.contact_page_data_locales_id_seq', 48, true);


--
-- Name: home_page_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.home_page_data_id_seq', 1, true);


--
-- Name: home_page_data_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.home_page_data_locales_id_seq', 3, true);


--
-- Name: media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.media_id_seq', 21, true);


--
-- Name: media_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.media_locales_id_seq', 21, true);


--
-- Name: payload_kv_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.payload_kv_id_seq', 1, false);


--
-- Name: payload_locked_documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.payload_locked_documents_id_seq', 118, true);


--
-- Name: payload_locked_documents_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.payload_locked_documents_rels_id_seq', 178, true);


--
-- Name: payload_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.payload_migrations_id_seq', 1, true);


--
-- Name: payload_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.payload_preferences_id_seq', 9, true);


--
-- Name: payload_preferences_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.payload_preferences_rels_id_seq', 78, true);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.projects_id_seq', 19, true);


--
-- Name: projects_links_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.projects_links_locales_id_seq', 141, true);


--
-- Name: projects_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.projects_locales_id_seq', 103, true);


--
-- Name: projects_page_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.projects_page_data_id_seq', 1, true);


--
-- Name: projects_page_data_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.projects_page_data_locales_id_seq', 25, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: contact_page_data_bottom_right_links_locales contact_page_data_bottom_right_links_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.contact_page_data_bottom_right_links_locales
    ADD CONSTRAINT contact_page_data_bottom_right_links_locales_pkey PRIMARY KEY (id);


--
-- Name: contact_page_data_bottom_right_links contact_page_data_bottom_right_links_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.contact_page_data_bottom_right_links
    ADD CONSTRAINT contact_page_data_bottom_right_links_pkey PRIMARY KEY (id);


--
-- Name: contact_page_data_locales contact_page_data_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.contact_page_data_locales
    ADD CONSTRAINT contact_page_data_locales_pkey PRIMARY KEY (id);


--
-- Name: contact_page_data contact_page_data_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.contact_page_data
    ADD CONSTRAINT contact_page_data_pkey PRIMARY KEY (id);


--
-- Name: home_page_data_locales home_page_data_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.home_page_data_locales
    ADD CONSTRAINT home_page_data_locales_pkey PRIMARY KEY (id);


--
-- Name: home_page_data home_page_data_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.home_page_data
    ADD CONSTRAINT home_page_data_pkey PRIMARY KEY (id);


--
-- Name: media_locales media_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.media_locales
    ADD CONSTRAINT media_locales_pkey PRIMARY KEY (id);


--
-- Name: media media_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_pkey PRIMARY KEY (id);


--
-- Name: payload_kv payload_kv_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.payload_kv
    ADD CONSTRAINT payload_kv_pkey PRIMARY KEY (id);


--
-- Name: payload_locked_documents payload_locked_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.payload_locked_documents
    ADD CONSTRAINT payload_locked_documents_pkey PRIMARY KEY (id);


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_pkey PRIMARY KEY (id);


--
-- Name: payload_migrations payload_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.payload_migrations
    ADD CONSTRAINT payload_migrations_pkey PRIMARY KEY (id);


--
-- Name: payload_preferences payload_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.payload_preferences
    ADD CONSTRAINT payload_preferences_pkey PRIMARY KEY (id);


--
-- Name: payload_preferences_rels payload_preferences_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.payload_preferences_rels
    ADD CONSTRAINT payload_preferences_rels_pkey PRIMARY KEY (id);


--
-- Name: projects_links_locales projects_links_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.projects_links_locales
    ADD CONSTRAINT projects_links_locales_pkey PRIMARY KEY (id);


--
-- Name: projects_links projects_links_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.projects_links
    ADD CONSTRAINT projects_links_pkey PRIMARY KEY (id);


--
-- Name: projects_locales projects_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.projects_locales
    ADD CONSTRAINT projects_locales_pkey PRIMARY KEY (id);


--
-- Name: projects_page_data_locales projects_page_data_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.projects_page_data_locales
    ADD CONSTRAINT projects_page_data_locales_pkey PRIMARY KEY (id);


--
-- Name: projects_page_data projects_page_data_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.projects_page_data
    ADD CONSTRAINT projects_page_data_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_sessions users_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.users_sessions
    ADD CONSTRAINT users_sessions_pkey PRIMARY KEY (id);


--
-- Name: contact_page_data_bottom_right_links_locales_locale_parent_i; Type: INDEX; Schema: public; Owner: homepage
--

CREATE UNIQUE INDEX contact_page_data_bottom_right_links_locales_locale_parent_i ON public.contact_page_data_bottom_right_links_locales USING btree (_locale, _parent_id);


--
-- Name: contact_page_data_bottom_right_links_order_idx; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX contact_page_data_bottom_right_links_order_idx ON public.contact_page_data_bottom_right_links USING btree (_order);


--
-- Name: contact_page_data_bottom_right_links_parent_id_idx; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX contact_page_data_bottom_right_links_parent_id_idx ON public.contact_page_data_bottom_right_links USING btree (_parent_id);


--
-- Name: contact_page_data_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: homepage
--

CREATE UNIQUE INDEX contact_page_data_locales_locale_parent_id_unique ON public.contact_page_data_locales USING btree (_locale, _parent_id);


--
-- Name: home_page_data_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: homepage
--

CREATE UNIQUE INDEX home_page_data_locales_locale_parent_id_unique ON public.home_page_data_locales USING btree (_locale, _parent_id);


--
-- Name: media_created_at_idx; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX media_created_at_idx ON public.media USING btree (created_at);


--
-- Name: media_filename_idx; Type: INDEX; Schema: public; Owner: homepage
--

CREATE UNIQUE INDEX media_filename_idx ON public.media USING btree (filename);


--
-- Name: media_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: homepage
--

CREATE UNIQUE INDEX media_locales_locale_parent_id_unique ON public.media_locales USING btree (_locale, _parent_id);


--
-- Name: media_updated_at_idx; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX media_updated_at_idx ON public.media USING btree (updated_at);


--
-- Name: payload_kv_key_idx; Type: INDEX; Schema: public; Owner: homepage
--

CREATE UNIQUE INDEX payload_kv_key_idx ON public.payload_kv USING btree (key);


--
-- Name: payload_locked_documents_created_at_idx; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX payload_locked_documents_created_at_idx ON public.payload_locked_documents USING btree (created_at);


--
-- Name: payload_locked_documents_global_slug_idx; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX payload_locked_documents_global_slug_idx ON public.payload_locked_documents USING btree (global_slug);


--
-- Name: payload_locked_documents_rels_media_id_idx; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX payload_locked_documents_rels_media_id_idx ON public.payload_locked_documents_rels USING btree (media_id);


--
-- Name: payload_locked_documents_rels_order_idx; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX payload_locked_documents_rels_order_idx ON public.payload_locked_documents_rels USING btree ("order");


--
-- Name: payload_locked_documents_rels_parent_idx; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX payload_locked_documents_rels_parent_idx ON public.payload_locked_documents_rels USING btree (parent_id);


--
-- Name: payload_locked_documents_rels_path_idx; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX payload_locked_documents_rels_path_idx ON public.payload_locked_documents_rels USING btree (path);


--
-- Name: payload_locked_documents_rels_projects_id_idx; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX payload_locked_documents_rels_projects_id_idx ON public.payload_locked_documents_rels USING btree (projects_id);


--
-- Name: payload_locked_documents_rels_users_id_idx; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX payload_locked_documents_rels_users_id_idx ON public.payload_locked_documents_rels USING btree (users_id);


--
-- Name: payload_locked_documents_updated_at_idx; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX payload_locked_documents_updated_at_idx ON public.payload_locked_documents USING btree (updated_at);


--
-- Name: payload_migrations_created_at_idx; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX payload_migrations_created_at_idx ON public.payload_migrations USING btree (created_at);


--
-- Name: payload_migrations_updated_at_idx; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX payload_migrations_updated_at_idx ON public.payload_migrations USING btree (updated_at);


--
-- Name: payload_preferences_created_at_idx; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX payload_preferences_created_at_idx ON public.payload_preferences USING btree (created_at);


--
-- Name: payload_preferences_key_idx; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX payload_preferences_key_idx ON public.payload_preferences USING btree (key);


--
-- Name: payload_preferences_rels_order_idx; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX payload_preferences_rels_order_idx ON public.payload_preferences_rels USING btree ("order");


--
-- Name: payload_preferences_rels_parent_idx; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX payload_preferences_rels_parent_idx ON public.payload_preferences_rels USING btree (parent_id);


--
-- Name: payload_preferences_rels_path_idx; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX payload_preferences_rels_path_idx ON public.payload_preferences_rels USING btree (path);


--
-- Name: payload_preferences_rels_users_id_idx; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX payload_preferences_rels_users_id_idx ON public.payload_preferences_rels USING btree (users_id);


--
-- Name: payload_preferences_updated_at_idx; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX payload_preferences_updated_at_idx ON public.payload_preferences USING btree (updated_at);


--
-- Name: projects_created_at_idx; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX projects_created_at_idx ON public.projects USING btree (created_at);


--
-- Name: projects_image_idx; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX projects_image_idx ON public.projects USING btree (image_id);


--
-- Name: projects_links_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: homepage
--

CREATE UNIQUE INDEX projects_links_locales_locale_parent_id_unique ON public.projects_links_locales USING btree (_locale, _parent_id);


--
-- Name: projects_links_order_idx; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX projects_links_order_idx ON public.projects_links USING btree (_order);


--
-- Name: projects_links_parent_id_idx; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX projects_links_parent_id_idx ON public.projects_links USING btree (_parent_id);


--
-- Name: projects_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: homepage
--

CREATE UNIQUE INDEX projects_locales_locale_parent_id_unique ON public.projects_locales USING btree (_locale, _parent_id);


--
-- Name: projects_page_data_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: homepage
--

CREATE UNIQUE INDEX projects_page_data_locales_locale_parent_id_unique ON public.projects_page_data_locales USING btree (_locale, _parent_id);


--
-- Name: projects_updated_at_idx; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX projects_updated_at_idx ON public.projects USING btree (updated_at);


--
-- Name: users_created_at_idx; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX users_created_at_idx ON public.users USING btree (created_at);


--
-- Name: users_email_idx; Type: INDEX; Schema: public; Owner: homepage
--

CREATE UNIQUE INDEX users_email_idx ON public.users USING btree (email);


--
-- Name: users_sessions_order_idx; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX users_sessions_order_idx ON public.users_sessions USING btree (_order);


--
-- Name: users_sessions_parent_id_idx; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX users_sessions_parent_id_idx ON public.users_sessions USING btree (_parent_id);


--
-- Name: users_updated_at_idx; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX users_updated_at_idx ON public.users USING btree (updated_at);


--
-- Name: contact_page_data_bottom_right_links_locales contact_page_data_bottom_right_links_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.contact_page_data_bottom_right_links_locales
    ADD CONSTRAINT contact_page_data_bottom_right_links_locales_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.contact_page_data_bottom_right_links(id) ON DELETE CASCADE;


--
-- Name: contact_page_data_bottom_right_links contact_page_data_bottom_right_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.contact_page_data_bottom_right_links
    ADD CONSTRAINT contact_page_data_bottom_right_links_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.contact_page_data(id) ON DELETE CASCADE;


--
-- Name: contact_page_data_locales contact_page_data_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.contact_page_data_locales
    ADD CONSTRAINT contact_page_data_locales_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.contact_page_data(id) ON DELETE CASCADE;


--
-- Name: home_page_data_locales home_page_data_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.home_page_data_locales
    ADD CONSTRAINT home_page_data_locales_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.home_page_data(id) ON DELETE CASCADE;


--
-- Name: media_locales media_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.media_locales
    ADD CONSTRAINT media_locales_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.media(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_media_fk; Type: FK CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_media_fk FOREIGN KEY (media_id) REFERENCES public.media(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.payload_locked_documents(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_projects_fk; Type: FK CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_projects_fk FOREIGN KEY (projects_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_users_fk FOREIGN KEY (users_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: payload_preferences_rels payload_preferences_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.payload_preferences_rels
    ADD CONSTRAINT payload_preferences_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.payload_preferences(id) ON DELETE CASCADE;


--
-- Name: payload_preferences_rels payload_preferences_rels_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.payload_preferences_rels
    ADD CONSTRAINT payload_preferences_rels_users_fk FOREIGN KEY (users_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: projects projects_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_image_id_media_id_fk FOREIGN KEY (image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: projects_links_locales projects_links_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.projects_links_locales
    ADD CONSTRAINT projects_links_locales_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.projects_links(id) ON DELETE CASCADE;


--
-- Name: projects_links projects_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.projects_links
    ADD CONSTRAINT projects_links_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: projects_locales projects_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.projects_locales
    ADD CONSTRAINT projects_locales_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: projects_page_data_locales projects_page_data_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.projects_page_data_locales
    ADD CONSTRAINT projects_page_data_locales_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.projects_page_data(id) ON DELETE CASCADE;


--
-- Name: users_sessions users_sessions_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.users_sessions
    ADD CONSTRAINT users_sessions_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict avlRtpqi89aZSOuJCd3RqDZWFdIRPSQYRGOvviaLHa8pxhgjegqfzGyGBvlZddN

