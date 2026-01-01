--
-- PostgreSQL database dump
--

\restrict jbWLT1zg6Rat48hpgFgcxDy7E3oZdCsn9lRt7Nc0zZzOAoPZNLO1bsbUw9hIFvw

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
    url character varying,
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
    _parent_id character varying NOT NULL
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
    bottom_right_title character varying NOT NULL
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

COPY public.contact_page_data_bottom_right_links (_order, _parent_id, id, url, icon) FROM stdin;
1	1	6955d90585bcb935b4b1d05b	https://nuage.vagahbond.com/s/KnYmaAF75B4dHWd	resume
2	1	6955d91385bcb935b4b1d05d	https://google.com	doc
\.


--
-- Data for Name: contact_page_data_bottom_right_links_locales; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.contact_page_data_bottom_right_links_locales (label, id, _locale, _parent_id) FROM stdin;
Resume	51	en	6955d90585bcb935b4b1d05b
Hey	52	en	6955d91385bcb935b4b1d05d
\.


--
-- Data for Name: contact_page_data_locales; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.contact_page_data_locales (top_left_title, top_left_text, id, _locale, _parent_id, top_right_title, top_right_text, bottom_left_title, bottom_left_text, bottom_right_title) FROM stdin;
Simple solutions to complex problems	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "In an era where it is increasingly common to seek ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "simplicity", "type": "text", "style": "", "detail": 0, "format": 17, "version": 1}, {"mode": "normal", "text": " in processes, we tend to forget the importance of ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "simple", "type": "text", "style": "", "detail": 0, "format": 17, "version": 1}, {"mode": "normal", "text": " solutions delivery. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "My philosophy is that any problem, however ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "complex", "type": "text", "style": "", "detail": 0, "format": 17, "version": 1}, {"mode": "normal", "text": ", has a relatively ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "simple", "type": "text", "style": "", "detail": 0, "format": 17, "version": 1}, {"mode": "normal", "text": " and ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "clear", "type": "text", "style": "", "detail": 0, "format": 17, "version": 1}, {"mode": "normal", "text": " solution. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "While having your priorities respected, get delivered simple, streamlined solutions with a strong anticipation for technical debt and maintenance needs.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Contact me today for an efficient, and organic approach to understanding your projects and making them a reality.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	29	en	1	Educated and self taught	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "As important as theory can be in many fields of computer science, real-life experience cannot be replaced. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "As powerful as experience can be for understanding problems, finding innovative solutions is hard without backing it with strong theory. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "With a master's degree and more than 5 years of a diverse professional experience, I have the versatility to tackle most software development needs and get up to speed quickly in tech stacks that I have never worked with before. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Constant practice through diverse projects entertains an interest in techs and provides a positive mindset and a curiosity that are needed to make the most out of this expertise.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Here is a secret to a skill-backed can-do attitude.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	More about me	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "I am a 26 years old software engineer with an active, lazy mindset. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "When I have to do something, I like to find ways to be able to get the same result with less effort the next time. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This mentality led me to  becoming a programmer with a strong interest in \\"things as code\\". As an example, nix (IaS) is probably the language I have spent the most time on within my latest personal projects.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "I am also interested in privacy online and freedom in tech. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	Find me on the internet
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
\.


--
-- Data for Name: media_locales; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.media_locales (alt, id, _locale, _parent_id) FROM stdin;
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
1	dev	-1	2026-01-01 20:06:12.995+13	2025-12-17 21:14:43.66+13
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
7	locale	"en"	2026-01-01 20:16:57.48+13	2025-12-28 00:25:16.154+13
\.


--
-- Data for Name: payload_preferences_rels; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.payload_preferences_rels (id, "order", parent_id, path, users_id) FROM stdin;
4	\N	2	user	1
6	\N	3	user	1
11	\N	5	user	1
12	\N	6	user	1
13	\N	1	user	1
30	\N	8	user	1
32	\N	9	user	1
37	\N	7	user	1
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.projects (id, updated_at, created_at, image_id, date) FROM stdin;
\.


--
-- Data for Name: projects_links; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.projects_links (_order, _parent_id, id, url, icon) FROM stdin;
\.


--
-- Data for Name: projects_links_locales; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.projects_links_locales (label, id, _locale, _parent_id) FROM stdin;
\.


--
-- Data for Name: projects_locales; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.projects_locales (name, description, id, _locale, _parent_id) FROM stdin;
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
1	2026-01-01 19:56:05.781+13	2025-12-17 21:15:02.465+13	vagahbond@pm.me	\N	\N	075999745062ba90e8efe7be679ca1ec3bacb49e92d4dd33c3ca31ea653c7b55	879d584ba8c7e013c0c82ed50da3e77c6b22921c1f62759ab5d371e657a2cb483e478c06aaebd101f59dc5e0d2c0009a13010f7ac6ebc227279845439e478de58b941624899ded3ecd420163b7942b748cd925c56917f73a94e9d355997a85da74f24ec9b2ea0b5d338d4d53496e4f20dd25dac7aabb3bd7da0c0af034344137fca899a2bb4fc907144fb5c72b55749627209a6b1ba43dbd9b425533eb151f2741ecbed4f6a1d0f1074790afd1391af01c2b641e3bffa3919791cc7d5069daa7a2d24cf6c80679e4c8af0586e5c3da551d866a9bd5a0d06bd5c8dc6d73f24481cf24a3dbf32aaa14e88b6a75739a6d3771d19f307b4c38a10a30f3552236521e19a7b9af119db69bd448cc4f3859db8adedb66e65c058c5ec45650f4cea261e27a0d9f0a3d0dcafcf4ba41a6cd8c3c885ef56ff09c149042a9fed53c27177b155a04ed89c1346663b04f7c94b4f051d3e59eb0ac4a4bd91882c3f4f675a58b5e1214227cd0c2a1caf4c06e678fa5206dcdea4b1fa4f99ae30de5ea3267e94989ad12fec1c61db5369017b6c5e23a825f7e1928bc585b94331e8516efcfb55fb50c10ff7fbf9fcc1adf97a4610bdb5f583f53a6b631e02eb58531cba74e47dc011105891f5ddf1535ed94f9540c9263578cb42de0acedec7c23bca0428067264cd52e498f7ed9ef96846ad43b559e7c7e7b4579a66628852672522e51cb8f4d90	0	\N
\.


--
-- Data for Name: users_sessions; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.users_sessions (_order, _parent_id, id, created_at, expires_at) FROM stdin;
1	1	96abac28-eefc-4352-84db-fb1981b96e34	2026-01-01 19:56:05.771+13	2026-01-01 21:56:05.771+13
\.


--
-- Name: contact_page_data_bottom_right_links_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.contact_page_data_bottom_right_links_locales_id_seq', 52, true);


--
-- Name: contact_page_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.contact_page_data_id_seq', 1, true);


--
-- Name: contact_page_data_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.contact_page_data_locales_id_seq', 29, true);


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

SELECT pg_catalog.setval('public.media_id_seq', 6, true);


--
-- Name: media_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.media_locales_id_seq', 1, false);


--
-- Name: payload_kv_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.payload_kv_id_seq', 1, false);


--
-- Name: payload_locked_documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.payload_locked_documents_id_seq', 54, true);


--
-- Name: payload_locked_documents_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.payload_locked_documents_rels_id_seq', 64, true);


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

SELECT pg_catalog.setval('public.payload_preferences_rels_id_seq', 37, true);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.projects_id_seq', 6, true);


--
-- Name: projects_links_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.projects_links_locales_id_seq', 4, true);


--
-- Name: projects_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.projects_locales_id_seq', 2, true);


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

\unrestrict jbWLT1zg6Rat48hpgFgcxDy7E3oZdCsn9lRt7Nc0zZzOAoPZNLO1bsbUw9hIFvw

