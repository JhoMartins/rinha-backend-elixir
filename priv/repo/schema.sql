--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

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

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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

--
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4 (Debian 15.4-1.pgdg120+1)
-- Dumped by pg_dump version 15.4 (Debian 15.4-1.pgdg120+1)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- Database "rinha_backend_elixir_prod" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4 (Debian 15.4-1.pgdg120+1)
-- Dumped by pg_dump version 15.4 (Debian 15.4-1.pgdg120+1)

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

--
-- Name: rinha_backend_elixir_prod; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE rinha_backend_elixir_prod WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE rinha_backend_elixir_prod OWNER TO postgres;

\connect rinha_backend_elixir_prod

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
-- Name: pessoas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pessoas (
    id uuid NOT NULL,
    nome character varying(100),
    apelido character varying(32),
    nascimento character varying(10),
    stack character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.pessoas OWNER TO postgres;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Data for Name: pessoas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pessoas (id, nome, apelido, nascimento, stack, inserted_at, updated_at) FROM stdin;
b778803a-c554-4154-836c-a628ae0e96f6	José Roberto	josé	2000-10-01	\N	2023-09-03 18:56:04	2023-09-03 18:56:04
39c97655-fce0-43ef-89ab-b32be2689cdc	José Roberto	josés	2000-10-01	\N	2023-09-04 02:35:18	2023-09-04 02:35:18
50b00246-ebf5-4c07-964a-f7f08aa8af4a	José Roberto	joséss	2000-10-01	\N	2023-09-04 02:35:37	2023-09-04 02:35:37
ef15bfda-d3e2-407d-b90b-4725219be7de	José Roberto	josésse	2000-10-01	\N	2023-09-04 02:35:50	2023-09-04 02:35:50
77aa753a-8543-4c6d-84dd-b123ca528e65	José Roberto	josaésse	2000-10-01	\N	2023-09-04 02:52:36	2023-09-04 02:52:36
40c07cb9-4689-40c4-b787-63f5a84038d3	José Roberto	josaeésse	2000-10-01	\N	2023-09-04 02:53:10	2023-09-04 02:53:10
e77e76aa-5f13-44b0-8877-7438f56fd888	José Roberto	josaeéssee	2000-10-01	\N	2023-09-04 02:54:10	2023-09-04 02:54:10
ef517201-85fa-47b7-bade-0028286e2b1e	José Roberto	josaeésasee	2000-10-01	\N	2023-09-04 02:55:00	2023-09-04 02:55:00
f2c92737-700f-4534-8cf8-17636bc9851b	José Roberto	josaeésadsee	2000-10-01	\N	2023-09-04 02:55:47	2023-09-04 02:55:47
39d12c4c-7388-496e-90de-f35d13923566	José Roberto	josaeeésaeedesee	2000-10-01	Elixir Ruby	2023-09-04 03:12:20	2023-09-04 03:12:20
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version, inserted_at) FROM stdin;
20230902190254	2023-09-03 18:55:09
\.


--
-- Name: pessoas pessoas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoas
    ADD CONSTRAINT pessoas_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: pessoas_apelido_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX pessoas_apelido_index ON public.pessoas USING btree (apelido);


--
-- PostgreSQL database dump complete
--

--
-- Database "rinha_backend_elixir_test" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4 (Debian 15.4-1.pgdg120+1)
-- Dumped by pg_dump version 15.4 (Debian 15.4-1.pgdg120+1)

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

--
-- Name: rinha_backend_elixir_test; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE rinha_backend_elixir_test WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE rinha_backend_elixir_test OWNER TO postgres;

\connect rinha_backend_elixir_test

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
-- Name: pessoas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pessoas (
    id uuid NOT NULL,
    nome character varying(100),
    apelido character varying(32),
    nascimento character varying(10),
    stack character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.pessoas OWNER TO postgres;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Data for Name: pessoas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pessoas (id, nome, apelido, nascimento, stack, inserted_at, updated_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version, inserted_at) FROM stdin;
20230902190254	2023-09-03 18:06:14
\.


--
-- Name: pessoas pessoas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoas
    ADD CONSTRAINT pessoas_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

