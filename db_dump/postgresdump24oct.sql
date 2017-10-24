--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 10.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: collections; Type: TABLE; Schema: public; Owner: riftadi
--

CREATE TABLE collections (
    oid_collection integer NOT NULL,
    title character varying(255),
    description character varying(255),
    "timestamp" timestamp without time zone,
    user_oid_user integer
);


ALTER TABLE collections OWNER TO riftadi;

--
-- Name: collections_keywords; Type: TABLE; Schema: public; Owner: riftadi
--

CREATE TABLE collections_keywords (
    collections_oid_collection integer NOT NULL,
    keywords_oid_keyword integer NOT NULL
);


ALTER TABLE collections_keywords OWNER TO riftadi;

--
-- Name: collections_publications; Type: TABLE; Schema: public; Owner: riftadi
--

CREATE TABLE collections_publications (
    collections_oid_collection integer NOT NULL,
    publications_oid_publication integer NOT NULL
);


ALTER TABLE collections_publications OWNER TO riftadi;

--
-- Name: collections_user; Type: TABLE; Schema: public; Owner: riftadi
--

CREATE TABLE collections_user (
    collections_oid_collection integer NOT NULL,
    user_oid_user integer NOT NULL
);


ALTER TABLE collections_user OWNER TO riftadi;

--
-- Name: comments; Type: TABLE; Schema: public; Owner: riftadi
--

CREATE TABLE comments (
    oid_comment integer NOT NULL,
    title character varying(255),
    content text,
    "timestamp" timestamp without time zone,
    oid_publication integer,
    oid_user integer
);


ALTER TABLE comments OWNER TO riftadi;

--
-- Name: group; Type: TABLE; Schema: public; Owner: riftadi
--

CREATE TABLE "group" (
    oid integer NOT NULL,
    groupname character varying(255),
    module_oid integer
);


ALTER TABLE "group" OWNER TO riftadi;

--
-- Name: group_module; Type: TABLE; Schema: public; Owner: riftadi
--

CREATE TABLE group_module (
    group_oid integer NOT NULL,
    module_oid integer NOT NULL
);


ALTER TABLE group_module OWNER TO riftadi;

--
-- Name: keywords; Type: TABLE; Schema: public; Owner: riftadi
--

CREATE TABLE keywords (
    oid_keyword integer NOT NULL,
    name character varying(255),
    "timestamp" timestamp without time zone
);


ALTER TABLE keywords OWNER TO riftadi;

--
-- Name: list_of_authors; Type: TABLE; Schema: public; Owner: riftadi
--

CREATE TABLE list_of_authors (
    publications_oid_publication integer NOT NULL,
    user_oid_user integer NOT NULL
);


ALTER TABLE list_of_authors OWNER TO riftadi;

--
-- Name: module; Type: TABLE; Schema: public; Owner: riftadi
--

CREATE TABLE module (
    oid integer NOT NULL,
    moduleid character varying(255),
    modulename character varying(255)
);


ALTER TABLE module OWNER TO riftadi;

--
-- Name: notifications; Type: TABLE; Schema: public; Owner: riftadi
--

CREATE TABLE notifications (
    notification_oid integer NOT NULL,
    "timestamp" timestamp without time zone,
    isprocessed boolean,
    user_oid_user integer,
    publications_oid_publication integer,
    content text
);


ALTER TABLE notifications OWNER TO riftadi;

--
-- Name: publications; Type: TABLE; Schema: public; Owner: riftadi
--

CREATE TABLE publications (
    oid_publication integer NOT NULL,
    title character varying(255),
    venue character varying(255),
    year text,
    pdf_file character varying(255),
    "timestamp" timestamp without time zone,
    abstract text,
    isclaimed boolean,
    user_oid_user integer,
    ispdfpublic boolean
);


ALTER TABLE publications OWNER TO riftadi;

--
-- Name: publications_keywords; Type: TABLE; Schema: public; Owner: riftadi
--

CREATE TABLE publications_keywords (
    publications_oid_publication integer NOT NULL,
    keywords_oid_keyword integer NOT NULL
);


ALTER TABLE publications_keywords OWNER TO riftadi;

--
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
    isexternal integer
);


ALTER TABLE "user" OWNER TO riftadi;

--
-- Name: user_group; Type: TABLE; Schema: public; Owner: riftadi
--

CREATE TABLE user_group (
    user_oid integer NOT NULL,
    group_oid integer NOT NULL
);


ALTER TABLE user_group OWNER TO riftadi;

--
-- Name: user_keywords; Type: TABLE; Schema: public; Owner: riftadi
--

CREATE TABLE user_keywords (
    user_oid_user integer NOT NULL,
    keywords_oid_keyword integer NOT NULL
);


ALTER TABLE user_keywords OWNER TO riftadi;

