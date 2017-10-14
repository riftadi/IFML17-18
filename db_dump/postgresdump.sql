--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 10.0

-- Started on 2017-10-14 17:21:11 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12655)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2517 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 188 (class 1259 OID 17618)
-- Name: collections; Type: TABLE; Schema: public; Owner: riftadi
--

CREATE TABLE collections (
    oid_collection integer NOT NULL,
    title character varying(255),
    description character varying(255),
    n_publications character varying(255),
    "timestamp" timestamp without time zone,
    user_oid_user integer
);


ALTER TABLE collections OWNER TO riftadi;

--
-- TOC entry 197 (class 1259 OID 17764)
-- Name: collections_keywords; Type: TABLE; Schema: public; Owner: riftadi
--

CREATE TABLE collections_keywords (
    collections_oid_collection integer NOT NULL,
    keywords_oid_keyword integer NOT NULL
);


ALTER TABLE collections_keywords OWNER TO riftadi;

--
-- TOC entry 196 (class 1259 OID 17749)
-- Name: collections_publications; Type: TABLE; Schema: public; Owner: riftadi
--

CREATE TABLE collections_publications (
    collections_oid_collection integer NOT NULL,
    publications_oid_publication integer NOT NULL
);


ALTER TABLE collections_publications OWNER TO riftadi;

--
-- TOC entry 190 (class 1259 OID 17631)
-- Name: comments; Type: TABLE; Schema: public; Owner: riftadi
--

CREATE TABLE comments (
    oid_comment integer NOT NULL,
    title character varying(255),
    content text,
    "timestamp" timestamp without time zone
);


ALTER TABLE comments OWNER TO riftadi;

--
-- TOC entry 185 (class 1259 OID 17589)
-- Name: group; Type: TABLE; Schema: public; Owner: riftadi
--

CREATE TABLE "group" (
    oid integer NOT NULL,
    groupname character varying(255),
    module_oid integer
);


ALTER TABLE "group" OWNER TO riftadi;

--
-- TOC entry 191 (class 1259 OID 17644)
-- Name: group_module; Type: TABLE; Schema: public; Owner: riftadi
--

CREATE TABLE group_module (
    group_oid integer NOT NULL,
    module_oid integer NOT NULL
);


ALTER TABLE group_module OWNER TO riftadi;

--
-- TOC entry 189 (class 1259 OID 17626)
-- Name: keywords; Type: TABLE; Schema: public; Owner: riftadi
--

CREATE TABLE keywords (
    oid_keyword integer NOT NULL,
    name character varying(255),
    "timestamp" timestamp without time zone
);


ALTER TABLE keywords OWNER TO riftadi;

--
-- TOC entry 194 (class 1259 OID 17699)
-- Name: list_of_authors; Type: TABLE; Schema: public; Owner: riftadi
--

CREATE TABLE list_of_authors (
    publications_oid_publication integer NOT NULL,
    user_oid_user integer NOT NULL
);


ALTER TABLE list_of_authors OWNER TO riftadi;

--
-- TOC entry 186 (class 1259 OID 17594)
-- Name: module; Type: TABLE; Schema: public; Owner: riftadi
--

CREATE TABLE module (
    oid integer NOT NULL,
    moduleid character varying(255),
    modulename character varying(255)
);


ALTER TABLE module OWNER TO riftadi;

--
-- TOC entry 199 (class 1259 OID 17805)
-- Name: notifications; Type: TABLE; Schema: public; Owner: riftadi
--

CREATE TABLE notifications (
    notification_oid integer NOT NULL,
    "timestamp" timestamp without time zone,
    isprocessed boolean,
    user_oid_user integer,
    publications_oid_publication integer
);


ALTER TABLE notifications OWNER TO riftadi;

--
-- TOC entry 198 (class 1259 OID 17787)
-- Name: publications; Type: TABLE; Schema: public; Owner: riftadi
--

