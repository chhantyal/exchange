--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: neo; Tablespace: 
--

CREATE TABLE account_emailaddress (
    id integer NOT NULL,
    user_id integer NOT NULL,
    email character varying(75) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO neo;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: neo
--

CREATE SEQUENCE account_emailaddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO neo;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neo
--

ALTER SEQUENCE account_emailaddress_id_seq OWNED BY account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: neo; Tablespace: 
--

CREATE TABLE account_emailconfirmation (
    id integer NOT NULL,
    email_address_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO neo;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: neo
--

CREATE SEQUENCE account_emailconfirmation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO neo;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neo
--

ALTER SEQUENCE account_emailconfirmation_id_seq OWNED BY account_emailconfirmation.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: neo; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO neo;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: neo
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO neo;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neo
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: neo; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO neo;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: neo
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO neo;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neo
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: neo; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO neo;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: neo
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO neo;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neo
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: avatar_avatar; Type: TABLE; Schema: public; Owner: neo; Tablespace: 
--

CREATE TABLE avatar_avatar (
    id integer NOT NULL,
    user_id integer NOT NULL,
    "primary" boolean NOT NULL,
    avatar character varying(1024) NOT NULL,
    date_uploaded timestamp with time zone NOT NULL
);


ALTER TABLE public.avatar_avatar OWNER TO neo;

--
-- Name: avatar_avatar_id_seq; Type: SEQUENCE; Schema: public; Owner: neo
--

CREATE SEQUENCE avatar_avatar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.avatar_avatar_id_seq OWNER TO neo;

--
-- Name: avatar_avatar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neo
--

ALTER SEQUENCE avatar_avatar_id_seq OWNED BY avatar_avatar.id;


--
-- Name: celery_taskmeta; Type: TABLE; Schema: public; Owner: neo; Tablespace: 
--

CREATE TABLE celery_taskmeta (
    id integer NOT NULL,
    task_id character varying(255) NOT NULL,
    status character varying(50) NOT NULL,
    result text,
    date_done timestamp with time zone NOT NULL,
    traceback text,
    hidden boolean NOT NULL,
    meta text
);


ALTER TABLE public.celery_taskmeta OWNER TO neo;

--
-- Name: celery_taskmeta_id_seq; Type: SEQUENCE; Schema: public; Owner: neo
--

CREATE SEQUENCE celery_taskmeta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celery_taskmeta_id_seq OWNER TO neo;

--
-- Name: celery_taskmeta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neo
--

ALTER SEQUENCE celery_taskmeta_id_seq OWNED BY celery_taskmeta.id;


--
-- Name: celery_tasksetmeta; Type: TABLE; Schema: public; Owner: neo; Tablespace: 
--

CREATE TABLE celery_tasksetmeta (
    id integer NOT NULL,
    taskset_id character varying(255) NOT NULL,
    result text NOT NULL,
    date_done timestamp with time zone NOT NULL,
    hidden boolean NOT NULL
);


ALTER TABLE public.celery_tasksetmeta OWNER TO neo;

--
-- Name: celery_tasksetmeta_id_seq; Type: SEQUENCE; Schema: public; Owner: neo
--

CREATE SEQUENCE celery_tasksetmeta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celery_tasksetmeta_id_seq OWNER TO neo;

--
-- Name: celery_tasksetmeta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neo
--

ALTER SEQUENCE celery_tasksetmeta_id_seq OWNED BY celery_tasksetmeta.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: neo; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO neo;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: neo
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO neo;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neo
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: neo; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO neo;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: neo
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO neo;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neo
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: neo; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO neo;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: neo; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO neo;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: neo
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO neo;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neo
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: djcelery_crontabschedule; Type: TABLE; Schema: public; Owner: neo; Tablespace: 
--

CREATE TABLE djcelery_crontabschedule (
    id integer NOT NULL,
    minute character varying(64) NOT NULL,
    hour character varying(64) NOT NULL,
    day_of_week character varying(64) NOT NULL,
    day_of_month character varying(64) NOT NULL,
    month_of_year character varying(64) NOT NULL
);


ALTER TABLE public.djcelery_crontabschedule OWNER TO neo;

--
-- Name: djcelery_crontabschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: neo
--

CREATE SEQUENCE djcelery_crontabschedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.djcelery_crontabschedule_id_seq OWNER TO neo;

--
-- Name: djcelery_crontabschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neo
--

ALTER SEQUENCE djcelery_crontabschedule_id_seq OWNED BY djcelery_crontabschedule.id;


--
-- Name: djcelery_intervalschedule; Type: TABLE; Schema: public; Owner: neo; Tablespace: 
--

CREATE TABLE djcelery_intervalschedule (
    id integer NOT NULL,
    every integer NOT NULL,
    period character varying(24) NOT NULL
);


ALTER TABLE public.djcelery_intervalschedule OWNER TO neo;

--
-- Name: djcelery_intervalschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: neo
--

CREATE SEQUENCE djcelery_intervalschedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.djcelery_intervalschedule_id_seq OWNER TO neo;

--
-- Name: djcelery_intervalschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neo
--

ALTER SEQUENCE djcelery_intervalschedule_id_seq OWNED BY djcelery_intervalschedule.id;


--
-- Name: djcelery_periodictask; Type: TABLE; Schema: public; Owner: neo; Tablespace: 
--

CREATE TABLE djcelery_periodictask (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    task character varying(200) NOT NULL,
    interval_id integer,
    crontab_id integer,
    args text NOT NULL,
    kwargs text NOT NULL,
    queue character varying(200),
    exchange character varying(200),
    routing_key character varying(200),
    expires timestamp with time zone,
    enabled boolean NOT NULL,
    last_run_at timestamp with time zone,
    total_run_count integer NOT NULL,
    date_changed timestamp with time zone NOT NULL,
    description text NOT NULL,
    CONSTRAINT djcelery_periodictask_total_run_count_check CHECK ((total_run_count >= 0))
);


ALTER TABLE public.djcelery_periodictask OWNER TO neo;

--
-- Name: djcelery_periodictask_id_seq; Type: SEQUENCE; Schema: public; Owner: neo
--

CREATE SEQUENCE djcelery_periodictask_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.djcelery_periodictask_id_seq OWNER TO neo;

--
-- Name: djcelery_periodictask_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neo
--

ALTER SEQUENCE djcelery_periodictask_id_seq OWNED BY djcelery_periodictask.id;


--
-- Name: djcelery_periodictasks; Type: TABLE; Schema: public; Owner: neo; Tablespace: 
--

CREATE TABLE djcelery_periodictasks (
    ident smallint NOT NULL,
    last_update timestamp with time zone NOT NULL
);


ALTER TABLE public.djcelery_periodictasks OWNER TO neo;

--
-- Name: djcelery_taskstate; Type: TABLE; Schema: public; Owner: neo; Tablespace: 
--

CREATE TABLE djcelery_taskstate (
    id integer NOT NULL,
    state character varying(64) NOT NULL,
    task_id character varying(36) NOT NULL,
    name character varying(200),
    tstamp timestamp with time zone NOT NULL,
    args text,
    kwargs text,
    eta timestamp with time zone,
    expires timestamp with time zone,
    result text,
    traceback text,
    runtime double precision,
    retries integer NOT NULL,
    worker_id integer,
    hidden boolean NOT NULL
);


ALTER TABLE public.djcelery_taskstate OWNER TO neo;

--
-- Name: djcelery_taskstate_id_seq; Type: SEQUENCE; Schema: public; Owner: neo
--

CREATE SEQUENCE djcelery_taskstate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.djcelery_taskstate_id_seq OWNER TO neo;

--
-- Name: djcelery_taskstate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neo
--

ALTER SEQUENCE djcelery_taskstate_id_seq OWNED BY djcelery_taskstate.id;


--
-- Name: djcelery_workerstate; Type: TABLE; Schema: public; Owner: neo; Tablespace: 
--

CREATE TABLE djcelery_workerstate (
    id integer NOT NULL,
    hostname character varying(255) NOT NULL,
    last_heartbeat timestamp with time zone
);


ALTER TABLE public.djcelery_workerstate OWNER TO neo;

--
-- Name: djcelery_workerstate_id_seq; Type: SEQUENCE; Schema: public; Owner: neo
--

CREATE SEQUENCE djcelery_workerstate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.djcelery_workerstate_id_seq OWNER TO neo;

--
-- Name: djcelery_workerstate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neo
--

ALTER SEQUENCE djcelery_workerstate_id_seq OWNED BY djcelery_workerstate.id;


--
-- Name: djkombu_message; Type: TABLE; Schema: public; Owner: neo; Tablespace: 
--

CREATE TABLE djkombu_message (
    id integer NOT NULL,
    visible boolean NOT NULL,
    sent_at timestamp with time zone,
    payload text NOT NULL,
    queue_id integer NOT NULL
);


ALTER TABLE public.djkombu_message OWNER TO neo;

--
-- Name: djkombu_message_id_seq; Type: SEQUENCE; Schema: public; Owner: neo
--

CREATE SEQUENCE djkombu_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.djkombu_message_id_seq OWNER TO neo;

--
-- Name: djkombu_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neo
--

ALTER SEQUENCE djkombu_message_id_seq OWNED BY djkombu_message.id;


--
-- Name: djkombu_queue; Type: TABLE; Schema: public; Owner: neo; Tablespace: 
--

CREATE TABLE djkombu_queue (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE public.djkombu_queue OWNER TO neo;

--
-- Name: djkombu_queue_id_seq; Type: SEQUENCE; Schema: public; Owner: neo
--

CREATE SEQUENCE djkombu_queue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.djkombu_queue_id_seq OWNER TO neo;

--
-- Name: djkombu_queue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neo
--

ALTER SEQUENCE djkombu_queue_id_seq OWNED BY djkombu_queue.id;


--
-- Name: exchange_exchange; Type: TABLE; Schema: public; Owner: neo; Tablespace: 
--

CREATE TABLE exchange_exchange (
    id integer NOT NULL,
    usd numeric(10,2) NOT NULL,
    euro numeric(10,2) NOT NULL,
    exchange_date date NOT NULL,
    date_imported date NOT NULL
);


ALTER TABLE public.exchange_exchange OWNER TO neo;

--
-- Name: exchange_exchange_id_seq; Type: SEQUENCE; Schema: public; Owner: neo
--

CREATE SEQUENCE exchange_exchange_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exchange_exchange_id_seq OWNER TO neo;

--
-- Name: exchange_exchange_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neo
--

ALTER SEQUENCE exchange_exchange_id_seq OWNED BY exchange_exchange.id;


--
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: neo; Tablespace: 
--

CREATE TABLE socialaccount_socialaccount (
    id integer NOT NULL,
    user_id integer NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(255) NOT NULL,
    extra_data text NOT NULL
);


ALTER TABLE public.socialaccount_socialaccount OWNER TO neo;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: neo
--

CREATE SEQUENCE socialaccount_socialaccount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialaccount_id_seq OWNER TO neo;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neo
--

ALTER SEQUENCE socialaccount_socialaccount_id_seq OWNED BY socialaccount_socialaccount.id;


--
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: neo; Tablespace: 
--

CREATE TABLE socialaccount_socialapp (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    key character varying(100) NOT NULL,
    secret character varying(100) NOT NULL,
    client_id character varying(100) NOT NULL
);


ALTER TABLE public.socialaccount_socialapp OWNER TO neo;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: neo
--

CREATE SEQUENCE socialaccount_socialapp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_id_seq OWNER TO neo;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neo
--

ALTER SEQUENCE socialaccount_socialapp_id_seq OWNED BY socialaccount_socialapp.id;


--
-- Name: socialaccount_socialapp_sites; Type: TABLE; Schema: public; Owner: neo; Tablespace: 
--

CREATE TABLE socialaccount_socialapp_sites (
    id integer NOT NULL,
    socialapp_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialapp_sites OWNER TO neo;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: neo
--

CREATE SEQUENCE socialaccount_socialapp_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_sites_id_seq OWNER TO neo;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neo
--

ALTER SEQUENCE socialaccount_socialapp_sites_id_seq OWNED BY socialaccount_socialapp_sites.id;


--
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: neo; Tablespace: 
--

CREATE TABLE socialaccount_socialtoken (
    id integer NOT NULL,
    app_id integer NOT NULL,
    account_id integer NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone
);


ALTER TABLE public.socialaccount_socialtoken OWNER TO neo;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: neo
--

CREATE SEQUENCE socialaccount_socialtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialtoken_id_seq OWNER TO neo;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neo
--

ALTER SEQUENCE socialaccount_socialtoken_id_seq OWNED BY socialaccount_socialtoken.id;


--
-- Name: south_migrationhistory; Type: TABLE; Schema: public; Owner: neo; Tablespace: 
--

CREATE TABLE south_migrationhistory (
    id integer NOT NULL,
    app_name character varying(255) NOT NULL,
    migration character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.south_migrationhistory OWNER TO neo;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: neo
--

CREATE SEQUENCE south_migrationhistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.south_migrationhistory_id_seq OWNER TO neo;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neo
--

ALTER SEQUENCE south_migrationhistory_id_seq OWNED BY south_migrationhistory.id;


--
-- Name: users_user; Type: TABLE; Schema: public; Owner: neo; Tablespace: 
--

CREATE TABLE users_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.users_user OWNER TO neo;

--
-- Name: users_user_groups; Type: TABLE; Schema: public; Owner: neo; Tablespace: 
--

CREATE TABLE users_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_user_groups OWNER TO neo;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: neo
--

CREATE SEQUENCE users_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_groups_id_seq OWNER TO neo;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neo
--

ALTER SEQUENCE users_user_groups_id_seq OWNED BY users_user_groups.id;


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: neo
--

CREATE SEQUENCE users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO neo;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neo
--

ALTER SEQUENCE users_user_id_seq OWNED BY users_user.id;


--
-- Name: users_user_user_permissions; Type: TABLE; Schema: public; Owner: neo; Tablespace: 
--

CREATE TABLE users_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.users_user_user_permissions OWNER TO neo;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: neo
--

CREATE SEQUENCE users_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_user_permissions_id_seq OWNER TO neo;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neo
--

ALTER SEQUENCE users_user_user_permissions_id_seq OWNED BY users_user_user_permissions.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: neo
--

ALTER TABLE ONLY account_emailaddress ALTER COLUMN id SET DEFAULT nextval('account_emailaddress_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: neo
--

ALTER TABLE ONLY account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('account_emailconfirmation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: neo
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: neo
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: neo
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: neo
--

ALTER TABLE ONLY avatar_avatar ALTER COLUMN id SET DEFAULT nextval('avatar_avatar_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: neo
--

ALTER TABLE ONLY celery_taskmeta ALTER COLUMN id SET DEFAULT nextval('celery_taskmeta_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: neo
--

ALTER TABLE ONLY celery_tasksetmeta ALTER COLUMN id SET DEFAULT nextval('celery_tasksetmeta_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: neo
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: neo
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: neo
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: neo
--

ALTER TABLE ONLY djcelery_crontabschedule ALTER COLUMN id SET DEFAULT nextval('djcelery_crontabschedule_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: neo
--

ALTER TABLE ONLY djcelery_intervalschedule ALTER COLUMN id SET DEFAULT nextval('djcelery_intervalschedule_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: neo
--

ALTER TABLE ONLY djcelery_periodictask ALTER COLUMN id SET DEFAULT nextval('djcelery_periodictask_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: neo
--

ALTER TABLE ONLY djcelery_taskstate ALTER COLUMN id SET DEFAULT nextval('djcelery_taskstate_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: neo
--

ALTER TABLE ONLY djcelery_workerstate ALTER COLUMN id SET DEFAULT nextval('djcelery_workerstate_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: neo
--

ALTER TABLE ONLY djkombu_message ALTER COLUMN id SET DEFAULT nextval('djkombu_message_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: neo
--

ALTER TABLE ONLY djkombu_queue ALTER COLUMN id SET DEFAULT nextval('djkombu_queue_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: neo
--

ALTER TABLE ONLY exchange_exchange ALTER COLUMN id SET DEFAULT nextval('exchange_exchange_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: neo
--

ALTER TABLE ONLY socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('socialaccount_socialaccount_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: neo
--

ALTER TABLE ONLY socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('socialaccount_socialapp_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: neo
--

ALTER TABLE ONLY socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('socialaccount_socialapp_sites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: neo
--

ALTER TABLE ONLY socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('socialaccount_socialtoken_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: neo
--

ALTER TABLE ONLY south_migrationhistory ALTER COLUMN id SET DEFAULT nextval('south_migrationhistory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: neo
--

ALTER TABLE ONLY users_user ALTER COLUMN id SET DEFAULT nextval('users_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: neo
--

ALTER TABLE ONLY users_user_groups ALTER COLUMN id SET DEFAULT nextval('users_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: neo
--

ALTER TABLE ONLY users_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('users_user_user_permissions_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: neo
--

COPY account_emailaddress (id, user_id, email, verified, "primary") FROM stdin;
1	2	nar.kumar@changer.nl	t	t
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neo
--

SELECT pg_catalog.setval('account_emailaddress_id_seq', 1, true);


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: neo
--

COPY account_emailconfirmation (id, email_address_id, created, sent, key) FROM stdin;
1	1	2014-05-11 02:27:47.403405+05:30	2014-05-11 02:27:47.585502+05:30	9f5dfd650a4c87ae58389700767edca9489c84d4174e401576f89d9aa0086c01
\.


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neo
--

SELECT pg_catalog.setval('account_emailconfirmation_id_seq', 1, true);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: neo
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neo
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: neo
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neo
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: neo
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add content type	3	add_contenttype
8	Can change content type	3	change_contenttype
9	Can delete content type	3	delete_contenttype
10	Can add session	4	add_session
11	Can change session	4	change_session
12	Can delete session	4	delete_session
13	Can add site	5	add_site
14	Can change site	5	change_site
15	Can delete site	5	delete_site
16	Can add log entry	6	add_logentry
17	Can change log entry	6	change_logentry
18	Can delete log entry	6	delete_logentry
19	Can add migration history	7	add_migrationhistory
20	Can change migration history	7	change_migrationhistory
21	Can delete migration history	7	delete_migrationhistory
22	Can add avatar	8	add_avatar
23	Can change avatar	8	change_avatar
24	Can delete avatar	8	delete_avatar
25	Can add email address	9	add_emailaddress
26	Can change email address	9	change_emailaddress
27	Can delete email address	9	delete_emailaddress
28	Can add email confirmation	10	add_emailconfirmation
29	Can change email confirmation	10	change_emailconfirmation
30	Can delete email confirmation	10	delete_emailconfirmation
31	Can add queue	11	add_queue
32	Can change queue	11	change_queue
33	Can delete queue	11	delete_queue
34	Can add message	12	add_message
35	Can change message	12	change_message
36	Can delete message	12	delete_message
37	Can add task state	13	add_taskmeta
38	Can change task state	13	change_taskmeta
39	Can delete task state	13	delete_taskmeta
40	Can add saved group result	14	add_tasksetmeta
41	Can change saved group result	14	change_tasksetmeta
42	Can delete saved group result	14	delete_tasksetmeta
43	Can add interval	15	add_intervalschedule
44	Can change interval	15	change_intervalschedule
45	Can delete interval	15	delete_intervalschedule
46	Can add crontab	16	add_crontabschedule
47	Can change crontab	16	change_crontabschedule
48	Can delete crontab	16	delete_crontabschedule
49	Can add periodic tasks	17	add_periodictasks
50	Can change periodic tasks	17	change_periodictasks
51	Can delete periodic tasks	17	delete_periodictasks
52	Can add periodic task	18	add_periodictask
53	Can change periodic task	18	change_periodictask
54	Can delete periodic task	18	delete_periodictask
55	Can add worker	19	add_workerstate
56	Can change worker	19	change_workerstate
57	Can delete worker	19	delete_workerstate
58	Can add task	20	add_taskstate
59	Can change task	20	change_taskstate
60	Can delete task	20	delete_taskstate
61	Can add user	21	add_user
62	Can change user	21	change_user
63	Can delete user	21	delete_user
64	Can add exchange	22	add_exchange
65	Can change exchange	22	change_exchange
66	Can delete exchange	22	delete_exchange
67	Can add social app	23	add_socialapp
68	Can change social app	23	change_socialapp
69	Can delete social app	23	delete_socialapp
70	Can add social account	24	add_socialaccount
71	Can change social account	24	change_socialaccount
72	Can delete social account	24	delete_socialaccount
73	Can add social token	25	add_socialtoken
74	Can change social token	25	change_socialtoken
75	Can delete social token	25	delete_socialtoken
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neo
--

SELECT pg_catalog.setval('auth_permission_id_seq', 75, true);


--
-- Data for Name: avatar_avatar; Type: TABLE DATA; Schema: public; Owner: neo
--

COPY avatar_avatar (id, user_id, "primary", avatar, date_uploaded) FROM stdin;
\.


--
-- Name: avatar_avatar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neo
--

SELECT pg_catalog.setval('avatar_avatar_id_seq', 1, false);


--
-- Data for Name: celery_taskmeta; Type: TABLE DATA; Schema: public; Owner: neo
--

COPY celery_taskmeta (id, task_id, status, result, date_done, traceback, hidden, meta) FROM stdin;
\.


--
-- Name: celery_taskmeta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neo
--

SELECT pg_catalog.setval('celery_taskmeta_id_seq', 1, false);


--
-- Data for Name: celery_tasksetmeta; Type: TABLE DATA; Schema: public; Owner: neo
--

COPY celery_tasksetmeta (id, taskset_id, result, date_done, hidden) FROM stdin;
\.


--
-- Name: celery_tasksetmeta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neo
--

SELECT pg_catalog.setval('celery_tasksetmeta_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: neo
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neo
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: neo
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	permission	auth	permission
2	group	auth	group
3	content type	contenttypes	contenttype
4	session	sessions	session
5	site	sites	site
6	log entry	admin	logentry
7	migration history	south	migrationhistory
8	avatar	avatar	avatar
9	email address	account	emailaddress
10	email confirmation	account	emailconfirmation
11	queue	django	queue
12	message	django	message
13	task state	djcelery	taskmeta
14	saved group result	djcelery	tasksetmeta
15	interval	djcelery	intervalschedule
16	crontab	djcelery	crontabschedule
17	periodic tasks	djcelery	periodictasks
18	periodic task	djcelery	periodictask
19	worker	djcelery	workerstate
20	task	djcelery	taskstate
21	user	users	user
22	exchange	exchange	exchange
23	social app	socialaccount	socialapp
24	social account	socialaccount	socialaccount
25	social token	socialaccount	socialtoken
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neo
--

SELECT pg_catalog.setval('django_content_type_id_seq', 25, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: neo
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
jyvywc8s9bxox6cb64le6o0cxt6123k5	NThhNjQxODllMDJhODM0OWM0OTljMDliMTM4MTBiNzEwMGE0MTBlZDp7fQ==	2014-05-24 23:23:58.386155+05:30
dwb7pluyatmvtd8b20lx5uq53yteq70p	NThhNjQxODllMDJhODM0OWM0OTljMDliMTM4MTBiNzEwMGE0MTBlZDp7fQ==	2014-05-24 23:24:40.717773+05:30
ydxbtcb1b20aldwmcybd5bd8ou5d4h35	NThhNjQxODllMDJhODM0OWM0OTljMDliMTM4MTBiNzEwMGE0MTBlZDp7fQ==	2014-05-24 23:25:08.658666+05:30
vv2prn9th7srucwcgdw05y66zto24gnp	NThhNjQxODllMDJhODM0OWM0OTljMDliMTM4MTBiNzEwMGE0MTBlZDp7fQ==	2014-05-24 23:35:02.499164+05:30
z3hbltqrxzcwar8zzoj6gsklr2zo5400	NThhNjQxODllMDJhODM0OWM0OTljMDliMTM4MTBiNzEwMGE0MTBlZDp7fQ==	2014-05-24 23:36:35.92175+05:30
op2jckklux0qggrmvkb346j5e4y1acu8	NThhNjQxODllMDJhODM0OWM0OTljMDliMTM4MTBiNzEwMGE0MTBlZDp7fQ==	2014-05-24 23:37:22.389865+05:30
2m7redokgfacs48tzegehtnk4o5q3232	ODlhMGUzNmE5MTdhNmI1OGQyNzA4N2M4MzljYzZlMDRjZmY1ODk5Zjp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoyfQ==	2014-05-25 02:28:22.205713+05:30
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: neo
--

COPY django_site (id, domain, name) FROM stdin;
1	uhura.com	uhura
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neo
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Data for Name: djcelery_crontabschedule; Type: TABLE DATA; Schema: public; Owner: neo
--

COPY djcelery_crontabschedule (id, minute, hour, day_of_week, day_of_month, month_of_year) FROM stdin;
\.


--
-- Name: djcelery_crontabschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neo
--

SELECT pg_catalog.setval('djcelery_crontabschedule_id_seq', 1, false);


--
-- Data for Name: djcelery_intervalschedule; Type: TABLE DATA; Schema: public; Owner: neo
--

COPY djcelery_intervalschedule (id, every, period) FROM stdin;
\.


--
-- Name: djcelery_intervalschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neo
--

SELECT pg_catalog.setval('djcelery_intervalschedule_id_seq', 1, false);


--
-- Data for Name: djcelery_periodictask; Type: TABLE DATA; Schema: public; Owner: neo
--

COPY djcelery_periodictask (id, name, task, interval_id, crontab_id, args, kwargs, queue, exchange, routing_key, expires, enabled, last_run_at, total_run_count, date_changed, description) FROM stdin;
\.


--
-- Name: djcelery_periodictask_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neo
--

SELECT pg_catalog.setval('djcelery_periodictask_id_seq', 1, false);


--
-- Data for Name: djcelery_periodictasks; Type: TABLE DATA; Schema: public; Owner: neo
--

COPY djcelery_periodictasks (ident, last_update) FROM stdin;
\.


--
-- Data for Name: djcelery_taskstate; Type: TABLE DATA; Schema: public; Owner: neo
--

COPY djcelery_taskstate (id, state, task_id, name, tstamp, args, kwargs, eta, expires, result, traceback, runtime, retries, worker_id, hidden) FROM stdin;
\.


--
-- Name: djcelery_taskstate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neo
--

SELECT pg_catalog.setval('djcelery_taskstate_id_seq', 1, false);


--
-- Data for Name: djcelery_workerstate; Type: TABLE DATA; Schema: public; Owner: neo
--

COPY djcelery_workerstate (id, hostname, last_heartbeat) FROM stdin;
\.


--
-- Name: djcelery_workerstate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neo
--

SELECT pg_catalog.setval('djcelery_workerstate_id_seq', 1, false);


--
-- Data for Name: djkombu_message; Type: TABLE DATA; Schema: public; Owner: neo
--

COPY djkombu_message (id, visible, sent_at, payload, queue_id) FROM stdin;
1	f	2014-05-10 23:23:18.998085+05:30	{"body": "gAJ9cQEoVQdleHBpcmVzcQJOVQN1dGNxA4hVBGFyZ3NxBF1xBVUFY2hvcmRxBk5VCWNhbGxiYWNrc3EHTlUIZXJyYmFja3NxCE5VB3Rhc2tzZXRxCU5VAmlkcQpVJGI0NWEzYmQ1LTJlNjktNGU1ZS04OTJjLTRmYzY1MDIzNDk4MXELVQdyZXRyaWVzcQxLAFUEdGFza3ENVSNleGNoYW5nZS50YXNrcy5wZXJpb2RpY19pbXBvcnRfZGF0YXEOVQl0aW1lbGltaXRxD05OhlUDZXRhcRBOVQZrd2FyZ3NxEX1xEnUu", "headers": {}, "content-type": "application/x-python-serialize", "properties": {"body_encoding": "base64", "correlation_id": "b45a3bd5-2e69-4e5e-892c-4fc650234981", "reply_to": "412c0dd4-924b-3ff6-a681-c728acaf6617", "delivery_info": {"priority": 0, "routing_key": "celery", "exchange": "celery"}, "delivery_mode": 2, "delivery_tag": "e40cee09-af9a-4b28-b945-52ef2f64bf99"}, "content-encoding": "binary"}	1
\.


--
-- Name: djkombu_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neo
--

SELECT pg_catalog.setval('djkombu_message_id_seq', 1, true);


--
-- Data for Name: djkombu_queue; Type: TABLE DATA; Schema: public; Owner: neo
--

COPY djkombu_queue (id, name) FROM stdin;
1	celery
2	celery@matrix.local.celery.pidbox
\.


--
-- Name: djkombu_queue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neo
--

SELECT pg_catalog.setval('djkombu_queue_id_seq', 2, true);


--
-- Data for Name: exchange_exchange; Type: TABLE DATA; Schema: public; Owner: neo
--

COPY exchange_exchange (id, usd, euro, exchange_date, date_imported) FROM stdin;
1	1.39	1.00	2014-05-02	2014-05-10
2	1.39	1.00	2014-05-01	2014-05-10
3	1.39	1.00	2014-04-30	2014-05-10
4	1.38	1.00	2014-04-29	2014-05-10
5	1.38	1.00	2014-04-28	2014-05-10
6	1.38	1.00	2014-04-25	2014-05-10
7	1.38	1.00	2014-04-24	2014-05-10
8	1.38	1.00	2014-04-23	2014-05-10
9	1.38	1.00	2014-04-22	2014-05-10
10	1.38	1.00	2014-04-21	2014-05-10
11	1.38	1.00	2014-04-18	2014-05-10
12	1.38	1.00	2014-04-17	2014-05-10
13	1.38	1.00	2014-04-16	2014-05-10
14	1.38	1.00	2014-04-15	2014-05-10
15	1.38	1.00	2014-04-14	2014-05-10
16	1.39	1.00	2014-04-11	2014-05-10
17	1.39	1.00	2014-04-10	2014-05-10
18	1.38	1.00	2014-04-09	2014-05-10
19	1.38	1.00	2014-04-08	2014-05-10
20	1.37	1.00	2014-04-07	2014-05-10
21	1.37	1.00	2014-04-04	2014-05-10
22	1.37	1.00	2014-04-03	2014-05-10
23	1.38	1.00	2014-04-02	2014-05-10
24	1.38	1.00	2014-04-01	2014-05-10
25	1.38	1.00	2014-03-31	2014-05-10
26	1.38	1.00	2014-03-28	2014-05-10
27	1.38	1.00	2014-03-27	2014-05-10
28	1.38	1.00	2014-03-26	2014-05-10
29	1.38	1.00	2014-03-25	2014-05-10
30	1.38	1.00	2014-03-24	2014-05-10
31	1.38	1.00	2014-03-21	2014-05-10
32	1.38	1.00	2014-03-20	2014-05-10
33	1.39	1.00	2014-03-19	2014-05-10
34	1.39	1.00	2014-03-18	2014-05-10
35	1.39	1.00	2014-03-17	2014-05-10
36	1.39	1.00	2014-03-14	2014-05-10
37	1.39	1.00	2014-03-13	2014-05-10
38	1.39	1.00	2014-03-12	2014-05-10
39	1.39	1.00	2014-03-11	2014-05-10
40	1.39	1.00	2014-03-10	2014-05-10
41	1.39	1.00	2014-03-07	2014-05-10
42	1.38	1.00	2014-03-06	2014-05-10
43	1.37	1.00	2014-03-05	2014-05-10
44	1.37	1.00	2014-03-04	2014-05-10
45	1.38	1.00	2014-03-03	2014-05-10
46	1.38	1.00	2014-02-28	2014-05-10
47	1.37	1.00	2014-02-27	2014-05-10
48	1.37	1.00	2014-02-26	2014-05-10
49	1.37	1.00	2014-02-25	2014-05-10
50	1.37	1.00	2014-02-24	2014-05-10
51	1.37	1.00	2014-02-21	2014-05-10
52	1.37	1.00	2014-02-20	2014-05-10
53	1.38	1.00	2014-02-19	2014-05-10
54	1.38	1.00	2014-02-18	2014-05-10
55	1.37	1.00	2014-02-14	2014-05-10
56	1.37	1.00	2014-02-13	2014-05-10
57	1.36	1.00	2014-02-12	2014-05-10
58	1.37	1.00	2014-02-11	2014-05-10
59	1.36	1.00	2014-02-10	2014-05-10
60	1.36	1.00	2014-02-07	2014-05-10
61	1.36	1.00	2014-02-06	2014-05-10
62	1.35	1.00	2014-02-05	2014-05-10
63	1.35	1.00	2014-02-04	2014-05-10
64	1.35	1.00	2014-02-03	2014-05-10
65	1.35	1.00	2014-01-31	2014-05-10
66	1.35	1.00	2014-01-30	2014-05-10
67	1.37	1.00	2014-01-29	2014-05-10
68	1.37	1.00	2014-01-28	2014-05-10
69	1.37	1.00	2014-01-27	2014-05-10
70	1.37	1.00	2014-01-24	2014-05-10
71	1.37	1.00	2014-01-23	2014-05-10
72	1.35	1.00	2014-01-22	2014-05-10
73	1.36	1.00	2014-01-21	2014-05-10
74	1.36	1.00	2014-01-17	2014-05-10
75	1.36	1.00	2014-01-16	2014-05-10
76	1.36	1.00	2014-01-15	2014-05-10
77	1.37	1.00	2014-01-14	2014-05-10
78	1.36	1.00	2014-01-13	2014-05-10
79	1.37	1.00	2014-01-10	2014-05-10
80	1.36	1.00	2014-01-09	2014-05-10
81	1.36	1.00	2014-01-08	2014-05-10
82	1.36	1.00	2014-01-07	2014-05-10
83	1.36	1.00	2014-01-06	2014-05-10
84	1.36	1.00	2014-01-03	2014-05-10
85	1.37	1.00	2014-01-02	2014-05-10
86	1.38	1.00	2013-12-31	2014-05-10
87	1.38	1.00	2013-12-30	2014-05-10
88	1.38	1.00	2013-12-27	2014-05-10
89	1.37	1.00	2013-12-26	2014-05-10
90	1.37	1.00	2013-12-24	2014-05-10
91	1.37	1.00	2013-12-23	2014-05-10
92	1.37	1.00	2013-12-20	2014-05-10
93	1.37	1.00	2013-12-19	2014-05-10
94	1.38	1.00	2013-12-18	2014-05-10
95	1.37	1.00	2013-12-17	2014-05-10
96	1.38	1.00	2013-12-16	2014-05-10
97	1.37	1.00	2013-12-13	2014-05-10
98	1.38	1.00	2013-12-12	2014-05-10
99	1.38	1.00	2013-12-11	2014-05-10
100	1.38	1.00	2013-12-10	2014-05-10
101	1.37	1.00	2013-12-09	2014-05-10
102	1.37	1.00	2013-12-06	2014-05-10
103	1.37	1.00	2013-12-05	2014-05-10
104	1.36	1.00	2013-12-04	2014-05-10
105	1.36	1.00	2013-12-03	2014-05-10
106	1.36	1.00	2013-12-02	2014-05-10
107	1.36	1.00	2013-11-29	2014-05-10
108	1.36	1.00	2013-11-27	2014-05-10
109	1.36	1.00	2013-11-26	2014-05-10
110	1.35	1.00	2013-11-25	2014-05-10
111	1.35	1.00	2013-11-22	2014-05-10
112	1.35	1.00	2013-11-21	2014-05-10
113	1.35	1.00	2013-11-20	2014-05-10
114	1.35	1.00	2013-11-19	2014-05-10
115	1.35	1.00	2013-11-18	2014-05-10
116	1.35	1.00	2013-11-15	2014-05-10
117	1.35	1.00	2013-11-14	2014-05-10
118	1.35	1.00	2013-11-13	2014-05-10
119	1.34	1.00	2013-11-12	2014-05-10
120	1.34	1.00	2013-11-08	2014-05-10
121	1.34	1.00	2013-11-07	2014-05-10
122	1.35	1.00	2013-11-06	2014-05-10
123	1.35	1.00	2013-11-05	2014-05-10
124	1.35	1.00	2013-11-04	2014-05-10
125	1.35	1.00	2013-11-01	2014-05-10
126	1.36	1.00	2013-10-31	2014-05-10
127	1.38	1.00	2013-10-30	2014-05-10
128	1.38	1.00	2013-10-29	2014-05-10
129	1.38	1.00	2013-10-28	2014-05-10
130	1.38	1.00	2013-10-25	2014-05-10
131	1.38	1.00	2013-10-24	2014-05-10
132	1.38	1.00	2013-10-23	2014-05-10
133	1.38	1.00	2013-10-22	2014-05-10
134	1.37	1.00	2013-10-21	2014-05-10
135	1.37	1.00	2013-10-18	2014-05-10
136	1.37	1.00	2013-10-17	2014-05-10
137	1.35	1.00	2013-10-16	2014-05-10
138	1.35	1.00	2013-10-15	2014-05-10
139	1.36	1.00	2013-10-11	2014-05-10
140	1.35	1.00	2013-10-10	2014-05-10
141	1.35	1.00	2013-10-09	2014-05-10
142	1.36	1.00	2013-10-08	2014-05-10
143	1.36	1.00	2013-10-07	2014-05-10
144	1.36	1.00	2013-10-04	2014-05-10
145	1.36	1.00	2013-10-03	2014-05-10
146	1.36	1.00	2013-10-02	2014-05-10
147	1.35	1.00	2013-10-01	2014-05-10
148	1.35	1.00	2013-09-30	2014-05-10
149	1.35	1.00	2013-09-27	2014-05-10
150	1.35	1.00	2013-09-26	2014-05-10
151	1.35	1.00	2013-09-25	2014-05-10
152	1.35	1.00	2013-09-24	2014-05-10
153	1.35	1.00	2013-09-23	2014-05-10
154	1.35	1.00	2013-09-20	2014-05-10
155	1.35	1.00	2013-09-19	2014-05-10
156	1.34	1.00	2013-09-18	2014-05-10
157	1.34	1.00	2013-09-17	2014-05-10
158	1.33	1.00	2013-09-16	2014-05-10
159	1.33	1.00	2013-09-13	2014-05-10
160	1.33	1.00	2013-09-12	2014-05-10
161	1.33	1.00	2013-09-11	2014-05-10
162	1.33	1.00	2013-09-10	2014-05-10
163	1.33	1.00	2013-09-09	2014-05-10
164	1.32	1.00	2013-09-06	2014-05-10
165	1.31	1.00	2013-09-05	2014-05-10
166	1.32	1.00	2013-09-04	2014-05-10
167	1.32	1.00	2013-09-03	2014-05-10
168	1.32	1.00	2013-08-30	2014-05-10
169	1.32	1.00	2013-08-29	2014-05-10
170	1.33	1.00	2013-08-28	2014-05-10
171	1.34	1.00	2013-08-27	2014-05-10
172	1.34	1.00	2013-08-26	2014-05-10
173	1.34	1.00	2013-08-23	2014-05-10
174	1.34	1.00	2013-08-22	2014-05-10
175	1.34	1.00	2013-08-21	2014-05-10
176	1.34	1.00	2013-08-20	2014-05-10
177	1.33	1.00	2013-08-19	2014-05-10
178	1.33	1.00	2013-08-16	2014-05-10
179	1.33	1.00	2013-08-15	2014-05-10
180	1.33	1.00	2013-08-14	2014-05-10
181	1.32	1.00	2013-08-13	2014-05-10
182	1.33	1.00	2013-08-12	2014-05-10
183	1.33	1.00	2013-08-09	2014-05-10
184	1.34	1.00	2013-08-08	2014-05-10
185	1.33	1.00	2013-08-07	2014-05-10
186	1.33	1.00	2013-08-06	2014-05-10
187	1.33	1.00	2013-08-05	2014-05-10
188	1.33	1.00	2013-08-02	2014-05-10
189	1.32	1.00	2013-08-01	2014-05-10
190	1.33	1.00	2013-07-31	2014-05-10
191	1.33	1.00	2013-07-30	2014-05-10
192	1.33	1.00	2013-07-29	2014-05-10
193	1.33	1.00	2013-07-26	2014-05-10
194	1.32	1.00	2013-07-25	2014-05-10
195	1.32	1.00	2013-07-24	2014-05-10
196	1.32	1.00	2013-07-23	2014-05-10
197	1.32	1.00	2013-07-22	2014-05-10
198	1.31	1.00	2013-07-19	2014-05-10
199	1.31	1.00	2013-07-18	2014-05-10
200	1.31	1.00	2013-07-17	2014-05-10
201	1.31	1.00	2013-07-16	2014-05-10
202	1.30	1.00	2013-07-15	2014-05-10
203	1.30	1.00	2013-07-12	2014-05-10
204	1.30	1.00	2013-07-11	2014-05-10
205	1.28	1.00	2013-07-10	2014-05-10
206	1.28	1.00	2013-07-09	2014-05-10
207	1.29	1.00	2013-07-08	2014-05-10
208	1.28	1.00	2013-07-05	2014-05-10
209	1.30	1.00	2013-07-03	2014-05-10
210	1.30	1.00	2013-07-02	2014-05-10
211	1.31	1.00	2013-07-01	2014-05-10
212	1.30	1.00	2013-06-28	2014-05-10
213	1.30	1.00	2013-06-27	2014-05-10
214	1.30	1.00	2013-06-26	2014-05-10
215	1.31	1.00	2013-06-25	2014-05-10
216	1.31	1.00	2013-06-24	2014-05-10
217	1.31	1.00	2013-06-21	2014-05-10
218	1.32	1.00	2013-06-20	2014-05-10
219	1.34	1.00	2013-06-19	2014-05-10
220	1.34	1.00	2013-06-18	2014-05-10
221	1.33	1.00	2013-06-17	2014-05-10
222	1.33	1.00	2013-06-14	2014-05-10
223	1.33	1.00	2013-06-13	2014-05-10
224	1.34	1.00	2013-06-12	2014-05-10
225	1.33	1.00	2013-06-11	2014-05-10
226	1.32	1.00	2013-06-10	2014-05-10
227	1.32	1.00	2013-06-07	2014-05-10
228	1.32	1.00	2013-06-06	2014-05-10
229	1.31	1.00	2013-06-05	2014-05-10
230	1.31	1.00	2013-06-04	2014-05-10
231	1.31	1.00	2013-06-03	2014-05-10
232	1.30	1.00	2013-05-31	2014-05-10
233	1.30	1.00	2013-05-30	2014-05-10
234	1.29	1.00	2013-05-29	2014-05-10
235	1.29	1.00	2013-05-28	2014-05-10
236	1.29	1.00	2013-05-24	2014-05-10
237	1.29	1.00	2013-05-23	2014-05-10
238	1.29	1.00	2013-05-22	2014-05-10
239	1.29	1.00	2013-05-21	2014-05-10
240	1.29	1.00	2013-05-20	2014-05-10
241	1.28	1.00	2013-05-17	2014-05-10
242	1.29	1.00	2013-05-16	2014-05-10
243	1.29	1.00	2013-05-15	2014-05-10
244	1.30	1.00	2013-05-14	2014-05-10
245	1.30	1.00	2013-05-13	2014-05-10
246	1.30	1.00	2013-05-10	2014-05-10
247	1.31	1.00	2013-05-09	2014-05-10
248	1.32	1.00	2013-05-08	2014-05-10
249	1.31	1.00	2013-05-07	2014-05-10
250	1.31	1.00	2013-05-06	2014-05-10
251	1.31	1.00	2013-05-03	2014-05-10
252	1.31	1.00	2013-05-02	2014-05-10
253	1.32	1.00	2013-05-01	2014-05-10
254	1.32	1.00	2013-04-30	2014-05-10
255	1.31	1.00	2013-04-29	2014-05-10
256	1.30	1.00	2013-04-26	2014-05-10
257	1.30	1.00	2013-04-25	2014-05-10
258	1.30	1.00	2013-04-24	2014-05-10
259	1.30	1.00	2013-04-23	2014-05-10
260	1.30	1.00	2013-04-22	2014-05-10
261	1.31	1.00	2013-04-19	2014-05-10
262	1.31	1.00	2013-04-18	2014-05-10
263	1.30	1.00	2013-04-17	2014-05-10
264	1.31	1.00	2013-04-16	2014-05-10
265	1.31	1.00	2013-04-15	2014-05-10
266	1.31	1.00	2013-04-12	2014-05-10
267	1.31	1.00	2013-04-11	2014-05-10
268	1.31	1.00	2013-04-10	2014-05-10
269	1.31	1.00	2013-04-09	2014-05-10
270	1.30	1.00	2013-04-08	2014-05-10
271	1.30	1.00	2013-04-05	2014-05-10
272	1.29	1.00	2013-04-04	2014-05-10
273	1.28	1.00	2013-04-03	2014-05-10
274	1.28	1.00	2013-04-02	2014-05-10
275	1.29	1.00	2013-04-01	2014-05-10
276	1.28	1.00	2013-03-29	2014-05-10
277	1.28	1.00	2013-03-28	2014-05-10
278	1.28	1.00	2013-03-27	2014-05-10
279	1.29	1.00	2013-03-26	2014-05-10
280	1.29	1.00	2013-03-25	2014-05-10
281	1.30	1.00	2013-03-22	2014-05-10
282	1.29	1.00	2013-03-21	2014-05-10
283	1.29	1.00	2013-03-20	2014-05-10
284	1.29	1.00	2013-03-19	2014-05-10
285	1.30	1.00	2013-03-18	2014-05-10
286	1.31	1.00	2013-03-15	2014-05-10
287	1.30	1.00	2013-03-14	2014-05-10
288	1.29	1.00	2013-03-13	2014-05-10
289	1.30	1.00	2013-03-12	2014-05-10
290	1.30	1.00	2013-03-11	2014-05-10
291	1.30	1.00	2013-03-08	2014-05-10
292	1.31	1.00	2013-03-07	2014-05-10
293	1.30	1.00	2013-03-06	2014-05-10
294	1.30	1.00	2013-03-05	2014-05-10
295	1.30	1.00	2013-03-04	2014-05-10
296	1.30	1.00	2013-03-01	2014-05-10
297	1.31	1.00	2013-02-28	2014-05-10
298	1.31	1.00	2013-02-27	2014-05-10
299	1.31	1.00	2013-02-26	2014-05-10
300	1.32	1.00	2013-02-25	2014-05-10
301	1.32	1.00	2013-02-22	2014-05-10
302	1.32	1.00	2013-02-21	2014-05-10
303	1.33	1.00	2013-02-20	2014-05-10
304	1.34	1.00	2013-02-19	2014-05-10
305	1.34	1.00	2013-02-15	2014-05-10
306	1.33	1.00	2013-02-14	2014-05-10
307	1.34	1.00	2013-02-13	2014-05-10
308	1.34	1.00	2013-02-12	2014-05-10
309	1.34	1.00	2013-02-11	2014-05-10
310	1.34	1.00	2013-02-08	2014-05-10
311	1.34	1.00	2013-02-07	2014-05-10
312	1.35	1.00	2013-02-06	2014-05-10
313	1.36	1.00	2013-02-05	2014-05-10
314	1.35	1.00	2013-02-04	2014-05-10
315	1.37	1.00	2013-02-01	2014-05-10
316	1.36	1.00	2013-01-31	2014-05-10
317	1.36	1.00	2013-01-30	2014-05-10
318	1.35	1.00	2013-01-29	2014-05-10
319	1.35	1.00	2013-01-28	2014-05-10
320	1.35	1.00	2013-01-25	2014-05-10
321	1.34	1.00	2013-01-24	2014-05-10
322	1.33	1.00	2013-01-23	2014-05-10
323	1.33	1.00	2013-01-22	2014-05-10
324	1.33	1.00	2013-01-18	2014-05-10
325	1.34	1.00	2013-01-17	2014-05-10
326	1.33	1.00	2013-01-16	2014-05-10
327	1.33	1.00	2013-01-15	2014-05-10
328	1.34	1.00	2013-01-14	2014-05-10
329	1.34	1.00	2013-01-11	2014-05-10
330	1.32	1.00	2013-01-10	2014-05-10
331	1.31	1.00	2013-01-09	2014-05-10
332	1.31	1.00	2013-01-08	2014-05-10
333	1.31	1.00	2013-01-07	2014-05-10
334	1.30	1.00	2013-01-04	2014-05-10
335	1.31	1.00	2013-01-03	2014-05-10
336	1.32	1.00	2013-01-02	2014-05-10
337	1.32	1.00	2012-12-31	2014-05-10
338	1.32	1.00	2012-12-28	2014-05-10
339	1.32	1.00	2012-12-27	2014-05-10
340	1.32	1.00	2012-12-26	2014-05-10
341	1.32	1.00	2012-12-24	2014-05-10
342	1.32	1.00	2012-12-21	2014-05-10
343	1.32	1.00	2012-12-20	2014-05-10
344	1.33	1.00	2012-12-19	2014-05-10
345	1.32	1.00	2012-12-18	2014-05-10
346	1.32	1.00	2012-12-17	2014-05-10
347	1.31	1.00	2012-12-14	2014-05-10
348	1.31	1.00	2012-12-13	2014-05-10
349	1.30	1.00	2012-12-12	2014-05-10
350	1.30	1.00	2012-12-11	2014-05-10
351	1.29	1.00	2012-12-10	2014-05-10
352	1.29	1.00	2012-12-07	2014-05-10
353	1.30	1.00	2012-12-06	2014-05-10
354	1.31	1.00	2012-12-05	2014-05-10
355	1.31	1.00	2012-12-04	2014-05-10
356	1.31	1.00	2012-12-03	2014-05-10
357	1.30	1.00	2012-11-30	2014-05-10
358	1.30	1.00	2012-11-29	2014-05-10
359	1.29	1.00	2012-11-28	2014-05-10
360	1.29	1.00	2012-11-27	2014-05-10
361	1.30	1.00	2012-11-26	2014-05-10
362	1.30	1.00	2012-11-23	2014-05-10
363	1.28	1.00	2012-11-21	2014-05-10
364	1.28	1.00	2012-11-20	2014-05-10
365	1.28	1.00	2012-11-19	2014-05-10
366	1.27	1.00	2012-11-16	2014-05-10
367	1.28	1.00	2012-11-15	2014-05-10
368	1.27	1.00	2012-11-14	2014-05-10
369	1.27	1.00	2012-11-13	2014-05-10
370	1.27	1.00	2012-11-09	2014-05-10
371	1.27	1.00	2012-11-08	2014-05-10
372	1.28	1.00	2012-11-07	2014-05-10
373	1.28	1.00	2012-11-06	2014-05-10
374	1.28	1.00	2012-11-05	2014-05-10
375	1.28	1.00	2012-11-02	2014-05-10
376	1.29	1.00	2012-11-01	2014-05-10
377	1.30	1.00	2012-10-31	2014-05-10
378	1.30	1.00	2012-10-30	2014-05-10
379	1.29	1.00	2012-10-29	2014-05-10
380	1.29	1.00	2012-10-26	2014-05-10
381	1.30	1.00	2012-10-25	2014-05-10
382	1.29	1.00	2012-10-24	2014-05-10
383	1.30	1.00	2012-10-23	2014-05-10
384	1.31	1.00	2012-10-22	2014-05-10
385	1.30	1.00	2012-10-19	2014-05-10
386	1.31	1.00	2012-10-18	2014-05-10
387	1.31	1.00	2012-10-17	2014-05-10
388	1.30	1.00	2012-10-16	2014-05-10
389	1.29	1.00	2012-10-15	2014-05-10
390	1.29	1.00	2012-10-12	2014-05-10
391	1.29	1.00	2012-10-11	2014-05-10
392	1.29	1.00	2012-10-10	2014-05-10
393	1.29	1.00	2012-10-09	2014-05-10
394	1.31	1.00	2012-10-05	2014-05-10
395	1.30	1.00	2012-10-04	2014-05-10
396	1.29	1.00	2012-10-03	2014-05-10
397	1.30	1.00	2012-10-02	2014-05-10
398	1.29	1.00	2012-10-01	2014-05-10
399	1.29	1.00	2012-09-28	2014-05-10
400	1.29	1.00	2012-09-27	2014-05-10
401	1.29	1.00	2012-09-26	2014-05-10
402	1.29	1.00	2012-09-25	2014-05-10
403	1.29	1.00	2012-09-24	2014-05-10
404	1.30	1.00	2012-09-21	2014-05-10
405	1.29	1.00	2012-09-20	2014-05-10
406	1.31	1.00	2012-09-19	2014-05-10
407	1.31	1.00	2012-09-18	2014-05-10
408	1.31	1.00	2012-09-17	2014-05-10
409	1.31	1.00	2012-09-14	2014-05-10
410	1.29	1.00	2012-09-13	2014-05-10
411	1.29	1.00	2012-09-12	2014-05-10
412	1.29	1.00	2012-09-11	2014-05-10
413	1.28	1.00	2012-09-10	2014-05-10
414	1.28	1.00	2012-09-07	2014-05-10
415	1.26	1.00	2012-09-06	2014-05-10
416	1.26	1.00	2012-09-05	2014-05-10
417	1.26	1.00	2012-09-04	2014-05-10
418	1.26	1.00	2012-08-31	2014-05-10
419	1.25	1.00	2012-08-30	2014-05-10
420	1.25	1.00	2012-08-29	2014-05-10
421	1.26	1.00	2012-08-28	2014-05-10
422	1.25	1.00	2012-08-27	2014-05-10
423	1.25	1.00	2012-08-24	2014-05-10
424	1.26	1.00	2012-08-23	2014-05-10
425	1.25	1.00	2012-08-22	2014-05-10
426	1.25	1.00	2012-08-21	2014-05-10
427	1.23	1.00	2012-08-20	2014-05-10
428	1.23	1.00	2012-08-17	2014-05-10
429	1.24	1.00	2012-08-16	2014-05-10
430	1.23	1.00	2012-08-15	2014-05-10
431	1.23	1.00	2012-08-14	2014-05-10
432	1.23	1.00	2012-08-13	2014-05-10
433	1.23	1.00	2012-08-10	2014-05-10
434	1.23	1.00	2012-08-09	2014-05-10
435	1.24	1.00	2012-08-08	2014-05-10
436	1.24	1.00	2012-08-07	2014-05-10
437	1.24	1.00	2012-08-06	2014-05-10
438	1.24	1.00	2012-08-03	2014-05-10
439	1.21	1.00	2012-08-02	2014-05-10
440	1.23	1.00	2012-08-01	2014-05-10
441	1.23	1.00	2012-07-31	2014-05-10
442	1.23	1.00	2012-07-30	2014-05-10
443	1.24	1.00	2012-07-27	2014-05-10
444	1.23	1.00	2012-07-26	2014-05-10
445	1.21	1.00	2012-07-25	2014-05-10
446	1.21	1.00	2012-07-24	2014-05-10
447	1.21	1.00	2012-07-23	2014-05-10
448	1.22	1.00	2012-07-20	2014-05-10
449	1.23	1.00	2012-07-19	2014-05-10
450	1.23	1.00	2012-07-18	2014-05-10
451	1.22	1.00	2012-07-17	2014-05-10
452	1.23	1.00	2012-07-16	2014-05-10
453	1.22	1.00	2012-07-13	2014-05-10
454	1.22	1.00	2012-07-12	2014-05-10
455	1.22	1.00	2012-07-11	2014-05-10
456	1.23	1.00	2012-07-10	2014-05-10
457	1.23	1.00	2012-07-09	2014-05-10
458	1.23	1.00	2012-07-06	2014-05-10
459	1.24	1.00	2012-07-05	2014-05-10
460	1.26	1.00	2012-07-03	2014-05-10
461	1.26	1.00	2012-07-02	2014-05-10
462	1.27	1.00	2012-06-29	2014-05-10
463	1.24	1.00	2012-06-28	2014-05-10
464	1.25	1.00	2012-06-27	2014-05-10
465	1.25	1.00	2012-06-26	2014-05-10
466	1.25	1.00	2012-06-25	2014-05-10
467	1.25	1.00	2012-06-22	2014-05-10
468	1.26	1.00	2012-06-21	2014-05-10
469	1.27	1.00	2012-06-20	2014-05-10
470	1.27	1.00	2012-06-19	2014-05-10
471	1.26	1.00	2012-06-18	2014-05-10
472	1.26	1.00	2012-06-15	2014-05-10
473	1.26	1.00	2012-06-14	2014-05-10
474	1.26	1.00	2012-06-13	2014-05-10
475	1.25	1.00	2012-06-12	2014-05-10
476	1.25	1.00	2012-06-11	2014-05-10
477	1.25	1.00	2012-06-08	2014-05-10
478	1.26	1.00	2012-06-07	2014-05-10
479	1.25	1.00	2012-06-06	2014-05-10
480	1.24	1.00	2012-06-05	2014-05-10
481	1.25	1.00	2012-06-04	2014-05-10
482	1.24	1.00	2012-06-01	2014-05-10
483	1.24	1.00	2012-05-31	2014-05-10
484	1.24	1.00	2012-05-30	2014-05-10
485	1.25	1.00	2012-05-29	2014-05-10
486	1.25	1.00	2012-05-25	2014-05-10
487	1.26	1.00	2012-05-24	2014-05-10
488	1.26	1.00	2012-05-23	2014-05-10
489	1.27	1.00	2012-05-22	2014-05-10
490	1.28	1.00	2012-05-21	2014-05-10
491	1.27	1.00	2012-05-18	2014-05-10
492	1.27	1.00	2012-05-17	2014-05-10
493	1.27	1.00	2012-05-16	2014-05-10
494	1.28	1.00	2012-05-15	2014-05-10
495	1.28	1.00	2012-05-14	2014-05-10
496	1.29	1.00	2012-05-11	2014-05-10
497	1.30	1.00	2012-05-10	2014-05-10
498	1.30	1.00	2012-05-09	2014-05-10
499	1.30	1.00	2012-05-08	2014-05-10
500	1.31	1.00	2012-05-07	2014-05-10
501	1.31	1.00	2012-05-04	2014-05-10
502	1.31	1.00	2012-05-03	2014-05-10
503	1.32	1.00	2012-05-02	2014-05-10
504	1.32	1.00	2012-05-01	2014-05-10
505	1.32	1.00	2012-04-30	2014-05-10
506	1.32	1.00	2012-04-27	2014-05-10
507	1.32	1.00	2012-04-26	2014-05-10
508	1.32	1.00	2012-04-25	2014-05-10
509	1.32	1.00	2012-04-24	2014-05-10
510	1.31	1.00	2012-04-23	2014-05-10
511	1.32	1.00	2012-04-20	2014-05-10
512	1.31	1.00	2012-04-19	2014-05-10
513	1.31	1.00	2012-04-18	2014-05-10
514	1.31	1.00	2012-04-17	2014-05-10
515	1.31	1.00	2012-04-16	2014-05-10
516	1.31	1.00	2012-04-13	2014-05-10
517	1.32	1.00	2012-04-12	2014-05-10
518	1.31	1.00	2012-04-11	2014-05-10
519	1.31	1.00	2012-04-10	2014-05-10
520	1.31	1.00	2012-04-09	2014-05-10
521	1.31	1.00	2012-04-06	2014-05-10
522	1.31	1.00	2012-04-05	2014-05-10
523	1.31	1.00	2012-04-04	2014-05-10
524	1.33	1.00	2012-04-03	2014-05-10
525	1.33	1.00	2012-04-02	2014-05-10
526	1.33	1.00	2012-03-30	2014-05-10
527	1.33	1.00	2012-03-29	2014-05-10
528	1.33	1.00	2012-03-28	2014-05-10
529	1.33	1.00	2012-03-27	2014-05-10
530	1.33	1.00	2012-03-26	2014-05-10
531	1.33	1.00	2012-03-23	2014-05-10
532	1.32	1.00	2012-03-22	2014-05-10
533	1.32	1.00	2012-03-21	2014-05-10
534	1.32	1.00	2012-03-20	2014-05-10
535	1.32	1.00	2012-03-19	2014-05-10
536	1.32	1.00	2012-03-16	2014-05-10
537	1.31	1.00	2012-03-15	2014-05-10
538	1.30	1.00	2012-03-14	2014-05-10
539	1.31	1.00	2012-03-13	2014-05-10
540	1.31	1.00	2012-03-12	2014-05-10
541	1.31	1.00	2012-03-09	2014-05-10
542	1.33	1.00	2012-03-08	2014-05-10
543	1.31	1.00	2012-03-07	2014-05-10
544	1.31	1.00	2012-03-06	2014-05-10
545	1.32	1.00	2012-03-05	2014-05-10
546	1.32	1.00	2012-03-02	2014-05-10
547	1.33	1.00	2012-03-01	2014-05-10
548	1.34	1.00	2012-02-29	2014-05-10
549	1.35	1.00	2012-02-28	2014-05-10
550	1.34	1.00	2012-02-27	2014-05-10
551	1.35	1.00	2012-02-24	2014-05-10
552	1.33	1.00	2012-02-23	2014-05-10
553	1.33	1.00	2012-02-22	2014-05-10
554	1.33	1.00	2012-02-21	2014-05-10
555	1.31	1.00	2012-02-17	2014-05-10
556	1.31	1.00	2012-02-16	2014-05-10
557	1.31	1.00	2012-02-15	2014-05-10
558	1.31	1.00	2012-02-14	2014-05-10
559	1.32	1.00	2012-02-13	2014-05-10
560	1.32	1.00	2012-02-10	2014-05-10
561	1.33	1.00	2012-02-09	2014-05-10
562	1.33	1.00	2012-02-08	2014-05-10
563	1.32	1.00	2012-02-07	2014-05-10
564	1.31	1.00	2012-02-06	2014-05-10
565	1.31	1.00	2012-02-03	2014-05-10
566	1.32	1.00	2012-02-02	2014-05-10
567	1.32	1.00	2012-02-01	2014-05-10
568	1.31	1.00	2012-01-31	2014-05-10
569	1.31	1.00	2012-01-30	2014-05-10
570	1.32	1.00	2012-01-27	2014-05-10
571	1.32	1.00	2012-01-26	2014-05-10
572	1.30	1.00	2012-01-25	2014-05-10
573	1.30	1.00	2012-01-24	2014-05-10
574	1.30	1.00	2012-01-23	2014-05-10
575	1.29	1.00	2012-01-20	2014-05-10
576	1.29	1.00	2012-01-19	2014-05-10
577	1.28	1.00	2012-01-18	2014-05-10
578	1.27	1.00	2012-01-17	2014-05-10
579	1.27	1.00	2012-01-13	2014-05-10
580	1.28	1.00	2012-01-12	2014-05-10
581	1.27	1.00	2012-01-11	2014-05-10
582	1.28	1.00	2012-01-10	2014-05-10
583	1.27	1.00	2012-01-09	2014-05-10
584	1.27	1.00	2012-01-06	2014-05-10
585	1.28	1.00	2012-01-05	2014-05-10
586	1.29	1.00	2012-01-04	2014-05-10
587	1.31	1.00	2012-01-03	2014-05-10
588	1.30	1.00	2011-12-30	2014-05-10
589	1.30	1.00	2011-12-29	2014-05-10
590	1.29	1.00	2011-12-28	2014-05-10
591	1.31	1.00	2011-12-27	2014-05-10
592	1.30	1.00	2011-12-23	2014-05-10
593	1.30	1.00	2011-12-22	2014-05-10
594	1.30	1.00	2011-12-21	2014-05-10
595	1.31	1.00	2011-12-20	2014-05-10
596	1.30	1.00	2011-12-19	2014-05-10
597	1.30	1.00	2011-12-16	2014-05-10
598	1.30	1.00	2011-12-15	2014-05-10
599	1.30	1.00	2011-12-14	2014-05-10
600	1.31	1.00	2011-12-13	2014-05-10
601	1.32	1.00	2011-12-12	2014-05-10
602	1.34	1.00	2011-12-09	2014-05-10
603	1.33	1.00	2011-12-08	2014-05-10
604	1.34	1.00	2011-12-07	2014-05-10
605	1.34	1.00	2011-12-06	2014-05-10
606	1.35	1.00	2011-12-05	2014-05-10
607	1.34	1.00	2011-12-02	2014-05-10
608	1.35	1.00	2011-12-01	2014-05-10
609	1.35	1.00	2011-11-30	2014-05-10
610	1.33	1.00	2011-11-29	2014-05-10
611	1.33	1.00	2011-11-28	2014-05-10
612	1.32	1.00	2011-11-25	2014-05-10
613	1.33	1.00	2011-11-23	2014-05-10
614	1.35	1.00	2011-11-22	2014-05-10
615	1.35	1.00	2011-11-21	2014-05-10
616	1.35	1.00	2011-11-18	2014-05-10
617	1.35	1.00	2011-11-17	2014-05-10
618	1.35	1.00	2011-11-16	2014-05-10
619	1.35	1.00	2011-11-15	2014-05-10
620	1.36	1.00	2011-11-14	2014-05-10
621	1.36	1.00	2011-11-10	2014-05-10
622	1.36	1.00	2011-11-09	2014-05-10
623	1.38	1.00	2011-11-08	2014-05-10
624	1.37	1.00	2011-11-07	2014-05-10
625	1.38	1.00	2011-11-04	2014-05-10
626	1.37	1.00	2011-11-03	2014-05-10
627	1.38	1.00	2011-11-02	2014-05-10
628	1.37	1.00	2011-11-01	2014-05-10
629	1.39	1.00	2011-10-31	2014-05-10
630	1.42	1.00	2011-10-28	2014-05-10
631	1.42	1.00	2011-10-27	2014-05-10
632	1.38	1.00	2011-10-26	2014-05-10
633	1.39	1.00	2011-10-25	2014-05-10
634	1.39	1.00	2011-10-24	2014-05-10
635	1.39	1.00	2011-10-21	2014-05-10
636	1.37	1.00	2011-10-20	2014-05-10
637	1.38	1.00	2011-10-19	2014-05-10
638	1.37	1.00	2011-10-18	2014-05-10
639	1.38	1.00	2011-10-17	2014-05-10
640	1.39	1.00	2011-10-14	2014-05-10
641	1.37	1.00	2011-10-13	2014-05-10
642	1.38	1.00	2011-10-12	2014-05-10
643	1.37	1.00	2011-10-11	2014-05-10
644	1.35	1.00	2011-10-07	2014-05-10
645	1.34	1.00	2011-10-06	2014-05-10
646	1.33	1.00	2011-10-05	2014-05-10
647	1.33	1.00	2011-10-04	2014-05-10
648	1.33	1.00	2011-10-03	2014-05-10
649	1.34	1.00	2011-09-30	2014-05-10
650	1.36	1.00	2011-09-29	2014-05-10
651	1.36	1.00	2011-09-28	2014-05-10
652	1.36	1.00	2011-09-27	2014-05-10
653	1.35	1.00	2011-09-26	2014-05-10
654	1.35	1.00	2011-09-23	2014-05-10
655	1.34	1.00	2011-09-22	2014-05-10
656	1.37	1.00	2011-09-21	2014-05-10
657	1.37	1.00	2011-09-20	2014-05-10
658	1.36	1.00	2011-09-19	2014-05-10
659	1.38	1.00	2011-09-16	2014-05-10
660	1.39	1.00	2011-09-15	2014-05-10
661	1.37	1.00	2011-09-14	2014-05-10
662	1.37	1.00	2011-09-13	2014-05-10
663	1.36	1.00	2011-09-12	2014-05-10
664	1.37	1.00	2011-09-09	2014-05-10
665	1.39	1.00	2011-09-08	2014-05-10
666	1.41	1.00	2011-09-07	2014-05-10
667	1.40	1.00	2011-09-06	2014-05-10
668	1.42	1.00	2011-09-02	2014-05-10
669	1.43	1.00	2011-09-01	2014-05-10
670	1.44	1.00	2011-08-31	2014-05-10
671	1.44	1.00	2011-08-30	2014-05-10
672	1.45	1.00	2011-08-29	2014-05-10
673	1.45	1.00	2011-08-26	2014-05-10
674	1.44	1.00	2011-08-25	2014-05-10
675	1.44	1.00	2011-08-24	2014-05-10
676	1.44	1.00	2011-08-23	2014-05-10
677	1.44	1.00	2011-08-22	2014-05-10
678	1.44	1.00	2011-08-19	2014-05-10
679	1.43	1.00	2011-08-18	2014-05-10
680	1.44	1.00	2011-08-17	2014-05-10
681	1.44	1.00	2011-08-16	2014-05-10
682	1.45	1.00	2011-08-15	2014-05-10
683	1.42	1.00	2011-08-12	2014-05-10
684	1.42	1.00	2011-08-11	2014-05-10
685	1.42	1.00	2011-08-10	2014-05-10
686	1.42	1.00	2011-08-09	2014-05-10
687	1.42	1.00	2011-08-08	2014-05-10
688	1.42	1.00	2011-08-05	2014-05-10
689	1.42	1.00	2011-08-04	2014-05-10
690	1.43	1.00	2011-08-03	2014-05-10
691	1.42	1.00	2011-08-02	2014-05-10
692	1.42	1.00	2011-08-01	2014-05-10
693	1.44	1.00	2011-07-29	2014-05-10
694	1.43	1.00	2011-07-28	2014-05-10
695	1.44	1.00	2011-07-27	2014-05-10
696	1.45	1.00	2011-07-26	2014-05-10
697	1.44	1.00	2011-07-25	2014-05-10
698	1.44	1.00	2011-07-22	2014-05-10
699	1.44	1.00	2011-07-21	2014-05-10
700	1.42	1.00	2011-07-20	2014-05-10
701	1.42	1.00	2011-07-19	2014-05-10
702	1.40	1.00	2011-07-18	2014-05-10
703	1.42	1.00	2011-07-15	2014-05-10
704	1.42	1.00	2011-07-14	2014-05-10
705	1.42	1.00	2011-07-13	2014-05-10
706	1.40	1.00	2011-07-12	2014-05-10
707	1.40	1.00	2011-07-11	2014-05-10
708	1.43	1.00	2011-07-08	2014-05-10
709	1.43	1.00	2011-07-07	2014-05-10
710	1.43	1.00	2011-07-06	2014-05-10
711	1.45	1.00	2011-07-05	2014-05-10
712	1.45	1.00	2011-07-01	2014-05-10
713	1.45	1.00	2011-06-30	2014-05-10
714	1.44	1.00	2011-06-29	2014-05-10
715	1.44	1.00	2011-06-28	2014-05-10
716	1.43	1.00	2011-06-27	2014-05-10
717	1.42	1.00	2011-06-24	2014-05-10
718	1.42	1.00	2011-06-23	2014-05-10
719	1.44	1.00	2011-06-22	2014-05-10
720	1.44	1.00	2011-06-21	2014-05-10
721	1.43	1.00	2011-06-20	2014-05-10
722	1.43	1.00	2011-06-17	2014-05-10
723	1.42	1.00	2011-06-16	2014-05-10
724	1.42	1.00	2011-06-15	2014-05-10
725	1.45	1.00	2011-06-14	2014-05-10
726	1.44	1.00	2011-06-13	2014-05-10
727	1.44	1.00	2011-06-10	2014-05-10
728	1.45	1.00	2011-06-09	2014-05-10
729	1.46	1.00	2011-06-08	2014-05-10
730	1.47	1.00	2011-06-07	2014-05-10
731	1.46	1.00	2011-06-06	2014-05-10
732	1.46	1.00	2011-06-03	2014-05-10
733	1.44	1.00	2011-06-02	2014-05-10
734	1.44	1.00	2011-06-01	2014-05-10
735	1.44	1.00	2011-05-31	2014-05-10
736	1.43	1.00	2011-05-27	2014-05-10
737	1.41	1.00	2011-05-26	2014-05-10
738	1.41	1.00	2011-05-25	2014-05-10
739	1.41	1.00	2011-05-24	2014-05-10
740	1.40	1.00	2011-05-23	2014-05-10
741	1.42	1.00	2011-05-20	2014-05-10
742	1.43	1.00	2011-05-19	2014-05-10
743	1.43	1.00	2011-05-18	2014-05-10
744	1.42	1.00	2011-05-17	2014-05-10
745	1.42	1.00	2011-05-16	2014-05-10
746	1.41	1.00	2011-05-13	2014-05-10
747	1.42	1.00	2011-05-12	2014-05-10
748	1.43	1.00	2011-05-11	2014-05-10
749	1.44	1.00	2011-05-10	2014-05-10
750	1.43	1.00	2011-05-09	2014-05-10
751	1.45	1.00	2011-05-06	2014-05-10
752	1.46	1.00	2011-05-05	2014-05-10
753	1.49	1.00	2011-05-04	2014-05-10
754	1.49	1.00	2011-05-03	2014-05-10
755	1.49	1.00	2011-05-02	2014-05-10
756	1.48	1.00	2011-04-29	2014-05-10
757	1.48	1.00	2011-04-28	2014-05-10
758	1.47	1.00	2011-04-27	2014-05-10
759	1.46	1.00	2011-04-26	2014-05-10
760	1.46	1.00	2011-04-25	2014-05-10
761	1.45	1.00	2011-04-22	2014-05-10
762	1.46	1.00	2011-04-21	2014-05-10
763	1.45	1.00	2011-04-20	2014-05-10
764	1.43	1.00	2011-04-19	2014-05-10
765	1.42	1.00	2011-04-18	2014-05-10
766	1.44	1.00	2011-04-15	2014-05-10
767	1.45	1.00	2011-04-14	2014-05-10
768	1.45	1.00	2011-04-13	2014-05-10
769	1.45	1.00	2011-04-12	2014-05-10
770	1.45	1.00	2011-04-11	2014-05-10
771	1.44	1.00	2011-04-08	2014-05-10
772	1.43	1.00	2011-04-07	2014-05-10
773	1.43	1.00	2011-04-06	2014-05-10
774	1.42	1.00	2011-04-05	2014-05-10
775	1.42	1.00	2011-04-04	2014-05-10
776	1.42	1.00	2011-04-01	2014-05-10
777	1.42	1.00	2011-03-31	2014-05-10
778	1.41	1.00	2011-03-30	2014-05-10
779	1.41	1.00	2011-03-29	2014-05-10
780	1.41	1.00	2011-03-28	2014-05-10
781	1.41	1.00	2011-03-25	2014-05-10
782	1.42	1.00	2011-03-24	2014-05-10
783	1.41	1.00	2011-03-23	2014-05-10
784	1.42	1.00	2011-03-22	2014-05-10
785	1.42	1.00	2011-03-21	2014-05-10
786	1.41	1.00	2011-03-18	2014-05-10
787	1.40	1.00	2011-03-17	2014-05-10
788	1.39	1.00	2011-03-16	2014-05-10
789	1.40	1.00	2011-03-15	2014-05-10
790	1.40	1.00	2011-03-14	2014-05-10
791	1.39	1.00	2011-03-11	2014-05-10
792	1.38	1.00	2011-03-10	2014-05-10
793	1.39	1.00	2011-03-09	2014-05-10
794	1.39	1.00	2011-03-08	2014-05-10
795	1.40	1.00	2011-03-07	2014-05-10
796	1.40	1.00	2011-03-04	2014-05-10
797	1.39	1.00	2011-03-03	2014-05-10
798	1.39	1.00	2011-03-02	2014-05-10
799	1.38	1.00	2011-03-01	2014-05-10
800	1.38	1.00	2011-02-28	2014-05-10
801	1.38	1.00	2011-02-25	2014-05-10
802	1.38	1.00	2011-02-24	2014-05-10
803	1.38	1.00	2011-02-23	2014-05-10
804	1.37	1.00	2011-02-22	2014-05-10
805	1.37	1.00	2011-02-18	2014-05-10
806	1.36	1.00	2011-02-17	2014-05-10
807	1.35	1.00	2011-02-16	2014-05-10
808	1.35	1.00	2011-02-15	2014-05-10
809	1.35	1.00	2011-02-14	2014-05-10
810	1.35	1.00	2011-02-11	2014-05-10
811	1.36	1.00	2011-02-10	2014-05-10
812	1.37	1.00	2011-02-09	2014-05-10
813	1.37	1.00	2011-02-08	2014-05-10
814	1.36	1.00	2011-02-07	2014-05-10
815	1.36	1.00	2011-02-04	2014-05-10
816	1.37	1.00	2011-02-03	2014-05-10
817	1.38	1.00	2011-02-02	2014-05-10
818	1.38	1.00	2011-02-01	2014-05-10
819	1.37	1.00	2011-01-31	2014-05-10
820	1.36	1.00	2011-01-28	2014-05-10
821	1.37	1.00	2011-01-27	2014-05-10
822	1.37	1.00	2011-01-26	2014-05-10
823	1.36	1.00	2011-01-25	2014-05-10
824	1.37	1.00	2011-01-24	2014-05-10
825	1.36	1.00	2011-01-21	2014-05-10
826	1.34	1.00	2011-01-20	2014-05-10
827	1.35	1.00	2011-01-19	2014-05-10
828	1.34	1.00	2011-01-18	2014-05-10
829	1.33	1.00	2011-01-14	2014-05-10
830	1.34	1.00	2011-01-13	2014-05-10
831	1.31	1.00	2011-01-12	2014-05-10
832	1.30	1.00	2011-01-11	2014-05-10
833	1.29	1.00	2011-01-10	2014-05-10
834	1.29	1.00	2011-01-07	2014-05-10
835	1.30	1.00	2011-01-06	2014-05-10
836	1.32	1.00	2011-01-05	2014-05-10
837	1.33	1.00	2011-01-04	2014-05-10
838	1.34	1.00	2011-01-03	2014-05-10
839	1.33	1.00	2010-12-30	2014-05-10
840	1.32	1.00	2010-12-29	2014-05-10
841	1.31	1.00	2010-12-28	2014-05-10
842	1.31	1.00	2010-12-27	2014-05-10
843	1.31	1.00	2010-12-23	2014-05-10
844	1.31	1.00	2010-12-22	2014-05-10
845	1.31	1.00	2010-12-21	2014-05-10
846	1.31	1.00	2010-12-20	2014-05-10
847	1.32	1.00	2010-12-17	2014-05-10
848	1.32	1.00	2010-12-16	2014-05-10
849	1.33	1.00	2010-12-15	2014-05-10
850	1.34	1.00	2010-12-14	2014-05-10
851	1.34	1.00	2010-12-13	2014-05-10
852	1.32	1.00	2010-12-10	2014-05-10
853	1.32	1.00	2010-12-09	2014-05-10
854	1.32	1.00	2010-12-08	2014-05-10
855	1.33	1.00	2010-12-07	2014-05-10
856	1.33	1.00	2010-12-06	2014-05-10
857	1.34	1.00	2010-12-03	2014-05-10
858	1.32	1.00	2010-12-02	2014-05-10
859	1.31	1.00	2010-12-01	2014-05-10
860	1.30	1.00	2010-11-30	2014-05-10
861	1.31	1.00	2010-11-29	2014-05-10
862	1.32	1.00	2010-11-26	2014-05-10
863	1.33	1.00	2010-11-24	2014-05-10
864	1.34	1.00	2010-11-23	2014-05-10
865	1.36	1.00	2010-11-22	2014-05-10
866	1.37	1.00	2010-11-19	2014-05-10
867	1.36	1.00	2010-11-18	2014-05-10
868	1.36	1.00	2010-11-17	2014-05-10
869	1.35	1.00	2010-11-16	2014-05-10
870	1.36	1.00	2010-11-15	2014-05-10
871	1.37	1.00	2010-11-12	2014-05-10
872	1.37	1.00	2010-11-10	2014-05-10
873	1.39	1.00	2010-11-09	2014-05-10
874	1.39	1.00	2010-11-08	2014-05-10
875	1.40	1.00	2010-11-05	2014-05-10
876	1.42	1.00	2010-11-04	2014-05-10
877	1.40	1.00	2010-11-03	2014-05-10
878	1.40	1.00	2010-11-02	2014-05-10
879	1.39	1.00	2010-11-01	2014-05-10
880	1.39	1.00	2010-10-29	2014-05-10
881	1.39	1.00	2010-10-28	2014-05-10
882	1.38	1.00	2010-10-27	2014-05-10
883	1.39	1.00	2010-10-26	2014-05-10
884	1.40	1.00	2010-10-25	2014-05-10
885	1.39	1.00	2010-10-22	2014-05-10
886	1.40	1.00	2010-10-21	2014-05-10
887	1.39	1.00	2010-10-20	2014-05-10
888	1.38	1.00	2010-10-19	2014-05-10
889	1.40	1.00	2010-10-18	2014-05-10
890	1.40	1.00	2010-10-15	2014-05-10
891	1.41	1.00	2010-10-14	2014-05-10
892	1.40	1.00	2010-10-13	2014-05-10
893	1.38	1.00	2010-10-12	2014-05-10
894	1.39	1.00	2010-10-08	2014-05-10
895	1.39	1.00	2010-10-07	2014-05-10
896	1.39	1.00	2010-10-06	2014-05-10
897	1.38	1.00	2010-10-05	2014-05-10
898	1.37	1.00	2010-10-04	2014-05-10
899	1.38	1.00	2010-10-01	2014-05-10
900	1.36	1.00	2010-09-30	2014-05-10
901	1.36	1.00	2010-09-29	2014-05-10
902	1.36	1.00	2010-09-28	2014-05-10
903	1.35	1.00	2010-09-27	2014-05-10
904	1.35	1.00	2010-09-24	2014-05-10
905	1.33	1.00	2010-09-23	2014-05-10
906	1.34	1.00	2010-09-22	2014-05-10
907	1.31	1.00	2010-09-21	2014-05-10
908	1.31	1.00	2010-09-20	2014-05-10
909	1.30	1.00	2010-09-17	2014-05-10
910	1.31	1.00	2010-09-16	2014-05-10
911	1.30	1.00	2010-09-15	2014-05-10
912	1.30	1.00	2010-09-14	2014-05-10
913	1.29	1.00	2010-09-13	2014-05-10
914	1.27	1.00	2010-09-10	2014-05-10
915	1.27	1.00	2010-09-09	2014-05-10
916	1.27	1.00	2010-09-08	2014-05-10
917	1.27	1.00	2010-09-07	2014-05-10
918	1.29	1.00	2010-09-03	2014-05-10
919	1.28	1.00	2010-09-02	2014-05-10
920	1.28	1.00	2010-09-01	2014-05-10
921	1.27	1.00	2010-08-31	2014-05-10
922	1.27	1.00	2010-08-30	2014-05-10
923	1.28	1.00	2010-08-27	2014-05-10
924	1.27	1.00	2010-08-26	2014-05-10
925	1.27	1.00	2010-08-25	2014-05-10
926	1.27	1.00	2010-08-24	2014-05-10
927	1.27	1.00	2010-08-23	2014-05-10
928	1.27	1.00	2010-08-20	2014-05-10
929	1.28	1.00	2010-08-19	2014-05-10
930	1.29	1.00	2010-08-18	2014-05-10
931	1.29	1.00	2010-08-17	2014-05-10
932	1.28	1.00	2010-08-16	2014-05-10
933	1.28	1.00	2010-08-13	2014-05-10
934	1.29	1.00	2010-08-12	2014-05-10
935	1.29	1.00	2010-08-11	2014-05-10
936	1.31	1.00	2010-08-10	2014-05-10
937	1.32	1.00	2010-08-09	2014-05-10
938	1.33	1.00	2010-08-06	2014-05-10
939	1.32	1.00	2010-08-05	2014-05-10
940	1.32	1.00	2010-08-04	2014-05-10
941	1.32	1.00	2010-08-03	2014-05-10
942	1.32	1.00	2010-08-02	2014-05-10
943	1.31	1.00	2010-07-30	2014-05-10
944	1.31	1.00	2010-07-29	2014-05-10
945	1.30	1.00	2010-07-28	2014-05-10
946	1.30	1.00	2010-07-27	2014-05-10
947	1.30	1.00	2010-07-26	2014-05-10
948	1.29	1.00	2010-07-23	2014-05-10
949	1.29	1.00	2010-07-22	2014-05-10
950	1.28	1.00	2010-07-21	2014-05-10
951	1.29	1.00	2010-07-20	2014-05-10
952	1.30	1.00	2010-07-19	2014-05-10
953	1.29	1.00	2010-07-16	2014-05-10
954	1.29	1.00	2010-07-15	2014-05-10
955	1.28	1.00	2010-07-14	2014-05-10
956	1.27	1.00	2010-07-13	2014-05-10
957	1.26	1.00	2010-07-12	2014-05-10
958	1.26	1.00	2010-07-09	2014-05-10
959	1.27	1.00	2010-07-08	2014-05-10
960	1.26	1.00	2010-07-07	2014-05-10
961	1.26	1.00	2010-07-06	2014-05-10
962	1.26	1.00	2010-07-02	2014-05-10
963	1.25	1.00	2010-07-01	2014-05-10
964	1.23	1.00	2010-06-30	2014-05-10
965	1.22	1.00	2010-06-29	2014-05-10
966	1.23	1.00	2010-06-28	2014-05-10
967	1.23	1.00	2010-06-25	2014-05-10
968	1.23	1.00	2010-06-24	2014-05-10
969	1.23	1.00	2010-06-23	2014-05-10
970	1.23	1.00	2010-06-22	2014-05-10
971	1.24	1.00	2010-06-21	2014-05-10
972	1.24	1.00	2010-06-18	2014-05-10
973	1.24	1.00	2010-06-17	2014-05-10
974	1.23	1.00	2010-06-16	2014-05-10
975	1.23	1.00	2010-06-15	2014-05-10
976	1.23	1.00	2010-06-14	2014-05-10
977	1.21	1.00	2010-06-11	2014-05-10
978	1.21	1.00	2010-06-10	2014-05-10
979	1.20	1.00	2010-06-09	2014-05-10
980	1.20	1.00	2010-06-08	2014-05-10
981	1.20	1.00	2010-06-07	2014-05-10
982	1.20	1.00	2010-06-04	2014-05-10
983	1.22	1.00	2010-06-03	2014-05-10
984	1.22	1.00	2010-06-02	2014-05-10
985	1.23	1.00	2010-06-01	2014-05-10
986	1.24	1.00	2010-05-28	2014-05-10
987	1.24	1.00	2010-05-27	2014-05-10
988	1.22	1.00	2010-05-26	2014-05-10
989	1.23	1.00	2010-05-25	2014-05-10
990	1.24	1.00	2010-05-24	2014-05-10
991	1.26	1.00	2010-05-21	2014-05-10
992	1.24	1.00	2010-05-20	2014-05-10
993	1.23	1.00	2010-05-19	2014-05-10
994	1.24	1.00	2010-05-18	2014-05-10
995	1.23	1.00	2010-05-17	2014-05-10
996	1.24	1.00	2010-05-14	2014-05-10
997	1.26	1.00	2010-05-13	2014-05-10
998	1.26	1.00	2010-05-12	2014-05-10
999	1.27	1.00	2010-05-11	2014-05-10
1000	1.29	1.00	2010-05-10	2014-05-10
1001	1.27	1.00	2010-05-07	2014-05-10
1002	1.27	1.00	2010-05-06	2014-05-10
1003	1.29	1.00	2010-05-05	2014-05-10
1004	1.30	1.00	2010-05-04	2014-05-10
1005	1.32	1.00	2010-05-03	2014-05-10
1006	1.33	1.00	2010-04-30	2014-05-10
1007	1.32	1.00	2010-04-29	2014-05-10
1008	1.31	1.00	2010-04-28	2014-05-10
1009	1.32	1.00	2010-04-27	2014-05-10
1010	1.33	1.00	2010-04-26	2014-05-10
1011	1.34	1.00	2010-04-23	2014-05-10
1012	1.33	1.00	2010-04-22	2014-05-10
1013	1.34	1.00	2010-04-21	2014-05-10
1014	1.34	1.00	2010-04-20	2014-05-10
1015	1.35	1.00	2010-04-19	2014-05-10
1016	1.35	1.00	2010-04-16	2014-05-10
1017	1.35	1.00	2010-04-15	2014-05-10
1018	1.37	1.00	2010-04-14	2014-05-10
1019	1.36	1.00	2010-04-13	2014-05-10
1020	1.36	1.00	2010-04-12	2014-05-10
1021	1.35	1.00	2010-04-09	2014-05-10
1022	1.34	1.00	2010-04-08	2014-05-10
1023	1.34	1.00	2010-04-07	2014-05-10
1024	1.34	1.00	2010-04-06	2014-05-10
1025	1.35	1.00	2010-04-05	2014-05-10
1026	1.35	1.00	2010-04-02	2014-05-10
1027	1.36	1.00	2010-04-01	2014-05-10
1028	1.35	1.00	2010-03-31	2014-05-10
1029	1.34	1.00	2010-03-30	2014-05-10
1030	1.35	1.00	2010-03-29	2014-05-10
1031	1.34	1.00	2010-03-26	2014-05-10
1032	1.33	1.00	2010-03-25	2014-05-10
1033	1.33	1.00	2010-03-24	2014-05-10
1034	1.35	1.00	2010-03-23	2014-05-10
1035	1.35	1.00	2010-03-22	2014-05-10
1036	1.35	1.00	2010-03-19	2014-05-10
1037	1.36	1.00	2010-03-18	2014-05-10
1038	1.37	1.00	2010-03-17	2014-05-10
1039	1.38	1.00	2010-03-16	2014-05-10
1040	1.37	1.00	2010-03-15	2014-05-10
1041	1.38	1.00	2010-03-12	2014-05-10
1042	1.37	1.00	2010-03-11	2014-05-10
1043	1.37	1.00	2010-03-10	2014-05-10
1044	1.36	1.00	2010-03-09	2014-05-10
1045	1.36	1.00	2010-03-08	2014-05-10
1046	1.36	1.00	2010-03-05	2014-05-10
1047	1.36	1.00	2010-03-04	2014-05-10
1048	1.37	1.00	2010-03-03	2014-05-10
1049	1.36	1.00	2010-03-02	2014-05-10
1050	1.35	1.00	2010-03-01	2014-05-10
1051	1.37	1.00	2010-02-26	2014-05-10
1052	1.35	1.00	2010-02-25	2014-05-10
1053	1.36	1.00	2010-02-24	2014-05-10
1054	1.35	1.00	2010-02-23	2014-05-10
1055	1.36	1.00	2010-02-22	2014-05-10
1056	1.35	1.00	2010-02-19	2014-05-10
1057	1.36	1.00	2010-02-18	2014-05-10
1058	1.36	1.00	2010-02-17	2014-05-10
1059	1.37	1.00	2010-02-16	2014-05-10
1060	1.36	1.00	2010-02-12	2014-05-10
1061	1.36	1.00	2010-02-11	2014-05-10
1062	1.37	1.00	2010-02-10	2014-05-10
1063	1.38	1.00	2010-02-09	2014-05-10
1064	1.37	1.00	2010-02-08	2014-05-10
1065	1.36	1.00	2010-02-05	2014-05-10
1066	1.38	1.00	2010-02-04	2014-05-10
1067	1.39	1.00	2010-02-03	2014-05-10
1068	1.40	1.00	2010-02-02	2014-05-10
1069	1.39	1.00	2010-02-01	2014-05-10
1070	1.39	1.00	2010-01-29	2014-05-10
1071	1.40	1.00	2010-01-28	2014-05-10
1072	1.41	1.00	2010-01-27	2014-05-10
1073	1.41	1.00	2010-01-26	2014-05-10
1074	1.41	1.00	2010-01-25	2014-05-10
1075	1.42	1.00	2010-01-22	2014-05-10
1076	1.41	1.00	2010-01-21	2014-05-10
1077	1.41	1.00	2010-01-20	2014-05-10
1078	1.43	1.00	2010-01-19	2014-05-10
1079	1.44	1.00	2010-01-15	2014-05-10
1080	1.45	1.00	2010-01-14	2014-05-10
1081	1.45	1.00	2010-01-13	2014-05-10
1082	1.45	1.00	2010-01-12	2014-05-10
1083	1.45	1.00	2010-01-11	2014-05-10
1084	1.44	1.00	2010-01-08	2014-05-10
1085	1.43	1.00	2010-01-07	2014-05-10
1086	1.44	1.00	2010-01-06	2014-05-10
1087	1.44	1.00	2010-01-05	2014-05-10
1088	1.44	1.00	2010-01-04	2014-05-10
1089	1.43	1.00	2009-12-31	2014-05-10
1090	1.43	1.00	2009-12-30	2014-05-10
1091	1.44	1.00	2009-12-29	2014-05-10
1092	1.44	1.00	2009-12-28	2014-05-10
1093	1.44	1.00	2009-12-24	2014-05-10
1094	1.43	1.00	2009-12-23	2014-05-10
1095	1.42	1.00	2009-12-22	2014-05-10
1096	1.43	1.00	2009-12-21	2014-05-10
1097	1.43	1.00	2009-12-18	2014-05-10
1098	1.43	1.00	2009-12-17	2014-05-10
1099	1.46	1.00	2009-12-16	2014-05-10
1100	1.45	1.00	2009-12-15	2014-05-10
1101	1.46	1.00	2009-12-14	2014-05-10
1102	1.46	1.00	2009-12-11	2014-05-10
1103	1.47	1.00	2009-12-10	2014-05-10
1104	1.47	1.00	2009-12-09	2014-05-10
1105	1.47	1.00	2009-12-08	2014-05-10
1106	1.48	1.00	2009-12-07	2014-05-10
1107	1.49	1.00	2009-12-04	2014-05-10
1108	1.51	1.00	2009-12-03	2014-05-10
1109	1.51	1.00	2009-12-02	2014-05-10
1110	1.51	1.00	2009-12-01	2014-05-10
1111	1.50	1.00	2009-11-30	2014-05-10
1112	1.50	1.00	2009-11-27	2014-05-10
1113	1.51	1.00	2009-11-25	2014-05-10
1114	1.49	1.00	2009-11-24	2014-05-10
1115	1.50	1.00	2009-11-23	2014-05-10
1116	1.49	1.00	2009-11-20	2014-05-10
1117	1.49	1.00	2009-11-19	2014-05-10
1118	1.50	1.00	2009-11-18	2014-05-10
1119	1.48	1.00	2009-11-17	2014-05-10
1120	1.50	1.00	2009-11-16	2014-05-10
1121	1.49	1.00	2009-11-13	2014-05-10
1122	1.49	1.00	2009-11-12	2014-05-10
1123	1.50	1.00	2009-11-10	2014-05-10
1124	1.50	1.00	2009-11-09	2014-05-10
1125	1.48	1.00	2009-11-06	2014-05-10
1126	1.49	1.00	2009-11-05	2014-05-10
1127	1.48	1.00	2009-11-04	2014-05-10
1128	1.47	1.00	2009-11-03	2014-05-10
1129	1.48	1.00	2009-11-02	2014-05-10
1130	1.48	1.00	2009-10-30	2014-05-10
1131	1.48	1.00	2009-10-29	2014-05-10
1132	1.48	1.00	2009-10-28	2014-05-10
1133	1.48	1.00	2009-10-27	2014-05-10
1134	1.49	1.00	2009-10-26	2014-05-10
1135	1.50	1.00	2009-10-23	2014-05-10
1136	1.50	1.00	2009-10-22	2014-05-10
1137	1.50	1.00	2009-10-21	2014-05-10
1138	1.49	1.00	2009-10-20	2014-05-10
1139	1.49	1.00	2009-10-19	2014-05-10
1140	1.49	1.00	2009-10-16	2014-05-10
1141	1.49	1.00	2009-10-15	2014-05-10
1142	1.49	1.00	2009-10-14	2014-05-10
1143	1.48	1.00	2009-10-13	2014-05-10
1144	1.47	1.00	2009-10-09	2014-05-10
1145	1.48	1.00	2009-10-08	2014-05-10
1146	1.47	1.00	2009-10-07	2014-05-10
1147	1.47	1.00	2009-10-06	2014-05-10
1148	1.46	1.00	2009-10-05	2014-05-10
1149	1.46	1.00	2009-10-02	2014-05-10
1150	1.45	1.00	2009-10-01	2014-05-10
1151	1.46	1.00	2009-09-30	2014-05-10
1152	1.46	1.00	2009-09-29	2014-05-10
1153	1.47	1.00	2009-09-28	2014-05-10
1154	1.47	1.00	2009-09-25	2014-05-10
1155	1.47	1.00	2009-09-24	2014-05-10
1156	1.48	1.00	2009-09-23	2014-05-10
1157	1.48	1.00	2009-09-22	2014-05-10
1158	1.47	1.00	2009-09-21	2014-05-10
1159	1.47	1.00	2009-09-18	2014-05-10
1160	1.47	1.00	2009-09-17	2014-05-10
1161	1.47	1.00	2009-09-16	2014-05-10
1162	1.46	1.00	2009-09-15	2014-05-10
1163	1.46	1.00	2009-09-14	2014-05-10
1164	1.46	1.00	2009-09-11	2014-05-10
1165	1.46	1.00	2009-09-10	2014-05-10
1166	1.46	1.00	2009-09-09	2014-05-10
1167	1.45	1.00	2009-09-08	2014-05-10
1168	1.43	1.00	2009-09-04	2014-05-10
1169	1.43	1.00	2009-09-03	2014-05-10
1170	1.42	1.00	2009-09-02	2014-05-10
1171	1.42	1.00	2009-09-01	2014-05-10
1172	1.44	1.00	2009-08-31	2014-05-10
1173	1.44	1.00	2009-08-28	2014-05-10
1174	1.43	1.00	2009-08-27	2014-05-10
1175	1.42	1.00	2009-08-26	2014-05-10
1176	1.44	1.00	2009-08-25	2014-05-10
1177	1.43	1.00	2009-08-24	2014-05-10
1178	1.43	1.00	2009-08-21	2014-05-10
1179	1.42	1.00	2009-08-20	2014-05-10
1180	1.43	1.00	2009-08-19	2014-05-10
1181	1.41	1.00	2009-08-18	2014-05-10
1182	1.41	1.00	2009-08-17	2014-05-10
1183	1.42	1.00	2009-08-14	2014-05-10
1184	1.43	1.00	2009-08-13	2014-05-10
1185	1.42	1.00	2009-08-12	2014-05-10
1186	1.41	1.00	2009-08-11	2014-05-10
1187	1.41	1.00	2009-08-10	2014-05-10
1188	1.42	1.00	2009-08-07	2014-05-10
1189	1.44	1.00	2009-08-06	2014-05-10
1190	1.44	1.00	2009-08-05	2014-05-10
1191	1.44	1.00	2009-08-04	2014-05-10
1192	1.44	1.00	2009-08-03	2014-05-10
1193	1.43	1.00	2009-07-31	2014-05-10
1194	1.41	1.00	2009-07-30	2014-05-10
1195	1.40	1.00	2009-07-29	2014-05-10
1196	1.42	1.00	2009-07-28	2014-05-10
1197	1.42	1.00	2009-07-27	2014-05-10
1198	1.42	1.00	2009-07-24	2014-05-10
1199	1.43	1.00	2009-07-23	2014-05-10
1200	1.42	1.00	2009-07-22	2014-05-10
1201	1.42	1.00	2009-07-21	2014-05-10
1202	1.42	1.00	2009-07-20	2014-05-10
1203	1.41	1.00	2009-07-17	2014-05-10
1204	1.41	1.00	2009-07-16	2014-05-10
1205	1.41	1.00	2009-07-15	2014-05-10
1206	1.40	1.00	2009-07-14	2014-05-10
1207	1.40	1.00	2009-07-13	2014-05-10
1208	1.39	1.00	2009-07-10	2014-05-10
1209	1.40	1.00	2009-07-09	2014-05-10
1210	1.39	1.00	2009-07-08	2014-05-10
1211	1.40	1.00	2009-07-07	2014-05-10
1212	1.39	1.00	2009-07-06	2014-05-10
1213	1.40	1.00	2009-07-03	2014-05-10
1214	1.40	1.00	2009-07-02	2014-05-10
1215	1.42	1.00	2009-07-01	2014-05-10
1216	1.40	1.00	2009-06-30	2014-05-10
1217	1.41	1.00	2009-06-29	2014-05-10
1218	1.41	1.00	2009-06-26	2014-05-10
1219	1.40	1.00	2009-06-25	2014-05-10
1220	1.40	1.00	2009-06-24	2014-05-10
1221	1.40	1.00	2009-06-23	2014-05-10
1222	1.38	1.00	2009-06-22	2014-05-10
1223	1.40	1.00	2009-06-19	2014-05-10
1224	1.40	1.00	2009-06-18	2014-05-10
1225	1.39	1.00	2009-06-17	2014-05-10
1226	1.39	1.00	2009-06-16	2014-05-10
1227	1.38	1.00	2009-06-15	2014-05-10
1228	1.40	1.00	2009-06-12	2014-05-10
1229	1.41	1.00	2009-06-11	2014-05-10
1230	1.40	1.00	2009-06-10	2014-05-10
1231	1.40	1.00	2009-06-09	2014-05-10
1232	1.39	1.00	2009-06-08	2014-05-10
1233	1.40	1.00	2009-06-05	2014-05-10
1234	1.42	1.00	2009-06-04	2014-05-10
1235	1.42	1.00	2009-06-03	2014-05-10
1236	1.43	1.00	2009-06-02	2014-05-10
1237	1.42	1.00	2009-06-01	2014-05-10
1238	1.41	1.00	2009-05-29	2014-05-10
1239	1.39	1.00	2009-05-28	2014-05-10
1240	1.39	1.00	2009-05-27	2014-05-10
1241	1.40	1.00	2009-05-26	2014-05-10
1242	1.40	1.00	2009-05-22	2014-05-10
1243	1.38	1.00	2009-05-21	2014-05-10
1244	1.38	1.00	2009-05-20	2014-05-10
1245	1.36	1.00	2009-05-19	2014-05-10
1246	1.35	1.00	2009-05-18	2014-05-10
1247	1.35	1.00	2009-05-15	2014-05-10
1248	1.36	1.00	2009-05-14	2014-05-10
1249	1.36	1.00	2009-05-13	2014-05-10
1250	1.36	1.00	2009-05-12	2014-05-10
1251	1.36	1.00	2009-05-11	2014-05-10
1252	1.35	1.00	2009-05-08	2014-05-10
1253	1.34	1.00	2009-05-07	2014-05-10
1254	1.33	1.00	2009-05-06	2014-05-10
1255	1.34	1.00	2009-05-05	2014-05-10
1256	1.34	1.00	2009-05-04	2014-05-10
1257	1.33	1.00	2009-05-01	2014-05-10
1258	1.32	1.00	2009-04-30	2014-05-10
1259	1.33	1.00	2009-04-29	2014-05-10
1260	1.31	1.00	2009-04-28	2014-05-10
1261	1.31	1.00	2009-04-27	2014-05-10
1262	1.33	1.00	2009-04-24	2014-05-10
1263	1.30	1.00	2009-04-23	2014-05-10
1264	1.30	1.00	2009-04-22	2014-05-10
1265	1.30	1.00	2009-04-21	2014-05-10
1266	1.29	1.00	2009-04-20	2014-05-10
1267	1.30	1.00	2009-04-17	2014-05-10
1268	1.32	1.00	2009-04-16	2014-05-10
1269	1.32	1.00	2009-04-15	2014-05-10
1270	1.33	1.00	2009-04-14	2014-05-10
1271	1.34	1.00	2009-04-13	2014-05-10
1272	1.31	1.00	2009-04-10	2014-05-10
1273	1.31	1.00	2009-04-09	2014-05-10
1274	1.33	1.00	2009-04-08	2014-05-10
1275	1.33	1.00	2009-04-07	2014-05-10
1276	1.34	1.00	2009-04-06	2014-05-10
1277	1.34	1.00	2009-04-03	2014-05-10
1278	1.35	1.00	2009-04-02	2014-05-10
1279	1.32	1.00	2009-04-01	2014-05-10
1280	1.33	1.00	2009-03-31	2014-05-10
1281	1.31	1.00	2009-03-30	2014-05-10
1282	1.33	1.00	2009-03-27	2014-05-10
1283	1.36	1.00	2009-03-26	2014-05-10
1284	1.35	1.00	2009-03-25	2014-05-10
1285	1.35	1.00	2009-03-24	2014-05-10
1286	1.36	1.00	2009-03-23	2014-05-10
1287	1.36	1.00	2009-03-20	2014-05-10
1288	1.37	1.00	2009-03-19	2014-05-10
1289	1.31	1.00	2009-03-18	2014-05-10
1290	1.30	1.00	2009-03-17	2014-05-10
1291	1.30	1.00	2009-03-16	2014-05-10
1292	1.29	1.00	2009-03-13	2014-05-10
1293	1.28	1.00	2009-03-12	2014-05-10
1294	1.28	1.00	2009-03-11	2014-05-10
1295	1.28	1.00	2009-03-10	2014-05-10
1296	1.26	1.00	2009-03-09	2014-05-10
1297	1.27	1.00	2009-03-06	2014-05-10
1298	1.26	1.00	2009-03-05	2014-05-10
1299	1.26	1.00	2009-03-04	2014-05-10
1300	1.25	1.00	2009-03-03	2014-05-10
1301	1.26	1.00	2009-03-02	2014-05-10
1302	1.27	1.00	2009-02-27	2014-05-10
1303	1.28	1.00	2009-02-26	2014-05-10
1304	1.27	1.00	2009-02-25	2014-05-10
1305	1.27	1.00	2009-02-24	2014-05-10
1306	1.27	1.00	2009-02-23	2014-05-10
1307	1.27	1.00	2009-02-20	2014-05-10
1308	1.27	1.00	2009-02-19	2014-05-10
1309	1.25	1.00	2009-02-18	2014-05-10
1310	1.26	1.00	2009-02-17	2014-05-10
1311	1.29	1.00	2009-02-13	2014-05-10
1312	1.28	1.00	2009-02-12	2014-05-10
1313	1.29	1.00	2009-02-11	2014-05-10
1314	1.30	1.00	2009-02-10	2014-05-10
1315	1.31	1.00	2009-02-09	2014-05-10
1316	1.29	1.00	2009-02-06	2014-05-10
1317	1.28	1.00	2009-02-05	2014-05-10
1318	1.29	1.00	2009-02-04	2014-05-10
1319	1.30	1.00	2009-02-03	2014-05-10
1320	1.28	1.00	2009-02-02	2014-05-10
1321	1.28	1.00	2009-01-30	2014-05-10
1322	1.30	1.00	2009-01-29	2014-05-10
1323	1.32	1.00	2009-01-28	2014-05-10
1324	1.32	1.00	2009-01-27	2014-05-10
1325	1.31	1.00	2009-01-26	2014-05-10
1326	1.28	1.00	2009-01-23	2014-05-10
1327	1.30	1.00	2009-01-22	2014-05-10
1328	1.29	1.00	2009-01-21	2014-05-10
1329	1.29	1.00	2009-01-20	2014-05-10
1330	1.32	1.00	2009-01-16	2014-05-10
1331	1.31	1.00	2009-01-15	2014-05-10
1332	1.32	1.00	2009-01-14	2014-05-10
1333	1.32	1.00	2009-01-13	2014-05-10
1334	1.33	1.00	2009-01-12	2014-05-10
1335	1.35	1.00	2009-01-09	2014-05-10
1336	1.37	1.00	2009-01-08	2014-05-10
1337	1.37	1.00	2009-01-07	2014-05-10
1338	1.34	1.00	2009-01-06	2014-05-10
1339	1.36	1.00	2009-01-05	2014-05-10
1340	1.39	1.00	2009-01-02	2014-05-10
1341	1.39	1.00	2008-12-31	2014-05-10
1342	1.41	1.00	2008-12-30	2014-05-10
1343	1.42	1.00	2008-12-29	2014-05-10
1344	1.41	1.00	2008-12-26	2014-05-10
1345	1.40	1.00	2008-12-24	2014-05-10
1346	1.40	1.00	2008-12-23	2014-05-10
1347	1.40	1.00	2008-12-22	2014-05-10
1348	1.39	1.00	2008-12-19	2014-05-10
1349	1.43	1.00	2008-12-18	2014-05-10
1350	1.44	1.00	2008-12-17	2014-05-10
1351	1.38	1.00	2008-12-16	2014-05-10
1352	1.37	1.00	2008-12-15	2014-05-10
1353	1.33	1.00	2008-12-12	2014-05-10
1354	1.33	1.00	2008-12-11	2014-05-10
1355	1.30	1.00	2008-12-10	2014-05-10
1356	1.29	1.00	2008-12-09	2014-05-10
1357	1.29	1.00	2008-12-08	2014-05-10
1358	1.27	1.00	2008-12-05	2014-05-10
1359	1.28	1.00	2008-12-04	2014-05-10
1360	1.27	1.00	2008-12-03	2014-05-10
1361	1.27	1.00	2008-12-02	2014-05-10
1362	1.26	1.00	2008-12-01	2014-05-10
1363	1.27	1.00	2008-11-28	2014-05-10
1364	1.28	1.00	2008-11-26	2014-05-10
1365	1.30	1.00	2008-11-25	2014-05-10
1366	1.29	1.00	2008-11-24	2014-05-10
1367	1.25	1.00	2008-11-21	2014-05-10
1368	1.25	1.00	2008-11-20	2014-05-10
1369	1.26	1.00	2008-11-19	2014-05-10
1370	1.27	1.00	2008-11-18	2014-05-10
1371	1.27	1.00	2008-11-17	2014-05-10
1372	1.27	1.00	2008-11-14	2014-05-10
1373	1.25	1.00	2008-11-13	2014-05-10
1374	1.26	1.00	2008-11-12	2014-05-10
1375	1.28	1.00	2008-11-10	2014-05-10
1376	1.28	1.00	2008-11-07	2014-05-10
1377	1.28	1.00	2008-11-06	2014-05-10
1378	1.30	1.00	2008-11-05	2014-05-10
1379	1.30	1.00	2008-11-04	2014-05-10
1380	1.27	1.00	2008-11-03	2014-05-10
1381	1.27	1.00	2008-10-31	2014-05-10
1382	1.28	1.00	2008-10-30	2014-05-10
1383	1.29	1.00	2008-10-29	2014-05-10
1384	1.25	1.00	2008-10-28	2014-05-10
1385	1.24	1.00	2008-10-27	2014-05-10
1386	1.26	1.00	2008-10-24	2014-05-10
1387	1.29	1.00	2008-10-23	2014-05-10
1388	1.28	1.00	2008-10-22	2014-05-10
1389	1.31	1.00	2008-10-21	2014-05-10
1390	1.33	1.00	2008-10-20	2014-05-10
1391	1.35	1.00	2008-10-17	2014-05-10
1392	1.34	1.00	2008-10-16	2014-05-10
1393	1.36	1.00	2008-10-15	2014-05-10
1394	1.37	1.00	2008-10-14	2014-05-10
1395	1.35	1.00	2008-10-10	2014-05-10
1396	1.36	1.00	2008-10-09	2014-05-10
1397	1.37	1.00	2008-10-08	2014-05-10
1398	1.36	1.00	2008-10-07	2014-05-10
1399	1.35	1.00	2008-10-06	2014-05-10
1400	1.38	1.00	2008-10-03	2014-05-10
1401	1.39	1.00	2008-10-02	2014-05-10
1402	1.41	1.00	2008-10-01	2014-05-10
1403	1.41	1.00	2008-09-30	2014-05-10
1404	1.44	1.00	2008-09-29	2014-05-10
1405	1.46	1.00	2008-09-26	2014-05-10
1406	1.46	1.00	2008-09-25	2014-05-10
1407	1.47	1.00	2008-09-24	2014-05-10
1408	1.47	1.00	2008-09-23	2014-05-10
1409	1.47	1.00	2008-09-22	2014-05-10
1410	1.44	1.00	2008-09-19	2014-05-10
1411	1.44	1.00	2008-09-18	2014-05-10
1412	1.42	1.00	2008-09-17	2014-05-10
1413	1.42	1.00	2008-09-16	2014-05-10
1414	1.42	1.00	2008-09-15	2014-05-10
1415	1.42	1.00	2008-09-12	2014-05-10
1416	1.39	1.00	2008-09-11	2014-05-10
1417	1.40	1.00	2008-09-10	2014-05-10
1418	1.42	1.00	2008-09-09	2014-05-10
1419	1.41	1.00	2008-09-08	2014-05-10
1420	1.43	1.00	2008-09-05	2014-05-10
1421	1.44	1.00	2008-09-04	2014-05-10
1422	1.45	1.00	2008-09-03	2014-05-10
1423	1.45	1.00	2008-09-02	2014-05-10
1424	1.47	1.00	2008-08-29	2014-05-10
1425	1.47	1.00	2008-08-28	2014-05-10
1426	1.47	1.00	2008-08-27	2014-05-10
1427	1.47	1.00	2008-08-26	2014-05-10
1428	1.48	1.00	2008-08-25	2014-05-10
1429	1.48	1.00	2008-08-22	2014-05-10
1430	1.49	1.00	2008-08-21	2014-05-10
1431	1.47	1.00	2008-08-20	2014-05-10
1432	1.47	1.00	2008-08-19	2014-05-10
1433	1.47	1.00	2008-08-18	2014-05-10
1434	1.47	1.00	2008-08-15	2014-05-10
1435	1.49	1.00	2008-08-14	2014-05-10
1436	1.49	1.00	2008-08-13	2014-05-10
1437	1.49	1.00	2008-08-12	2014-05-10
1438	1.50	1.00	2008-08-11	2014-05-10
1439	1.50	1.00	2008-08-08	2014-05-10
1440	1.53	1.00	2008-08-07	2014-05-10
1441	1.54	1.00	2008-08-06	2014-05-10
1442	1.55	1.00	2008-08-05	2014-05-10
1443	1.56	1.00	2008-08-04	2014-05-10
1444	1.56	1.00	2008-08-01	2014-05-10
1445	1.56	1.00	2008-07-31	2014-05-10
1446	1.56	1.00	2008-07-30	2014-05-10
1447	1.56	1.00	2008-07-29	2014-05-10
1448	1.57	1.00	2008-07-28	2014-05-10
1449	1.57	1.00	2008-07-25	2014-05-10
1450	1.57	1.00	2008-07-24	2014-05-10
1451	1.57	1.00	2008-07-23	2014-05-10
1452	1.58	1.00	2008-07-22	2014-05-10
1453	1.59	1.00	2008-07-21	2014-05-10
1454	1.59	1.00	2008-07-18	2014-05-10
1455	1.59	1.00	2008-07-17	2014-05-10
1456	1.58	1.00	2008-07-16	2014-05-10
1457	1.59	1.00	2008-07-15	2014-05-10
1458	1.59	1.00	2008-07-14	2014-05-10
1459	1.59	1.00	2008-07-11	2014-05-10
1460	1.58	1.00	2008-07-10	2014-05-10
1461	1.57	1.00	2008-07-09	2014-05-10
1462	1.57	1.00	2008-07-08	2014-05-10
1463	1.56	1.00	2008-07-07	2014-05-10
1464	1.57	1.00	2008-07-03	2014-05-10
1465	1.59	1.00	2008-07-02	2014-05-10
1466	1.58	1.00	2008-07-01	2014-05-10
1467	1.57	1.00	2008-06-30	2014-05-10
1468	1.57	1.00	2008-06-27	2014-05-10
1469	1.57	1.00	2008-06-26	2014-05-10
1470	1.56	1.00	2008-06-25	2014-05-10
1471	1.56	1.00	2008-06-24	2014-05-10
1472	1.55	1.00	2008-06-23	2014-05-10
1473	1.56	1.00	2008-06-20	2014-05-10
1474	1.55	1.00	2008-06-19	2014-05-10
1475	1.55	1.00	2008-06-18	2014-05-10
1476	1.55	1.00	2008-06-17	2014-05-10
1477	1.55	1.00	2008-06-16	2014-05-10
1478	1.54	1.00	2008-06-13	2014-05-10
1479	1.54	1.00	2008-06-12	2014-05-10
1480	1.56	1.00	2008-06-11	2014-05-10
1481	1.55	1.00	2008-06-10	2014-05-10
1482	1.57	1.00	2008-06-09	2014-05-10
1483	1.57	1.00	2008-06-06	2014-05-10
1484	1.56	1.00	2008-06-05	2014-05-10
1485	1.55	1.00	2008-06-04	2014-05-10
1486	1.55	1.00	2008-06-03	2014-05-10
1487	1.55	1.00	2008-06-02	2014-05-10
1488	1.56	1.00	2008-05-30	2014-05-10
1489	1.55	1.00	2008-05-29	2014-05-10
1490	1.56	1.00	2008-05-28	2014-05-10
1491	1.57	1.00	2008-05-27	2014-05-10
1492	1.58	1.00	2008-05-23	2014-05-10
1493	1.57	1.00	2008-05-22	2014-05-10
1494	1.58	1.00	2008-05-21	2014-05-10
1495	1.57	1.00	2008-05-20	2014-05-10
1496	1.55	1.00	2008-05-19	2014-05-10
1497	1.56	1.00	2008-05-16	2014-05-10
1498	1.55	1.00	2008-05-15	2014-05-10
1499	1.55	1.00	2008-05-14	2014-05-10
1500	1.55	1.00	2008-05-13	2014-05-10
1501	1.55	1.00	2008-05-12	2014-05-10
1502	1.54	1.00	2008-05-09	2014-05-10
1503	1.54	1.00	2008-05-08	2014-05-10
1504	1.54	1.00	2008-05-07	2014-05-10
1505	1.55	1.00	2008-05-06	2014-05-10
1506	1.55	1.00	2008-05-05	2014-05-10
1507	1.54	1.00	2008-05-02	2014-05-10
1508	1.55	1.00	2008-05-01	2014-05-10
1509	1.56	1.00	2008-04-30	2014-05-10
1510	1.56	1.00	2008-04-29	2014-05-10
1511	1.56	1.00	2008-04-28	2014-05-10
1512	1.56	1.00	2008-04-25	2014-05-10
1513	1.57	1.00	2008-04-24	2014-05-10
1514	1.59	1.00	2008-04-23	2014-05-10
1515	1.60	1.00	2008-04-22	2014-05-10
1516	1.59	1.00	2008-04-21	2014-05-10
1517	1.57	1.00	2008-04-18	2014-05-10
1518	1.59	1.00	2008-04-17	2014-05-10
1519	1.60	1.00	2008-04-16	2014-05-10
1520	1.58	1.00	2008-04-15	2014-05-10
1521	1.58	1.00	2008-04-14	2014-05-10
1522	1.58	1.00	2008-04-11	2014-05-10
1523	1.57	1.00	2008-04-10	2014-05-10
1524	1.58	1.00	2008-04-09	2014-05-10
1525	1.57	1.00	2008-04-08	2014-05-10
1526	1.57	1.00	2008-04-07	2014-05-10
1527	1.57	1.00	2008-04-04	2014-05-10
1528	1.57	1.00	2008-04-03	2014-05-10
1529	1.56	1.00	2008-04-02	2014-05-10
1530	1.56	1.00	2008-04-01	2014-05-10
1531	1.58	1.00	2008-03-31	2014-05-10
1532	1.58	1.00	2008-03-28	2014-05-10
1533	1.58	1.00	2008-03-27	2014-05-10
1534	1.58	1.00	2008-03-26	2014-05-10
1535	1.56	1.00	2008-03-25	2014-05-10
1536	1.54	1.00	2008-03-24	2014-05-10
1537	1.54	1.00	2008-03-21	2014-05-10
1538	1.54	1.00	2008-03-20	2014-05-10
1539	1.56	1.00	2008-03-19	2014-05-10
1540	1.58	1.00	2008-03-18	2014-05-10
1541	1.58	1.00	2008-03-17	2014-05-10
1542	1.56	1.00	2008-03-14	2014-05-10
1543	1.56	1.00	2008-03-13	2014-05-10
1544	1.55	1.00	2008-03-12	2014-05-10
1545	1.53	1.00	2008-03-11	2014-05-10
1546	1.54	1.00	2008-03-10	2014-05-10
1547	1.53	1.00	2008-03-07	2014-05-10
1548	1.54	1.00	2008-03-06	2014-05-10
1549	1.53	1.00	2008-03-05	2014-05-10
1550	1.52	1.00	2008-03-04	2014-05-10
1551	1.52	1.00	2008-03-03	2014-05-10
1552	1.52	1.00	2008-02-29	2014-05-10
1553	1.52	1.00	2008-02-28	2014-05-10
1554	1.51	1.00	2008-02-27	2014-05-10
1555	1.49	1.00	2008-02-26	2014-05-10
1556	1.48	1.00	2008-02-25	2014-05-10
1557	1.48	1.00	2008-02-22	2014-05-10
1558	1.48	1.00	2008-02-21	2014-05-10
1559	1.47	1.00	2008-02-20	2014-05-10
1560	1.47	1.00	2008-02-19	2014-05-10
1561	1.47	1.00	2008-02-15	2014-05-10
1562	1.46	1.00	2008-02-14	2014-05-10
1563	1.46	1.00	2008-02-13	2014-05-10
1564	1.46	1.00	2008-02-12	2014-05-10
1565	1.45	1.00	2008-02-11	2014-05-10
1566	1.45	1.00	2008-02-08	2014-05-10
1567	1.45	1.00	2008-02-07	2014-05-10
1568	1.46	1.00	2008-02-06	2014-05-10
1569	1.46	1.00	2008-02-05	2014-05-10
1570	1.48	1.00	2008-02-04	2014-05-10
1571	1.49	1.00	2008-02-01	2014-05-10
1572	1.48	1.00	2008-01-31	2014-05-10
1573	1.48	1.00	2008-01-30	2014-05-10
1574	1.48	1.00	2008-01-29	2014-05-10
1575	1.48	1.00	2008-01-28	2014-05-10
1576	1.47	1.00	2008-01-25	2014-05-10
1577	1.47	1.00	2008-01-24	2014-05-10
1578	1.46	1.00	2008-01-23	2014-05-10
1579	1.46	1.00	2008-01-22	2014-05-10
1580	1.46	1.00	2008-01-18	2014-05-10
1581	1.47	1.00	2008-01-17	2014-05-10
1582	1.46	1.00	2008-01-16	2014-05-10
1583	1.48	1.00	2008-01-15	2014-05-10
1584	1.49	1.00	2008-01-14	2014-05-10
1585	1.48	1.00	2008-01-11	2014-05-10
1586	1.47	1.00	2008-01-10	2014-05-10
1587	1.47	1.00	2008-01-09	2014-05-10
1588	1.47	1.00	2008-01-08	2014-05-10
1589	1.47	1.00	2008-01-07	2014-05-10
1590	1.48	1.00	2008-01-04	2014-05-10
1591	1.47	1.00	2008-01-03	2014-05-10
1592	1.47	1.00	2008-01-02	2014-05-10
1593	1.46	1.00	2007-12-31	2014-05-10
1594	1.47	1.00	2007-12-28	2014-05-10
1595	1.46	1.00	2007-12-27	2014-05-10
1596	1.45	1.00	2007-12-26	2014-05-10
1597	1.44	1.00	2007-12-24	2014-05-10
1598	1.44	1.00	2007-12-21	2014-05-10
1599	1.44	1.00	2007-12-20	2014-05-10
1600	1.43	1.00	2007-12-19	2014-05-10
1601	1.44	1.00	2007-12-18	2014-05-10
1602	1.44	1.00	2007-12-17	2014-05-10
1603	1.44	1.00	2007-12-14	2014-05-10
1604	1.46	1.00	2007-12-13	2014-05-10
1605	1.47	1.00	2007-12-12	2014-05-10
1606	1.47	1.00	2007-12-11	2014-05-10
1607	1.47	1.00	2007-12-10	2014-05-10
1608	1.47	1.00	2007-12-07	2014-05-10
1609	1.46	1.00	2007-12-06	2014-05-10
1610	1.47	1.00	2007-12-05	2014-05-10
1611	1.48	1.00	2007-12-04	2014-05-10
1612	1.47	1.00	2007-12-03	2014-05-10
1613	1.47	1.00	2007-11-30	2014-05-10
1614	1.48	1.00	2007-11-29	2014-05-10
1615	1.48	1.00	2007-11-28	2014-05-10
1616	1.48	1.00	2007-11-27	2014-05-10
1617	1.49	1.00	2007-11-26	2014-05-10
1618	1.48	1.00	2007-11-23	2014-05-10
1619	1.48	1.00	2007-11-22	2014-05-10
1620	1.48	1.00	2007-11-21	2014-05-10
1621	1.48	1.00	2007-11-20	2014-05-10
1622	1.47	1.00	2007-11-19	2014-05-10
1623	1.47	1.00	2007-11-16	2014-05-10
1624	1.46	1.00	2007-11-15	2014-05-10
1625	1.47	1.00	2007-11-14	2014-05-10
1626	1.46	1.00	2007-11-13	2014-05-10
1627	1.47	1.00	2007-11-09	2014-05-10
1628	1.47	1.00	2007-11-08	2014-05-10
1629	1.47	1.00	2007-11-07	2014-05-10
1630	1.46	1.00	2007-11-06	2014-05-10
1631	1.45	1.00	2007-11-05	2014-05-10
1632	1.45	1.00	2007-11-02	2014-05-10
1633	1.44	1.00	2007-11-01	2014-05-10
1634	1.45	1.00	2007-10-31	2014-05-10
1635	1.44	1.00	2007-10-30	2014-05-10
1636	1.44	1.00	2007-10-29	2014-05-10
1637	1.44	1.00	2007-10-26	2014-05-10
1638	1.43	1.00	2007-10-25	2014-05-10
1639	1.42	1.00	2007-10-24	2014-05-10
1640	1.42	1.00	2007-10-23	2014-05-10
1641	1.41	1.00	2007-10-22	2014-05-10
1642	1.43	1.00	2007-10-19	2014-05-10
1643	1.43	1.00	2007-10-18	2014-05-10
1644	1.42	1.00	2007-10-17	2014-05-10
1645	1.42	1.00	2007-10-16	2014-05-10
1646	1.42	1.00	2007-10-15	2014-05-10
1647	1.42	1.00	2007-10-12	2014-05-10
1648	1.42	1.00	2007-10-11	2014-05-10
1649	1.42	1.00	2007-10-10	2014-05-10
1650	1.41	1.00	2007-10-09	2014-05-10
1651	1.42	1.00	2007-10-08	2014-05-10
1652	1.42	1.00	2007-10-05	2014-05-10
1653	1.41	1.00	2007-10-04	2014-05-10
1654	1.41	1.00	2007-10-03	2014-05-10
1655	1.42	1.00	2007-10-02	2014-05-10
1656	1.42	1.00	2007-10-01	2014-05-10
1657	1.42	1.00	2007-09-28	2014-05-10
1658	1.41	1.00	2007-09-27	2014-05-10
1659	1.41	1.00	2007-09-26	2014-05-10
1660	1.41	1.00	2007-09-25	2014-05-10
1661	1.41	1.00	2007-09-24	2014-05-10
1662	1.41	1.00	2007-09-21	2014-05-10
1663	1.41	1.00	2007-09-20	2014-05-10
1664	1.40	1.00	2007-09-19	2014-05-10
1665	1.39	1.00	2007-09-18	2014-05-10
1666	1.39	1.00	2007-09-17	2014-05-10
1667	1.38	1.00	2007-09-14	2014-05-10
1668	1.39	1.00	2007-09-13	2014-05-10
1669	1.39	1.00	2007-09-12	2014-05-10
1670	1.38	1.00	2007-09-11	2014-05-10
1671	1.38	1.00	2007-09-10	2014-05-10
1672	1.38	1.00	2007-09-07	2014-05-10
1673	1.37	1.00	2007-09-06	2014-05-10
1674	1.37	1.00	2007-09-05	2014-05-10
1675	1.36	1.00	2007-09-04	2014-05-10
1676	1.36	1.00	2007-09-03	2014-05-10
1677	1.36	1.00	2007-08-31	2014-05-10
1678	1.36	1.00	2007-08-30	2014-05-10
1679	1.37	1.00	2007-08-29	2014-05-10
1680	1.36	1.00	2007-08-28	2014-05-10
1681	1.36	1.00	2007-08-27	2014-05-10
1682	1.36	1.00	2007-08-24	2014-05-10
1683	1.36	1.00	2007-08-23	2014-05-10
1684	1.35	1.00	2007-08-22	2014-05-10
1685	1.35	1.00	2007-08-21	2014-05-10
1686	1.35	1.00	2007-08-20	2014-05-10
1687	1.35	1.00	2007-08-17	2014-05-10
1688	1.34	1.00	2007-08-16	2014-05-10
1689	1.35	1.00	2007-08-15	2014-05-10
1690	1.36	1.00	2007-08-14	2014-05-10
1691	1.36	1.00	2007-08-13	2014-05-10
1692	1.37	1.00	2007-08-10	2014-05-10
1693	1.37	1.00	2007-08-09	2014-05-10
1694	1.38	1.00	2007-08-08	2014-05-10
1695	1.37	1.00	2007-08-07	2014-05-10
1696	1.38	1.00	2007-08-06	2014-05-10
1697	1.38	1.00	2007-08-03	2014-05-10
1698	1.37	1.00	2007-08-02	2014-05-10
1699	1.37	1.00	2007-08-01	2014-05-10
1700	1.37	1.00	2007-07-31	2014-05-10
1701	1.37	1.00	2007-07-30	2014-05-10
1702	1.36	1.00	2007-07-27	2014-05-10
1703	1.37	1.00	2007-07-26	2014-05-10
1704	1.37	1.00	2007-07-25	2014-05-10
1705	1.38	1.00	2007-07-24	2014-05-10
1706	1.38	1.00	2007-07-23	2014-05-10
1707	1.38	1.00	2007-07-20	2014-05-10
1708	1.38	1.00	2007-07-19	2014-05-10
1709	1.38	1.00	2007-07-18	2014-05-10
1710	1.38	1.00	2007-07-17	2014-05-10
1711	1.38	1.00	2007-07-16	2014-05-10
1712	1.38	1.00	2007-07-13	2014-05-10
1713	1.38	1.00	2007-07-12	2014-05-10
1714	1.38	1.00	2007-07-11	2014-05-10
1715	1.37	1.00	2007-07-10	2014-05-10
1716	1.36	1.00	2007-07-09	2014-05-10
1717	1.36	1.00	2007-07-06	2014-05-10
1718	1.36	1.00	2007-07-05	2014-05-10
1719	1.36	1.00	2007-07-03	2014-05-10
1720	1.36	1.00	2007-07-02	2014-05-10
1721	1.35	1.00	2007-06-29	2014-05-10
1722	1.35	1.00	2007-06-28	2014-05-10
1723	1.34	1.00	2007-06-27	2014-05-10
1724	1.35	1.00	2007-06-26	2014-05-10
1725	1.34	1.00	2007-06-25	2014-05-10
1726	1.34	1.00	2007-06-22	2014-05-10
1727	1.34	1.00	2007-06-21	2014-05-10
1728	1.34	1.00	2007-06-20	2014-05-10
1729	1.34	1.00	2007-06-19	2014-05-10
1730	1.34	1.00	2007-06-18	2014-05-10
1731	1.34	1.00	2007-06-15	2014-05-10
1732	1.33	1.00	2007-06-14	2014-05-10
1733	1.33	1.00	2007-06-13	2014-05-10
1734	1.33	1.00	2007-06-12	2014-05-10
1735	1.34	1.00	2007-06-11	2014-05-10
1736	1.34	1.00	2007-06-08	2014-05-10
1737	1.35	1.00	2007-06-07	2014-05-10
1738	1.35	1.00	2007-06-06	2014-05-10
1739	1.35	1.00	2007-06-05	2014-05-10
1740	1.35	1.00	2007-06-04	2014-05-10
1741	1.34	1.00	2007-06-01	2014-05-10
1742	1.35	1.00	2007-05-31	2014-05-10
1743	1.34	1.00	2007-05-30	2014-05-10
1744	1.35	1.00	2007-05-29	2014-05-10
1745	1.35	1.00	2007-05-25	2014-05-10
1746	1.34	1.00	2007-05-24	2014-05-10
1747	1.35	1.00	2007-05-23	2014-05-10
1748	1.35	1.00	2007-05-22	2014-05-10
1749	1.35	1.00	2007-05-21	2014-05-10
1750	1.35	1.00	2007-05-18	2014-05-10
1751	1.35	1.00	2007-05-17	2014-05-10
1752	1.35	1.00	2007-05-16	2014-05-10
1753	1.36	1.00	2007-05-15	2014-05-10
1754	1.35	1.00	2007-05-14	2014-05-10
1755	1.35	1.00	2007-05-11	2014-05-10
1756	1.35	1.00	2007-05-10	2014-05-10
1757	1.35	1.00	2007-05-09	2014-05-10
1758	1.35	1.00	2007-05-08	2014-05-10
1759	1.36	1.00	2007-05-07	2014-05-10
1760	1.36	1.00	2007-05-04	2014-05-10
1761	1.36	1.00	2007-05-03	2014-05-10
1762	1.36	1.00	2007-05-02	2014-05-10
1763	1.36	1.00	2007-05-01	2014-05-10
1764	1.37	1.00	2007-04-30	2014-05-10
1765	1.36	1.00	2007-04-27	2014-05-10
1766	1.36	1.00	2007-04-26	2014-05-10
1767	1.36	1.00	2007-04-25	2014-05-10
1768	1.36	1.00	2007-04-24	2014-05-10
1769	1.36	1.00	2007-04-23	2014-05-10
1770	1.36	1.00	2007-04-20	2014-05-10
1771	1.36	1.00	2007-04-19	2014-05-10
1772	1.36	1.00	2007-04-18	2014-05-10
1773	1.36	1.00	2007-04-17	2014-05-10
1774	1.35	1.00	2007-04-16	2014-05-10
1775	1.35	1.00	2007-04-13	2014-05-10
1776	1.35	1.00	2007-04-12	2014-05-10
1777	1.34	1.00	2007-04-11	2014-05-10
1778	1.34	1.00	2007-04-10	2014-05-10
1779	1.34	1.00	2007-04-09	2014-05-10
1780	1.34	1.00	2007-04-06	2014-05-10
1781	1.34	1.00	2007-04-05	2014-05-10
1782	1.34	1.00	2007-04-04	2014-05-10
1783	1.34	1.00	2007-04-03	2014-05-10
1784	1.34	1.00	2007-04-02	2014-05-10
1785	1.34	1.00	2007-03-30	2014-05-10
1786	1.33	1.00	2007-03-29	2014-05-10
1787	1.33	1.00	2007-03-28	2014-05-10
1788	1.34	1.00	2007-03-27	2014-05-10
1789	1.33	1.00	2007-03-26	2014-05-10
1790	1.33	1.00	2007-03-23	2014-05-10
1791	1.34	1.00	2007-03-22	2014-05-10
1792	1.33	1.00	2007-03-21	2014-05-10
1793	1.33	1.00	2007-03-20	2014-05-10
1794	1.33	1.00	2007-03-19	2014-05-10
1795	1.33	1.00	2007-03-16	2014-05-10
1796	1.32	1.00	2007-03-15	2014-05-10
1797	1.32	1.00	2007-03-14	2014-05-10
1798	1.32	1.00	2007-03-13	2014-05-10
1799	1.32	1.00	2007-03-12	2014-05-10
1800	1.31	1.00	2007-03-09	2014-05-10
1801	1.31	1.00	2007-03-08	2014-05-10
1802	1.31	1.00	2007-03-07	2014-05-10
1803	1.31	1.00	2007-03-06	2014-05-10
1804	1.31	1.00	2007-03-05	2014-05-10
1805	1.32	1.00	2007-03-02	2014-05-10
1806	1.32	1.00	2007-03-01	2014-05-10
1807	1.32	1.00	2007-02-28	2014-05-10
1808	1.32	1.00	2007-02-27	2014-05-10
1809	1.32	1.00	2007-02-26	2014-05-10
1810	1.32	1.00	2007-02-23	2014-05-10
1811	1.31	1.00	2007-02-22	2014-05-10
1812	1.31	1.00	2007-02-21	2014-05-10
1813	1.31	1.00	2007-02-20	2014-05-10
1814	1.31	1.00	2007-02-16	2014-05-10
1815	1.31	1.00	2007-02-15	2014-05-10
1816	1.31	1.00	2007-02-14	2014-05-10
1817	1.30	1.00	2007-02-13	2014-05-10
1818	1.30	1.00	2007-02-12	2014-05-10
1819	1.30	1.00	2007-02-09	2014-05-10
1820	1.30	1.00	2007-02-08	2014-05-10
1821	1.30	1.00	2007-02-07	2014-05-10
1822	1.30	1.00	2007-02-06	2014-05-10
1823	1.29	1.00	2007-02-05	2014-05-10
1824	1.30	1.00	2007-02-02	2014-05-10
1825	1.30	1.00	2007-02-01	2014-05-10
1826	1.30	1.00	2007-01-31	2014-05-10
1827	1.30	1.00	2007-01-30	2014-05-10
1828	1.29	1.00	2007-01-29	2014-05-10
1829	1.29	1.00	2007-01-26	2014-05-10
1830	1.30	1.00	2007-01-25	2014-05-10
1831	1.30	1.00	2007-01-24	2014-05-10
1832	1.30	1.00	2007-01-23	2014-05-10
1833	1.30	1.00	2007-01-22	2014-05-10
1834	1.30	1.00	2007-01-19	2014-05-10
1835	1.29	1.00	2007-01-18	2014-05-10
1836	1.29	1.00	2007-01-17	2014-05-10
1837	1.29	1.00	2007-01-16	2014-05-10
1838	1.29	1.00	2007-01-12	2014-05-10
1839	1.29	1.00	2007-01-11	2014-05-10
1840	1.29	1.00	2007-01-10	2014-05-10
1841	1.30	1.00	2007-01-09	2014-05-10
1842	1.30	1.00	2007-01-08	2014-05-10
1843	1.30	1.00	2007-01-05	2014-05-10
1844	1.31	1.00	2007-01-04	2014-05-10
1845	1.32	1.00	2007-01-03	2014-05-10
1846	1.33	1.00	2007-01-02	2014-05-10
1847	1.32	1.00	2006-12-29	2014-05-10
1848	1.32	1.00	2006-12-28	2014-05-10
1849	1.31	1.00	2006-12-27	2014-05-10
1850	1.31	1.00	2006-12-26	2014-05-10
1851	1.31	1.00	2006-12-22	2014-05-10
1852	1.32	1.00	2006-12-21	2014-05-10
1853	1.32	1.00	2006-12-20	2014-05-10
1854	1.32	1.00	2006-12-19	2014-05-10
1855	1.31	1.00	2006-12-18	2014-05-10
1856	1.31	1.00	2006-12-15	2014-05-10
1857	1.32	1.00	2006-12-14	2014-05-10
1858	1.32	1.00	2006-12-13	2014-05-10
1859	1.32	1.00	2006-12-12	2014-05-10
1860	1.32	1.00	2006-12-11	2014-05-10
1861	1.32	1.00	2006-12-08	2014-05-10
1862	1.33	1.00	2006-12-07	2014-05-10
1863	1.33	1.00	2006-12-06	2014-05-10
1864	1.33	1.00	2006-12-05	2014-05-10
1865	1.33	1.00	2006-12-04	2014-05-10
1866	1.33	1.00	2006-12-01	2014-05-10
1867	1.33	1.00	2006-11-30	2014-05-10
1868	1.31	1.00	2006-11-29	2014-05-10
1869	1.32	1.00	2006-11-28	2014-05-10
1870	1.31	1.00	2006-11-27	2014-05-10
1871	1.31	1.00	2006-11-24	2014-05-10
1872	1.29	1.00	2006-11-22	2014-05-10
1873	1.28	1.00	2006-11-21	2014-05-10
1874	1.28	1.00	2006-11-20	2014-05-10
1875	1.28	1.00	2006-11-17	2014-05-10
1876	1.28	1.00	2006-11-16	2014-05-10
1877	1.28	1.00	2006-11-15	2014-05-10
1878	1.28	1.00	2006-11-14	2014-05-10
1879	1.28	1.00	2006-11-13	2014-05-10
1880	1.29	1.00	2006-11-10	2014-05-10
1881	1.28	1.00	2006-11-09	2014-05-10
1882	1.28	1.00	2006-11-08	2014-05-10
1883	1.28	1.00	2006-11-07	2014-05-10
1884	1.27	1.00	2006-11-06	2014-05-10
1885	1.27	1.00	2006-11-03	2014-05-10
1886	1.28	1.00	2006-11-02	2014-05-10
1887	1.28	1.00	2006-11-01	2014-05-10
1888	1.28	1.00	2006-10-31	2014-05-10
1889	1.27	1.00	2006-10-30	2014-05-10
1890	1.27	1.00	2006-10-27	2014-05-10
1891	1.27	1.00	2006-10-26	2014-05-10
1892	1.26	1.00	2006-10-25	2014-05-10
1893	1.26	1.00	2006-10-24	2014-05-10
1894	1.25	1.00	2006-10-23	2014-05-10
1895	1.26	1.00	2006-10-20	2014-05-10
1896	1.26	1.00	2006-10-19	2014-05-10
1897	1.25	1.00	2006-10-18	2014-05-10
1898	1.26	1.00	2006-10-17	2014-05-10
1899	1.25	1.00	2006-10-16	2014-05-10
1900	1.25	1.00	2006-10-13	2014-05-10
1901	1.25	1.00	2006-10-12	2014-05-10
1902	1.25	1.00	2006-10-11	2014-05-10
1903	1.25	1.00	2006-10-10	2014-05-10
1904	1.26	1.00	2006-10-06	2014-05-10
1905	1.27	1.00	2006-10-05	2014-05-10
1906	1.27	1.00	2006-10-04	2014-05-10
1907	1.27	1.00	2006-10-03	2014-05-10
1908	1.27	1.00	2006-10-02	2014-05-10
1909	1.27	1.00	2006-09-29	2014-05-10
1910	1.27	1.00	2006-09-28	2014-05-10
1911	1.27	1.00	2006-09-27	2014-05-10
1912	1.27	1.00	2006-09-26	2014-05-10
1913	1.27	1.00	2006-09-25	2014-05-10
1914	1.28	1.00	2006-09-22	2014-05-10
1915	1.27	1.00	2006-09-21	2014-05-10
1916	1.27	1.00	2006-09-20	2014-05-10
1917	1.27	1.00	2006-09-19	2014-05-10
1918	1.27	1.00	2006-09-18	2014-05-10
1919	1.26	1.00	2006-09-15	2014-05-10
1920	1.27	1.00	2006-09-14	2014-05-10
1921	1.27	1.00	2006-09-13	2014-05-10
1922	1.27	1.00	2006-09-12	2014-05-10
1923	1.27	1.00	2006-09-11	2014-05-10
1924	1.27	1.00	2006-09-08	2014-05-10
1925	1.28	1.00	2006-09-07	2014-05-10
1926	1.28	1.00	2006-09-06	2014-05-10
1927	1.28	1.00	2006-09-05	2014-05-10
1928	1.28	1.00	2006-09-01	2014-05-10
1929	1.28	1.00	2006-08-31	2014-05-10
1930	1.28	1.00	2006-08-30	2014-05-10
1931	1.28	1.00	2006-08-29	2014-05-10
1932	1.28	1.00	2006-08-28	2014-05-10
1933	1.28	1.00	2006-08-25	2014-05-10
1934	1.28	1.00	2006-08-24	2014-05-10
1935	1.28	1.00	2006-08-23	2014-05-10
1936	1.28	1.00	2006-08-22	2014-05-10
1937	1.29	1.00	2006-08-21	2014-05-10
1938	1.28	1.00	2006-08-18	2014-05-10
1939	1.29	1.00	2006-08-17	2014-05-10
1940	1.29	1.00	2006-08-16	2014-05-10
1941	1.28	1.00	2006-08-15	2014-05-10
1942	1.27	1.00	2006-08-14	2014-05-10
1943	1.28	1.00	2006-08-11	2014-05-10
1944	1.28	1.00	2006-08-10	2014-05-10
1945	1.29	1.00	2006-08-09	2014-05-10
1946	1.28	1.00	2006-08-08	2014-05-10
1947	1.29	1.00	2006-08-07	2014-05-10
1948	1.29	1.00	2006-08-04	2014-05-10
1949	1.28	1.00	2006-08-03	2014-05-10
1950	1.28	1.00	2006-08-02	2014-05-10
1951	1.28	1.00	2006-08-01	2014-05-10
1952	1.28	1.00	2006-07-31	2014-05-10
1953	1.27	1.00	2006-07-28	2014-05-10
1954	1.27	1.00	2006-07-27	2014-05-10
1955	1.26	1.00	2006-07-26	2014-05-10
1956	1.26	1.00	2006-07-25	2014-05-10
1957	1.26	1.00	2006-07-24	2014-05-10
1958	1.27	1.00	2006-07-21	2014-05-10
1959	1.26	1.00	2006-07-20	2014-05-10
1960	1.26	1.00	2006-07-19	2014-05-10
1961	1.25	1.00	2006-07-18	2014-05-10
1962	1.25	1.00	2006-07-17	2014-05-10
1963	1.26	1.00	2006-07-14	2014-05-10
1964	1.27	1.00	2006-07-13	2014-05-10
1965	1.27	1.00	2006-07-12	2014-05-10
1966	1.28	1.00	2006-07-11	2014-05-10
1967	1.28	1.00	2006-07-10	2014-05-10
1968	1.28	1.00	2006-07-07	2014-05-10
1969	1.28	1.00	2006-07-06	2014-05-10
1970	1.27	1.00	2006-07-05	2014-05-10
1971	1.28	1.00	2006-07-03	2014-05-10
1972	1.28	1.00	2006-06-30	2014-05-10
1973	1.25	1.00	2006-06-29	2014-05-10
1974	1.25	1.00	2006-06-28	2014-05-10
1975	1.26	1.00	2006-06-27	2014-05-10
1976	1.26	1.00	2006-06-26	2014-05-10
1977	1.25	1.00	2006-06-23	2014-05-10
1978	1.26	1.00	2006-06-22	2014-05-10
1979	1.27	1.00	2006-06-21	2014-05-10
1980	1.26	1.00	2006-06-20	2014-05-10
1981	1.26	1.00	2006-06-19	2014-05-10
1982	1.26	1.00	2006-06-16	2014-05-10
1983	1.26	1.00	2006-06-15	2014-05-10
1984	1.26	1.00	2006-06-14	2014-05-10
1985	1.26	1.00	2006-06-13	2014-05-10
1986	1.26	1.00	2006-06-12	2014-05-10
1987	1.26	1.00	2006-06-09	2014-05-10
1988	1.26	1.00	2006-06-08	2014-05-10
1989	1.28	1.00	2006-06-07	2014-05-10
1990	1.28	1.00	2006-06-06	2014-05-10
1991	1.30	1.00	2006-06-05	2014-05-10
1992	1.29	1.00	2006-06-02	2014-05-10
1993	1.28	1.00	2006-06-01	2014-05-10
1994	1.28	1.00	2006-05-31	2014-05-10
1995	1.29	1.00	2006-05-30	2014-05-10
1996	1.27	1.00	2006-05-26	2014-05-10
1997	1.28	1.00	2006-05-25	2014-05-10
1998	1.27	1.00	2006-05-24	2014-05-10
1999	1.28	1.00	2006-05-23	2014-05-10
2000	1.28	1.00	2006-05-22	2014-05-10
2001	1.27	1.00	2006-05-19	2014-05-10
2002	1.28	1.00	2006-05-18	2014-05-10
2003	1.27	1.00	2006-05-17	2014-05-10
2004	1.28	1.00	2006-05-16	2014-05-10
2005	1.28	1.00	2006-05-15	2014-05-10
2006	1.29	1.00	2006-05-12	2014-05-10
2007	1.29	1.00	2006-05-11	2014-05-10
2008	1.28	1.00	2006-05-10	2014-05-10
2009	1.27	1.00	2006-05-09	2014-05-10
2010	1.27	1.00	2006-05-08	2014-05-10
2011	1.27	1.00	2006-05-05	2014-05-10
2012	1.27	1.00	2006-05-04	2014-05-10
2013	1.26	1.00	2006-05-03	2014-05-10
2014	1.26	1.00	2006-05-02	2014-05-10
2015	1.26	1.00	2006-05-01	2014-05-10
2016	1.26	1.00	2006-04-28	2014-05-10
2017	1.25	1.00	2006-04-27	2014-05-10
2018	1.25	1.00	2006-04-26	2014-05-10
2019	1.24	1.00	2006-04-25	2014-05-10
2020	1.24	1.00	2006-04-24	2014-05-10
2021	1.23	1.00	2006-04-21	2014-05-10
2022	1.23	1.00	2006-04-20	2014-05-10
2023	1.23	1.00	2006-04-19	2014-05-10
2024	1.23	1.00	2006-04-18	2014-05-10
2025	1.23	1.00	2006-04-17	2014-05-10
2026	1.21	1.00	2006-04-14	2014-05-10
2027	1.21	1.00	2006-04-13	2014-05-10
2028	1.21	1.00	2006-04-12	2014-05-10
2029	1.21	1.00	2006-04-11	2014-05-10
2030	1.21	1.00	2006-04-10	2014-05-10
2031	1.21	1.00	2006-04-07	2014-05-10
2032	1.22	1.00	2006-04-06	2014-05-10
2033	1.23	1.00	2006-04-05	2014-05-10
2034	1.23	1.00	2006-04-04	2014-05-10
2035	1.21	1.00	2006-04-03	2014-05-10
2036	1.21	1.00	2006-03-31	2014-05-10
2037	1.21	1.00	2006-03-30	2014-05-10
2038	1.20	1.00	2006-03-29	2014-05-10
2039	1.21	1.00	2006-03-28	2014-05-10
2040	1.20	1.00	2006-03-27	2014-05-10
2041	1.20	1.00	2006-03-24	2014-05-10
2042	1.20	1.00	2006-03-23	2014-05-10
2043	1.21	1.00	2006-03-22	2014-05-10
2044	1.21	1.00	2006-03-21	2014-05-10
2045	1.22	1.00	2006-03-20	2014-05-10
2046	1.22	1.00	2006-03-17	2014-05-10
2047	1.22	1.00	2006-03-16	2014-05-10
2048	1.20	1.00	2006-03-15	2014-05-10
2049	1.20	1.00	2006-03-14	2014-05-10
2050	1.19	1.00	2006-03-13	2014-05-10
2051	1.19	1.00	2006-03-10	2014-05-10
2052	1.19	1.00	2006-03-09	2014-05-10
2053	1.19	1.00	2006-03-08	2014-05-10
2054	1.19	1.00	2006-03-07	2014-05-10
2055	1.20	1.00	2006-03-06	2014-05-10
2056	1.20	1.00	2006-03-03	2014-05-10
2057	1.20	1.00	2006-03-02	2014-05-10
2058	1.19	1.00	2006-03-01	2014-05-10
2059	1.19	1.00	2006-02-28	2014-05-10
2060	1.19	1.00	2006-02-27	2014-05-10
2061	1.19	1.00	2006-02-24	2014-05-10
2062	1.19	1.00	2006-02-23	2014-05-10
2063	1.19	1.00	2006-02-22	2014-05-10
2064	1.19	1.00	2006-02-21	2014-05-10
2065	1.19	1.00	2006-02-17	2014-05-10
2066	1.19	1.00	2006-02-16	2014-05-10
2067	1.19	1.00	2006-02-15	2014-05-10
2068	1.19	1.00	2006-02-14	2014-05-10
2069	1.19	1.00	2006-02-13	2014-05-10
2070	1.19	1.00	2006-02-10	2014-05-10
2071	1.20	1.00	2006-02-09	2014-05-10
2072	1.19	1.00	2006-02-08	2014-05-10
2073	1.20	1.00	2006-02-07	2014-05-10
2074	1.20	1.00	2006-02-06	2014-05-10
2075	1.20	1.00	2006-02-03	2014-05-10
2076	1.21	1.00	2006-02-02	2014-05-10
2077	1.21	1.00	2006-02-01	2014-05-10
2078	1.22	1.00	2006-01-31	2014-05-10
2079	1.21	1.00	2006-01-30	2014-05-10
2080	1.21	1.00	2006-01-27	2014-05-10
2081	1.22	1.00	2006-01-26	2014-05-10
2082	1.23	1.00	2006-01-25	2014-05-10
2083	1.23	1.00	2006-01-24	2014-05-10
2084	1.23	1.00	2006-01-23	2014-05-10
2085	1.21	1.00	2006-01-20	2014-05-10
2086	1.21	1.00	2006-01-19	2014-05-10
2087	1.21	1.00	2006-01-18	2014-05-10
2088	1.21	1.00	2006-01-17	2014-05-10
2089	1.21	1.00	2006-01-13	2014-05-10
2090	1.20	1.00	2006-01-12	2014-05-10
2091	1.21	1.00	2006-01-11	2014-05-10
2092	1.21	1.00	2006-01-10	2014-05-10
2093	1.21	1.00	2006-01-09	2014-05-10
2094	1.21	1.00	2006-01-06	2014-05-10
2095	1.21	1.00	2006-01-05	2014-05-10
2096	1.21	1.00	2006-01-04	2014-05-10
2097	1.20	1.00	2006-01-03	2014-05-10
2098	1.18	1.00	2005-12-30	2014-05-10
2099	1.18	1.00	2005-12-29	2014-05-10
2100	1.19	1.00	2005-12-28	2014-05-10
2101	1.19	1.00	2005-12-27	2014-05-10
2102	1.19	1.00	2005-12-23	2014-05-10
2103	1.19	1.00	2005-12-22	2014-05-10
2104	1.18	1.00	2005-12-21	2014-05-10
2105	1.18	1.00	2005-12-20	2014-05-10
2106	1.20	1.00	2005-12-19	2014-05-10
2107	1.20	1.00	2005-12-16	2014-05-10
2108	1.20	1.00	2005-12-15	2014-05-10
2109	1.20	1.00	2005-12-14	2014-05-10
2110	1.19	1.00	2005-12-13	2014-05-10
2111	1.20	1.00	2005-12-12	2014-05-10
2112	1.18	1.00	2005-12-09	2014-05-10
2113	1.18	1.00	2005-12-08	2014-05-10
2114	1.17	1.00	2005-12-07	2014-05-10
2115	1.18	1.00	2005-12-06	2014-05-10
2116	1.18	1.00	2005-12-05	2014-05-10
2117	1.17	1.00	2005-12-02	2014-05-10
2118	1.17	1.00	2005-12-01	2014-05-10
2119	1.18	1.00	2005-11-30	2014-05-10
2120	1.18	1.00	2005-11-29	2014-05-10
2121	1.18	1.00	2005-11-28	2014-05-10
2122	1.17	1.00	2005-11-25	2014-05-10
2123	1.18	1.00	2005-11-23	2014-05-10
2124	1.17	1.00	2005-11-22	2014-05-10
2125	1.17	1.00	2005-11-21	2014-05-10
2126	1.17	1.00	2005-11-18	2014-05-10
2127	1.17	1.00	2005-11-17	2014-05-10
2128	1.17	1.00	2005-11-16	2014-05-10
2129	1.17	1.00	2005-11-15	2014-05-10
2130	1.17	1.00	2005-11-14	2014-05-10
2131	1.17	1.00	2005-11-10	2014-05-10
2132	1.17	1.00	2005-11-09	2014-05-10
2133	1.18	1.00	2005-11-08	2014-05-10
2134	1.18	1.00	2005-11-07	2014-05-10
2135	1.18	1.00	2005-11-04	2014-05-10
2136	1.20	1.00	2005-11-03	2014-05-10
2137	1.21	1.00	2005-11-02	2014-05-10
2138	1.20	1.00	2005-11-01	2014-05-10
2139	1.20	1.00	2005-10-31	2014-05-10
2140	1.21	1.00	2005-10-28	2014-05-10
2141	1.21	1.00	2005-10-27	2014-05-10
2142	1.21	1.00	2005-10-26	2014-05-10
2143	1.21	1.00	2005-10-25	2014-05-10
2144	1.20	1.00	2005-10-24	2014-05-10
2145	1.20	1.00	2005-10-21	2014-05-10
2146	1.20	1.00	2005-10-20	2014-05-10
2147	1.20	1.00	2005-10-19	2014-05-10
2148	1.19	1.00	2005-10-18	2014-05-10
2149	1.20	1.00	2005-10-17	2014-05-10
2150	1.21	1.00	2005-10-14	2014-05-10
2151	1.19	1.00	2005-10-13	2014-05-10
2152	1.20	1.00	2005-10-12	2014-05-10
2153	1.20	1.00	2005-10-11	2014-05-10
2154	1.21	1.00	2005-10-07	2014-05-10
2155	1.21	1.00	2005-10-06	2014-05-10
2156	1.20	1.00	2005-10-05	2014-05-10
2157	1.19	1.00	2005-10-04	2014-05-10
2158	1.19	1.00	2005-10-03	2014-05-10
2159	1.21	1.00	2005-09-30	2014-05-10
2160	1.20	1.00	2005-09-29	2014-05-10
2161	1.20	1.00	2005-09-28	2014-05-10
2162	1.20	1.00	2005-09-27	2014-05-10
2163	1.20	1.00	2005-09-26	2014-05-10
2164	1.21	1.00	2005-09-23	2014-05-10
2165	1.22	1.00	2005-09-22	2014-05-10
2166	1.22	1.00	2005-09-21	2014-05-10
2167	1.22	1.00	2005-09-20	2014-05-10
2168	1.22	1.00	2005-09-19	2014-05-10
2169	1.22	1.00	2005-09-16	2014-05-10
2170	1.22	1.00	2005-09-15	2014-05-10
2171	1.23	1.00	2005-09-14	2014-05-10
2172	1.23	1.00	2005-09-13	2014-05-10
2173	1.23	1.00	2005-09-12	2014-05-10
2174	1.24	1.00	2005-09-09	2014-05-10
2175	1.24	1.00	2005-09-08	2014-05-10
2176	1.24	1.00	2005-09-07	2014-05-10
2177	1.25	1.00	2005-09-06	2014-05-10
2178	1.25	1.00	2005-09-02	2014-05-10
2179	1.24	1.00	2005-09-01	2014-05-10
2180	1.23	1.00	2005-08-31	2014-05-10
2181	1.22	1.00	2005-08-30	2014-05-10
2182	1.22	1.00	2005-08-29	2014-05-10
2183	1.23	1.00	2005-08-26	2014-05-10
2184	1.23	1.00	2005-08-25	2014-05-10
2185	1.22	1.00	2005-08-24	2014-05-10
2186	1.22	1.00	2005-08-23	2014-05-10
2187	1.22	1.00	2005-08-22	2014-05-10
2188	1.21	1.00	2005-08-19	2014-05-10
2189	1.22	1.00	2005-08-18	2014-05-10
2190	1.23	1.00	2005-08-17	2014-05-10
2191	1.23	1.00	2005-08-16	2014-05-10
2192	1.24	1.00	2005-08-15	2014-05-10
2193	1.24	1.00	2005-08-12	2014-05-10
2194	1.24	1.00	2005-08-11	2014-05-10
2195	1.23	1.00	2005-08-10	2014-05-10
2196	1.23	1.00	2005-08-09	2014-05-10
2197	1.24	1.00	2005-08-08	2014-05-10
2198	1.23	1.00	2005-08-05	2014-05-10
2199	1.24	1.00	2005-08-04	2014-05-10
2200	1.23	1.00	2005-08-03	2014-05-10
2201	1.22	1.00	2005-08-02	2014-05-10
2202	1.22	1.00	2005-08-01	2014-05-10
2203	1.21	1.00	2005-07-29	2014-05-10
2204	1.21	1.00	2005-07-28	2014-05-10
2205	1.20	1.00	2005-07-27	2014-05-10
2206	1.20	1.00	2005-07-26	2014-05-10
2207	1.21	1.00	2005-07-25	2014-05-10
2208	1.21	1.00	2005-07-22	2014-05-10
2209	1.21	1.00	2005-07-21	2014-05-10
2210	1.20	1.00	2005-07-20	2014-05-10
2211	1.20	1.00	2005-07-19	2014-05-10
2212	1.21	1.00	2005-07-18	2014-05-10
2213	1.20	1.00	2005-07-15	2014-05-10
2214	1.21	1.00	2005-07-14	2014-05-10
2215	1.21	1.00	2005-07-13	2014-05-10
2216	1.22	1.00	2005-07-12	2014-05-10
2217	1.21	1.00	2005-07-11	2014-05-10
2218	1.19	1.00	2005-07-08	2014-05-10
2219	1.19	1.00	2005-07-07	2014-05-10
2220	1.19	1.00	2005-07-06	2014-05-10
2221	1.19	1.00	2005-07-05	2014-05-10
2222	1.20	1.00	2005-07-01	2014-05-10
2223	1.21	1.00	2005-06-30	2014-05-10
2224	1.21	1.00	2005-06-29	2014-05-10
2225	1.21	1.00	2005-06-28	2014-05-10
2226	1.22	1.00	2005-06-27	2014-05-10
2227	1.21	1.00	2005-06-24	2014-05-10
2228	1.21	1.00	2005-06-23	2014-05-10
2229	1.21	1.00	2005-06-22	2014-05-10
2230	1.21	1.00	2005-06-21	2014-05-10
2231	1.21	1.00	2005-06-20	2014-05-10
2232	1.22	1.00	2005-06-17	2014-05-10
2233	1.21	1.00	2005-06-16	2014-05-10
2234	1.21	1.00	2005-06-15	2014-05-10
2235	1.20	1.00	2005-06-14	2014-05-10
2236	1.20	1.00	2005-06-13	2014-05-10
2237	1.21	1.00	2005-06-10	2014-05-10
2238	1.22	1.00	2005-06-09	2014-05-10
2239	1.23	1.00	2005-06-08	2014-05-10
2240	1.23	1.00	2005-06-07	2014-05-10
2241	1.23	1.00	2005-06-06	2014-05-10
2242	1.22	1.00	2005-06-03	2014-05-10
2243	1.23	1.00	2005-06-02	2014-05-10
2244	1.22	1.00	2005-06-01	2014-05-10
2245	1.23	1.00	2005-05-31	2014-05-10
2246	1.26	1.00	2005-05-27	2014-05-10
2247	1.25	1.00	2005-05-26	2014-05-10
2248	1.26	1.00	2005-05-25	2014-05-10
2249	1.26	1.00	2005-05-24	2014-05-10
2250	1.26	1.00	2005-05-23	2014-05-10
2251	1.26	1.00	2005-05-20	2014-05-10
2252	1.26	1.00	2005-05-19	2014-05-10
2253	1.27	1.00	2005-05-18	2014-05-10
2254	1.26	1.00	2005-05-17	2014-05-10
2255	1.26	1.00	2005-05-16	2014-05-10
2256	1.26	1.00	2005-05-13	2014-05-10
2257	1.27	1.00	2005-05-12	2014-05-10
2258	1.28	1.00	2005-05-11	2014-05-10
2259	1.29	1.00	2005-05-10	2014-05-10
2260	1.28	1.00	2005-05-09	2014-05-10
2261	1.28	1.00	2005-05-06	2014-05-10
2262	1.29	1.00	2005-05-05	2014-05-10
2263	1.29	1.00	2005-05-04	2014-05-10
2264	1.29	1.00	2005-05-03	2014-05-10
2265	1.29	1.00	2005-05-02	2014-05-10
2266	1.29	1.00	2005-04-29	2014-05-10
2267	1.29	1.00	2005-04-28	2014-05-10
2268	1.29	1.00	2005-04-27	2014-05-10
2269	1.30	1.00	2005-04-26	2014-05-10
2270	1.30	1.00	2005-04-25	2014-05-10
2271	1.31	1.00	2005-04-22	2014-05-10
2272	1.31	1.00	2005-04-21	2014-05-10
2273	1.31	1.00	2005-04-20	2014-05-10
2274	1.30	1.00	2005-04-19	2014-05-10
2275	1.30	1.00	2005-04-18	2014-05-10
2276	1.29	1.00	2005-04-15	2014-05-10
2277	1.28	1.00	2005-04-14	2014-05-10
2278	1.29	1.00	2005-04-13	2014-05-10
2279	1.29	1.00	2005-04-12	2014-05-10
2280	1.30	1.00	2005-04-11	2014-05-10
2281	1.29	1.00	2005-04-08	2014-05-10
2282	1.29	1.00	2005-04-07	2014-05-10
2283	1.29	1.00	2005-04-06	2014-05-10
2284	1.28	1.00	2005-04-05	2014-05-10
2285	1.28	1.00	2005-04-04	2014-05-10
2286	1.29	1.00	2005-04-01	2014-05-10
2287	1.30	1.00	2005-03-31	2014-05-10
2288	1.29	1.00	2005-03-30	2014-05-10
2289	1.29	1.00	2005-03-29	2014-05-10
2290	1.29	1.00	2005-03-28	2014-05-10
2291	1.30	1.00	2005-03-25	2014-05-10
2292	1.30	1.00	2005-03-24	2014-05-10
2293	1.30	1.00	2005-03-23	2014-05-10
2294	1.32	1.00	2005-03-22	2014-05-10
2295	1.32	1.00	2005-03-21	2014-05-10
2296	1.33	1.00	2005-03-18	2014-05-10
2297	1.34	1.00	2005-03-17	2014-05-10
2298	1.34	1.00	2005-03-16	2014-05-10
2299	1.33	1.00	2005-03-15	2014-05-10
2300	1.33	1.00	2005-03-14	2014-05-10
2301	1.35	1.00	2005-03-11	2014-05-10
2302	1.34	1.00	2005-03-10	2014-05-10
2303	1.34	1.00	2005-03-09	2014-05-10
2304	1.33	1.00	2005-03-08	2014-05-10
2305	1.32	1.00	2005-03-07	2014-05-10
2306	1.32	1.00	2005-03-04	2014-05-10
2307	1.31	1.00	2005-03-03	2014-05-10
2308	1.31	1.00	2005-03-02	2014-05-10
2309	1.32	1.00	2005-03-01	2014-05-10
2310	1.33	1.00	2005-02-28	2014-05-10
2311	1.32	1.00	2005-02-25	2014-05-10
2312	1.32	1.00	2005-02-24	2014-05-10
2313	1.32	1.00	2005-02-23	2014-05-10
2314	1.32	1.00	2005-02-22	2014-05-10
2315	1.31	1.00	2005-02-18	2014-05-10
2316	1.31	1.00	2005-02-17	2014-05-10
2317	1.30	1.00	2005-02-16	2014-05-10
2318	1.30	1.00	2005-02-15	2014-05-10
2319	1.30	1.00	2005-02-14	2014-05-10
2320	1.29	1.00	2005-02-11	2014-05-10
2321	1.29	1.00	2005-02-10	2014-05-10
2322	1.28	1.00	2005-02-09	2014-05-10
2323	1.28	1.00	2005-02-08	2014-05-10
2324	1.28	1.00	2005-02-07	2014-05-10
2325	1.29	1.00	2005-02-04	2014-05-10
2326	1.30	1.00	2005-02-03	2014-05-10
2327	1.30	1.00	2005-02-02	2014-05-10
2328	1.30	1.00	2005-02-01	2014-05-10
2329	1.30	1.00	2005-01-31	2014-05-10
2330	1.30	1.00	2005-01-28	2014-05-10
2331	1.30	1.00	2005-01-27	2014-05-10
2332	1.31	1.00	2005-01-26	2014-05-10
2333	1.30	1.00	2005-01-25	2014-05-10
2334	1.30	1.00	2005-01-24	2014-05-10
2335	1.30	1.00	2005-01-21	2014-05-10
2336	1.30	1.00	2005-01-20	2014-05-10
2337	1.30	1.00	2005-01-19	2014-05-10
2338	1.30	1.00	2005-01-18	2014-05-10
2339	1.31	1.00	2005-01-14	2014-05-10
2340	1.32	1.00	2005-01-13	2014-05-10
2341	1.33	1.00	2005-01-12	2014-05-10
2342	1.32	1.00	2005-01-11	2014-05-10
2343	1.31	1.00	2005-01-10	2014-05-10
2344	1.31	1.00	2005-01-07	2014-05-10
2345	1.32	1.00	2005-01-06	2014-05-10
2346	1.33	1.00	2005-01-05	2014-05-10
2347	1.33	1.00	2005-01-04	2014-05-10
2348	1.35	1.00	2005-01-03	2014-05-10
2349	1.35	1.00	2004-12-31	2014-05-10
2350	1.36	1.00	2004-12-30	2014-05-10
2351	1.36	1.00	2004-12-29	2014-05-10
2352	1.36	1.00	2004-12-28	2014-05-10
2353	1.36	1.00	2004-12-27	2014-05-10
2354	1.35	1.00	2004-12-24	2014-05-10
2355	1.35	1.00	2004-12-23	2014-05-10
2356	1.34	1.00	2004-12-22	2014-05-10
2357	1.34	1.00	2004-12-21	2014-05-10
2358	1.34	1.00	2004-12-20	2014-05-10
2359	1.33	1.00	2004-12-17	2014-05-10
2360	1.33	1.00	2004-12-16	2014-05-10
2361	1.34	1.00	2004-12-15	2014-05-10
2362	1.33	1.00	2004-12-14	2014-05-10
2363	1.33	1.00	2004-12-13	2014-05-10
2364	1.32	1.00	2004-12-10	2014-05-10
2365	1.33	1.00	2004-12-09	2014-05-10
2366	1.33	1.00	2004-12-08	2014-05-10
2367	1.34	1.00	2004-12-07	2014-05-10
2368	1.34	1.00	2004-12-06	2014-05-10
2369	1.34	1.00	2004-12-03	2014-05-10
2370	1.33	1.00	2004-12-02	2014-05-10
2371	1.33	1.00	2004-12-01	2014-05-10
2372	1.33	1.00	2004-11-30	2014-05-10
2373	1.33	1.00	2004-11-29	2014-05-10
2374	1.33	1.00	2004-11-26	2014-05-10
2375	1.32	1.00	2004-11-24	2014-05-10
2376	1.31	1.00	2004-11-23	2014-05-10
2377	1.30	1.00	2004-11-22	2014-05-10
2378	1.31	1.00	2004-11-19	2014-05-10
2379	1.30	1.00	2004-11-18	2014-05-10
2380	1.30	1.00	2004-11-17	2014-05-10
2381	1.30	1.00	2004-11-16	2014-05-10
2382	1.29	1.00	2004-11-15	2014-05-10
2383	1.30	1.00	2004-11-12	2014-05-10
2384	1.29	1.00	2004-11-10	2014-05-10
2385	1.29	1.00	2004-11-09	2014-05-10
2386	1.29	1.00	2004-11-08	2014-05-10
2387	1.29	1.00	2004-11-05	2014-05-10
2388	1.29	1.00	2004-11-04	2014-05-10
2389	1.28	1.00	2004-11-03	2014-05-10
2390	1.27	1.00	2004-11-02	2014-05-10
2391	1.27	1.00	2004-11-01	2014-05-10
2392	1.27	1.00	2004-10-29	2014-05-10
2393	1.28	1.00	2004-10-28	2014-05-10
2394	1.27	1.00	2004-10-27	2014-05-10
2395	1.28	1.00	2004-10-26	2014-05-10
2396	1.28	1.00	2004-10-25	2014-05-10
2397	1.26	1.00	2004-10-22	2014-05-10
2398	1.26	1.00	2004-10-21	2014-05-10
2399	1.26	1.00	2004-10-20	2014-05-10
2400	1.25	1.00	2004-10-19	2014-05-10
2401	1.25	1.00	2004-10-18	2014-05-10
2402	1.25	1.00	2004-10-15	2014-05-10
2403	1.24	1.00	2004-10-14	2014-05-10
2404	1.23	1.00	2004-10-13	2014-05-10
2405	1.23	1.00	2004-10-12	2014-05-10
2406	1.24	1.00	2004-10-08	2014-05-10
2407	1.23	1.00	2004-10-07	2014-05-10
2408	1.23	1.00	2004-10-06	2014-05-10
2409	1.23	1.00	2004-10-05	2014-05-10
2410	1.23	1.00	2004-10-04	2014-05-10
2411	1.24	1.00	2004-10-01	2014-05-10
2412	1.24	1.00	2004-09-30	2014-05-10
2413	1.23	1.00	2004-09-29	2014-05-10
2414	1.23	1.00	2004-09-28	2014-05-10
2415	1.23	1.00	2004-09-27	2014-05-10
2416	1.23	1.00	2004-09-24	2014-05-10
2417	1.23	1.00	2004-09-23	2014-05-10
2418	1.23	1.00	2004-09-22	2014-05-10
2419	1.23	1.00	2004-09-21	2014-05-10
2420	1.22	1.00	2004-09-20	2014-05-10
2421	1.22	1.00	2004-09-17	2014-05-10
2422	1.22	1.00	2004-09-16	2014-05-10
2423	1.21	1.00	2004-09-15	2014-05-10
2424	1.23	1.00	2004-09-14	2014-05-10
2425	1.23	1.00	2004-09-13	2014-05-10
2426	1.23	1.00	2004-09-10	2014-05-10
2427	1.22	1.00	2004-09-09	2014-05-10
2428	1.22	1.00	2004-09-08	2014-05-10
2429	1.21	1.00	2004-09-07	2014-05-10
2430	1.21	1.00	2004-09-03	2014-05-10
2431	1.22	1.00	2004-09-02	2014-05-10
2432	1.22	1.00	2004-09-01	2014-05-10
2433	1.22	1.00	2004-08-31	2014-05-10
2434	1.20	1.00	2004-08-30	2014-05-10
2435	1.20	1.00	2004-08-27	2014-05-10
2436	1.21	1.00	2004-08-26	2014-05-10
2437	1.21	1.00	2004-08-25	2014-05-10
2438	1.21	1.00	2004-08-24	2014-05-10
2439	1.22	1.00	2004-08-23	2014-05-10
2440	1.23	1.00	2004-08-20	2014-05-10
2441	1.24	1.00	2004-08-19	2014-05-10
2442	1.23	1.00	2004-08-18	2014-05-10
2443	1.23	1.00	2004-08-17	2014-05-10
2444	1.23	1.00	2004-08-16	2014-05-10
2445	1.24	1.00	2004-08-13	2014-05-10
2446	1.22	1.00	2004-08-12	2014-05-10
2447	1.22	1.00	2004-08-11	2014-05-10
2448	1.23	1.00	2004-08-10	2014-05-10
2449	1.23	1.00	2004-08-09	2014-05-10
2450	1.23	1.00	2004-08-06	2014-05-10
2451	1.21	1.00	2004-08-05	2014-05-10
2452	1.21	1.00	2004-08-04	2014-05-10
2453	1.21	1.00	2004-08-03	2014-05-10
2454	1.20	1.00	2004-08-02	2014-05-10
2455	1.20	1.00	2004-07-30	2014-05-10
2456	1.21	1.00	2004-07-29	2014-05-10
2457	1.20	1.00	2004-07-28	2014-05-10
2458	1.21	1.00	2004-07-27	2014-05-10
2459	1.21	1.00	2004-07-26	2014-05-10
2460	1.21	1.00	2004-07-23	2014-05-10
2461	1.23	1.00	2004-07-22	2014-05-10
2462	1.22	1.00	2004-07-21	2014-05-10
2463	1.24	1.00	2004-07-20	2014-05-10
2464	1.24	1.00	2004-07-19	2014-05-10
2465	1.24	1.00	2004-07-16	2014-05-10
2466	1.24	1.00	2004-07-15	2014-05-10
2467	1.24	1.00	2004-07-14	2014-05-10
2468	1.23	1.00	2004-07-13	2014-05-10
2469	1.24	1.00	2004-07-12	2014-05-10
2470	1.24	1.00	2004-07-09	2014-05-10
2471	1.24	1.00	2004-07-08	2014-05-10
2472	1.24	1.00	2004-07-07	2014-05-10
2473	1.23	1.00	2004-07-06	2014-05-10
2474	1.23	1.00	2004-07-02	2014-05-10
2475	1.22	1.00	2004-07-01	2014-05-10
2476	1.22	1.00	2004-06-30	2014-05-10
2477	1.21	1.00	2004-06-29	2014-05-10
2478	1.22	1.00	2004-06-28	2014-05-10
2479	1.21	1.00	2004-06-25	2014-05-10
2480	1.22	1.00	2004-06-24	2014-05-10
2481	1.21	1.00	2004-06-23	2014-05-10
2482	1.21	1.00	2004-06-22	2014-05-10
2483	1.21	1.00	2004-06-21	2014-05-10
2484	1.21	1.00	2004-06-18	2014-05-10
2485	1.20	1.00	2004-06-17	2014-05-10
2486	1.20	1.00	2004-06-16	2014-05-10
2487	1.21	1.00	2004-06-15	2014-05-10
2488	1.21	1.00	2004-06-14	2014-05-10
2489	1.20	1.00	2004-06-11	2014-05-10
2490	1.21	1.00	2004-06-10	2014-05-10
2491	1.21	1.00	2004-06-09	2014-05-10
2492	1.23	1.00	2004-06-08	2014-05-10
2493	1.23	1.00	2004-06-07	2014-05-10
2494	1.23	1.00	2004-06-04	2014-05-10
2495	1.22	1.00	2004-06-03	2014-05-10
2496	1.23	1.00	2004-06-02	2014-05-10
2497	1.22	1.00	2004-06-01	2014-05-10
2498	1.22	1.00	2004-05-28	2014-05-10
2499	1.23	1.00	2004-05-27	2014-05-10
2500	1.21	1.00	2004-05-26	2014-05-10
2501	1.21	1.00	2004-05-25	2014-05-10
2502	1.20	1.00	2004-05-24	2014-05-10
2503	1.20	1.00	2004-05-21	2014-05-10
2504	1.19	1.00	2004-05-20	2014-05-10
2505	1.20	1.00	2004-05-19	2014-05-10
2506	1.20	1.00	2004-05-18	2014-05-10
2507	1.20	1.00	2004-05-17	2014-05-10
2508	1.19	1.00	2004-05-14	2014-05-10
2509	1.18	1.00	2004-05-13	2014-05-10
2510	1.19	1.00	2004-05-12	2014-05-10
2511	1.18	1.00	2004-05-11	2014-05-10
2512	1.18	1.00	2004-05-10	2014-05-10
2513	1.19	1.00	2004-05-07	2014-05-10
2514	1.21	1.00	2004-05-06	2014-05-10
2515	1.22	1.00	2004-05-05	2014-05-10
2516	1.21	1.00	2004-05-04	2014-05-10
2517	1.19	1.00	2004-05-03	2014-05-10
2518	1.20	1.00	2004-04-30	2014-05-10
2519	1.19	1.00	2004-04-29	2014-05-10
2520	1.18	1.00	2004-04-28	2014-05-10
2521	1.19	1.00	2004-04-27	2014-05-10
2522	1.19	1.00	2004-04-26	2014-05-10
2523	1.18	1.00	2004-04-23	2014-05-10
2524	1.19	1.00	2004-04-22	2014-05-10
2525	1.19	1.00	2004-04-21	2014-05-10
2526	1.19	1.00	2004-04-20	2014-05-10
2527	1.20	1.00	2004-04-19	2014-05-10
2528	1.20	1.00	2004-04-16	2014-05-10
2529	1.19	1.00	2004-04-15	2014-05-10
2530	1.19	1.00	2004-04-14	2014-05-10
2531	1.19	1.00	2004-04-13	2014-05-10
2532	1.21	1.00	2004-04-12	2014-05-10
2533	1.21	1.00	2004-04-09	2014-05-10
2534	1.21	1.00	2004-04-08	2014-05-10
2535	1.22	1.00	2004-04-07	2014-05-10
2536	1.21	1.00	2004-04-06	2014-05-10
2537	1.20	1.00	2004-04-05	2014-05-10
2538	1.21	1.00	2004-04-02	2014-05-10
2539	1.24	1.00	2004-04-01	2014-05-10
2540	1.23	1.00	2004-03-31	2014-05-10
2541	1.22	1.00	2004-03-30	2014-05-10
2542	1.21	1.00	2004-03-29	2014-05-10
2543	1.21	1.00	2004-03-26	2014-05-10
2544	1.22	1.00	2004-03-25	2014-05-10
2545	1.22	1.00	2004-03-24	2014-05-10
2546	1.23	1.00	2004-03-23	2014-05-10
2547	1.24	1.00	2004-03-22	2014-05-10
2548	1.23	1.00	2004-03-19	2014-05-10
2549	1.24	1.00	2004-03-18	2014-05-10
2550	1.22	1.00	2004-03-17	2014-05-10
2551	1.23	1.00	2004-03-16	2014-05-10
2552	1.22	1.00	2004-03-15	2014-05-10
2553	1.22	1.00	2004-03-12	2014-05-10
2554	1.23	1.00	2004-03-11	2014-05-10
2555	1.22	1.00	2004-03-10	2014-05-10
2556	1.24	1.00	2004-03-09	2014-05-10
2557	1.24	1.00	2004-03-08	2014-05-10
2558	1.24	1.00	2004-03-05	2014-05-10
2559	1.22	1.00	2004-03-04	2014-05-10
2560	1.21	1.00	2004-03-03	2014-05-10
2561	1.22	1.00	2004-03-02	2014-05-10
2562	1.24	1.00	2004-03-01	2014-05-10
2563	1.24	1.00	2004-02-27	2014-05-10
2564	1.24	1.00	2004-02-26	2014-05-10
2565	1.25	1.00	2004-02-25	2014-05-10
2566	1.27	1.00	2004-02-24	2014-05-10
2567	1.26	1.00	2004-02-23	2014-05-10
2568	1.26	1.00	2004-02-20	2014-05-10
2569	1.27	1.00	2004-02-19	2014-05-10
2570	1.28	1.00	2004-02-18	2014-05-10
2571	1.28	1.00	2004-02-17	2014-05-10
2572	1.28	1.00	2004-02-13	2014-05-10
2573	1.28	1.00	2004-02-12	2014-05-10
2574	1.28	1.00	2004-02-11	2014-05-10
2575	1.27	1.00	2004-02-10	2014-05-10
2576	1.27	1.00	2004-02-09	2014-05-10
2577	1.27	1.00	2004-02-06	2014-05-10
2578	1.26	1.00	2004-02-05	2014-05-10
2579	1.26	1.00	2004-02-04	2014-05-10
2580	1.26	1.00	2004-02-03	2014-05-10
2581	1.24	1.00	2004-02-02	2014-05-10
2582	1.25	1.00	2004-01-30	2014-05-10
2583	1.24	1.00	2004-01-29	2014-05-10
2584	1.26	1.00	2004-01-28	2014-05-10
2585	1.26	1.00	2004-01-27	2014-05-10
2586	1.26	1.00	2004-01-26	2014-05-10
2587	1.26	1.00	2004-01-23	2014-05-10
2588	1.27	1.00	2004-01-22	2014-05-10
2589	1.26	1.00	2004-01-21	2014-05-10
2590	1.26	1.00	2004-01-20	2014-05-10
2591	1.24	1.00	2004-01-16	2014-05-10
2592	1.26	1.00	2004-01-15	2014-05-10
2593	1.27	1.00	2004-01-14	2014-05-10
2594	1.27	1.00	2004-01-13	2014-05-10
2595	1.28	1.00	2004-01-12	2014-05-10
2596	1.29	1.00	2004-01-09	2014-05-10
2597	1.28	1.00	2004-01-08	2014-05-10
2598	1.27	1.00	2004-01-07	2014-05-10
2599	1.28	1.00	2004-01-06	2014-05-10
2600	1.27	1.00	2004-01-05	2014-05-10
2601	1.26	1.00	2004-01-02	2014-05-10
2602	1.26	1.00	2003-12-31	2014-05-10
2603	1.25	1.00	2003-12-30	2014-05-10
2604	1.25	1.00	2003-12-29	2014-05-10
2605	1.24	1.00	2003-12-26	2014-05-10
2606	1.25	1.00	2003-12-24	2014-05-10
2607	1.24	1.00	2003-12-23	2014-05-10
2608	1.24	1.00	2003-12-22	2014-05-10
2609	1.24	1.00	2003-12-19	2014-05-10
2610	1.24	1.00	2003-12-18	2014-05-10
2611	1.24	1.00	2003-12-17	2014-05-10
2612	1.23	1.00	2003-12-16	2014-05-10
2613	1.23	1.00	2003-12-15	2014-05-10
2614	1.23	1.00	2003-12-12	2014-05-10
2615	1.22	1.00	2003-12-11	2014-05-10
2616	1.22	1.00	2003-12-10	2014-05-10
2617	1.22	1.00	2003-12-09	2014-05-10
2618	1.22	1.00	2003-12-08	2014-05-10
2619	1.22	1.00	2003-12-05	2014-05-10
2620	1.21	1.00	2003-12-04	2014-05-10
2621	1.21	1.00	2003-12-03	2014-05-10
2622	1.21	1.00	2003-12-02	2014-05-10
2623	1.20	1.00	2003-12-01	2014-05-10
2624	1.20	1.00	2003-11-28	2014-05-10
2625	1.19	1.00	2003-11-26	2014-05-10
2626	1.18	1.00	2003-11-25	2014-05-10
2627	1.18	1.00	2003-11-24	2014-05-10
2628	1.19	1.00	2003-11-21	2014-05-10
2629	1.19	1.00	2003-11-20	2014-05-10
2630	1.19	1.00	2003-11-19	2014-05-10
2631	1.19	1.00	2003-11-18	2014-05-10
2632	1.17	1.00	2003-11-17	2014-05-10
2633	1.17	1.00	2003-11-14	2014-05-10
2634	1.17	1.00	2003-11-13	2014-05-10
2635	1.16	1.00	2003-11-12	2014-05-10
2636	1.15	1.00	2003-11-10	2014-05-10
2637	1.15	1.00	2003-11-07	2014-05-10
2638	1.14	1.00	2003-11-06	2014-05-10
2639	1.15	1.00	2003-11-05	2014-05-10
2640	1.15	1.00	2003-11-04	2014-05-10
2641	1.15	1.00	2003-11-03	2014-05-10
2642	1.16	1.00	2003-10-31	2014-05-10
2643	1.17	1.00	2003-10-30	2014-05-10
2644	1.17	1.00	2003-10-29	2014-05-10
2645	1.17	1.00	2003-10-28	2014-05-10
2646	1.18	1.00	2003-10-27	2014-05-10
2647	1.18	1.00	2003-10-24	2014-05-10
2648	1.18	1.00	2003-10-23	2014-05-10
2649	1.18	1.00	2003-10-22	2014-05-10
2650	1.17	1.00	2003-10-21	2014-05-10
2651	1.17	1.00	2003-10-20	2014-05-10
2652	1.16	1.00	2003-10-17	2014-05-10
2653	1.17	1.00	2003-10-16	2014-05-10
2654	1.17	1.00	2003-10-15	2014-05-10
2655	1.17	1.00	2003-10-14	2014-05-10
2656	1.18	1.00	2003-10-10	2014-05-10
2657	1.17	1.00	2003-10-09	2014-05-10
2658	1.18	1.00	2003-10-08	2014-05-10
2659	1.18	1.00	2003-10-07	2014-05-10
2660	1.17	1.00	2003-10-06	2014-05-10
2661	1.16	1.00	2003-10-03	2014-05-10
2662	1.17	1.00	2003-10-02	2014-05-10
2663	1.17	1.00	2003-10-01	2014-05-10
2664	1.17	1.00	2003-09-30	2014-05-10
2665	1.16	1.00	2003-09-29	2014-05-10
2666	1.15	1.00	2003-09-26	2014-05-10
2667	1.15	1.00	2003-09-25	2014-05-10
2668	1.15	1.00	2003-09-24	2014-05-10
2669	1.15	1.00	2003-09-23	2014-05-10
2670	1.15	1.00	2003-09-22	2014-05-10
2671	1.13	1.00	2003-09-19	2014-05-10
2672	1.12	1.00	2003-09-18	2014-05-10
2673	1.12	1.00	2003-09-17	2014-05-10
2674	1.12	1.00	2003-09-16	2014-05-10
2675	1.13	1.00	2003-09-15	2014-05-10
2676	1.13	1.00	2003-09-12	2014-05-10
2677	1.12	1.00	2003-09-11	2014-05-10
2678	1.12	1.00	2003-09-10	2014-05-10
2679	1.12	1.00	2003-09-09	2014-05-10
2680	1.11	1.00	2003-09-08	2014-05-10
2681	1.11	1.00	2003-09-05	2014-05-10
2682	1.09	1.00	2003-09-04	2014-05-10
2683	1.08	1.00	2003-09-03	2014-05-10
2684	1.09	1.00	2003-09-02	2014-05-10
2685	1.10	1.00	2003-08-29	2014-05-10
2686	1.09	1.00	2003-08-28	2014-05-10
2687	1.09	1.00	2003-08-27	2014-05-10
2688	1.09	1.00	2003-08-26	2014-05-10
2689	1.09	1.00	2003-08-25	2014-05-10
2690	1.09	1.00	2003-08-22	2014-05-10
2691	1.10	1.00	2003-08-21	2014-05-10
2692	1.11	1.00	2003-08-20	2014-05-10
2693	1.11	1.00	2003-08-19	2014-05-10
2694	1.11	1.00	2003-08-18	2014-05-10
2695	1.13	1.00	2003-08-15	2014-05-10
2696	1.12	1.00	2003-08-14	2014-05-10
2697	1.13	1.00	2003-08-13	2014-05-10
2698	1.13	1.00	2003-08-12	2014-05-10
2699	1.13	1.00	2003-08-11	2014-05-10
2700	1.13	1.00	2003-08-08	2014-05-10
2701	1.14	1.00	2003-08-07	2014-05-10
2702	1.14	1.00	2003-08-06	2014-05-10
2703	1.13	1.00	2003-08-05	2014-05-10
2704	1.13	1.00	2003-08-04	2014-05-10
2705	1.13	1.00	2003-08-01	2014-05-10
2706	1.12	1.00	2003-07-31	2014-05-10
2707	1.14	1.00	2003-07-30	2014-05-10
2708	1.15	1.00	2003-07-29	2014-05-10
2709	1.15	1.00	2003-07-28	2014-05-10
2710	1.15	1.00	2003-07-25	2014-05-10
2711	1.14	1.00	2003-07-24	2014-05-10
2712	1.15	1.00	2003-07-23	2014-05-10
2713	1.13	1.00	2003-07-22	2014-05-10
2714	1.13	1.00	2003-07-21	2014-05-10
2715	1.12	1.00	2003-07-18	2014-05-10
2716	1.12	1.00	2003-07-17	2014-05-10
2717	1.12	1.00	2003-07-16	2014-05-10
2718	1.12	1.00	2003-07-15	2014-05-10
2719	1.13	1.00	2003-07-14	2014-05-10
2720	1.13	1.00	2003-07-11	2014-05-10
2721	1.14	1.00	2003-07-10	2014-05-10
2722	1.13	1.00	2003-07-09	2014-05-10
2723	1.13	1.00	2003-07-08	2014-05-10
2724	1.13	1.00	2003-07-07	2014-05-10
2725	1.15	1.00	2003-07-03	2014-05-10
2726	1.15	1.00	2003-07-02	2014-05-10
2727	1.16	1.00	2003-07-01	2014-05-10
2728	1.15	1.00	2003-06-30	2014-05-10
2729	1.14	1.00	2003-06-27	2014-05-10
2730	1.14	1.00	2003-06-26	2014-05-10
2731	1.16	1.00	2003-06-25	2014-05-10
2732	1.15	1.00	2003-06-24	2014-05-10
2733	1.15	1.00	2003-06-23	2014-05-10
2734	1.16	1.00	2003-06-20	2014-05-10
2735	1.17	1.00	2003-06-19	2014-05-10
2736	1.17	1.00	2003-06-18	2014-05-10
2737	1.18	1.00	2003-06-17	2014-05-10
2738	1.18	1.00	2003-06-16	2014-05-10
2739	1.18	1.00	2003-06-13	2014-05-10
2740	1.18	1.00	2003-06-12	2014-05-10
2741	1.18	1.00	2003-06-11	2014-05-10
2742	1.17	1.00	2003-06-10	2014-05-10
2743	1.17	1.00	2003-06-09	2014-05-10
2744	1.17	1.00	2003-06-06	2014-05-10
2745	1.19	1.00	2003-06-05	2014-05-10
2746	1.17	1.00	2003-06-04	2014-05-10
2747	1.17	1.00	2003-06-03	2014-05-10
2748	1.17	1.00	2003-06-02	2014-05-10
2749	1.18	1.00	2003-05-30	2014-05-10
2750	1.18	1.00	2003-05-29	2014-05-10
2751	1.17	1.00	2003-05-28	2014-05-10
2752	1.19	1.00	2003-05-27	2014-05-10
2753	1.18	1.00	2003-05-23	2014-05-10
2754	1.17	1.00	2003-05-22	2014-05-10
2755	1.17	1.00	2003-05-21	2014-05-10
2756	1.17	1.00	2003-05-20	2014-05-10
2757	1.17	1.00	2003-05-19	2014-05-10
2758	1.15	1.00	2003-05-16	2014-05-10
2759	1.15	1.00	2003-05-15	2014-05-10
2760	1.15	1.00	2003-05-14	2014-05-10
2761	1.15	1.00	2003-05-13	2014-05-10
2762	1.16	1.00	2003-05-12	2014-05-10
2763	1.15	1.00	2003-05-09	2014-05-10
2764	1.15	1.00	2003-05-08	2014-05-10
2765	1.13	1.00	2003-05-07	2014-05-10
2766	1.14	1.00	2003-05-06	2014-05-10
2767	1.13	1.00	2003-05-05	2014-05-10
2768	1.12	1.00	2003-05-02	2014-05-10
2769	1.12	1.00	2003-05-01	2014-05-10
2770	1.12	1.00	2003-04-30	2014-05-10
2771	1.10	1.00	2003-04-29	2014-05-10
2772	1.10	1.00	2003-04-28	2014-05-10
2773	1.10	1.00	2003-04-25	2014-05-10
2774	1.10	1.00	2003-04-24	2014-05-10
2775	1.09	1.00	2003-04-23	2014-05-10
2776	1.10	1.00	2003-04-22	2014-05-10
2777	1.09	1.00	2003-04-21	2014-05-10
2778	1.09	1.00	2003-04-18	2014-05-10
2779	1.09	1.00	2003-04-17	2014-05-10
2780	1.09	1.00	2003-04-16	2014-05-10
2781	1.08	1.00	2003-04-15	2014-05-10
2782	1.08	1.00	2003-04-14	2014-05-10
2783	1.08	1.00	2003-04-11	2014-05-10
2784	1.08	1.00	2003-04-10	2014-05-10
2785	1.07	1.00	2003-04-09	2014-05-10
2786	1.07	1.00	2003-04-08	2014-05-10
2787	1.06	1.00	2003-04-07	2014-05-10
2788	1.07	1.00	2003-04-04	2014-05-10
2789	1.07	1.00	2003-04-03	2014-05-10
2790	1.08	1.00	2003-04-02	2014-05-10
2791	1.09	1.00	2003-04-01	2014-05-10
2792	1.09	1.00	2003-03-31	2014-05-10
2793	1.08	1.00	2003-03-28	2014-05-10
2794	1.07	1.00	2003-03-27	2014-05-10
2795	1.07	1.00	2003-03-26	2014-05-10
2796	1.07	1.00	2003-03-25	2014-05-10
2797	1.06	1.00	2003-03-24	2014-05-10
2798	1.05	1.00	2003-03-21	2014-05-10
2799	1.06	1.00	2003-03-20	2014-05-10
2800	1.06	1.00	2003-03-19	2014-05-10
2801	1.06	1.00	2003-03-18	2014-05-10
2802	1.06	1.00	2003-03-17	2014-05-10
2803	1.07	1.00	2003-03-14	2014-05-10
2804	1.09	1.00	2003-03-13	2014-05-10
2805	1.10	1.00	2003-03-12	2014-05-10
2806	1.10	1.00	2003-03-11	2014-05-10
2807	1.11	1.00	2003-03-10	2014-05-10
2808	1.10	1.00	2003-03-07	2014-05-10
2809	1.10	1.00	2003-03-06	2014-05-10
2810	1.10	1.00	2003-03-05	2014-05-10
2811	1.09	1.00	2003-03-04	2014-05-10
2812	1.08	1.00	2003-03-03	2014-05-10
2813	1.08	1.00	2003-02-28	2014-05-10
2814	1.08	1.00	2003-02-27	2014-05-10
2815	1.08	1.00	2003-02-26	2014-05-10
2816	1.08	1.00	2003-02-25	2014-05-10
2817	1.08	1.00	2003-02-24	2014-05-10
2818	1.08	1.00	2003-02-21	2014-05-10
2819	1.08	1.00	2003-02-20	2014-05-10
2820	1.07	1.00	2003-02-19	2014-05-10
2821	1.07	1.00	2003-02-18	2014-05-10
2822	1.08	1.00	2003-02-14	2014-05-10
2823	1.08	1.00	2003-02-13	2014-05-10
2824	1.07	1.00	2003-02-12	2014-05-10
2825	1.07	1.00	2003-02-11	2014-05-10
2826	1.07	1.00	2003-02-10	2014-05-10
2827	1.08	1.00	2003-02-07	2014-05-10
2828	1.08	1.00	2003-02-06	2014-05-10
2829	1.08	1.00	2003-02-05	2014-05-10
2830	1.09	1.00	2003-02-04	2014-05-10
2831	1.08	1.00	2003-02-03	2014-05-10
2832	1.07	1.00	2003-01-31	2014-05-10
2833	1.08	1.00	2003-01-30	2014-05-10
2834	1.09	1.00	2003-01-29	2014-05-10
2835	1.08	1.00	2003-01-28	2014-05-10
2836	1.08	1.00	2003-01-27	2014-05-10
2837	1.08	1.00	2003-01-24	2014-05-10
2838	1.08	1.00	2003-01-23	2014-05-10
2839	1.07	1.00	2003-01-22	2014-05-10
2840	1.07	1.00	2003-01-21	2014-05-10
2841	1.07	1.00	2003-01-17	2014-05-10
2842	1.06	1.00	2003-01-16	2014-05-10
2843	1.06	1.00	2003-01-15	2014-05-10
2844	1.06	1.00	2003-01-14	2014-05-10
2845	1.05	1.00	2003-01-13	2014-05-10
2846	1.05	1.00	2003-01-10	2014-05-10
2847	1.05	1.00	2003-01-09	2014-05-10
2848	1.04	1.00	2003-01-08	2014-05-10
2849	1.04	1.00	2003-01-07	2014-05-10
2850	1.05	1.00	2003-01-06	2014-05-10
2851	1.04	1.00	2003-01-03	2014-05-10
2852	1.04	1.00	2003-01-02	2014-05-10
2853	1.05	1.00	2002-12-31	2014-05-10
2854	1.05	1.00	2002-12-30	2014-05-10
2855	1.04	1.00	2002-12-27	2014-05-10
2856	1.04	1.00	2002-12-26	2014-05-10
2857	1.03	1.00	2002-12-24	2014-05-10
2858	1.02	1.00	2002-12-23	2014-05-10
2859	1.03	1.00	2002-12-20	2014-05-10
2860	1.02	1.00	2002-12-19	2014-05-10
2861	1.03	1.00	2002-12-18	2014-05-10
2862	1.03	1.00	2002-12-17	2014-05-10
2863	1.02	1.00	2002-12-16	2014-05-10
2864	1.02	1.00	2002-12-13	2014-05-10
2865	1.02	1.00	2002-12-12	2014-05-10
2866	1.01	1.00	2002-12-11	2014-05-10
2867	1.01	1.00	2002-12-10	2014-05-10
2868	1.01	1.00	2002-12-09	2014-05-10
2869	1.01	1.00	2002-12-06	2014-05-10
2870	1.00	1.00	2002-12-05	2014-05-10
2871	1.00	1.00	2002-12-04	2014-05-10
2872	1.00	1.00	2002-12-03	2014-05-10
2873	0.99	1.00	2002-12-02	2014-05-10
2874	0.99	1.00	2002-11-29	2014-05-10
2875	0.99	1.00	2002-11-27	2014-05-10
2876	0.99	1.00	2002-11-26	2014-05-10
2877	0.99	1.00	2002-11-25	2014-05-10
2878	1.00	1.00	2002-11-22	2014-05-10
2879	1.00	1.00	2002-11-21	2014-05-10
2880	1.00	1.00	2002-11-20	2014-05-10
2881	1.01	1.00	2002-11-19	2014-05-10
2882	1.01	1.00	2002-11-18	2014-05-10
2883	1.01	1.00	2002-11-15	2014-05-10
2884	1.00	1.00	2002-11-14	2014-05-10
2885	1.01	1.00	2002-11-13	2014-05-10
2886	1.01	1.00	2002-11-12	2014-05-10
2887	1.01	1.00	2002-11-08	2014-05-10
2888	1.01	1.00	2002-11-07	2014-05-10
2889	1.00	1.00	2002-11-06	2014-05-10
2890	1.00	1.00	2002-11-05	2014-05-10
2891	1.00	1.00	2002-11-04	2014-05-10
2892	1.00	1.00	2002-11-01	2014-05-10
2893	0.99	1.00	2002-10-31	2014-05-10
2894	0.98	1.00	2002-10-30	2014-05-10
2895	0.99	1.00	2002-10-29	2014-05-10
2896	0.98	1.00	2002-10-28	2014-05-10
2897	0.98	1.00	2002-10-25	2014-05-10
2898	0.97	1.00	2002-10-24	2014-05-10
2899	0.98	1.00	2002-10-23	2014-05-10
2900	0.98	1.00	2002-10-22	2014-05-10
2901	0.97	1.00	2002-10-21	2014-05-10
2902	0.97	1.00	2002-10-18	2014-05-10
2903	0.97	1.00	2002-10-17	2014-05-10
2904	0.98	1.00	2002-10-16	2014-05-10
2905	0.98	1.00	2002-10-15	2014-05-10
2906	0.99	1.00	2002-10-11	2014-05-10
2907	0.99	1.00	2002-10-10	2014-05-10
2908	0.99	1.00	2002-10-09	2014-05-10
2909	0.98	1.00	2002-10-08	2014-05-10
2910	0.98	1.00	2002-10-07	2014-05-10
2911	0.98	1.00	2002-10-04	2014-05-10
2912	0.99	1.00	2002-10-03	2014-05-10
2913	0.98	1.00	2002-10-02	2014-05-10
2914	0.99	1.00	2002-10-01	2014-05-10
2915	0.99	1.00	2002-09-30	2014-05-10
2916	0.98	1.00	2002-09-27	2014-05-10
2917	0.98	1.00	2002-09-26	2014-05-10
2918	0.98	1.00	2002-09-25	2014-05-10
2919	0.98	1.00	2002-09-24	2014-05-10
2920	0.98	1.00	2002-09-23	2014-05-10
2921	0.98	1.00	2002-09-20	2014-05-10
2922	0.98	1.00	2002-09-19	2014-05-10
2923	0.98	1.00	2002-09-18	2014-05-10
2924	0.97	1.00	2002-09-17	2014-05-10
2925	0.97	1.00	2002-09-16	2014-05-10
2926	0.97	1.00	2002-09-13	2014-05-10
2927	0.98	1.00	2002-09-12	2014-05-10
2928	0.97	1.00	2002-09-11	2014-05-10
2929	0.98	1.00	2002-09-10	2014-05-10
2930	0.98	1.00	2002-09-09	2014-05-10
2931	0.98	1.00	2002-09-06	2014-05-10
2932	0.99	1.00	2002-09-05	2014-05-10
2933	0.99	1.00	2002-09-04	2014-05-10
2934	1.00	1.00	2002-09-03	2014-05-10
2935	0.98	1.00	2002-08-30	2014-05-10
2936	0.98	1.00	2002-08-29	2014-05-10
2937	0.98	1.00	2002-08-28	2014-05-10
2938	0.98	1.00	2002-08-27	2014-05-10
2939	0.97	1.00	2002-08-26	2014-05-10
2940	0.97	1.00	2002-08-23	2014-05-10
2941	0.97	1.00	2002-08-22	2014-05-10
2942	0.98	1.00	2002-08-21	2014-05-10
2943	0.98	1.00	2002-08-20	2014-05-10
2944	0.98	1.00	2002-08-19	2014-05-10
2945	0.98	1.00	2002-08-16	2014-05-10
2946	0.98	1.00	2002-08-15	2014-05-10
2947	0.99	1.00	2002-08-14	2014-05-10
2948	0.98	1.00	2002-08-13	2014-05-10
2949	0.98	1.00	2002-08-12	2014-05-10
2950	0.97	1.00	2002-08-09	2014-05-10
2951	0.97	1.00	2002-08-08	2014-05-10
2952	0.97	1.00	2002-08-07	2014-05-10
2953	0.96	1.00	2002-08-06	2014-05-10
2954	0.98	1.00	2002-08-05	2014-05-10
2955	0.99	1.00	2002-08-02	2014-05-10
2956	0.98	1.00	2002-08-01	2014-05-10
2957	0.98	1.00	2002-07-31	2014-05-10
2958	0.99	1.00	2002-07-30	2014-05-10
2959	0.98	1.00	2002-07-29	2014-05-10
2960	0.99	1.00	2002-07-26	2014-05-10
2961	1.00	1.00	2002-07-25	2014-05-10
2962	0.99	1.00	2002-07-24	2014-05-10
2963	0.99	1.00	2002-07-23	2014-05-10
2964	1.01	1.00	2002-07-22	2014-05-10
2965	1.02	1.00	2002-07-19	2014-05-10
2966	1.01	1.00	2002-07-18	2014-05-10
2967	1.01	1.00	2002-07-17	2014-05-10
2968	1.01	1.00	2002-07-16	2014-05-10
2969	1.01	1.00	2002-07-15	2014-05-10
2970	0.99	1.00	2002-07-12	2014-05-10
2971	0.99	1.00	2002-07-11	2014-05-10
2972	0.99	1.00	2002-07-10	2014-05-10
2973	0.99	1.00	2002-07-09	2014-05-10
2974	0.99	1.00	2002-07-08	2014-05-10
2975	0.97	1.00	2002-07-05	2014-05-10
2976	0.98	1.00	2002-07-03	2014-05-10
2977	0.98	1.00	2002-07-02	2014-05-10
2978	0.99	1.00	2002-07-01	2014-05-10
2979	0.99	1.00	2002-06-28	2014-05-10
2980	0.99	1.00	2002-06-27	2014-05-10
2981	0.98	1.00	2002-06-26	2014-05-10
2982	0.97	1.00	2002-06-25	2014-05-10
2983	0.98	1.00	2002-06-24	2014-05-10
2984	0.97	1.00	2002-06-21	2014-05-10
2985	0.96	1.00	2002-06-20	2014-05-10
2986	0.95	1.00	2002-06-19	2014-05-10
2987	0.95	1.00	2002-06-18	2014-05-10
2988	0.94	1.00	2002-06-17	2014-05-10
2989	0.94	1.00	2002-06-14	2014-05-10
2990	0.94	1.00	2002-06-13	2014-05-10
2991	0.95	1.00	2002-06-12	2014-05-10
2992	0.94	1.00	2002-06-11	2014-05-10
2993	0.94	1.00	2002-06-10	2014-05-10
2994	0.94	1.00	2002-06-07	2014-05-10
2995	0.95	1.00	2002-06-06	2014-05-10
2996	0.94	1.00	2002-06-05	2014-05-10
2997	0.94	1.00	2002-06-04	2014-05-10
2998	0.94	1.00	2002-06-03	2014-05-10
2999	0.93	1.00	2002-05-31	2014-05-10
3000	0.94	1.00	2002-05-30	2014-05-10
3001	0.93	1.00	2002-05-29	2014-05-10
3002	0.93	1.00	2002-05-28	2014-05-10
3003	0.92	1.00	2002-05-24	2014-05-10
3004	0.92	1.00	2002-05-23	2014-05-10
3005	0.93	1.00	2002-05-22	2014-05-10
3006	0.92	1.00	2002-05-21	2014-05-10
3007	0.92	1.00	2002-05-20	2014-05-10
3008	0.92	1.00	2002-05-17	2014-05-10
3009	0.91	1.00	2002-05-16	2014-05-10
3010	0.91	1.00	2002-05-15	2014-05-10
3011	0.90	1.00	2002-05-14	2014-05-10
3012	0.91	1.00	2002-05-13	2014-05-10
3013	0.91	1.00	2002-05-10	2014-05-10
3014	0.91	1.00	2002-05-09	2014-05-10
3015	0.90	1.00	2002-05-08	2014-05-10
3016	0.91	1.00	2002-05-07	2014-05-10
3017	0.92	1.00	2002-05-06	2014-05-10
3018	0.91	1.00	2002-05-03	2014-05-10
3019	0.90	1.00	2002-05-02	2014-05-10
3020	0.91	1.00	2002-05-01	2014-05-10
3021	0.90	1.00	2002-04-30	2014-05-10
3022	0.90	1.00	2002-04-29	2014-05-10
3023	0.90	1.00	2002-04-26	2014-05-10
3024	0.90	1.00	2002-04-25	2014-05-10
3025	0.89	1.00	2002-04-24	2014-05-10
3026	0.89	1.00	2002-04-23	2014-05-10
3027	0.89	1.00	2002-04-22	2014-05-10
3028	0.89	1.00	2002-04-19	2014-05-10
3029	0.89	1.00	2002-04-18	2014-05-10
3030	0.89	1.00	2002-04-17	2014-05-10
3031	0.88	1.00	2002-04-16	2014-05-10
3032	0.88	1.00	2002-04-15	2014-05-10
3033	0.88	1.00	2002-04-12	2014-05-10
3034	0.88	1.00	2002-04-11	2014-05-10
3035	0.88	1.00	2002-04-10	2014-05-10
3036	0.88	1.00	2002-04-09	2014-05-10
3037	0.88	1.00	2002-04-08	2014-05-10
3038	0.88	1.00	2002-04-05	2014-05-10
3039	0.88	1.00	2002-04-04	2014-05-10
3040	0.88	1.00	2002-04-03	2014-05-10
3041	0.88	1.00	2002-04-02	2014-05-10
3042	0.88	1.00	2002-04-01	2014-05-10
3043	0.87	1.00	2002-03-29	2014-05-10
3044	0.87	1.00	2002-03-28	2014-05-10
3045	0.87	1.00	2002-03-27	2014-05-10
3046	0.88	1.00	2002-03-26	2014-05-10
3047	0.88	1.00	2002-03-25	2014-05-10
3048	0.88	1.00	2002-03-22	2014-05-10
3049	0.88	1.00	2002-03-21	2014-05-10
3050	0.88	1.00	2002-03-20	2014-05-10
3051	0.88	1.00	2002-03-19	2014-05-10
3052	0.88	1.00	2002-03-18	2014-05-10
3053	0.88	1.00	2002-03-15	2014-05-10
3054	0.88	1.00	2002-03-14	2014-05-10
3055	0.88	1.00	2002-03-13	2014-05-10
3056	0.88	1.00	2002-03-12	2014-05-10
3057	0.88	1.00	2002-03-11	2014-05-10
3058	0.88	1.00	2002-03-08	2014-05-10
3059	0.88	1.00	2002-03-07	2014-05-10
3060	0.88	1.00	2002-03-06	2014-05-10
3061	0.87	1.00	2002-03-05	2014-05-10
3062	0.87	1.00	2002-03-04	2014-05-10
3063	0.87	1.00	2002-03-01	2014-05-10
3064	0.87	1.00	2002-02-28	2014-05-10
3065	0.86	1.00	2002-02-27	2014-05-10
3066	0.87	1.00	2002-02-26	2014-05-10
3067	0.87	1.00	2002-02-25	2014-05-10
3068	0.88	1.00	2002-02-22	2014-05-10
3069	0.87	1.00	2002-02-21	2014-05-10
3070	0.87	1.00	2002-02-20	2014-05-10
3071	0.88	1.00	2002-02-19	2014-05-10
3072	0.87	1.00	2002-02-15	2014-05-10
3073	0.87	1.00	2002-02-14	2014-05-10
3074	0.87	1.00	2002-02-13	2014-05-10
3075	0.88	1.00	2002-02-12	2014-05-10
3076	0.88	1.00	2002-02-11	2014-05-10
3077	0.87	1.00	2002-02-08	2014-05-10
3078	0.87	1.00	2002-02-07	2014-05-10
3079	0.87	1.00	2002-02-06	2014-05-10
3080	0.87	1.00	2002-02-05	2014-05-10
3081	0.87	1.00	2002-02-04	2014-05-10
3082	0.86	1.00	2002-02-01	2014-05-10
3083	0.86	1.00	2002-01-31	2014-05-10
3084	0.86	1.00	2002-01-30	2014-05-10
3085	0.86	1.00	2002-01-29	2014-05-10
3086	0.86	1.00	2002-01-28	2014-05-10
3087	0.87	1.00	2002-01-25	2014-05-10
3088	0.88	1.00	2002-01-24	2014-05-10
3089	0.88	1.00	2002-01-23	2014-05-10
3090	0.88	1.00	2002-01-22	2014-05-10
3091	0.88	1.00	2002-01-18	2014-05-10
3092	0.88	1.00	2002-01-17	2014-05-10
3093	0.88	1.00	2002-01-16	2014-05-10
3094	0.89	1.00	2002-01-15	2014-05-10
3095	0.89	1.00	2002-01-14	2014-05-10
3096	0.89	1.00	2002-01-11	2014-05-10
3097	0.89	1.00	2002-01-10	2014-05-10
3098	0.89	1.00	2002-01-09	2014-05-10
3099	0.89	1.00	2002-01-08	2014-05-10
3100	0.89	1.00	2002-01-07	2014-05-10
3101	0.89	1.00	2002-01-04	2014-05-10
3102	0.90	1.00	2002-01-03	2014-05-10
3103	0.90	1.00	2002-01-02	2014-05-10
3104	0.89	1.00	2001-12-31	2014-05-10
3105	0.88	1.00	2001-12-28	2014-05-10
3106	0.88	1.00	2001-12-27	2014-05-10
3107	0.88	1.00	2001-12-26	2014-05-10
3108	0.88	1.00	2001-12-24	2014-05-10
3109	0.89	1.00	2001-12-21	2014-05-10
3110	0.90	1.00	2001-12-20	2014-05-10
3111	0.90	1.00	2001-12-19	2014-05-10
3112	0.90	1.00	2001-12-18	2014-05-10
3113	0.90	1.00	2001-12-17	2014-05-10
3114	0.90	1.00	2001-12-14	2014-05-10
3115	0.90	1.00	2001-12-13	2014-05-10
3116	0.89	1.00	2001-12-12	2014-05-10
3117	0.89	1.00	2001-12-11	2014-05-10
3118	0.89	1.00	2001-12-10	2014-05-10
3119	0.89	1.00	2001-12-07	2014-05-10
3120	0.89	1.00	2001-12-06	2014-05-10
3121	0.89	1.00	2001-12-05	2014-05-10
3122	0.89	1.00	2001-12-04	2014-05-10
3123	0.89	1.00	2001-12-03	2014-05-10
3124	0.90	1.00	2001-11-30	2014-05-10
3125	0.89	1.00	2001-11-29	2014-05-10
3126	0.89	1.00	2001-11-28	2014-05-10
3127	0.88	1.00	2001-11-27	2014-05-10
3128	0.88	1.00	2001-11-26	2014-05-10
3129	0.88	1.00	2001-11-23	2014-05-10
3130	0.88	1.00	2001-11-21	2014-05-10
3131	0.88	1.00	2001-11-20	2014-05-10
3132	0.88	1.00	2001-11-19	2014-05-10
3133	0.88	1.00	2001-11-16	2014-05-10
3134	0.88	1.00	2001-11-15	2014-05-10
3135	0.88	1.00	2001-11-14	2014-05-10
3136	0.88	1.00	2001-11-13	2014-05-10
3137	0.89	1.00	2001-11-09	2014-05-10
3138	0.89	1.00	2001-11-08	2014-05-10
3139	0.90	1.00	2001-11-07	2014-05-10
3140	0.90	1.00	2001-11-06	2014-05-10
3141	0.90	1.00	2001-11-05	2014-05-10
3142	0.90	1.00	2001-11-02	2014-05-10
3143	0.90	1.00	2001-11-01	2014-05-10
3144	0.90	1.00	2001-10-31	2014-05-10
3145	0.91	1.00	2001-10-30	2014-05-10
3146	0.90	1.00	2001-10-29	2014-05-10
3147	0.89	1.00	2001-10-26	2014-05-10
3148	0.90	1.00	2001-10-25	2014-05-10
3149	0.89	1.00	2001-10-24	2014-05-10
3150	0.89	1.00	2001-10-23	2014-05-10
3151	0.89	1.00	2001-10-22	2014-05-10
3152	0.90	1.00	2001-10-19	2014-05-10
3153	0.90	1.00	2001-10-18	2014-05-10
3154	0.91	1.00	2001-10-17	2014-05-10
3155	0.91	1.00	2001-10-16	2014-05-10
3156	0.91	1.00	2001-10-15	2014-05-10
3157	0.91	1.00	2001-10-12	2014-05-10
3158	0.90	1.00	2001-10-11	2014-05-10
3159	0.91	1.00	2001-10-10	2014-05-10
3160	0.92	1.00	2001-10-09	2014-05-10
3161	0.92	1.00	2001-10-05	2014-05-10
3162	0.91	1.00	2001-10-04	2014-05-10
3163	0.92	1.00	2001-10-03	2014-05-10
3164	0.91	1.00	2001-10-02	2014-05-10
3165	0.92	1.00	2001-10-01	2014-05-10
3166	0.91	1.00	2001-09-28	2014-05-10
3167	0.92	1.00	2001-09-27	2014-05-10
3168	0.92	1.00	2001-09-26	2014-05-10
3169	0.92	1.00	2001-09-25	2014-05-10
3170	0.91	1.00	2001-09-24	2014-05-10
3171	0.91	1.00	2001-09-21	2014-05-10
3172	0.93	1.00	2001-09-20	2014-05-10
3173	0.93	1.00	2001-09-19	2014-05-10
3174	0.92	1.00	2001-09-18	2014-05-10
3175	0.92	1.00	2001-09-17	2014-05-10
3176	0.92	1.00	2001-09-14	2014-05-10
3177	0.91	1.00	2001-09-13	2014-05-10
3178	0.91	1.00	2001-09-12	2014-05-10
3179	0.90	1.00	2001-09-10	2014-05-10
3180	0.90	1.00	2001-09-07	2014-05-10
3181	0.89	1.00	2001-09-06	2014-05-10
3182	0.89	1.00	2001-09-05	2014-05-10
3183	0.89	1.00	2001-09-04	2014-05-10
3184	0.91	1.00	2001-08-31	2014-05-10
3185	0.92	1.00	2001-08-30	2014-05-10
3186	0.91	1.00	2001-08-29	2014-05-10
3187	0.91	1.00	2001-08-28	2014-05-10
3188	0.91	1.00	2001-08-27	2014-05-10
3189	0.91	1.00	2001-08-24	2014-05-10
3190	0.92	1.00	2001-08-23	2014-05-10
3191	0.92	1.00	2001-08-22	2014-05-10
3192	0.91	1.00	2001-08-21	2014-05-10
3193	0.91	1.00	2001-08-20	2014-05-10
3194	0.92	1.00	2001-08-17	2014-05-10
3195	0.91	1.00	2001-08-16	2014-05-10
3196	0.91	1.00	2001-08-15	2014-05-10
3197	0.90	1.00	2001-08-14	2014-05-10
3198	0.90	1.00	2001-08-13	2014-05-10
3199	0.89	1.00	2001-08-10	2014-05-10
3200	0.89	1.00	2001-08-09	2014-05-10
3201	0.88	1.00	2001-08-08	2014-05-10
3202	0.88	1.00	2001-08-07	2014-05-10
3203	0.88	1.00	2001-08-06	2014-05-10
3204	0.88	1.00	2001-08-03	2014-05-10
3205	0.88	1.00	2001-08-02	2014-05-10
3206	0.88	1.00	2001-08-01	2014-05-10
3207	0.88	1.00	2001-07-31	2014-05-10
3208	0.88	1.00	2001-07-30	2014-05-10
3209	0.87	1.00	2001-07-27	2014-05-10
3210	0.88	1.00	2001-07-26	2014-05-10
3211	0.88	1.00	2001-07-25	2014-05-10
3212	0.88	1.00	2001-07-24	2014-05-10
3213	0.87	1.00	2001-07-23	2014-05-10
3214	0.87	1.00	2001-07-20	2014-05-10
3215	0.87	1.00	2001-07-19	2014-05-10
3216	0.87	1.00	2001-07-18	2014-05-10
3217	0.85	1.00	2001-07-17	2014-05-10
3218	0.85	1.00	2001-07-16	2014-05-10
3219	0.85	1.00	2001-07-13	2014-05-10
3220	0.85	1.00	2001-07-12	2014-05-10
3221	0.86	1.00	2001-07-11	2014-05-10
3222	0.86	1.00	2001-07-10	2014-05-10
3223	0.85	1.00	2001-07-09	2014-05-10
3224	0.85	1.00	2001-07-06	2014-05-10
3225	0.84	1.00	2001-07-05	2014-05-10
3226	0.85	1.00	2001-07-03	2014-05-10
3227	0.85	1.00	2001-07-02	2014-05-10
3228	0.85	1.00	2001-06-29	2014-05-10
3229	0.85	1.00	2001-06-28	2014-05-10
3230	0.86	1.00	2001-06-27	2014-05-10
3231	0.86	1.00	2001-06-26	2014-05-10
3232	0.86	1.00	2001-06-25	2014-05-10
3233	0.86	1.00	2001-06-22	2014-05-10
3234	0.85	1.00	2001-06-21	2014-05-10
3235	0.85	1.00	2001-06-20	2014-05-10
3236	0.86	1.00	2001-06-19	2014-05-10
3237	0.86	1.00	2001-06-18	2014-05-10
3238	0.86	1.00	2001-06-15	2014-05-10
3239	0.86	1.00	2001-06-14	2014-05-10
3240	0.85	1.00	2001-06-13	2014-05-10
3241	0.85	1.00	2001-06-12	2014-05-10
3242	0.84	1.00	2001-06-11	2014-05-10
3243	0.85	1.00	2001-06-08	2014-05-10
3244	0.85	1.00	2001-06-07	2014-05-10
3245	0.85	1.00	2001-06-06	2014-05-10
3246	0.85	1.00	2001-06-05	2014-05-10
3247	0.84	1.00	2001-06-04	2014-05-10
3248	0.85	1.00	2001-06-01	2014-05-10
3249	0.85	1.00	2001-05-31	2014-05-10
3250	0.86	1.00	2001-05-30	2014-05-10
3251	0.85	1.00	2001-05-29	2014-05-10
3252	0.86	1.00	2001-05-25	2014-05-10
3253	0.86	1.00	2001-05-24	2014-05-10
3254	0.86	1.00	2001-05-23	2014-05-10
3255	0.87	1.00	2001-05-22	2014-05-10
3256	0.88	1.00	2001-05-21	2014-05-10
3257	0.88	1.00	2001-05-18	2014-05-10
3258	0.88	1.00	2001-05-17	2014-05-10
3259	0.88	1.00	2001-05-16	2014-05-10
3260	0.88	1.00	2001-05-15	2014-05-10
3261	0.87	1.00	2001-05-14	2014-05-10
3262	0.88	1.00	2001-05-11	2014-05-10
3263	0.88	1.00	2001-05-10	2014-05-10
3264	0.88	1.00	2001-05-09	2014-05-10
3265	0.88	1.00	2001-05-08	2014-05-10
3266	0.89	1.00	2001-05-07	2014-05-10
3267	0.89	1.00	2001-05-04	2014-05-10
3268	0.89	1.00	2001-05-03	2014-05-10
3269	0.89	1.00	2001-05-02	2014-05-10
3270	0.89	1.00	2001-05-01	2014-05-10
3271	0.89	1.00	2001-04-30	2014-05-10
3272	0.89	1.00	2001-04-27	2014-05-10
3273	0.90	1.00	2001-04-26	2014-05-10
3274	0.90	1.00	2001-04-25	2014-05-10
3275	0.89	1.00	2001-04-24	2014-05-10
3276	0.90	1.00	2001-04-23	2014-05-10
3277	0.90	1.00	2001-04-20	2014-05-10
3278	0.89	1.00	2001-04-19	2014-05-10
3279	0.88	1.00	2001-04-18	2014-05-10
3280	0.88	1.00	2001-04-17	2014-05-10
3281	0.89	1.00	2001-04-16	2014-05-10
3282	0.89	1.00	2001-04-13	2014-05-10
3283	0.89	1.00	2001-04-12	2014-05-10
3284	0.89	1.00	2001-04-11	2014-05-10
3285	0.89	1.00	2001-04-10	2014-05-10
3286	0.90	1.00	2001-04-09	2014-05-10
3287	0.90	1.00	2001-04-06	2014-05-10
3288	0.90	1.00	2001-04-05	2014-05-10
3289	0.90	1.00	2001-04-04	2014-05-10
3290	0.89	1.00	2001-04-03	2014-05-10
3291	0.88	1.00	2001-04-02	2014-05-10
3292	0.88	1.00	2001-03-30	2014-05-10
3293	0.88	1.00	2001-03-29	2014-05-10
3294	0.89	1.00	2001-03-28	2014-05-10
3295	0.89	1.00	2001-03-27	2014-05-10
3296	0.90	1.00	2001-03-26	2014-05-10
3297	0.89	1.00	2001-03-23	2014-05-10
3298	0.89	1.00	2001-03-22	2014-05-10
3299	0.90	1.00	2001-03-21	2014-05-10
3300	0.91	1.00	2001-03-20	2014-05-10
3301	0.90	1.00	2001-03-19	2014-05-10
3302	0.89	1.00	2001-03-16	2014-05-10
3303	0.90	1.00	2001-03-15	2014-05-10
3304	0.91	1.00	2001-03-14	2014-05-10
3305	0.91	1.00	2001-03-13	2014-05-10
3306	0.93	1.00	2001-03-12	2014-05-10
3307	0.93	1.00	2001-03-09	2014-05-10
3308	0.93	1.00	2001-03-08	2014-05-10
3309	0.93	1.00	2001-03-07	2014-05-10
3310	0.93	1.00	2001-03-06	2014-05-10
3311	0.93	1.00	2001-03-05	2014-05-10
3312	0.93	1.00	2001-03-02	2014-05-10
3313	0.93	1.00	2001-03-01	2014-05-10
3314	0.92	1.00	2001-02-28	2014-05-10
3315	0.91	1.00	2001-02-27	2014-05-10
3316	0.91	1.00	2001-02-26	2014-05-10
3317	0.91	1.00	2001-02-23	2014-05-10
3318	0.91	1.00	2001-02-22	2014-05-10
3319	0.91	1.00	2001-02-21	2014-05-10
3320	0.91	1.00	2001-02-20	2014-05-10
3321	0.92	1.00	2001-02-16	2014-05-10
3322	0.91	1.00	2001-02-15	2014-05-10
3323	0.92	1.00	2001-02-14	2014-05-10
3324	0.92	1.00	2001-02-13	2014-05-10
3325	0.93	1.00	2001-02-12	2014-05-10
3326	0.93	1.00	2001-02-09	2014-05-10
3327	0.92	1.00	2001-02-08	2014-05-10
3328	0.93	1.00	2001-02-07	2014-05-10
3329	0.93	1.00	2001-02-06	2014-05-10
3330	0.94	1.00	2001-02-05	2014-05-10
3331	0.94	1.00	2001-02-02	2014-05-10
3332	0.94	1.00	2001-02-01	2014-05-10
3333	0.93	1.00	2001-01-31	2014-05-10
3334	0.93	1.00	2001-01-30	2014-05-10
3335	0.92	1.00	2001-01-29	2014-05-10
3336	0.92	1.00	2001-01-26	2014-05-10
3337	0.92	1.00	2001-01-25	2014-05-10
3338	0.93	1.00	2001-01-24	2014-05-10
3339	0.94	1.00	2001-01-23	2014-05-10
3340	0.94	1.00	2001-01-22	2014-05-10
3341	0.94	1.00	2001-01-19	2014-05-10
3342	0.94	1.00	2001-01-18	2014-05-10
3343	0.93	1.00	2001-01-17	2014-05-10
3344	0.94	1.00	2001-01-16	2014-05-10
3345	0.95	1.00	2001-01-12	2014-05-10
3346	0.95	1.00	2001-01-11	2014-05-10
3347	0.94	1.00	2001-01-10	2014-05-10
3348	0.94	1.00	2001-01-09	2014-05-10
3349	0.95	1.00	2001-01-08	2014-05-10
3350	0.95	1.00	2001-01-05	2014-05-10
3351	0.94	1.00	2001-01-04	2014-05-10
3352	0.95	1.00	2001-01-03	2014-05-10
3353	0.95	1.00	2001-01-02	2014-05-10
3354	0.94	1.00	2000-12-29	2014-05-10
3355	0.93	1.00	2000-12-28	2014-05-10
3356	0.93	1.00	2000-12-27	2014-05-10
3357	0.93	1.00	2000-12-26	2014-05-10
3358	0.92	1.00	2000-12-22	2014-05-10
3359	0.91	1.00	2000-12-21	2014-05-10
3360	0.91	1.00	2000-12-20	2014-05-10
3361	0.89	1.00	2000-12-19	2014-05-10
3362	0.89	1.00	2000-12-18	2014-05-10
3363	0.90	1.00	2000-12-15	2014-05-10
3364	0.89	1.00	2000-12-14	2014-05-10
3365	0.88	1.00	2000-12-13	2014-05-10
3366	0.88	1.00	2000-12-12	2014-05-10
3367	0.88	1.00	2000-12-11	2014-05-10
3368	0.88	1.00	2000-12-08	2014-05-10
3369	0.89	1.00	2000-12-07	2014-05-10
3370	0.89	1.00	2000-12-06	2014-05-10
3371	0.88	1.00	2000-12-05	2014-05-10
3372	0.89	1.00	2000-12-04	2014-05-10
3373	0.88	1.00	2000-12-01	2014-05-10
3374	0.87	1.00	2000-11-30	2014-05-10
3375	0.86	1.00	2000-11-29	2014-05-10
3376	0.85	1.00	2000-11-28	2014-05-10
3377	0.85	1.00	2000-11-27	2014-05-10
3378	0.84	1.00	2000-11-24	2014-05-10
3379	0.84	1.00	2000-11-22	2014-05-10
3380	0.85	1.00	2000-11-21	2014-05-10
3381	0.85	1.00	2000-11-20	2014-05-10
3382	0.85	1.00	2000-11-17	2014-05-10
3383	0.85	1.00	2000-11-16	2014-05-10
3384	0.86	1.00	2000-11-15	2014-05-10
3385	0.86	1.00	2000-11-14	2014-05-10
3386	0.86	1.00	2000-11-13	2014-05-10
3387	0.86	1.00	2000-11-10	2014-05-10
3388	0.86	1.00	2000-11-09	2014-05-10
3389	0.86	1.00	2000-11-08	2014-05-10
3390	0.86	1.00	2000-11-07	2014-05-10
3391	0.86	1.00	2000-11-06	2014-05-10
3392	0.86	1.00	2000-11-03	2014-05-10
3393	0.86	1.00	2000-11-02	2014-05-10
3394	0.86	1.00	2000-11-01	2014-05-10
3395	0.85	1.00	2000-10-31	2014-05-10
3396	0.84	1.00	2000-10-30	2014-05-10
3397	0.84	1.00	2000-10-27	2014-05-10
3398	0.83	1.00	2000-10-26	2014-05-10
3399	0.83	1.00	2000-10-25	2014-05-10
3400	0.84	1.00	2000-10-24	2014-05-10
3401	0.84	1.00	2000-10-23	2014-05-10
3402	0.84	1.00	2000-10-20	2014-05-10
3403	0.84	1.00	2000-10-19	2014-05-10
3404	0.84	1.00	2000-10-18	2014-05-10
3405	0.85	1.00	2000-10-17	2014-05-10
3406	0.85	1.00	2000-10-16	2014-05-10
3407	0.86	1.00	2000-10-13	2014-05-10
3408	0.86	1.00	2000-10-12	2014-05-10
3409	0.87	1.00	2000-10-11	2014-05-10
3410	0.87	1.00	2000-10-10	2014-05-10
3411	0.87	1.00	2000-10-06	2014-05-10
3412	0.87	1.00	2000-10-05	2014-05-10
3413	0.87	1.00	2000-10-04	2014-05-10
3414	0.87	1.00	2000-10-03	2014-05-10
3415	0.88	1.00	2000-10-02	2014-05-10
3416	0.88	1.00	2000-09-29	2014-05-10
3417	0.88	1.00	2000-09-28	2014-05-10
3418	0.88	1.00	2000-09-27	2014-05-10
3419	0.88	1.00	2000-09-26	2014-05-10
3420	0.87	1.00	2000-09-25	2014-05-10
3421	0.88	1.00	2000-09-22	2014-05-10
3422	0.86	1.00	2000-09-21	2014-05-10
3423	0.85	1.00	2000-09-20	2014-05-10
3424	0.85	1.00	2000-09-19	2014-05-10
3425	0.85	1.00	2000-09-18	2014-05-10
3426	0.86	1.00	2000-09-15	2014-05-10
3427	0.86	1.00	2000-09-14	2014-05-10
3428	0.86	1.00	2000-09-13	2014-05-10
3429	0.86	1.00	2000-09-12	2014-05-10
3430	0.86	1.00	2000-09-11	2014-05-10
3431	0.87	1.00	2000-09-08	2014-05-10
3432	0.87	1.00	2000-09-07	2014-05-10
3433	0.87	1.00	2000-09-06	2014-05-10
3434	0.89	1.00	2000-09-05	2014-05-10
3435	0.90	1.00	2000-09-01	2014-05-10
3436	0.89	1.00	2000-08-31	2014-05-10
3437	0.89	1.00	2000-08-30	2014-05-10
3438	0.90	1.00	2000-08-29	2014-05-10
3439	0.90	1.00	2000-08-28	2014-05-10
3440	0.90	1.00	2000-08-25	2014-05-10
3441	0.90	1.00	2000-08-24	2014-05-10
3442	0.90	1.00	2000-08-23	2014-05-10
3443	0.90	1.00	2000-08-22	2014-05-10
3444	0.90	1.00	2000-08-21	2014-05-10
3445	0.91	1.00	2000-08-18	2014-05-10
3446	0.92	1.00	2000-08-17	2014-05-10
3447	0.91	1.00	2000-08-16	2014-05-10
3448	0.91	1.00	2000-08-15	2014-05-10
3449	0.90	1.00	2000-08-14	2014-05-10
3450	0.90	1.00	2000-08-11	2014-05-10
3451	0.91	1.00	2000-08-10	2014-05-10
3452	0.90	1.00	2000-08-09	2014-05-10
3453	0.90	1.00	2000-08-08	2014-05-10
3454	0.91	1.00	2000-08-07	2014-05-10
3455	0.91	1.00	2000-08-04	2014-05-10
3456	0.90	1.00	2000-08-03	2014-05-10
3457	0.91	1.00	2000-08-02	2014-05-10
3458	0.92	1.00	2000-08-01	2014-05-10
3459	0.93	1.00	2000-07-31	2014-05-10
3460	0.92	1.00	2000-07-28	2014-05-10
3461	0.93	1.00	2000-07-27	2014-05-10
3462	0.94	1.00	2000-07-26	2014-05-10
3463	0.94	1.00	2000-07-25	2014-05-10
3464	0.93	1.00	2000-07-24	2014-05-10
3465	0.93	1.00	2000-07-21	2014-05-10
3466	0.93	1.00	2000-07-20	2014-05-10
3467	0.92	1.00	2000-07-19	2014-05-10
3468	0.93	1.00	2000-07-18	2014-05-10
3469	0.94	1.00	2000-07-17	2014-05-10
3470	0.94	1.00	2000-07-14	2014-05-10
3471	0.93	1.00	2000-07-13	2014-05-10
3472	0.94	1.00	2000-07-12	2014-05-10
3473	0.95	1.00	2000-07-11	2014-05-10
3474	0.95	1.00	2000-07-10	2014-05-10
3475	0.95	1.00	2000-07-07	2014-05-10
3476	0.95	1.00	2000-07-06	2014-05-10
3477	0.95	1.00	2000-07-05	2014-05-10
3478	0.95	1.00	2000-07-03	2014-05-10
3479	0.95	1.00	2000-06-30	2014-05-10
3480	0.95	1.00	2000-06-29	2014-05-10
3481	0.94	1.00	2000-06-28	2014-05-10
3482	0.94	1.00	2000-06-27	2014-05-10
3483	0.94	1.00	2000-06-26	2014-05-10
3484	0.94	1.00	2000-06-23	2014-05-10
3485	0.94	1.00	2000-06-22	2014-05-10
3486	0.95	1.00	2000-06-21	2014-05-10
3487	0.96	1.00	2000-06-20	2014-05-10
3488	0.96	1.00	2000-06-19	2014-05-10
3489	0.96	1.00	2000-06-16	2014-05-10
3490	0.95	1.00	2000-06-15	2014-05-10
3491	0.96	1.00	2000-06-14	2014-05-10
3492	0.96	1.00	2000-06-13	2014-05-10
3493	0.95	1.00	2000-06-12	2014-05-10
3494	0.95	1.00	2000-06-09	2014-05-10
3495	0.95	1.00	2000-06-08	2014-05-10
3496	0.96	1.00	2000-06-07	2014-05-10
3497	0.96	1.00	2000-06-06	2014-05-10
3498	0.95	1.00	2000-06-05	2014-05-10
3499	0.94	1.00	2000-06-02	2014-05-10
3500	0.93	1.00	2000-06-01	2014-05-10
3501	0.93	1.00	2000-05-31	2014-05-10
3502	0.93	1.00	2000-05-30	2014-05-10
3503	0.93	1.00	2000-05-26	2014-05-10
3504	0.91	1.00	2000-05-25	2014-05-10
3505	0.91	1.00	2000-05-24	2014-05-10
3506	0.90	1.00	2000-05-23	2014-05-10
3507	0.90	1.00	2000-05-22	2014-05-10
3508	0.89	1.00	2000-05-19	2014-05-10
3509	0.90	1.00	2000-05-18	2014-05-10
3510	0.89	1.00	2000-05-17	2014-05-10
3511	0.91	1.00	2000-05-16	2014-05-10
3512	0.91	1.00	2000-05-15	2014-05-10
3513	0.91	1.00	2000-05-12	2014-05-10
3514	0.90	1.00	2000-05-11	2014-05-10
3515	0.91	1.00	2000-05-10	2014-05-10
3516	0.90	1.00	2000-05-09	2014-05-10
3517	0.90	1.00	2000-05-08	2014-05-10
3518	0.90	1.00	2000-05-05	2014-05-10
3519	0.89	1.00	2000-05-04	2014-05-10
3520	0.89	1.00	2000-05-03	2014-05-10
3521	0.91	1.00	2000-05-02	2014-05-10
3522	0.91	1.00	2000-05-01	2014-05-10
3523	0.91	1.00	2000-04-28	2014-05-10
3524	0.91	1.00	2000-04-27	2014-05-10
3525	0.92	1.00	2000-04-26	2014-05-10
3526	0.93	1.00	2000-04-25	2014-05-10
3527	0.94	1.00	2000-04-24	2014-05-10
3528	0.94	1.00	2000-04-21	2014-05-10
3529	0.94	1.00	2000-04-20	2014-05-10
3530	0.94	1.00	2000-04-19	2014-05-10
3531	0.95	1.00	2000-04-18	2014-05-10
3532	0.95	1.00	2000-04-17	2014-05-10
3533	0.96	1.00	2000-04-14	2014-05-10
3534	0.95	1.00	2000-04-13	2014-05-10
3535	0.96	1.00	2000-04-12	2014-05-10
3536	0.96	1.00	2000-04-11	2014-05-10
3537	0.96	1.00	2000-04-10	2014-05-10
3538	0.96	1.00	2000-04-07	2014-05-10
3539	0.96	1.00	2000-04-06	2014-05-10
3540	0.96	1.00	2000-04-05	2014-05-10
3541	0.96	1.00	2000-04-04	2014-05-10
3542	0.96	1.00	2000-04-03	2014-05-10
3543	0.96	1.00	2000-03-31	2014-05-10
3544	0.96	1.00	2000-03-30	2014-05-10
3545	0.95	1.00	2000-03-29	2014-05-10
3546	0.96	1.00	2000-03-28	2014-05-10
3547	0.96	1.00	2000-03-27	2014-05-10
3548	0.97	1.00	2000-03-24	2014-05-10
3549	0.97	1.00	2000-03-23	2014-05-10
3550	0.96	1.00	2000-03-22	2014-05-10
3551	0.97	1.00	2000-03-21	2014-05-10
3552	0.97	1.00	2000-03-20	2014-05-10
3553	0.97	1.00	2000-03-17	2014-05-10
3554	0.97	1.00	2000-03-16	2014-05-10
3555	0.97	1.00	2000-03-15	2014-05-10
3556	0.96	1.00	2000-03-14	2014-05-10
3557	0.96	1.00	2000-03-13	2014-05-10
3558	0.97	1.00	2000-03-10	2014-05-10
3559	0.97	1.00	2000-03-09	2014-05-10
3560	0.96	1.00	2000-03-08	2014-05-10
3561	0.96	1.00	2000-03-07	2014-05-10
3562	0.96	1.00	2000-03-06	2014-05-10
3563	0.96	1.00	2000-03-03	2014-05-10
3564	0.96	1.00	2000-03-02	2014-05-10
3565	0.97	1.00	2000-03-01	2014-05-10
3566	0.96	1.00	2000-02-29	2014-05-10
3567	0.97	1.00	2000-02-28	2014-05-10
3568	0.98	1.00	2000-02-25	2014-05-10
3569	0.99	1.00	2000-02-24	2014-05-10
3570	1.00	1.00	2000-02-23	2014-05-10
3571	1.01	1.00	2000-02-22	2014-05-10
3572	0.98	1.00	2000-02-18	2014-05-10
3573	0.99	1.00	2000-02-17	2014-05-10
3574	0.98	1.00	2000-02-16	2014-05-10
3575	0.98	1.00	2000-02-15	2014-05-10
3576	0.98	1.00	2000-02-14	2014-05-10
3577	0.98	1.00	2000-02-11	2014-05-10
3578	0.99	1.00	2000-02-10	2014-05-10
3579	0.99	1.00	2000-02-09	2014-05-10
3580	0.99	1.00	2000-02-08	2014-05-10
3581	0.98	1.00	2000-02-07	2014-05-10
3582	0.98	1.00	2000-02-04	2014-05-10
3583	0.99	1.00	2000-02-03	2014-05-10
3584	0.98	1.00	2000-02-02	2014-05-10
3585	0.97	1.00	2000-02-01	2014-05-10
3586	0.98	1.00	2000-01-31	2014-05-10
3587	0.98	1.00	2000-01-28	2014-05-10
3588	0.99	1.00	2000-01-27	2014-05-10
3589	1.00	1.00	2000-01-26	2014-05-10
3590	1.00	1.00	2000-01-25	2014-05-10
3591	1.00	1.00	2000-01-24	2014-05-10
3592	1.01	1.00	2000-01-21	2014-05-10
3593	1.01	1.00	2000-01-20	2014-05-10
3594	1.01	1.00	2000-01-19	2014-05-10
3595	1.01	1.00	2000-01-18	2014-05-10
3596	1.01	1.00	2000-01-14	2014-05-10
3597	1.03	1.00	2000-01-13	2014-05-10
3598	1.03	1.00	2000-01-12	2014-05-10
3599	1.03	1.00	2000-01-11	2014-05-10
3600	1.03	1.00	2000-01-10	2014-05-10
3601	1.03	1.00	2000-01-07	2014-05-10
3602	1.03	1.00	2000-01-06	2014-05-10
3603	1.03	1.00	2000-01-05	2014-05-10
3604	1.03	1.00	2000-01-04	2014-05-10
3605	1.02	1.00	2000-01-03	2014-05-10
3606	1.01	1.00	1999-12-31	2014-05-10
3607	1.00	1.00	1999-12-30	2014-05-10
3608	1.00	1.00	1999-12-29	2014-05-10
3609	1.01	1.00	1999-12-28	2014-05-10
3610	1.01	1.00	1999-12-27	2014-05-10
3611	1.01	1.00	1999-12-24	2014-05-10
3612	1.02	1.00	1999-12-23	2014-05-10
3613	1.01	1.00	1999-12-22	2014-05-10
3614	1.01	1.00	1999-12-21	2014-05-10
3615	1.01	1.00	1999-12-20	2014-05-10
3616	1.01	1.00	1999-12-17	2014-05-10
3617	1.02	1.00	1999-12-16	2014-05-10
3618	1.01	1.00	1999-12-15	2014-05-10
3619	1.01	1.00	1999-12-14	2014-05-10
3620	1.01	1.00	1999-12-13	2014-05-10
3621	1.02	1.00	1999-12-10	2014-05-10
3622	1.02	1.00	1999-12-09	2014-05-10
3623	1.03	1.00	1999-12-08	2014-05-10
3624	1.02	1.00	1999-12-07	2014-05-10
3625	1.03	1.00	1999-12-06	2014-05-10
3626	1.00	1.00	1999-12-03	2014-05-10
3627	1.00	1.00	1999-12-02	2014-05-10
3628	1.01	1.00	1999-12-01	2014-05-10
3629	1.01	1.00	1999-11-30	2014-05-10
3630	1.01	1.00	1999-11-29	2014-05-10
3631	1.01	1.00	1999-11-26	2014-05-10
3632	1.02	1.00	1999-11-24	2014-05-10
3633	1.03	1.00	1999-11-23	2014-05-10
3634	1.03	1.00	1999-11-22	2014-05-10
3635	1.03	1.00	1999-11-19	2014-05-10
3636	1.03	1.00	1999-11-18	2014-05-10
3637	1.04	1.00	1999-11-17	2014-05-10
3638	1.03	1.00	1999-11-16	2014-05-10
3639	1.03	1.00	1999-11-15	2014-05-10
3640	1.03	1.00	1999-11-12	2014-05-10
3641	1.04	1.00	1999-11-10	2014-05-10
3642	1.04	1.00	1999-11-09	2014-05-10
3643	1.04	1.00	1999-11-08	2014-05-10
3644	1.04	1.00	1999-11-05	2014-05-10
3645	1.04	1.00	1999-11-04	2014-05-10
3646	1.05	1.00	1999-11-03	2014-05-10
3647	1.05	1.00	1999-11-02	2014-05-10
3648	1.05	1.00	1999-11-01	2014-05-10
3649	1.05	1.00	1999-10-29	2014-05-10
3650	1.05	1.00	1999-10-28	2014-05-10
3651	1.05	1.00	1999-10-27	2014-05-10
3652	1.06	1.00	1999-10-26	2014-05-10
3653	1.07	1.00	1999-10-25	2014-05-10
3654	1.07	1.00	1999-10-22	2014-05-10
3655	1.08	1.00	1999-10-21	2014-05-10
3656	1.08	1.00	1999-10-20	2014-05-10
3657	1.08	1.00	1999-10-19	2014-05-10
3658	1.09	1.00	1999-10-18	2014-05-10
3659	1.09	1.00	1999-10-15	2014-05-10
3660	1.08	1.00	1999-10-14	2014-05-10
3661	1.08	1.00	1999-10-13	2014-05-10
3662	1.07	1.00	1999-10-12	2014-05-10
3663	1.06	1.00	1999-10-08	2014-05-10
3664	1.07	1.00	1999-10-07	2014-05-10
3665	1.07	1.00	1999-10-06	2014-05-10
3666	1.07	1.00	1999-10-05	2014-05-10
3667	1.07	1.00	1999-10-04	2014-05-10
3668	1.07	1.00	1999-10-01	2014-05-10
3669	1.06	1.00	1999-09-30	2014-05-10
3670	1.06	1.00	1999-09-29	2014-05-10
3671	1.05	1.00	1999-09-28	2014-05-10
3672	1.04	1.00	1999-09-27	2014-05-10
3673	1.05	1.00	1999-09-24	2014-05-10
3674	1.04	1.00	1999-09-23	2014-05-10
3675	1.05	1.00	1999-09-22	2014-05-10
3676	1.05	1.00	1999-09-21	2014-05-10
3677	1.04	1.00	1999-09-20	2014-05-10
3678	1.04	1.00	1999-09-17	2014-05-10
3679	1.04	1.00	1999-09-16	2014-05-10
3680	1.04	1.00	1999-09-15	2014-05-10
3681	1.04	1.00	1999-09-14	2014-05-10
3682	1.04	1.00	1999-09-13	2014-05-10
3683	1.04	1.00	1999-09-10	2014-05-10
3684	1.05	1.00	1999-09-09	2014-05-10
3685	1.06	1.00	1999-09-08	2014-05-10
3686	1.06	1.00	1999-09-07	2014-05-10
3687	1.06	1.00	1999-09-03	2014-05-10
3688	1.07	1.00	1999-09-02	2014-05-10
3689	1.06	1.00	1999-09-01	2014-05-10
3690	1.06	1.00	1999-08-31	2014-05-10
3691	1.04	1.00	1999-08-30	2014-05-10
3692	1.05	1.00	1999-08-27	2014-05-10
3693	1.04	1.00	1999-08-26	2014-05-10
3694	1.05	1.00	1999-08-25	2014-05-10
3695	1.05	1.00	1999-08-24	2014-05-10
3696	1.06	1.00	1999-08-23	2014-05-10
3697	1.07	1.00	1999-08-20	2014-05-10
3698	1.06	1.00	1999-08-19	2014-05-10
3699	1.05	1.00	1999-08-18	2014-05-10
3700	1.05	1.00	1999-08-17	2014-05-10
3701	1.06	1.00	1999-08-16	2014-05-10
3702	1.06	1.00	1999-08-13	2014-05-10
3703	1.06	1.00	1999-08-12	2014-05-10
3704	1.07	1.00	1999-08-11	2014-05-10
3705	1.08	1.00	1999-08-10	2014-05-10
3706	1.07	1.00	1999-08-09	2014-05-10
3707	1.08	1.00	1999-08-06	2014-05-10
3708	1.08	1.00	1999-08-05	2014-05-10
3709	1.08	1.00	1999-08-04	2014-05-10
3710	1.07	1.00	1999-08-03	2014-05-10
3711	1.07	1.00	1999-08-02	2014-05-10
3712	1.07	1.00	1999-07-30	2014-05-10
3713	1.07	1.00	1999-07-29	2014-05-10
3714	1.06	1.00	1999-07-28	2014-05-10
3715	1.06	1.00	1999-07-27	2014-05-10
3716	1.07	1.00	1999-07-26	2014-05-10
3717	1.05	1.00	1999-07-23	2014-05-10
3718	1.05	1.00	1999-07-22	2014-05-10
3719	1.05	1.00	1999-07-21	2014-05-10
3720	1.04	1.00	1999-07-20	2014-05-10
3721	1.02	1.00	1999-07-19	2014-05-10
3722	1.02	1.00	1999-07-16	2014-05-10
3723	1.02	1.00	1999-07-15	2014-05-10
3724	1.02	1.00	1999-07-14	2014-05-10
3725	1.02	1.00	1999-07-13	2014-05-10
3726	1.01	1.00	1999-07-12	2014-05-10
3727	1.02	1.00	1999-07-09	2014-05-10
3728	1.02	1.00	1999-07-08	2014-05-10
3729	1.02	1.00	1999-07-07	2014-05-10
3730	1.02	1.00	1999-07-06	2014-05-10
3731	1.02	1.00	1999-07-02	2014-05-10
3732	1.02	1.00	1999-07-01	2014-05-10
3733	1.03	1.00	1999-06-30	2014-05-10
3734	1.03	1.00	1999-06-29	2014-05-10
3735	1.04	1.00	1999-06-28	2014-05-10
3736	1.04	1.00	1999-06-25	2014-05-10
3737	1.04	1.00	1999-06-24	2014-05-10
3738	1.03	1.00	1999-06-23	2014-05-10
3739	1.03	1.00	1999-06-22	2014-05-10
3740	1.03	1.00	1999-06-21	2014-05-10
3741	1.04	1.00	1999-06-18	2014-05-10
3742	1.03	1.00	1999-06-17	2014-05-10
3743	1.03	1.00	1999-06-16	2014-05-10
3744	1.04	1.00	1999-06-15	2014-05-10
3745	1.04	1.00	1999-06-14	2014-05-10
3746	1.05	1.00	1999-06-11	2014-05-10
3747	1.05	1.00	1999-06-10	2014-05-10
3748	1.04	1.00	1999-06-09	2014-05-10
3749	1.04	1.00	1999-06-08	2014-05-10
3750	1.03	1.00	1999-06-07	2014-05-10
3751	1.03	1.00	1999-06-04	2014-05-10
3752	1.04	1.00	1999-06-03	2014-05-10
3753	1.04	1.00	1999-06-02	2014-05-10
3754	1.04	1.00	1999-06-01	2014-05-10
3755	1.04	1.00	1999-05-28	2014-05-10
3756	1.04	1.00	1999-05-27	2014-05-10
3757	1.05	1.00	1999-05-26	2014-05-10
3758	1.06	1.00	1999-05-25	2014-05-10
3759	1.06	1.00	1999-05-24	2014-05-10
3760	1.06	1.00	1999-05-21	2014-05-10
3761	1.06	1.00	1999-05-20	2014-05-10
3762	1.06	1.00	1999-05-19	2014-05-10
3763	1.07	1.00	1999-05-18	2014-05-10
3764	1.07	1.00	1999-05-17	2014-05-10
3765	1.06	1.00	1999-05-14	2014-05-10
3766	1.06	1.00	1999-05-13	2014-05-10
3767	1.07	1.00	1999-05-12	2014-05-10
3768	1.07	1.00	1999-05-11	2014-05-10
3769	1.08	1.00	1999-05-10	2014-05-10
3770	1.08	1.00	1999-05-07	2014-05-10
3771	1.08	1.00	1999-05-06	2014-05-10
3772	1.07	1.00	1999-05-05	2014-05-10
3773	1.06	1.00	1999-05-04	2014-05-10
3774	1.06	1.00	1999-05-03	2014-05-10
3775	1.06	1.00	1999-04-30	2014-05-10
3776	1.06	1.00	1999-04-29	2014-05-10
3777	1.06	1.00	1999-04-28	2014-05-10
3778	1.06	1.00	1999-04-27	2014-05-10
3779	1.06	1.00	1999-04-26	2014-05-10
3780	1.06	1.00	1999-04-23	2014-05-10
3781	1.06	1.00	1999-04-22	2014-05-10
3782	1.06	1.00	1999-04-21	2014-05-10
3783	1.06	1.00	1999-04-20	2014-05-10
3784	1.06	1.00	1999-04-19	2014-05-10
3785	1.07	1.00	1999-04-16	2014-05-10
3786	1.07	1.00	1999-04-15	2014-05-10
3787	1.08	1.00	1999-04-14	2014-05-10
3788	1.08	1.00	1999-04-13	2014-05-10
3789	1.08	1.00	1999-04-12	2014-05-10
3790	1.08	1.00	1999-04-09	2014-05-10
3791	1.08	1.00	1999-04-08	2014-05-10
3792	1.08	1.00	1999-04-07	2014-05-10
3793	1.08	1.00	1999-04-06	2014-05-10
3794	1.07	1.00	1999-04-05	2014-05-10
3795	1.08	1.00	1999-04-02	2014-05-10
3796	1.08	1.00	1999-04-01	2014-05-10
3797	1.08	1.00	1999-03-31	2014-05-10
3798	1.07	1.00	1999-03-30	2014-05-10
3799	1.07	1.00	1999-03-29	2014-05-10
3800	1.07	1.00	1999-03-26	2014-05-10
3801	1.09	1.00	1999-03-25	2014-05-10
3802	1.09	1.00	1999-03-24	2014-05-10
3803	1.09	1.00	1999-03-23	2014-05-10
3804	1.09	1.00	1999-03-22	2014-05-10
3805	1.09	1.00	1999-03-19	2014-05-10
3806	1.10	1.00	1999-03-18	2014-05-10
3807	1.10	1.00	1999-03-17	2014-05-10
3808	1.09	1.00	1999-03-16	2014-05-10
3809	1.09	1.00	1999-03-15	2014-05-10
3810	1.09	1.00	1999-03-12	2014-05-10
3811	1.09	1.00	1999-03-11	2014-05-10
3812	1.10	1.00	1999-03-10	2014-05-10
3813	1.09	1.00	1999-03-09	2014-05-10
3814	1.09	1.00	1999-03-08	2014-05-10
3815	1.08	1.00	1999-03-05	2014-05-10
3816	1.08	1.00	1999-03-04	2014-05-10
3817	1.09	1.00	1999-03-03	2014-05-10
3818	1.09	1.00	1999-03-02	2014-05-10
3819	1.09	1.00	1999-03-01	2014-05-10
3820	1.10	1.00	1999-02-26	2014-05-10
3821	1.11	1.00	1999-02-25	2014-05-10
3822	1.10	1.00	1999-02-24	2014-05-10
3823	1.10	1.00	1999-02-23	2014-05-10
3824	1.10	1.00	1999-02-22	2014-05-10
3825	1.11	1.00	1999-02-19	2014-05-10
3826	1.12	1.00	1999-02-18	2014-05-10
3827	1.12	1.00	1999-02-17	2014-05-10
3828	1.12	1.00	1999-02-16	2014-05-10
3829	1.13	1.00	1999-02-12	2014-05-10
3830	1.13	1.00	1999-02-11	2014-05-10
3831	1.13	1.00	1999-02-10	2014-05-10
3832	1.13	1.00	1999-02-09	2014-05-10
3833	1.13	1.00	1999-02-08	2014-05-10
3834	1.13	1.00	1999-02-05	2014-05-10
3835	1.13	1.00	1999-02-04	2014-05-10
3836	1.13	1.00	1999-02-03	2014-05-10
3837	1.13	1.00	1999-02-02	2014-05-10
3838	1.13	1.00	1999-02-01	2014-05-10
3839	1.14	1.00	1999-01-29	2014-05-10
3840	1.14	1.00	1999-01-28	2014-05-10
3841	1.15	1.00	1999-01-27	2014-05-10
3842	1.16	1.00	1999-01-26	2014-05-10
3843	1.16	1.00	1999-01-25	2014-05-10
3844	1.16	1.00	1999-01-22	2014-05-10
3845	1.16	1.00	1999-01-21	2014-05-10
3846	1.16	1.00	1999-01-20	2014-05-10
3847	1.16	1.00	1999-01-19	2014-05-10
3848	1.16	1.00	1999-01-15	2014-05-10
3849	1.17	1.00	1999-01-14	2014-05-10
3850	1.17	1.00	1999-01-13	2014-05-10
3851	1.15	1.00	1999-01-12	2014-05-10
3852	1.15	1.00	1999-01-11	2014-05-10
3853	1.16	1.00	1999-01-08	2014-05-10
3854	1.17	1.00	1999-01-07	2014-05-10
3855	1.16	1.00	1999-01-06	2014-05-10
3856	1.18	1.00	1999-01-05	2014-05-10
3857	1.18	1.00	1999-01-04	2014-05-10
\.


--
-- Name: exchange_exchange_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neo
--

SELECT pg_catalog.setval('exchange_exchange_id_seq', 3857, true);


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: neo
--

COPY socialaccount_socialaccount (id, user_id, last_login, date_joined, provider, uid, extra_data) FROM stdin;
\.


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neo
--

SELECT pg_catalog.setval('socialaccount_socialaccount_id_seq', 1, false);


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: neo
--

COPY socialaccount_socialapp (id, provider, name, key, secret, client_id) FROM stdin;
\.


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neo
--

SELECT pg_catalog.setval('socialaccount_socialapp_id_seq', 1, false);


--
-- Data for Name: socialaccount_socialapp_sites; Type: TABLE DATA; Schema: public; Owner: neo
--

COPY socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
\.


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neo
--

SELECT pg_catalog.setval('socialaccount_socialapp_sites_id_seq', 1, false);


--
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: neo
--

COPY socialaccount_socialtoken (id, app_id, account_id, token, token_secret, expires_at) FROM stdin;
\.


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neo
--

SELECT pg_catalog.setval('socialaccount_socialtoken_id_seq', 1, false);


--
-- Data for Name: south_migrationhistory; Type: TABLE DATA; Schema: public; Owner: neo
--

COPY south_migrationhistory (id, app_name, migration, applied) FROM stdin;
1	django	0001_initial	2014-05-10 23:23:11.487454+05:30
2	djcelery	0001_initial	2014-05-10 23:23:11.689439+05:30
3	djcelery	0002_v25_changes	2014-05-10 23:23:11.750598+05:30
4	djcelery	0003_v26_changes	2014-05-10 23:23:11.783419+05:30
5	djcelery	0004_v30_changes	2014-05-10 23:23:11.812529+05:30
6	users	0001_initial	2014-05-10 23:23:11.966848+05:30
7	users	0002_set_site_domain_and_name	2014-05-10 23:23:11.996454+05:30
8	exchange	0001_initial	2014-05-10 23:23:12.06353+05:30
9	socialaccount	0001_initial	2014-05-10 23:23:12.146101+05:30
10	socialaccount	0002_genericmodels	2014-05-10 23:23:12.284825+05:30
11	socialaccount	0003_auto__add_unique_socialaccount_uid_provider	2014-05-10 23:23:12.31224+05:30
12	socialaccount	0004_add_sites	2014-05-10 23:23:12.349539+05:30
13	socialaccount	0005_set_sites	2014-05-10 23:23:12.373665+05:30
14	socialaccount	0006_auto__del_field_socialapp_site	2014-05-10 23:23:12.392152+05:30
15	socialaccount	0007_auto__add_field_socialapp_client_id	2014-05-10 23:23:12.435733+05:30
16	socialaccount	0008_client_id	2014-05-10 23:23:12.460988+05:30
17	socialaccount	0009_auto__add_field_socialtoken_expires_at	2014-05-10 23:23:12.482541+05:30
18	socialaccount	0010_auto__chg_field_socialtoken_token	2014-05-10 23:23:12.52157+05:30
19	socialaccount	0011_auto__chg_field_socialtoken_token	2014-05-10 23:23:12.557871+05:30
20	socialaccount	0012_auto__chg_field_socialtoken_token_secret	2014-05-10 23:23:12.600114+05:30
\.


--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neo
--

SELECT pg_catalog.setval('south_migrationhistory_id_seq', 20, true);


--
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: neo
--

COPY users_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$12000$LrTXHbd6PmFp$HZxzBjMhA5CStWmvID0xrxsnB6QghkEHB5nr90lf5mA=	2014-05-11 01:08:06.19833+05:30	t	neo			neokya@gmail.com	t	t	2014-05-11 00:47:51.368097+05:30
2	pbkdf2_sha256$12000$k4u2YFJ847iv$oAf2uoBnCZBAzA3fMI9o9AaF+Acy1OqsuagibICA6Ig=	2014-05-11 02:28:22.163741+05:30	f	uhura			nar.kumar@changer.nl	f	t	2014-05-11 02:27:47.223894+05:30
\.


--
-- Data for Name: users_user_groups; Type: TABLE DATA; Schema: public; Owner: neo
--

COPY users_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: users_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neo
--

SELECT pg_catalog.setval('users_user_groups_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neo
--

SELECT pg_catalog.setval('users_user_id_seq', 2, true);


--
-- Data for Name: users_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: neo
--

COPY users_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neo
--

SELECT pg_catalog.setval('users_user_user_permissions_id_seq', 1, false);


--
-- Name: account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: avatar_avatar_pkey; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY avatar_avatar
    ADD CONSTRAINT avatar_avatar_pkey PRIMARY KEY (id);


--
-- Name: celery_taskmeta_pkey; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY celery_taskmeta
    ADD CONSTRAINT celery_taskmeta_pkey PRIMARY KEY (id);


--
-- Name: celery_taskmeta_task_id_key; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY celery_taskmeta
    ADD CONSTRAINT celery_taskmeta_task_id_key UNIQUE (task_id);


--
-- Name: celery_tasksetmeta_pkey; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY celery_tasksetmeta
    ADD CONSTRAINT celery_tasksetmeta_pkey PRIMARY KEY (id);


--
-- Name: celery_tasksetmeta_taskset_id_key; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY celery_tasksetmeta
    ADD CONSTRAINT celery_tasksetmeta_taskset_id_key UNIQUE (taskset_id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: djcelery_crontabschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY djcelery_crontabschedule
    ADD CONSTRAINT djcelery_crontabschedule_pkey PRIMARY KEY (id);


--
-- Name: djcelery_intervalschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY djcelery_intervalschedule
    ADD CONSTRAINT djcelery_intervalschedule_pkey PRIMARY KEY (id);


--
-- Name: djcelery_periodictask_name_key; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY djcelery_periodictask
    ADD CONSTRAINT djcelery_periodictask_name_key UNIQUE (name);


--
-- Name: djcelery_periodictask_pkey; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY djcelery_periodictask
    ADD CONSTRAINT djcelery_periodictask_pkey PRIMARY KEY (id);


--
-- Name: djcelery_periodictasks_pkey; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY djcelery_periodictasks
    ADD CONSTRAINT djcelery_periodictasks_pkey PRIMARY KEY (ident);


--
-- Name: djcelery_taskstate_pkey; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY djcelery_taskstate
    ADD CONSTRAINT djcelery_taskstate_pkey PRIMARY KEY (id);


--
-- Name: djcelery_taskstate_task_id_key; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY djcelery_taskstate
    ADD CONSTRAINT djcelery_taskstate_task_id_key UNIQUE (task_id);


--
-- Name: djcelery_workerstate_hostname_key; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY djcelery_workerstate
    ADD CONSTRAINT djcelery_workerstate_hostname_key UNIQUE (hostname);


--
-- Name: djcelery_workerstate_pkey; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY djcelery_workerstate
    ADD CONSTRAINT djcelery_workerstate_pkey PRIMARY KEY (id);


--
-- Name: djkombu_message_pkey; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY djkombu_message
    ADD CONSTRAINT djkombu_message_pkey PRIMARY KEY (id);


--
-- Name: djkombu_queue_name_key; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY djkombu_queue
    ADD CONSTRAINT djkombu_queue_name_key UNIQUE (name);


--
-- Name: djkombu_queue_pkey; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY djkombu_queue
    ADD CONSTRAINT djkombu_queue_pkey PRIMARY KEY (id);


--
-- Name: exchange_exchange_pkey; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY exchange_exchange
    ADD CONSTRAINT exchange_exchange_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount_uid_5ac8b4eb459472be_uniq; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_uid_5ac8b4eb459472be_uniq UNIQUE (uid, provider);


--
-- Name: socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites_socialapp_id_711547c3e6a002b_uniq; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_socialapp_id_711547c3e6a002b_uniq UNIQUE (socialapp_id, site_id);


--
-- Name: socialaccount_socialtoken_app_id_697928748c2e1968_uniq; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_697928748c2e1968_uniq UNIQUE (app_id, account_id);


--
-- Name: socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- Name: south_migrationhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY south_migrationhistory
    ADD CONSTRAINT south_migrationhistory_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups_user_id_61c5ad738dcdc437_uniq; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_61c5ad738dcdc437_uniq UNIQUE (user_id, group_id);


--
-- Name: users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions_user_id_5986a67e217af32e_uniq; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_5986a67e217af32e_uniq UNIQUE (user_id, permission_id);


--
-- Name: users_user_username_key; Type: CONSTRAINT; Schema: public; Owner: neo; Tablespace: 
--

ALTER TABLE ONLY users_user
    ADD CONSTRAINT users_user_username_key UNIQUE (username);


--
-- Name: account_emailaddress_email_like; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX account_emailaddress_email_like ON account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX account_emailaddress_user_id ON account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX account_emailconfirmation_email_address_id ON account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_like; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX account_emailconfirmation_key_like ON account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: auth_group_name_like; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX auth_group_name_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: avatar_avatar_user_id; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX avatar_avatar_user_id ON avatar_avatar USING btree (user_id);


--
-- Name: celery_taskmeta_hidden; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX celery_taskmeta_hidden ON celery_taskmeta USING btree (hidden);


--
-- Name: celery_taskmeta_task_id_like; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX celery_taskmeta_task_id_like ON celery_taskmeta USING btree (task_id varchar_pattern_ops);


--
-- Name: celery_tasksetmeta_hidden; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX celery_tasksetmeta_hidden ON celery_tasksetmeta USING btree (hidden);


--
-- Name: celery_tasksetmeta_taskset_id_like; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX celery_tasksetmeta_taskset_id_like ON celery_tasksetmeta USING btree (taskset_id varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX django_session_expire_date ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_like; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX django_session_session_key_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: djcelery_periodictask_crontab_id; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX djcelery_periodictask_crontab_id ON djcelery_periodictask USING btree (crontab_id);


--
-- Name: djcelery_periodictask_interval_id; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX djcelery_periodictask_interval_id ON djcelery_periodictask USING btree (interval_id);


--
-- Name: djcelery_periodictask_name_like; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX djcelery_periodictask_name_like ON djcelery_periodictask USING btree (name varchar_pattern_ops);


--
-- Name: djcelery_taskstate_hidden; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX djcelery_taskstate_hidden ON djcelery_taskstate USING btree (hidden);


--
-- Name: djcelery_taskstate_name; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX djcelery_taskstate_name ON djcelery_taskstate USING btree (name);


--
-- Name: djcelery_taskstate_name_like; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX djcelery_taskstate_name_like ON djcelery_taskstate USING btree (name varchar_pattern_ops);


--
-- Name: djcelery_taskstate_state; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX djcelery_taskstate_state ON djcelery_taskstate USING btree (state);


--
-- Name: djcelery_taskstate_state_like; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX djcelery_taskstate_state_like ON djcelery_taskstate USING btree (state varchar_pattern_ops);


--
-- Name: djcelery_taskstate_task_id_like; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX djcelery_taskstate_task_id_like ON djcelery_taskstate USING btree (task_id varchar_pattern_ops);


--
-- Name: djcelery_taskstate_tstamp; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX djcelery_taskstate_tstamp ON djcelery_taskstate USING btree (tstamp);


--
-- Name: djcelery_taskstate_worker_id; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX djcelery_taskstate_worker_id ON djcelery_taskstate USING btree (worker_id);


--
-- Name: djcelery_workerstate_hostname_like; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX djcelery_workerstate_hostname_like ON djcelery_workerstate USING btree (hostname varchar_pattern_ops);


--
-- Name: djcelery_workerstate_last_heartbeat; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX djcelery_workerstate_last_heartbeat ON djcelery_workerstate USING btree (last_heartbeat);


--
-- Name: djkombu_message_queue_id; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX djkombu_message_queue_id ON djkombu_message USING btree (queue_id);


--
-- Name: djkombu_message_sent_at; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX djkombu_message_sent_at ON djkombu_message USING btree (sent_at);


--
-- Name: djkombu_message_visible; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX djkombu_message_visible ON djkombu_message USING btree (visible);


--
-- Name: djkombu_queue_name_like; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX djkombu_queue_name_like ON djkombu_queue USING btree (name varchar_pattern_ops);


--
-- Name: exchange_exchange_exchange_date; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX exchange_exchange_exchange_date ON exchange_exchange USING btree (exchange_date);


--
-- Name: socialaccount_socialaccount_user_id; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX socialaccount_socialaccount_user_id ON socialaccount_socialaccount USING btree (user_id);


--
-- Name: socialaccount_socialapp_sites_site_id; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX socialaccount_socialapp_sites_site_id ON socialaccount_socialapp_sites USING btree (site_id);


--
-- Name: socialaccount_socialapp_sites_socialapp_id; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX socialaccount_socialapp_sites_socialapp_id ON socialaccount_socialapp_sites USING btree (socialapp_id);


--
-- Name: socialaccount_socialtoken_account_id; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX socialaccount_socialtoken_account_id ON socialaccount_socialtoken USING btree (account_id);


--
-- Name: socialaccount_socialtoken_app_id; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX socialaccount_socialtoken_app_id ON socialaccount_socialtoken USING btree (app_id);


--
-- Name: users_user_groups_group_id; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX users_user_groups_group_id ON users_user_groups USING btree (group_id);


--
-- Name: users_user_groups_user_id; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX users_user_groups_user_id ON users_user_groups USING btree (user_id);


--
-- Name: users_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX users_user_user_permissions_permission_id ON users_user_user_permissions USING btree (permission_id);


--
-- Name: users_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX users_user_user_permissions_user_id ON users_user_user_permissions USING btree (user_id);


--
-- Name: users_user_username_like; Type: INDEX; Schema: public; Owner: neo; Tablespace: 
--

CREATE INDEX users_user_username_like ON users_user USING btree (username varchar_pattern_ops);


--
-- Name: account_emailconfirmation_email_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neo
--

ALTER TABLE ONLY account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_email_address_id_fkey FOREIGN KEY (email_address_id) REFERENCES account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_id_refs_id_1337a128; Type: FK CONSTRAINT; Schema: public; Owner: neo
--

ALTER TABLE ONLY socialaccount_socialtoken
    ADD CONSTRAINT account_id_refs_id_1337a128 FOREIGN KEY (account_id) REFERENCES socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_id_refs_id_edac8a54; Type: FK CONSTRAINT; Schema: public; Owner: neo
--

ALTER TABLE ONLY socialaccount_socialtoken
    ADD CONSTRAINT app_id_refs_id_edac8a54 FOREIGN KEY (app_id) REFERENCES socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neo
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_d043b34a; Type: FK CONSTRAINT; Schema: public; Owner: neo
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_d043b34a FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: crontab_id_refs_id_286da0d1; Type: FK CONSTRAINT; Schema: public; Owner: neo
--

ALTER TABLE ONLY djcelery_periodictask
    ADD CONSTRAINT crontab_id_refs_id_286da0d1 FOREIGN KEY (crontab_id) REFERENCES djcelery_crontabschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neo
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_52d270a4; Type: FK CONSTRAINT; Schema: public; Owner: neo
--

ALTER TABLE ONLY users_user_groups
    ADD CONSTRAINT group_id_refs_id_52d270a4 FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_f4b32aac; Type: FK CONSTRAINT; Schema: public; Owner: neo
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_f4b32aac FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: interval_id_refs_id_1829f358; Type: FK CONSTRAINT; Schema: public; Owner: neo
--

ALTER TABLE ONLY djcelery_periodictask
    ADD CONSTRAINT interval_id_refs_id_1829f358 FOREIGN KEY (interval_id) REFERENCES djcelery_intervalschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: permission_id_refs_id_01625f6a; Type: FK CONSTRAINT; Schema: public; Owner: neo
--

ALTER TABLE ONLY users_user_user_permissions
    ADD CONSTRAINT permission_id_refs_id_01625f6a FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: queue_id_refs_id_88980102; Type: FK CONSTRAINT; Schema: public; Owner: neo
--

ALTER TABLE ONLY djkombu_message
    ADD CONSTRAINT queue_id_refs_id_88980102 FOREIGN KEY (queue_id) REFERENCES djkombu_queue(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_id_refs_id_05d6147e; Type: FK CONSTRAINT; Schema: public; Owner: neo
--

ALTER TABLE ONLY socialaccount_socialapp_sites
    ADD CONSTRAINT site_id_refs_id_05d6147e FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialapp_id_refs_id_e7a43014; Type: FK CONSTRAINT; Schema: public; Owner: neo
--

ALTER TABLE ONLY socialaccount_socialapp_sites
    ADD CONSTRAINT socialapp_id_refs_id_e7a43014 FOREIGN KEY (socialapp_id) REFERENCES socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_6dbe081e; Type: FK CONSTRAINT; Schema: public; Owner: neo
--

ALTER TABLE ONLY socialaccount_socialaccount
    ADD CONSTRAINT user_id_refs_id_6dbe081e FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_7d077e6f; Type: FK CONSTRAINT; Schema: public; Owner: neo
--

ALTER TABLE ONLY users_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_7d077e6f FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_cbec8e88; Type: FK CONSTRAINT; Schema: public; Owner: neo
--

ALTER TABLE ONLY users_user_groups
    ADD CONSTRAINT user_id_refs_id_cbec8e88 FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: worker_id_refs_id_6fd8ce95; Type: FK CONSTRAINT; Schema: public; Owner: neo
--

ALTER TABLE ONLY djcelery_taskstate
    ADD CONSTRAINT worker_id_refs_id_6fd8ce95 FOREIGN KEY (worker_id) REFERENCES djcelery_workerstate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: neo
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM neo;
GRANT ALL ON SCHEMA public TO neo;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