--
-- Data for Name: collections; Type: TABLE DATA; Schema: public; Owner: riftadi
--

COPY collections (oid_collection, title, description, "timestamp", user_oid_user) FROM stdin;
1	My Precious Collection	The greatest collection ever	2017-10-15 12:26:23.331331	1
2	My Best Collection	The best ever	2017-10-22 21:48:50.726	2
\.


--
-- Data for Name: collections_keywords; Type: TABLE DATA; Schema: public; Owner: riftadi
--

COPY collections_keywords (collections_oid_collection, keywords_oid_keyword) FROM stdin;
1	1
1	2
2	4
2	3
\.


--
-- Data for Name: collections_publications; Type: TABLE DATA; Schema: public; Owner: riftadi
--

COPY collections_publications (collections_oid_collection, publications_oid_publication) FROM stdin;
1	100
1	103
1	110
2	104
2	108
\.


--
-- Data for Name: collections_user; Type: TABLE DATA; Schema: public; Owner: riftadi
--

COPY collections_user (collections_oid_collection, user_oid_user) FROM stdin;
1	2
1	1
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: riftadi
--

COPY comments (oid_comment, title, content, "timestamp", oid_publication, oid_user) FROM stdin;
100	Good	<p>This publication is good!</p>\r\n	2017-10-22 20:11:21.992	100	2
103	Hi	<p>Hmm, this should not be here.. but I&#39;m not sure... What do you think?</p>\r\n	2017-10-24 17:27:18.966	101	1
104	User 1 commenting on pub 2	<p>I don&#39;t what to say, whatever</p>\r\n	2017-10-24 17:27:59.582	100	1
\.


--
-- Data for Name: group; Type: TABLE DATA; Schema: public; Owner: riftadi
--

COPY "group" (oid, groupname, module_oid) FROM stdin;
2	researcher	2
1	administrator	1
\.


--
-- Data for Name: group_module; Type: TABLE DATA; Schema: public; Owner: riftadi
--

COPY group_module (group_oid, module_oid) FROM stdin;
2	2
1	1
\.


--
-- Data for Name: keywords; Type: TABLE DATA; Schema: public; Owner: riftadi
--

COPY keywords (oid_keyword, name, "timestamp") FROM stdin;
1	machine learning	2017-10-15 12:22:47.963565
2	pattern recognition	2017-10-15 12:23:09.852503
3	ai techniques	2017-10-22 20:34:48.347
4	data visualization	2017-10-24 17:12:12.017
5	web science	2017-10-24 17:12:12.017
6	web engineering	2017-10-24 17:12:12.017
\.


--
-- Data for Name: list_of_authors; Type: TABLE DATA; Schema: public; Owner: riftadi
--

COPY list_of_authors (publications_oid_publication, user_oid_user) FROM stdin;
100	1
101	1
101	2
101	20
102	3
103	20
104	2
104	20
106	2
106	20
108	2
108	20
110	2
110	3
110	20
\.


--
-- Data for Name: module; Type: TABLE DATA; Schema: public; Owner: riftadi
--

COPY module (oid, moduleid, modulename) FROM stdin;
1	sv3	Administration
2	sv2	Researcher
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: riftadi
--

COPY notifications (notification_oid, "timestamp", isprocessed, user_oid_user, publications_oid_publication, content) FROM stdin;
2	2017-10-24 16:19:58.177	f	2	110	Your authored publication is uploaded into our platform.
4	2017-10-24 16:36:09.854	f	3	\N	Your authored publication is uploaded into our platform.
\.


--
-- Data for Name: publications; Type: TABLE DATA; Schema: public; Owner: riftadi
--

COPY publications (oid_publication, title, venue, year, pdf_file, "timestamp", abstract, isclaimed, user_oid_user, ispdfpublic) FROM stdin;
101	Publication 2	Berlin	2016	\N	2017-10-15 12:22:30.312881	asdfafsaf	t	2	t
100	Alternating Offer Protocols For Multilateral Negotiations	Delft	2012	upload/ent2/1/AlternatingOfferProtocolsForMultilateralNegotiations.pdf	2017-10-24 17:26:28.653	<p>This is the abstract for&nbsp;Alternating Offer Protocols For Multilateral Negotiations.</p>\r\n	t	1	t
103	Interesting Pub 3	Amsterdam	1998	\N	2017-10-23 01:05:46.889	<p>sadadsa</p>\r\n	f	20	t
102	Interesting Publication	Utrecht	2010	\N	2017-10-22 22:52:06.191	<p>asdfaf</p>\r\n	f	3	t
106	Publication 6	Leiden	2002	\N	2017-10-23 11:10:22.234	<p>sadfa</p>\r\n	f	2	t
104	Publication 4	Delft	2013	\N	2017-10-23 11:03:30.404	<p>safda</p>\r\n	f	2	t
110	Publication External 3	Den Haag	2015	\N	2017-10-24 16:19:58.177	<p>sadfas</p>\r\n	f	20	t
108	Publication External1	Delft	2009	\N	2017-10-24 16:01:33.157	<p>sadfa</p>\r\n	f	20	t
\.