CREATE TABLE publications (
    oid_publication integer NOT NULL,
    title character varying(255),
    venue character varying(255),
    year text,
    pdf_file character varying(255),
    "timestamp" timestamp without time zone,
    comments_oid_comment integer,
    user_oid_user integer,
    isclaimed boolean,
    abstract text
);


ALTER TABLE publications OWNER TO riftadi;

--
-- TOC entry 193 (class 1259 OID 17684)
-- Name: publications_keywords; Type: TABLE; Schema: public; Owner: riftadi
--

CREATE TABLE publications_keywords (
    publications_oid_publication integer NOT NULL,
    keywords_oid_keyword integer NOT NULL
);


ALTER TABLE publications_keywords OWNER TO riftadi;

--
-- TOC entry 187 (class 1259 OID 17602)
-- Name: user; Type: TABLE; Schema: public; Owner: riftadi
--

CREATE TABLE "user" (
    oid_user integer NOT NULL,
    username character varying(255),
    password character varying(255),
    email character varying(255),
    name character varying(255),
    affiliation character varying(255),
    "timestamp" timestamp without time zone,
    reputation double precision,
    group_oid integer,
    comments_oid_comment integer,
    collections_oid_collection integer
);


ALTER TABLE "user" OWNER TO riftadi;

--
-- TOC entry 192 (class 1259 OID 17664)
-- Name: user_group; Type: TABLE; Schema: public; Owner: riftadi
--

CREATE TABLE user_group (
    user_oid integer NOT NULL,
    group_oid integer NOT NULL
);


ALTER TABLE user_group OWNER TO riftadi;

--
-- TOC entry 195 (class 1259 OID 17734)
-- Name: user_keywords; Type: TABLE; Schema: public; Owner: riftadi
--

CREATE TABLE user_keywords (
    user_oid_user integer NOT NULL,
    keywords_oid_keyword integer NOT NULL
);


ALTER TABLE user_keywords OWNER TO riftadi;

--
-- TOC entry 2499 (class 0 OID 17618)
-- Dependencies: 188
-- Data for Name: collections; Type: TABLE DATA; Schema: public; Owner: riftadi
--

COPY collections (oid_collection, title, description, n_publications, "timestamp", user_oid_user) FROM stdin;
\.


--
-- TOC entry 2508 (class 0 OID 17764)
-- Dependencies: 197
-- Data for Name: collections_keywords; Type: TABLE DATA; Schema: public; Owner: riftadi
--

COPY collections_keywords (collections_oid_collection, keywords_oid_keyword) FROM stdin;
\.


--
-- TOC entry 2507 (class 0 OID 17749)
-- Dependencies: 196
-- Data for Name: collections_publications; Type: TABLE DATA; Schema: public; Owner: riftadi
--

COPY collections_publications (collections_oid_collection, publications_oid_publication) FROM stdin;
\.


--
-- TOC entry 2501 (class 0 OID 17631)
-- Dependencies: 190
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: riftadi
--

COPY comments (oid_comment, title, content, "timestamp") FROM stdin;
\.


--
-- TOC entry 2496 (class 0 OID 17589)
-- Dependencies: 185
-- Data for Name: group; Type: TABLE DATA; Schema: public; Owner: riftadi
--

COPY "group" (oid, groupname, module_oid) FROM stdin;
2	researcher	2
1	administrator	1
\.


--
-- TOC entry 2502 (class 0 OID 17644)
-- Dependencies: 191
-- Data for Name: group_module; Type: TABLE DATA; Schema: public; Owner: riftadi
--

COPY group_module (group_oid, module_oid) FROM stdin;
2	2
1	1
\.


--
-- TOC entry 2500 (class 0 OID 17626)
-- Dependencies: 189
-- Data for Name: keywords; Type: TABLE DATA; Schema: public; Owner: riftadi
--

COPY keywords (oid_keyword, name, "timestamp") FROM stdin;
\.


--
-- TOC entry 2505 (class 0 OID 17699)
-- Dependencies: 194
-- Data for Name: list_of_authors; Type: TABLE DATA; Schema: public; Owner: riftadi
--

COPY list_of_authors (publications_oid_publication, user_oid_user) FROM stdin;
\.


--
-- TOC entry 2497 (class 0 OID 17594)
-- Dependencies: 186
-- Data for Name: module; Type: TABLE DATA; Schema: public; Owner: riftadi
--

COPY module (oid, moduleid, modulename) FROM stdin;
1	sv3	Administration
2	sv2	Researcher
\.


--
-- TOC entry 2510 (class 0 OID 17805)
-- Dependencies: 199
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: riftadi
--

COPY notifications (notification_oid, "timestamp", isprocessed, user_oid_user, publications_oid_publication) FROM stdin;
\.


--
-- TOC entry 2509 (class 0 OID 17787)
-- Dependencies: 198
-- Data for Name: publications; Type: TABLE DATA; Schema: public; Owner: riftadi
--

COPY publications (oid_publication, title, venue, year, pdf_file, "timestamp", comments_oid_comment, user_oid_user, isclaimed, abstract) FROM stdin;
1	publi1	delft	2017	\N	2017-10-10 22:35:11.353627	\N	4	\N	\N
\.


--
-- TOC entry 2504 (class 0 OID 17684)
-- Dependencies: 193
-- Data for Name: publications_keywords; Type: TABLE DATA; Schema: public; Owner: riftadi
--

COPY publications_keywords (publications_oid_publication, keywords_oid_keyword) FROM stdin;
\.


--
-- TOC entry 2498 (class 0 OID 17602)
-- Dependencies: 187
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: riftadi
--

COPY "user" (oid_user, username, password, email, name, affiliation, "timestamp", reputation, group_oid, comments_oid_comment, collections_oid_collection) FROM stdin;
4	test1	test1	test1@user.net	User Test 1	TU Delft	2017-10-10 22:18:12.968	\N	2	\N	\N
5	test2	test2	test2@test.net	User Test 2	TUD	2017-10-11 10:37:46.373	\N	\N	\N	\N
\.


--
-- TOC entry 2503 (class 0 OID 17664)
-- Dependencies: 192
-- Data for Name: user_group; Type: TABLE DATA; Schema: public; Owner: riftadi
--

COPY user_group (user_oid, group_oid) FROM stdin;
4	2
5	2
\.


--
-- TOC entry 2506 (class 0 OID 17734)
-- Dependencies: 195
-- Data for Name: user_keywords; Type: TABLE DATA; Schema: public; Owner: riftadi
--

COPY user_keywords (user_oid_user, keywords_oid_keyword) FROM stdin;
\.


--
-- TOC entry 2351 (class 2606 OID 17768)
-- Name: collections_keywords collections_keywords_pkey; Type: CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY collections_keywords
    ADD CONSTRAINT collections_keywords_pkey PRIMARY KEY (collections_oid_collection, keywords_oid_keyword);


--
-- TOC entry 2333 (class 2606 OID 17625)
-- Name: collections collections_pkey; Type: CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY collections
    ADD CONSTRAINT collections_pkey PRIMARY KEY (oid_collection);


--
-- TOC entry 2349 (class 2606 OID 17753)
-- Name: collections_publications collections_publications_pkey; Type: CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY collections_publications
    ADD CONSTRAINT collections_publications_pkey PRIMARY KEY (collections_oid_collection, publications_oid_publication);


--
-- TOC entry 2337 (class 2606 OID 17638)
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (oid_comment);


--
-- TOC entry 2339 (class 2606 OID 17648)
-- Name: group_module group_module_pkey; Type: CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY group_module
    ADD CONSTRAINT group_module_pkey PRIMARY KEY (group_oid, module_oid);


--
-- TOC entry 2327 (class 2606 OID 17593)
-- Name: group group_pkey; Type: CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY "group"
    ADD CONSTRAINT group_pkey PRIMARY KEY (oid);