--
-- Data for Name: publications_keywords; Type: TABLE DATA; Schema: public; Owner: riftadi
--

COPY publications_keywords (publications_oid_publication, keywords_oid_keyword) FROM stdin;
100	1
101	2
100	2
102	1
102	2
103	2
103	3
104	3
106	3
108	1
108	2
110	1
110	3
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: riftadi
--

COPY "user" (oid_user, username, password, email, name, affiliation, "timestamp", reputation, group_oid, isexternal) FROM stdin;
1	test1	test1	test1@tud.nl	Test User 1	TUD	2017-10-15 10:47:41.997	1	2	0
3	test3	test3	test3@tud.nl	Test User 3	TUD	2017-10-15 12:21:35.565796	1	2	0
2	test2	test2	test2@tud.nl	Test User 2	TUD	2017-10-15 11:41:57.877333	3	2	0
20	\N	\N	ext1@tud.nl	External Author 1	\N	2017-10-24 17:32:30.951149	4	\N	1
101	\N	\N	ext2@tud.nl	External Author 2	\N	2017-10-24 17:32:39.086096	\N	\N	1
100	super	super	super@tud.nl	Super Admin	TUD	2017-10-15 10:55:48.826935	\N	1	0
\.


--
-- Data for Name: user_group; Type: TABLE DATA; Schema: public; Owner: riftadi
--

COPY user_group (user_oid, group_oid) FROM stdin;
\.


--
-- Data for Name: user_keywords; Type: TABLE DATA; Schema: public; Owner: riftadi
--

COPY user_keywords (user_oid_user, keywords_oid_keyword) FROM stdin;
1	1
1	2
1	4
2	3
2	5
\.


--
-- Name: collections_keywords collections_keywords_pkey; Type: CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY collections_keywords
    ADD CONSTRAINT collections_keywords_pkey PRIMARY KEY (collections_oid_collection, keywords_oid_keyword);


--
-- Name: collections collections_pkey; Type: CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY collections
    ADD CONSTRAINT collections_pkey PRIMARY KEY (oid_collection);


--
-- Name: collections_publications collections_publications_pkey; Type: CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY collections_publications
    ADD CONSTRAINT collections_publications_pkey PRIMARY KEY (collections_oid_collection, publications_oid_publication);


--
-- Name: collections_user collections_user_pkey; Type: CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY collections_user
    ADD CONSTRAINT collections_user_pkey PRIMARY KEY (collections_oid_collection, user_oid_user);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (oid_comment);


--
-- Name: group_module group_module_pkey; Type: CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY group_module
    ADD CONSTRAINT group_module_pkey PRIMARY KEY (group_oid, module_oid);


--
-- Name: group group_pkey; Type: CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY "group"
    ADD CONSTRAINT group_pkey PRIMARY KEY (oid);


--
-- Name: keywords keywords_pkey; Type: CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY keywords
    ADD CONSTRAINT keywords_pkey PRIMARY KEY (oid_keyword);


--
-- Name: list_of_authors list_of_authors_pkey; Type: CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY list_of_authors
    ADD CONSTRAINT list_of_authors_pkey PRIMARY KEY (publications_oid_publication, user_oid_user);


--
-- Name: module module_pkey; Type: CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY module
    ADD CONSTRAINT module_pkey PRIMARY KEY (oid);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (notification_oid);


--
-- Name: publications_keywords publications_keywords_pkey; Type: CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY publications_keywords
    ADD CONSTRAINT publications_keywords_pkey PRIMARY KEY (publications_oid_publication, keywords_oid_keyword);


--
-- Name: publications publications_pkey; Type: CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY publications
    ADD CONSTRAINT publications_pkey PRIMARY KEY (oid_publication);


--
-- Name: user_group user_group_pkey; Type: CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY user_group
    ADD CONSTRAINT user_group_pkey PRIMARY KEY (user_oid, group_oid);


--
-- Name: user_keywords user_keywords_pkey; Type: CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY user_keywords
    ADD CONSTRAINT user_keywords_pkey PRIMARY KEY (user_oid_user, keywords_oid_keyword);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (oid_user);


--
-- Name: collections_keywords fk_collections_keywords_collec; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY collections_keywords
    ADD CONSTRAINT fk_collections_keywords_collec FOREIGN KEY (collections_oid_collection) REFERENCES collections(oid_collection);