--
-- TOC entry 2335 (class 2606 OID 17630)
-- Name: keywords keywords_pkey; Type: CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY keywords
    ADD CONSTRAINT keywords_pkey PRIMARY KEY (oid_keyword);


--
-- TOC entry 2345 (class 2606 OID 17703)
-- Name: list_of_authors list_of_authors_pkey; Type: CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY list_of_authors
    ADD CONSTRAINT list_of_authors_pkey PRIMARY KEY (publications_oid_publication, user_oid_user);


--
-- TOC entry 2329 (class 2606 OID 17601)
-- Name: module module_pkey; Type: CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY module
    ADD CONSTRAINT module_pkey PRIMARY KEY (oid);


--
-- TOC entry 2355 (class 2606 OID 17809)
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (notification_oid);


--
-- TOC entry 2343 (class 2606 OID 17688)
-- Name: publications_keywords publications_keywords_pkey; Type: CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY publications_keywords
    ADD CONSTRAINT publications_keywords_pkey PRIMARY KEY (publications_oid_publication, keywords_oid_keyword);


--
-- TOC entry 2353 (class 2606 OID 17794)
-- Name: publications publications_pkey; Type: CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY publications
    ADD CONSTRAINT publications_pkey PRIMARY KEY (oid_publication);


--
-- TOC entry 2341 (class 2606 OID 17668)
-- Name: user_group user_group_pkey; Type: CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY user_group
    ADD CONSTRAINT user_group_pkey PRIMARY KEY (user_oid, group_oid);


--
-- TOC entry 2347 (class 2606 OID 17738)
-- Name: user_keywords user_keywords_pkey; Type: CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY user_keywords
    ADD CONSTRAINT user_keywords_pkey PRIMARY KEY (user_oid_user, keywords_oid_keyword);


--
-- TOC entry 2331 (class 2606 OID 17609)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (oid_user);


--
-- TOC entry 2373 (class 2606 OID 17769)
-- Name: collections_keywords fk_collections_keywords_collec; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY collections_keywords
    ADD CONSTRAINT fk_collections_keywords_collec FOREIGN KEY (collections_oid_collection) REFERENCES collections(oid_collection);


--
-- TOC entry 2374 (class 2606 OID 17774)
-- Name: collections_keywords fk_collections_keywords_keywor; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY collections_keywords
    ADD CONSTRAINT fk_collections_keywords_keywor FOREIGN KEY (keywords_oid_keyword) REFERENCES keywords(oid_keyword);


--
-- TOC entry 2371 (class 2606 OID 17754)
-- Name: collections_publications fk_collections_publications_co; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY collections_publications
    ADD CONSTRAINT fk_collections_publications_co FOREIGN KEY (collections_oid_collection) REFERENCES collections(oid_collection);


--
-- TOC entry 2372 (class 2606 OID 17830)
-- Name: collections_publications fk_collections_publications_pu; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY collections_publications
    ADD CONSTRAINT fk_collections_publications_pu FOREIGN KEY (publications_oid_publication) REFERENCES publications(oid_publication);


--
-- TOC entry 2360 (class 2606 OID 17724)
-- Name: collections fk_collections_user; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY collections
    ADD CONSTRAINT fk_collections_user FOREIGN KEY (user_oid_user) REFERENCES "user"(oid_user);


--
-- TOC entry 2356 (class 2606 OID 17639)
-- Name: group fk_group_module; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY "group"
    ADD CONSTRAINT fk_group_module FOREIGN KEY (module_oid) REFERENCES module(oid);


--
-- TOC entry 2361 (class 2606 OID 17649)
-- Name: group_module fk_group_module_group; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY group_module
    ADD CONSTRAINT fk_group_module_group FOREIGN KEY (group_oid) REFERENCES "group"(oid);


--
-- TOC entry 2362 (class 2606 OID 17654)
-- Name: group_module fk_group_module_module; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY group_module
    ADD CONSTRAINT fk_group_module_module FOREIGN KEY (module_oid) REFERENCES module(oid);