--
-- Name: collections_keywords fk_collections_keywords_keywor; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY collections_keywords
    ADD CONSTRAINT fk_collections_keywords_keywor FOREIGN KEY (keywords_oid_keyword) REFERENCES keywords(oid_keyword);


--
-- Name: collections_publications fk_collections_publications_co; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY collections_publications
    ADD CONSTRAINT fk_collections_publications_co FOREIGN KEY (collections_oid_collection) REFERENCES collections(oid_collection);


--
-- Name: collections_publications fk_collections_publications_pu; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY collections_publications
    ADD CONSTRAINT fk_collections_publications_pu FOREIGN KEY (publications_oid_publication) REFERENCES publications(oid_publication);


--
-- Name: collections fk_collections_user; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY collections
    ADD CONSTRAINT fk_collections_user FOREIGN KEY (user_oid_user) REFERENCES "user"(oid_user);


--
-- Name: collections_user fk_collections_user_collection; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY collections_user
    ADD CONSTRAINT fk_collections_user_collection FOREIGN KEY (collections_oid_collection) REFERENCES collections(oid_collection);


--
-- Name: collections_user fk_collections_user_user; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY collections_user
    ADD CONSTRAINT fk_collections_user_user FOREIGN KEY (user_oid_user) REFERENCES "user"(oid_user);


--
-- Name: comments fk_comments_publications; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT fk_comments_publications FOREIGN KEY (oid_publication) REFERENCES publications(oid_publication);


--
-- Name: comments fk_comments_user; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT fk_comments_user FOREIGN KEY (oid_user) REFERENCES "user"(oid_user);


--
-- Name: group fk_group_module; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY "group"
    ADD CONSTRAINT fk_group_module FOREIGN KEY (module_oid) REFERENCES module(oid);


--
-- Name: group_module fk_group_module_group; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY group_module
    ADD CONSTRAINT fk_group_module_group FOREIGN KEY (group_oid) REFERENCES "group"(oid);


--
-- Name: group_module fk_group_module_module; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY group_module
    ADD CONSTRAINT fk_group_module_module FOREIGN KEY (module_oid) REFERENCES module(oid);


--
-- Name: list_of_authors fk_list_of_authors_publication; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY list_of_authors
    ADD CONSTRAINT fk_list_of_authors_publication FOREIGN KEY (publications_oid_publication) REFERENCES publications(oid_publication);


--
-- Name: list_of_authors fk_list_of_authors_user; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY list_of_authors
    ADD CONSTRAINT fk_list_of_authors_user FOREIGN KEY (user_oid_user) REFERENCES "user"(oid_user);


--
-- Name: notifications fk_notifications_publications; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY notifications
    ADD CONSTRAINT fk_notifications_publications FOREIGN KEY (publications_oid_publication) REFERENCES publications(oid_publication);


--
-- Name: notifications fk_notifications_user; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY notifications
    ADD CONSTRAINT fk_notifications_user FOREIGN KEY (user_oid_user) REFERENCES "user"(oid_user);


--
-- Name: publications_keywords fk_publications_keywords_keywo; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY publications_keywords
    ADD CONSTRAINT fk_publications_keywords_keywo FOREIGN KEY (keywords_oid_keyword) REFERENCES keywords(oid_keyword);


--
-- Name: publications_keywords fk_publications_keywords_publi; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY publications_keywords
    ADD CONSTRAINT fk_publications_keywords_publi FOREIGN KEY (publications_oid_publication) REFERENCES publications(oid_publication);


--
-- Name: publications fk_publications_user; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY publications
    ADD CONSTRAINT fk_publications_user FOREIGN KEY (user_oid_user) REFERENCES "user"(oid_user);


--
-- Name: user fk_user_group; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT fk_user_group FOREIGN KEY (group_oid) REFERENCES "group"(oid);


--
-- Name: user_group fk_user_group_group; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY user_group
    ADD CONSTRAINT fk_user_group_group FOREIGN KEY (group_oid) REFERENCES "group"(oid);


--
-- Name: user_group fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY user_group
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_oid) REFERENCES "user"(oid_user);


--
-- Name: user_keywords fk_user_keywords_keywords; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY user_keywords
    ADD CONSTRAINT fk_user_keywords_keywords FOREIGN KEY (keywords_oid_keyword) REFERENCES keywords(oid_keyword);


--
-- Name: user_keywords fk_user_keywords_user; Type: FK CONSTRAINT; Schema: public; Owner: riftadi
--

ALTER TABLE ONLY user_keywords
    ADD CONSTRAINT fk_user_keywords_user FOREIGN KEY (user_oid_user) REFERENCES "user"(oid_user);


--
-- PostgreSQL database dump complete
--