--
-- TOC entry 2368 (class 2606 OID 17825)
-- Name: list_of_authors fk_list_of_authors_publication; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY list_of_authors
    ADD CONSTRAINT fk_list_of_authors_publication FOREIGN KEY (publications_oid_publication) REFERENCES publications(oid_publication);


--
-- TOC entry 2367 (class 2606 OID 17709)
-- Name: list_of_authors fk_list_of_authors_user; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY list_of_authors
    ADD CONSTRAINT fk_list_of_authors_user FOREIGN KEY (user_oid_user) REFERENCES "user"(oid_user);


--
-- TOC entry 2378 (class 2606 OID 17815)
-- Name: notifications fk_notifications_publications; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY notifications
    ADD CONSTRAINT fk_notifications_publications FOREIGN KEY (publications_oid_publication) REFERENCES publications(oid_publication);


--
-- TOC entry 2377 (class 2606 OID 17810)
-- Name: notifications fk_notifications_user; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY notifications
    ADD CONSTRAINT fk_notifications_user FOREIGN KEY (user_oid_user) REFERENCES "user"(oid_user);


--
-- TOC entry 2375 (class 2606 OID 17795)
-- Name: publications fk_publications_comments; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY publications
    ADD CONSTRAINT fk_publications_comments FOREIGN KEY (comments_oid_comment) REFERENCES comments(oid_comment);


--
-- TOC entry 2365 (class 2606 OID 17694)
-- Name: publications_keywords fk_publications_keywords_keywo; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY publications_keywords
    ADD CONSTRAINT fk_publications_keywords_keywo FOREIGN KEY (keywords_oid_keyword) REFERENCES keywords(oid_keyword);


--
-- TOC entry 2366 (class 2606 OID 17820)
-- Name: publications_keywords fk_publications_keywords_publi; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY publications_keywords
    ADD CONSTRAINT fk_publications_keywords_publi FOREIGN KEY (publications_oid_publication) REFERENCES publications(oid_publication);


--
-- TOC entry 2376 (class 2606 OID 17800)
-- Name: publications fk_publications_user; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY publications
    ADD CONSTRAINT fk_publications_user FOREIGN KEY (user_oid_user) REFERENCES "user"(oid_user);


--
-- TOC entry 2359 (class 2606 OID 17729)
-- Name: user fk_user_collections; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT fk_user_collections FOREIGN KEY (collections_oid_collection) REFERENCES collections(oid_collection);


--
-- TOC entry 2358 (class 2606 OID 17719)
-- Name: user fk_user_comments; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT fk_user_comments FOREIGN KEY (comments_oid_comment) REFERENCES comments(oid_comment);


--
-- TOC entry 2357 (class 2606 OID 17659)
-- Name: user fk_user_group; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT fk_user_group FOREIGN KEY (group_oid) REFERENCES "group"(oid);


--
-- TOC entry 2364 (class 2606 OID 17674)
-- Name: user_group fk_user_group_group; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY user_group
    ADD CONSTRAINT fk_user_group_group FOREIGN KEY (group_oid) REFERENCES "group"(oid);


--
-- TOC entry 2363 (class 2606 OID 17669)
-- Name: user_group fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY user_group
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_oid) REFERENCES "user"(oid_user);


--
-- TOC entry 2370 (class 2606 OID 17744)
-- Name: user_keywords fk_user_keywords_keywords; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY user_keywords
    ADD CONSTRAINT fk_user_keywords_keywords FOREIGN KEY (keywords_oid_keyword) REFERENCES keywords(oid_keyword);


--
-- TOC entry 2369 (class 2606 OID 17739)
-- Name: user_keywords fk_user_keywords_user; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY user_keywords
    ADD CONSTRAINT fk_user_keywords_user FOREIGN KEY (user_oid_user) REFERENCES "user"(oid_user);


-- Completed on 2017-10-14 17:21:11 CEST

--
-- PostgreSQL database dump complete
--

