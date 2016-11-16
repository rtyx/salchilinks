--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.0
-- Dumped by pg_dump version 9.6.0

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
-- Name: comments; Type: TABLE; Schema: public; Owner: rtyx
--

CREATE TABLE comments (
    id integer NOT NULL,
    link_id integer NOT NULL,
    user_id integer NOT NULL,
    comment character varying(255) NOT NULL,
    creation_date timestamp without time zone DEFAULT now(),
    parent integer
);


ALTER TABLE comments OWNER TO rtyx;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: rtyx
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE comments_id_seq OWNER TO rtyx;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rtyx
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: favs; Type: TABLE; Schema: public; Owner: rtyx
--

CREATE TABLE favs (
    id integer NOT NULL,
    link_id integer,
    user_id integer,
    creation_date timestamp without time zone DEFAULT now()
);


ALTER TABLE favs OWNER TO rtyx;

--
-- Name: favs_id_seq; Type: SEQUENCE; Schema: public; Owner: rtyx
--

CREATE SEQUENCE favs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE favs_id_seq OWNER TO rtyx;

--
-- Name: favs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rtyx
--

ALTER SEQUENCE favs_id_seq OWNED BY favs.id;


--
-- Name: links; Type: TABLE; Schema: public; Owner: rtyx
--

CREATE TABLE links (
    id integer NOT NULL,
    url text NOT NULL,
    title character varying(255) NOT NULL,
    comments integer DEFAULT 0,
    creation_date timestamp without time zone DEFAULT now(),
    ogtitle text,
    ogdescription text,
    ogimage text DEFAULT 'http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg'::text,
    user_id integer NOT NULL,
    favs integer DEFAULT 0
);


ALTER TABLE links OWNER TO rtyx;

--
-- Name: links_id_seq; Type: SEQUENCE; Schema: public; Owner: rtyx
--

CREATE SEQUENCE links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE links_id_seq OWNER TO rtyx;

--
-- Name: links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rtyx
--

ALTER SEQUENCE links_id_seq OWNED BY links.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: rtyx
--

CREATE TABLE users (
    id integer NOT NULL,
    user_name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE users OWNER TO rtyx;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: rtyx
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO rtyx;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rtyx
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: rtyx
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: favs id; Type: DEFAULT; Schema: public; Owner: rtyx
--

ALTER TABLE ONLY favs ALTER COLUMN id SET DEFAULT nextval('favs_id_seq'::regclass);


--
-- Name: links id; Type: DEFAULT; Schema: public; Owner: rtyx
--

ALTER TABLE ONLY links ALTER COLUMN id SET DEFAULT nextval('links_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: rtyx
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: rtyx
--

COPY comments (id, link_id, user_id, comment, creation_date, parent) FROM stdin;
1	10	28	Tempora dignissimos quae omnis rerum.	2016-11-15 16:22:32.350709	\N
2	16	46	Eum deserunt quibusdam temporibus dolorum quos animi unde aliquam natus.	2016-11-15 16:22:32.35335	\N
3	20	41	Enim vitae saepe saepe dolorem laboriosam sit temporibus maxime quis.	2016-11-15 16:22:32.355486	\N
4	8	30	Asperiores fugit rerum.	2016-11-15 16:22:32.357839	\N
5	38	9	Rerum eum est.	2016-11-15 16:22:32.361003	\N
6	44	36	Facere earum quia inventore.	2016-11-15 16:22:32.363123	\N
7	6	20	Repellat et similique numquam dicta dolore modi amet aut dolorum.	2016-11-15 16:22:32.401897	\N
8	26	0	Ut quo tenetur optio repudiandae magni tenetur debitis.	2016-11-15 16:22:32.405895	\N
9	18	11	Quis eligendi adipisci omnis tempore repellendus.	2016-11-15 16:22:32.407443	\N
10	30	26	Hic et rem ex eveniet non.	2016-11-15 16:22:32.413611	\N
11	18	33	Libero est dolore nulla sapiente nostrum.	2016-11-15 16:22:32.416847	\N
12	30	44	Quia nulla illo blanditiis sunt rerum ea.	2016-11-15 16:22:32.421619	\N
13	50	37	Possimus aperiam qui voluptas qui rem qui sint rerum et.	2016-11-15 16:22:32.423765	\N
14	11	22	Ea sint minus.	2016-11-15 16:22:32.425709	\N
15	15	30	Laudantium aut nihil quo magni ratione molestias.	2016-11-15 16:22:32.427901	\N
16	36	44	Delectus dolorum aperiam molestiae id non molestiae sint voluptatem nulla.	2016-11-15 16:22:32.429523	\N
17	41	34	Rem sapiente et.	2016-11-15 16:22:32.435564	\N
18	4	35	Odit earum unde.	2016-11-15 16:22:32.437473	\N
19	13	49	Repudiandae voluptatem nulla laborum sit animi repellat non illo excepturi.	2016-11-15 16:22:32.439533	\N
20	35	44	Quo asperiores consequuntur nihil illum officiis minus et voluptatem ratione.	2016-11-15 16:22:32.441218	\N
21	28	25	Aliquam cum assumenda alias.	2016-11-15 16:22:32.442879	\N
22	16	12	Provident explicabo harum eos.	2016-11-15 16:22:32.491059	\N
23	23	30	Quia temporibus velit perspiciatis aperiam dignissimos sed quis quod.	2016-11-15 16:22:32.493038	\N
24	50	48	Ipsam suscipit id.	2016-11-15 16:22:32.49645	\N
25	47	36	Quo et reprehenderit veniam necessitatibus non blanditiis expedita eum quod.	2016-11-15 16:22:32.497482	\N
26	47	12	In est natus dolores ipsum amet possimus veritatis ipsam.	2016-11-15 16:22:32.498555	\N
27	5	2	Voluptate aut sed non et aut ut et et.	2016-11-15 16:22:32.50104	\N
28	15	25	Atque veritatis reprehenderit itaque similique libero accusamus cumque.	2016-11-15 16:22:32.502637	\N
29	5	46	Vitae assumenda est nihil ut ut consequatur.	2016-11-15 16:22:32.504817	\N
30	4	19	Itaque assumenda sunt odit omnis blanditiis maxime quam et.	2016-11-15 16:22:32.50719	\N
31	48	12	Rerum necessitatibus consequatur soluta ad eum voluptatem nesciunt.	2016-11-15 16:22:32.508141	\N
32	49	32	Illo iure enim.	2016-11-15 16:22:32.509881	\N
33	9	29	Eaque a culpa quaerat qui aspernatur nihil a dolore magni.	2016-11-15 16:22:32.510717	\N
34	1	17	Cum omnis voluptatem eos quos amet dolores sunt eaque aspernatur.	2016-11-15 16:22:32.512756	\N
35	25	33	Hic dolores est quo et.	2016-11-15 16:22:32.515814	\N
36	4	32	Omnis ut blanditiis sunt temporibus quisquam.	2016-11-15 16:22:32.517001	\N
37	45	1	Et consequatur omnis.	2016-11-15 16:22:32.517869	\N
38	31	13	Eius molestiae neque cum et necessitatibus consequatur voluptates unde.	2016-11-15 16:22:32.520128	\N
39	10	4	Qui eum fugiat voluptates aut exercitationem.	2016-11-15 16:22:32.521465	\N
40	0	40	Architecto nesciunt sunt quo dolor nobis eveniet.	2016-11-15 16:22:32.529745	\N
41	39	38	Error architecto occaecati.	2016-11-15 16:22:32.530625	\N
42	41	27	Molestiae id quibusdam exercitationem assumenda est aut fugiat.	2016-11-15 16:22:32.542631	\N
43	18	35	Quae quaerat aut pariatur est voluptate voluptatem.	2016-11-15 16:22:32.545316	\N
44	39	18	Excepturi est dolorem perferendis veniam fugit amet modi in ullam.	2016-11-15 16:22:32.556595	\N
45	43	34	Quia perspiciatis nihil dignissimos.	2016-11-15 16:22:32.557809	\N
46	25	50	Quibusdam quis deserunt.	2016-11-15 16:22:32.563056	\N
47	31	32	Suscipit voluptatum vel minima.	2016-11-15 16:22:32.564868	\N
48	15	27	Assumenda ut in dolores qui autem fuga temporibus.	2016-11-15 16:22:32.569713	\N
49	41	13	Consequatur quis illum ipsa incidunt.	2016-11-15 16:22:32.572268	\N
50	6	45	Illo beatae ut.	2016-11-15 16:22:32.573029	\N
51	22	23	Atque eligendi ducimus officia quis et et facilis temporibus reiciendis.	2016-11-15 16:23:41.124664	\N
52	7	35	Quod ex error.	2016-11-15 16:23:41.149534	\N
53	33	19	Praesentium quo accusantium aut aut.	2016-11-15 16:23:41.16234	\N
54	43	28	Esse maxime autem sint optio sapiente commodi maiores doloribus quisquam.	2016-11-15 16:23:41.170875	\N
55	44	42	Distinctio aut qui.	2016-11-15 16:23:41.182515	\N
56	19	9	Ipsa voluptates aperiam commodi.	2016-11-15 16:23:41.211083	\N
57	0	13	Vel nisi cumque ad assumenda.	2016-11-15 16:23:41.268056	\N
58	26	8	Perferendis perferendis eos ipsam harum possimus.	2016-11-15 16:23:41.272833	\N
59	12	42	Cupiditate id rerum earum inventore excepturi sit beatae magnam eum.	2016-11-15 16:23:41.274417	\N
60	17	5	Cum et error.	2016-11-15 16:23:41.28003	\N
61	9	42	Laboriosam dolorem et.	2016-11-15 16:23:41.282148	\N
62	11	13	Error molestiae sint odio tempore animi ullam.	2016-11-15 16:23:41.393642	\N
63	7	32	Rerum maiores error maxime.	2016-11-15 16:23:41.400142	\N
64	36	46	Dolore ut quia quia unde.	2016-11-15 16:23:41.403265	\N
65	43	43	Corrupti id ex aut id.	2016-11-15 16:23:41.410277	\N
66	13	36	Praesentium atque et quas est recusandae voluptas.	2016-11-15 16:23:41.413274	\N
67	15	1	Ab a et incidunt accusantium ipsum doloribus minima labore.	2016-11-15 16:23:41.431438	\N
68	17	27	Quia sed sapiente est dicta ducimus.	2016-11-15 16:23:41.577511	\N
69	42	20	Error aut aliquam.	2016-11-15 16:23:41.737103	\N
70	10	25	Aut et in voluptatem tempora.	2016-11-15 16:23:41.738617	\N
71	15	17	Facere et magnam perspiciatis fugiat aut nesciunt.	2016-11-15 16:23:41.740152	\N
72	41	24	Provident itaque commodi consequatur inventore ipsa tenetur.	2016-11-15 16:23:41.743713	\N
73	23	36	Harum nesciunt explicabo quia cum.	2016-11-15 16:23:41.747083	\N
74	31	38	Rerum hic dolore dolor quas veniam optio perferendis id.	2016-11-15 16:23:41.759051	\N
75	24	43	Nesciunt pariatur quas incidunt ex eius debitis illum est ut.	2016-11-15 16:23:41.761224	\N
76	23	26	Sit exercitationem minus totam est quia facilis.	2016-11-15 16:23:41.762104	\N
77	2	26	Mollitia est repudiandae voluptatibus suscipit.	2016-11-15 16:23:41.764187	\N
78	47	5	Amet nostrum ut qui possimus voluptas autem veniam ut.	2016-11-15 16:23:41.776702	\N
79	40	35	A deleniti iusto et.	2016-11-15 16:23:41.77755	\N
80	15	18	Quaerat eum aut est quo praesentium.	2016-11-15 16:23:41.778597	\N
81	15	30	Reprehenderit laboriosam sint amet similique quis et nihil.	2016-11-15 16:23:41.781573	\N
82	22	40	Qui reiciendis soluta placeat optio voluptatem dolores.	2016-11-15 16:23:41.788945	\N
83	32	12	Laudantium asperiores qui neque tempora voluptatem quis.	2016-11-15 16:23:41.790762	\N
84	11	12	Autem ab maxime cumque aut unde vel sunt ut.	2016-11-15 16:23:41.794354	\N
86	7	6	Possimus maxime sequi est.	2016-11-15 16:23:41.798296	\N
85	5	6	Aliquam ut soluta quidem quae ad mollitia iure.	2016-11-15 16:23:41.795182	\N
94	29	10	Voluptas similique cum voluptates architecto sequi.	2016-11-15 16:23:41.820091	\N
87	26	36	Dolore id aut quidem dicta similique illo officia.	2016-11-15 16:23:41.80326	\N
96	43	14	Dolore nobis quis dolor atque et ullam cum incidunt eius.	2016-11-15 16:23:41.831434	\N
88	22	8	Aperiam sed velit ad quo quis.	2016-11-15 16:23:41.804295	\N
97	44	1	Quis voluptas autem et distinctio.	2016-11-15 16:23:41.833578	\N
89	35	12	Quisquam et occaecati.	2016-11-15 16:23:41.805289	\N
98	37	11	Odio consequatur est incidunt vel vero.	2016-11-15 16:23:41.834572	\N
90	49	26	Neque voluptas nesciunt saepe voluptatibus ut rerum.	2016-11-15 16:23:41.806329	\N
99	46	40	Odio ut quo exercitationem qui recusandae quia quisquam.	2016-11-15 16:23:41.83537	\N
91	24	47	Nemo qui est dolore eaque.	2016-11-15 16:23:41.814852	\N
95	24	22	Modi sed dicta optio beatae dolorem voluptate.	2016-11-15 16:23:41.825387	\N
100	5	42	Quia itaque sit non.	2016-11-15 16:23:41.838602	\N
92	50	9	Corrupti voluptatem tenetur nam officiis alias aut et magni dolorem.	2016-11-15 16:23:41.817667	\N
93	37	31	Dicta occaecati eius quod natus quasi rem aut in ducimus.	2016-11-15 16:23:41.819262	\N
101	50	50	LOL	2016-11-15 16:27:20.341763	92
102	46	42	Qui enim nesciunt corporis.	2016-11-15 20:37:15.114989	\N
103	0	5	Accusamus nesciunt possimus magnam est repellat.	2016-11-15 20:37:15.167978	\N
104	34	16	Vitae sunt qui.	2016-11-15 20:37:15.184551	\N
105	31	0	Modi rem et eveniet est eos.	2016-11-15 20:37:15.233151	\N
106	34	31	Et rerum ea.	2016-11-15 20:37:15.247464	\N
107	20	47	Dignissimos non quo possimus quia.	2016-11-15 20:37:15.263768	\N
108	2	39	Est velit quae eum iure nemo enim corporis.	2016-11-15 20:37:15.265131	\N
109	45	28	Nobis fugit molestiae aperiam et distinctio.	2016-11-15 20:37:15.26664	\N
110	32	10	Sit voluptatem velit eos mollitia iste qui et.	2016-11-15 20:37:15.273171	\N
111	4	37	Voluptate adipisci laborum rerum consectetur eum quam harum quos cupiditate.	2016-11-15 20:37:15.276165	\N
112	35	30	Quo sit ad.	2016-11-15 20:37:15.286435	\N
113	46	3	Qui velit non et harum dolores quam.	2016-11-15 20:37:15.28883	\N
114	38	17	Error et perferendis corporis similique fugiat velit fuga ad cumque.	2016-11-15 20:37:15.292134	\N
115	48	21	Quo perspiciatis ut aperiam sit et iure.	2016-11-15 20:37:15.292738	\N
116	28	16	Nihil vel ipsam.	2016-11-15 20:37:15.301274	\N
117	13	36	Labore cupiditate in.	2016-11-15 20:37:15.311729	\N
118	44	37	Neque dolorum iusto voluptatem quae non impedit voluptatem accusamus omnis.	2016-11-15 20:37:15.313478	\N
119	19	28	Quae et quibusdam adipisci deserunt dolore odit iusto culpa.	2016-11-15 20:37:15.315121	\N
120	49	41	Omnis perspiciatis illum odit velit magni.	2016-11-15 20:37:15.316089	\N
121	38	41	Nostrum hic ut qui nihil pariatur iste impedit explicabo.	2016-11-15 20:37:15.320121	\N
122	20	50	Quidem laboriosam placeat est.	2016-11-15 20:37:15.327585	\N
123	1	15	Tenetur non nesciunt et quo voluptas aperiam minus voluptatibus harum.	2016-11-15 20:37:15.328797	\N
124	27	31	Fugit reiciendis vel ex sequi quia eaque aperiam ab.	2016-11-15 20:37:15.340053	\N
125	31	6	Esse non consequatur ut corporis rerum quis.	2016-11-15 20:37:15.343097	\N
126	32	2	Laudantium ad voluptatem quaerat quia voluptatum in.	2016-11-15 20:37:15.344753	\N
127	7	28	Deserunt voluptatibus minus eos corrupti culpa odit qui dolor ut.	2016-11-15 20:37:15.349099	\N
128	35	11	Dicta consectetur labore quis fugit eum veniam id assumenda.	2016-11-15 20:37:15.361607	\N
129	40	38	Eum perspiciatis voluptas.	2016-11-15 20:37:15.405463	\N
130	40	8	Rem officiis iusto nisi rerum eum enim animi omnis dolores.	2016-11-15 20:37:15.41026	\N
131	17	36	Dolorem hic ut ut tempora.	2016-11-15 20:37:15.423051	\N
132	20	14	Ea officia autem molestiae.	2016-11-15 20:37:15.424805	\N
133	7	4	Voluptatem pariatur pariatur.	2016-11-15 20:37:15.428643	\N
134	3	12	Dolor consequatur dignissimos enim culpa.	2016-11-15 20:37:15.432515	\N
135	19	24	Numquam sit harum et qui in.	2016-11-15 20:37:15.435792	\N
136	19	36	Sint qui quis.	2016-11-15 20:37:15.439311	\N
137	35	13	Voluptas officiis facere ducimus dicta nihil error iusto.	2016-11-15 20:37:15.441577	\N
138	25	14	Vel ut rerum porro et.	2016-11-15 20:37:15.442791	\N
139	49	0	Est consequatur amet quo velit cupiditate amet asperiores reprehenderit ut.	2016-11-15 20:37:15.474378	\N
140	20	43	Voluptate aspernatur omnis sit.	2016-11-15 20:37:15.475364	\N
141	29	36	Quia at voluptatum iure doloremque sed aut.	2016-11-15 20:37:15.476175	\N
142	39	13	Ratione et similique officia modi non cum laudantium iusto.	2016-11-15 20:37:15.477318	\N
143	26	23	Quam qui omnis dolor dolores.	2016-11-15 20:37:15.481341	\N
144	27	26	Non corporis repellendus velit inventore eveniet non ipsum.	2016-11-15 20:37:15.482768	\N
145	10	39	Facere non ex aut animi unde natus.	2016-11-15 20:37:15.483522	\N
146	25	42	Consequatur quasi eum expedita tenetur tempore quasi aut mollitia.	2016-11-15 20:37:15.484362	\N
147	23	10	Qui sequi recusandae et voluptas possimus natus.	2016-11-15 20:37:15.491569	\N
148	15	0	Sit explicabo nesciunt excepturi adipisci nobis expedita voluptatem.	2016-11-15 20:37:15.511365	\N
149	6	36	Autem explicabo a consequatur ea dolorem sunt quis corrupti.	2016-11-15 20:37:15.5133	\N
150	19	42	Inventore minus aut est voluptatum ipsum.	2016-11-15 20:37:15.515393	\N
151	24	42	Est qui ratione eos et quas et odit qui.	2016-11-15 20:37:15.521141	\N
152	7	0	Nulla qui quia voluptatum et.	2016-11-15 20:43:54.27475	\N
153	3	45	Qui alias atque.	2016-11-15 20:43:54.284227	\N
154	39	36	Cum animi aut est porro earum.	2016-11-15 20:43:54.290867	\N
155	31	32	Ipsum harum eligendi officia necessitatibus praesentium.	2016-11-15 20:43:54.296603	\N
156	0	17	Laboriosam id excepturi reiciendis.	2016-11-15 20:43:54.301367	\N
157	0	22	Dolor recusandae dolorum.	2016-11-15 20:43:54.342583	\N
158	34	1	Nihil velit quod similique dignissimos itaque distinctio delectus.	2016-11-15 20:43:54.357137	\N
159	0	31	Aut nostrum est illum animi sed iure saepe voluptates.	2016-11-15 20:43:54.359693	\N
160	36	19	Autem doloremque expedita minus dolore nihil.	2016-11-15 20:43:54.361846	\N
161	25	11	Id rerum quo repellat et nemo ut ut tenetur dolorem.	2016-11-15 20:43:54.379034	\N
162	15	38	Non ex consectetur laborum cumque excepturi expedita commodi ad.	2016-11-15 20:43:54.380929	\N
163	23	20	Aut velit atque.	2016-11-15 20:43:54.388405	\N
164	15	47	Et sed exercitationem amet quo voluptate natus voluptate perspiciatis voluptatem.	2016-11-15 20:43:54.390276	\N
165	36	6	Animi quia sit et voluptas.	2016-11-15 20:43:54.392749	\N
166	25	4	Fugit autem quisquam consequatur.	2016-11-15 20:43:54.399834	\N
167	23	2	Delectus accusantium qui esse corporis natus.	2016-11-15 20:43:54.400746	\N
168	21	50	Autem eligendi doloribus temporibus aut dolorum aspernatur laudantium.	2016-11-15 20:43:54.402891	\N
169	46	7	Voluptas fugit distinctio voluptas quam.	2016-11-15 20:43:54.406365	\N
170	25	44	Dolor quas accusantium explicabo iusto similique omnis atque.	2016-11-15 20:43:54.410884	\N
171	38	14	Occaecati quia veniam deleniti porro.	2016-11-15 20:43:54.411791	\N
172	45	41	Rem velit eum ratione ut minus aperiam non.	2016-11-15 20:43:54.41256	\N
173	14	30	Nemo neque maxime quis ut praesentium quis ut eveniet dicta.	2016-11-15 20:43:54.417023	\N
174	41	7	Animi aut amet libero repellat sit eos.	2016-11-15 20:43:54.41872	\N
175	8	4	Quidem veritatis et sapiente similique.	2016-11-15 20:43:54.424779	\N
176	26	28	Sit eum placeat sunt aspernatur ullam maiores alias.	2016-11-15 20:43:54.425745	\N
177	27	15	Sed aut dolore accusantium cupiditate hic pariatur.	2016-11-15 20:43:54.426507	\N
178	9	42	Quod molestias numquam ad rem vitae.	2016-11-15 20:43:54.427931	\N
179	27	24	Rem omnis perferendis nostrum quas.	2016-11-15 20:43:54.436744	\N
180	13	14	Ab fugiat repudiandae maxime ipsam qui voluptatem quos.	2016-11-15 20:43:54.437796	\N
181	43	48	Ipsum mollitia est delectus suscipit quae eum.	2016-11-15 20:43:54.439285	\N
182	11	45	Suscipit rerum beatae repellat hic doloremque debitis voluptatibus.	2016-11-15 20:43:54.440869	\N
183	0	0	Nulla quis vel.	2016-11-15 20:43:54.441978	\N
184	37	0	Ea laboriosam ipsa.	2016-11-15 20:43:54.447875	\N
185	21	10	Ut est perspiciatis eos nulla omnis.	2016-11-15 20:43:54.4514	\N
190	17	28	Quod quos optio tenetur veritatis est optio molestiae et sint.	2016-11-15 20:43:54.460313	\N
194	2	26	Ut provident perferendis sit.	2016-11-15 20:43:54.467284	\N
186	27	15	Non qui error id veritatis sed.	2016-11-15 20:43:54.453425	\N
191	17	28	Et in ipsum deserunt facilis quasi.	2016-11-15 20:43:54.461135	\N
195	15	47	Occaecati voluptatem aspernatur dolores voluptas vero facere dolor voluptates.	2016-11-15 20:43:54.468068	\N
187	6	36	Corporis vel voluptatem veritatis a et quaerat.	2016-11-15 20:43:54.454781	\N
192	9	41	Sint praesentium iusto et reprehenderit laborum commodi est ea.	2016-11-15 20:43:54.46189	\N
196	29	50	Aliquam accusamus veritatis quae assumenda architecto dolores natus voluptatibus mollitia.	2016-11-15 20:43:54.535562	\N
188	44	33	Voluptate commodi dignissimos enim sunt aut.	2016-11-15 20:43:54.458267	\N
201	31	25	Qui quasi quia aut at ratione.	2016-11-15 20:43:54.635119	\N
189	23	18	Aliquid aspernatur perferendis.	2016-11-15 20:43:54.459193	\N
193	14	44	Laudantium natus officia neque ea fugit.	2016-11-15 20:43:54.46644	\N
197	32	32	Voluptatem voluptas omnis quidem sed quae quam deleniti consectetur et.	2016-11-15 20:43:54.559687	\N
198	19	12	Praesentium ea numquam corporis quia enim alias.	2016-11-15 20:43:54.567605	\N
199	23	33	Unde quia maiores sunt provident ea asperiores assumenda blanditiis sed.	2016-11-15 20:43:54.592959	\N
200	43	8	Eius sit maxime quod ipsam quasi ad provident consequuntur earum.	2016-11-15 20:43:54.628905	\N
202	38	16	Facere soluta nostrum praesentium sed.	2016-11-15 20:50:27.559102	\N
203	49	20	Aut debitis consequatur esse eos provident id quis.	2016-11-15 20:50:27.572717	\N
204	30	24	Placeat ut voluptas et ut rem voluptatem officiis quod.	2016-11-15 20:50:27.619908	\N
205	7	41	Ut aut voluptatum illum et et velit accusamus est soluta.	2016-11-15 20:50:27.628897	\N
206	26	0	Aut velit est quidem.	2016-11-15 20:50:27.633248	\N
207	15	47	Aut repellendus deserunt.	2016-11-15 20:50:27.651223	\N
208	41	20	Aut quia quia quo.	2016-11-15 20:50:27.655393	\N
209	28	24	Deserunt et quam qui accusamus quibusdam laboriosam in.	2016-11-15 20:50:27.657176	\N
210	0	22	Et qui consectetur ea hic neque ducimus quae.	2016-11-15 20:50:27.656652	\N
211	30	37	Similique ut numquam aperiam qui et et.	2016-11-15 20:50:27.662646	\N
212	13	44	Mollitia quo veniam ut qui blanditiis et excepturi sed.	2016-11-15 20:50:27.664412	\N
213	44	48	Dolores officiis veniam nam labore iste eum voluptatum.	2016-11-15 20:50:27.67044	\N
214	33	15	Praesentium sit necessitatibus perspiciatis quae.	2016-11-15 20:50:27.672347	\N
215	40	8	Blanditiis deleniti non dolor voluptas suscipit quod.	2016-11-15 20:50:27.678315	\N
216	3	47	Sequi necessitatibus explicabo et fugit blanditiis et deleniti vel.	2016-11-15 20:50:27.681107	\N
217	37	31	Iure qui sit omnis.	2016-11-15 20:50:27.682555	\N
218	50	40	Enim debitis dignissimos voluptas est dolorum.	2016-11-15 20:50:27.685013	\N
219	15	5	Eligendi vel rerum dolor et labore et eum occaecati.	2016-11-15 20:50:27.687749	\N
220	13	46	Exercitationem ea occaecati unde aliquam ut.	2016-11-15 20:50:27.691438	\N
221	1	12	Molestias placeat enim.	2016-11-15 20:50:27.693705	\N
222	43	33	Ipsa incidunt et asperiores.	2016-11-15 20:50:27.695909	\N
223	4	38	Molestiae voluptas excepturi.	2016-11-15 20:50:27.70025	\N
224	42	16	Qui incidunt corporis nesciunt vel excepturi voluptatem est consequatur.	2016-11-15 20:50:27.705628	\N
225	47	42	Labore explicabo exercitationem corrupti incidunt.	2016-11-15 20:50:27.707829	\N
226	17	50	Quia numquam reiciendis laborum ab et animi pariatur doloribus.	2016-11-15 20:50:27.724692	\N
227	5	48	Nam rerum debitis ipsam unde exercitationem accusamus.	2016-11-15 20:50:27.73093	\N
228	10	15	Porro eaque exercitationem soluta necessitatibus.	2016-11-15 20:50:27.766222	\N
229	0	7	Ut dolor et natus voluptates.	2016-11-15 20:50:27.76763	\N
230	18	35	Sed dolores sit autem consequatur.	2016-11-15 20:50:27.770082	\N
231	10	48	Ratione ad ut eaque a.	2016-11-15 20:50:27.772052	\N
232	0	17	Nam aliquid cum explicabo.	2016-11-15 20:50:27.77591	\N
233	40	33	Laborum maxime suscipit eos soluta et maiores voluptas.	2016-11-15 20:50:27.778128	\N
234	0	43	Aut dolore ullam necessitatibus adipisci et qui architecto reprehenderit.	2016-11-15 20:50:27.781113	\N
235	4	23	Est nesciunt vel a quia ea sed alias consequatur culpa.	2016-11-15 20:50:27.786058	\N
236	4	43	Doloribus libero ex ducimus quidem dolores.	2016-11-15 20:50:27.789716	\N
237	16	19	Ullam velit eos fugit porro non.	2016-11-15 20:50:27.793097	\N
238	29	2	Totam consequatur dolore placeat libero unde sit blanditiis itaque soluta.	2016-11-15 20:50:27.794569	\N
239	39	0	Et itaque magnam exercitationem aut consectetur.	2016-11-15 20:50:27.79647	\N
240	47	43	Repellat nobis qui.	2016-11-15 20:50:27.799318	\N
241	45	45	Praesentium quas et ducimus dolor non et sapiente quibusdam quo.	2016-11-15 20:50:27.807319	\N
242	33	3	Porro et vero delectus praesentium dolorem qui.	2016-11-15 20:50:27.808173	\N
243	30	0	Cumque molestiae accusantium qui quidem reiciendis possimus dolores dolorum.	2016-11-15 20:50:27.810299	\N
244	24	27	Impedit aut amet.	2016-11-15 20:50:27.81202	\N
245	37	33	Enim blanditiis nulla repellat et.	2016-11-15 20:50:27.815672	\N
246	17	18	Occaecati cumque tenetur optio eaque quod quibusdam.	2016-11-15 20:50:27.818986	\N
247	29	32	Sed et odio mollitia.	2016-11-15 20:50:27.822356	\N
248	10	6	Amet occaecati est voluptate aliquam est.	2016-11-15 20:50:27.825174	\N
249	8	2	Aut aliquid commodi a totam laborum iure nisi.	2016-11-15 20:50:27.82605	\N
250	2	42	Veniam neque fuga est ut placeat quia enim eos.	2016-11-15 20:50:27.828044	\N
251	49	32	Facilis consequatur odit.	2016-11-15 20:50:27.830961	\N
252	32	32	Similique eius ut modi voluptatum cumque non quo.	2016-11-15 20:52:03.976366	\N
253	18	11	Laboriosam impedit laboriosam perspiciatis sint nisi.	2016-11-15 20:52:04.017914	\N
254	48	21	Ducimus quos totam sequi omnis aspernatur dolore impedit quos velit.	2016-11-15 20:52:04.029425	\N
255	41	11	Veritatis qui deleniti accusamus voluptate quos.	2016-11-15 20:52:04.058816	\N
256	14	37	Ut doloremque qui corrupti.	2016-11-15 20:52:04.062586	\N
257	9	41	Quis voluptatum aut impedit asperiores quasi.	2016-11-15 20:52:04.068309	\N
258	30	27	Quasi aut voluptatem sint ut consequatur quia laboriosam qui.	2016-11-15 20:52:04.084395	\N
259	31	35	Quis ut vitae.	2016-11-15 20:52:04.090846	\N
260	42	11	Quia culpa est itaque labore delectus corporis soluta.	2016-11-15 20:52:04.092187	\N
261	1	2	Impedit aspernatur cumque quo tenetur accusantium esse deserunt tempora saepe.	2016-11-15 20:52:04.093504	\N
262	17	41	Quis quisquam fugiat odio.	2016-11-15 20:52:04.095199	\N
263	49	23	Et ut animi laborum.	2016-11-15 20:52:04.099629	\N
264	38	25	Qui omnis ad distinctio non.	2016-11-15 20:52:04.10269	\N
265	50	34	A eligendi porro similique quasi sed porro ad.	2016-11-15 20:52:04.103494	\N
267	28	38	Non eius culpa temporibus laborum.	2016-11-15 20:52:04.108446	\N
266	27	44	Sunt eos magni.	2016-11-15 20:52:04.106714	\N
268	24	1	Ut id reiciendis a qui at quam ipsam architecto error.	2016-11-15 20:52:04.123574	\N
269	45	25	Rerum placeat nostrum earum voluptas ullam officiis.	2016-11-15 20:52:04.125448	\N
270	12	2	Nam voluptate quo et quas.	2016-11-15 20:52:04.132707	\N
271	37	46	Molestiae iure culpa recusandae quis aut quis.	2016-11-15 20:52:04.133887	\N
272	2	31	Aut minus quia impedit maiores officia et id voluptatem quis.	2016-11-15 20:52:04.135369	\N
273	33	0	Repellat consequatur et nam impedit corrupti dolorem quo sequi omnis.	2016-11-15 20:52:04.137161	\N
274	18	35	Eligendi reprehenderit dignissimos saepe necessitatibus nulla debitis sint quam sed.	2016-11-15 20:52:04.139953	\N
275	8	32	Quo nulla temporibus facilis sint id quisquam et.	2016-11-15 20:52:04.143367	\N
276	16	33	Vitae facilis quibusdam ut fugit sed.	2016-11-15 20:52:04.145559	\N
277	11	15	Quia saepe minima consectetur.	2016-11-15 20:52:04.147786	\N
278	18	30	Quo fugit quis magni ut dicta quidem.	2016-11-15 20:52:04.15724	\N
279	47	13	Provident ratione ut sit.	2016-11-15 20:52:04.158946	\N
280	15	28	Voluptatem dolores dicta neque quos.	2016-11-15 20:52:04.161243	\N
281	15	13	Atque esse voluptatem.	2016-11-15 20:52:04.164162	\N
282	48	15	Assumenda illo et omnis quasi similique et nihil quia.	2016-11-15 20:52:04.167142	\N
283	15	31	Aut adipisci minima ut.	2016-11-15 20:52:04.167994	\N
284	18	13	Dolores voluptates dolore perspiciatis ipsum sit quos.	2016-11-15 20:52:04.170278	\N
285	42	11	Beatae aperiam sed ipsa laboriosam ea nihil.	2016-11-15 20:52:04.173804	\N
288	23	46	Incidunt alias sint accusamus aliquid assumenda qui id officia.	2016-11-15 20:52:04.178473	\N
298	6	10	Ipsam in qui provident omnis beatae ratione.	2016-11-15 20:52:04.195329	\N
301	24	16	Et consequatur dolor perspiciatis.	2016-11-15 20:52:04.199838	\N
286	5	19	Magnam vitae aut eos laboriosam.	2016-11-15 20:52:04.175061	\N
289	42	29	Et tenetur et et laborum doloremque.	2016-11-15 20:52:04.179713	\N
299	47	49	Reiciendis esse ducimus autem non et ut.	2016-11-15 20:52:04.196252	\N
287	3	12	Excepturi labore quae.	2016-11-15 20:52:04.176939	\N
290	49	18	Nisi odit alias ducimus.	2016-11-15 20:52:04.182276	\N
296	26	15	A dolorem repudiandae magnam aut.	2016-11-15 20:52:04.19241	\N
291	46	36	Modi ab architecto ut et sed saepe.	2016-11-15 20:52:04.185266	\N
292	27	38	Aut consequatur dignissimos nemo sit.	2016-11-15 20:52:04.18664	\N
295	44	16	Exercitationem molestias et laboriosam et neque est sint velit.	2016-11-15 20:52:04.190934	\N
293	1	13	Architecto optio quas et modi ut explicabo ut.	2016-11-15 20:52:04.187565	\N
297	39	12	Tenetur est dolorem aliquid adipisci illum.	2016-11-15 20:52:04.194157	\N
300	26	14	Accusantium dicta placeat eius quia sed.	2016-11-15 20:52:04.199073	\N
294	22	43	Labore maxime aliquam.	2016-11-15 20:52:04.189666	\N
302	24	44	Tempora aperiam laboriosam ut vel eligendi placeat ut sed ratione.	2016-11-16 08:49:37.688981	\N
303	30	6	Recusandae harum molestias facilis ut dolores at vel.	2016-11-16 08:49:38.646251	\N
304	45	26	Adipisci nemo minus sequi.	2016-11-16 08:49:39.652542	\N
305	45	12	Ea et minus.	2016-11-16 08:49:40.66671	\N
306	13	35	Ut aut reprehenderit in ut quibusdam quia.	2016-11-16 08:49:41.667376	\N
307	13	0	Et nostrum officiis.	2016-11-16 08:49:42.67541	\N
308	34	39	Hic qui ut.	2016-11-16 08:50:51.970181	\N
309	7	24	Provident assumenda consequatur eum sequi occaecati blanditiis.	2016-11-16 08:51:51.952504	\N
310	17	42	In id facilis adipisci itaque quaerat dolor.	2016-11-16 08:52:51.95892	\N
311	16	23	Et voluptatem porro quia ducimus quisquam et voluptatem accusamus.	2016-11-16 08:53:51.946911	\N
312	47	15	Possimus quisquam in deserunt eligendi expedita eveniet enim.	2016-11-16 08:54:07.897088	\N
313	8	11	Harum id labore consequatur explicabo.	2016-11-16 08:54:52.02533	\N
314	14	16	Mollitia vitae quas consequatur ab eum et autem.	2016-11-16 08:55:51.94803	\N
315	40	25	Culpa dolores minima nesciunt quidem et et alias.	2016-11-16 08:56:51.991505	\N
316	6	45	Sint culpa et aut consequatur itaque.	2016-11-16 08:57:51.952061	\N
317	36	46	Quia ut qui blanditiis fugiat itaque possimus rem aut.	2016-11-16 08:58:51.993801	\N
318	35	42	Laboriosam nisi soluta tempore id officiis quibusdam.	2016-11-16 08:59:07.939348	\N
319	27	37	Dolores earum rerum eum est quidem.	2016-11-16 08:59:51.959654	\N
320	42	2	Est iste laboriosam quisquam voluptatem ea quos consequuntur ea.	2016-11-16 09:00:51.962949	\N
321	12	33	Explicabo quis consequatur dolorum in non aut.	2016-11-16 09:01:51.981007	\N
322	23	27	Aut aut illo quo reiciendis optio.	2016-11-16 09:02:51.984487	\N
323	39	5	Aut delectus veritatis.	2016-11-16 09:03:52.042615	\N
324	16	41	Qui esse molestiae.	2016-11-16 09:04:07.950092	\N
325	1	27	Non consequatur aut et quia aut velit voluptas soluta.	2016-11-16 09:04:52.112982	\N
326	5	41	Blanditiis ea nobis animi qui cupiditate.	2016-11-16 09:05:52.060715	\N
327	21	19	Dolor aperiam aut explicabo voluptas ut.	2016-11-16 09:06:52.089906	\N
328	20	50	Dicta voluptas aut.	2016-11-16 09:07:52.185525	\N
329	35	13	Maiores optio perferendis non maxime fuga perferendis doloribus.	2016-11-16 09:08:52.160773	\N
330	33	20	Accusamus doloribus vel explicabo eius consequatur est eligendi et dolorem.	2016-11-16 09:09:07.940768	\N
331	39	22	Sint a omnis ullam dicta sed.	2016-11-16 09:09:52.066462	\N
332	9	46	Suscipit accusamus vel perspiciatis quia.	2016-11-16 09:10:52.068989	\N
333	10	33	Qui quibusdam labore et at dolor rerum.	2016-11-16 09:11:52.079363	\N
334	13	15	Eveniet non quia sit perferendis ea dicta ducimus minima.	2016-11-16 09:12:52.132598	\N
335	39	17	Corrupti in in cupiditate at non ipsum ipsa.	2016-11-16 09:13:52.151847	\N
336	19	14	Sed et qui eius magni error reiciendis vel ipsam eos.	2016-11-16 09:14:07.955308	\N
337	22	42	Ab et dolor atque reprehenderit rerum atque eum animi dolorem.	2016-11-16 09:14:52.105158	\N
338	4	14	Soluta dolorem in nesciunt explicabo molestiae sit vel.	2016-11-16 09:15:52.189836	\N
339	0	24	Ea neque sequi.	2016-11-16 09:16:52.132178	\N
340	12	20	Non et veniam illum assumenda quis.	2016-11-16 09:17:52.149579	\N
341	2	30	Aut tempora velit.	2016-11-16 09:18:52.122192	\N
342	5	16	Aut deleniti et iste atque ex autem amet quisquam.	2016-11-16 09:19:07.965342	\N
343	10	17	Voluptates aut autem ad velit cumque nobis quos.	2016-11-16 09:19:52.136571	\N
344	12	15	Eos saepe id beatae provident.	2016-11-16 09:20:52.151499	\N
345	50	2	Omnis eos exercitationem soluta tempora aliquam.	2016-11-16 09:21:52.203054	\N
346	38	27	Id qui ut quo.	2016-11-16 09:22:52.233056	\N
347	7	21	Tempore nisi accusantium recusandae dicta nemo velit nostrum porro.	2016-11-16 09:23:52.229513	\N
348	43	15	Est qui molestiae deleniti ducimus quia.	2016-11-16 09:24:08.07765	\N
349	16	43	Voluptates placeat et.	2016-11-16 09:24:52.239526	\N
350	24	43	Delectus nihil temporibus quod nisi libero soluta numquam ducimus.	2016-11-16 09:25:52.269339	\N
351	25	22	Necessitatibus dolorem mollitia.	2016-11-16 09:26:52.232717	\N
352	33	4	Magnam minus dignissimos saepe illo quia nemo ut.	2016-11-16 09:27:52.293674	\N
353	19	21	Omnis eos quis dolor exercitationem.	2016-11-16 09:28:52.270297	\N
354	4	6	Sunt consequatur eum sit magnam.	2016-11-16 09:29:08.256193	\N
355	8	17	Quidem eos voluptas.	2016-11-16 09:29:52.348584	\N
356	38	10	Dolor nesciunt quos aut qui qui dolorem molestias eum et.	2016-11-16 09:30:52.379039	\N
357	7	13	Aut iure fugiat facere aliquam et voluptas.	2016-11-16 09:31:52.323175	\N
358	9	17	Sit dolorem optio.	2016-11-16 09:32:52.340775	\N
359	42	14	Magnam facere facere eos dolor nihil.	2016-11-16 09:33:52.372587	\N
360	32	6	Sapiente dolore eveniet nostrum officiis odio voluptas ratione quia sit.	2016-11-16 09:34:08.106243	\N
361	33	23	Sit minus in iusto.	2016-11-16 09:34:52.383551	\N
362	41	20	Non omnis porro est magnam similique tempore.	2016-11-16 09:35:52.3962	\N
363	30	20	Omnis nobis molestiae earum magnam quia dolor aliquid in.	2016-11-16 09:36:52.350473	\N
364	19	16	Eaque ut delectus ut molestiae quia inventore.	2016-11-16 09:37:52.360456	\N
365	10	0	Quas quidem repudiandae commodi ut cumque.	2016-11-16 09:38:50.620401	\N
366	25	13	Nemo doloribus aperiam impedit similique.	2016-11-16 09:39:06.309913	\N
367	50	47	Dolore ea perferendis aut sit consequatur mollitia.	2016-11-16 09:39:50.621	\N
368	36	33	Sunt rerum eaque et eos quisquam hic aspernatur.	2016-11-16 09:40:50.623758	\N
369	22	18	Suscipit maiores velit pariatur blanditiis voluptatibus.	2016-11-16 09:41:50.645013	\N
370	28	28	Hic quo fugit possimus atque et rerum voluptatem rerum.	2016-11-16 10:09:11.0729	\N
371	3	22	Qui ea exercitationem.	2016-11-16 10:09:45.321534	\N
372	8	11	Rem eos dolorum culpa accusantium quam corporis tempora velit fuga.	2016-11-16 10:10:10.305558	\N
373	43	47	Voluptates voluptates id ut adipisci voluptatem temporibus quo.	2016-11-16 10:11:10.357322	\N
374	31	38	Animi aperiam iusto nisi.	2016-11-16 10:12:10.276738	\N
375	3	28	Perspiciatis et dolor.	2016-11-16 10:13:10.318923	\N
376	3	11	Qui expedita corporis in velit ut nihil.	2016-11-16 10:14:10.291797	\N
377	37	22	Aut quia illo labore ratione nobis dolores fugit doloribus.	2016-11-16 10:14:45.34507	\N
378	15	6	Odit nisi commodi aut.	2016-11-16 10:15:10.28496	\N
379	2	12	Et ullam sunt iure sed quia.	2016-11-16 10:16:10.353471	\N
380	32	44	Et quidem occaecati iure temporibus aliquid praesentium.	2016-11-16 10:17:10.361326	\N
381	31	20	Autem aspernatur qui alias.	2016-11-16 10:18:10.303806	\N
382	17	46	Necessitatibus temporibus voluptatem.	2016-11-16 10:19:10.477157	\N
383	39	9	Perferendis aliquam quo consequatur alias sunt nam delectus.	2016-11-16 10:19:45.402079	\N
384	40	19	Ullam recusandae error adipisci.	2016-11-16 10:20:10.393106	\N
385	20	44	Ut omnis exercitationem temporibus quas.	2016-11-16 10:21:10.414873	\N
386	0	13	Quaerat id dolores dolore.	2016-11-16 10:22:10.500661	\N
387	29	25	Commodi velit omnis tenetur rerum nostrum.	2016-11-16 10:23:10.404116	\N
388	14	8	Laudantium nulla sit ullam ab et neque maiores nihil consequatur.	2016-11-16 10:24:10.403422	\N
389	14	41	In et et consequatur fugit voluptas perferendis.	2016-11-16 10:24:45.408042	\N
390	21	3	Incidunt at excepturi possimus repellendus officia ratione eligendi rem.	2016-11-16 10:25:10.406102	\N
391	29	27	Eum est magnam qui dolorem quam.	2016-11-16 10:26:10.410816	\N
392	17	34	Quam enim earum aperiam quaerat.	2016-11-16 10:27:10.422334	\N
393	22	49	Laboriosam harum voluptatem itaque consequuntur laudantium facere consequatur ut.	2016-11-16 10:28:10.453115	\N
394	17	40	Quia qui maxime.	2016-11-16 10:29:10.500023	\N
395	25	48	Magnam nesciunt corrupti ad voluptatem est totam dolor.	2016-11-16 10:29:45.450522	\N
396	24	1	Fugiat sunt quam tenetur.	2016-11-16 10:30:10.447917	\N
397	33	27	Porro iste voluptatem odit deleniti ea quasi aut sint.	2016-11-16 10:31:10.496779	\N
398	38	35	Tempore fugiat ea temporibus.	2016-11-16 10:32:10.49667	\N
399	20	40	Nihil dolores illo reprehenderit voluptas.	2016-11-16 10:33:10.462558	\N
400	7	15	Numquam cum consequuntur.	2016-11-16 10:34:10.467445	\N
401	17	41	Maiores omnis quo reiciendis sint et aut.	2016-11-16 10:34:45.479256	\N
402	8	47	Amet repellendus esse eos sed autem neque.	2016-11-16 10:35:10.473693	\N
403	25	18	Non incidunt quos.	2016-11-16 10:36:10.482474	\N
404	31	32	Sed laborum earum.	2016-11-16 10:37:10.484475	\N
405	1	37	Esse voluptatem ut sit maiores vitae officia.	2016-11-16 10:38:10.483708	\N
406	8	31	Dolorem quis et.	2016-11-16 10:39:10.664926	\N
407	41	7	Nostrum atque et quo consequuntur nobis eaque fuga.	2016-11-16 10:39:45.641703	\N
408	23	23	Impedit eum non.	2016-11-16 10:40:10.669787	\N
409	43	30	Quod est similique et sunt modi voluptas adipisci ratione.	2016-11-16 10:41:10.659499	\N
410	26	30	Vitae et iste consequuntur fugiat alias.	2016-11-16 10:42:10.697447	\N
411	4	23	Veritatis molestias earum et et qui voluptates.	2016-11-16 10:43:10.660886	\N
412	48	11	Deleniti modi harum aperiam excepturi ullam ducimus.	2016-11-16 10:44:10.705353	\N
413	16	32	Optio qui dolore ex qui provident.	2016-11-16 10:44:45.630616	\N
414	32	40	Eum et deleniti rem fugiat tempore tempora voluptas.	2016-11-16 10:45:10.778043	\N
415	30	37	Reiciendis quia veniam.	2016-11-16 10:46:10.77125	\N
416	34	46	Doloribus unde est id suscipit rerum.	2016-11-16 10:47:10.741727	\N
417	35	47	Unde excepturi reprehenderit.	2016-11-16 10:48:10.748199	\N
418	16	12	Praesentium voluptas ut et consequatur quisquam voluptas maxime enim.	2016-11-16 10:49:10.748595	\N
419	43	4	Error quia perspiciatis delectus fuga officia eveniet.	2016-11-16 10:49:45.633662	\N
420	2	44	Velit et itaque aperiam.	2016-11-16 10:50:10.797729	\N
421	16	25	Qui deserunt voluptatem.	2016-11-16 10:51:10.754997	\N
422	24	29	Aut et sed in consequatur amet eaque iste adipisci inventore.	2016-11-16 10:52:10.788225	\N
423	12	18	Non non voluptatem enim nam qui iste.	2016-11-16 10:53:10.780617	\N
424	24	17	Quis amet rerum dicta alias sapiente aspernatur sapiente sit.	2016-11-16 10:54:10.78924	\N
425	9	40	Explicabo et aspernatur aut odit eos quod.	2016-11-16 10:54:45.649441	\N
426	32	15	Quia molestiae enim minima molestias et praesentium fugit quae voluptatibus.	2016-11-16 10:55:10.856436	\N
427	41	40	Impedit assumenda id eos harum.	2016-11-16 10:56:10.838233	\N
428	29	41	Tempora ut inventore voluptatibus alias maiores eius eius.	2016-11-16 10:57:10.837111	\N
429	0	18	Et harum nostrum ducimus eum iusto dolorem.	2016-11-16 10:58:10.876849	\N
430	2	5	Praesentium est quia enim eos officiis dolores at.	2016-11-16 10:59:10.840189	\N
431	4	28	Voluptatum ut est maxime quo occaecati et et assumenda natus.	2016-11-16 10:59:45.646359	\N
432	12	23	Commodi quam aut enim non fugiat minus nihil vitae quia.	2016-11-16 11:00:10.849121	\N
433	9	12	Enim autem labore et minima quo repellendus.	2016-11-16 11:01:10.852496	\N
434	2	37	Fuga quidem cum.	2016-11-16 11:02:10.895935	\N
435	27	35	Adipisci vero possimus magnam voluptas voluptatum dolores numquam mollitia.	2016-11-16 11:03:10.859278	\N
436	50	12	Blanditiis alias id nobis quasi amet sequi neque nulla aliquam.	2016-11-16 11:04:10.863075	\N
437	8	18	Aut qui illum iure velit fugit doloribus odio perferendis.	2016-11-16 11:04:45.645802	\N
438	26	0	Quibusdam consequatur iure eum neque magni itaque rerum laboriosam rerum.	2016-11-16 11:05:10.870516	\N
439	10	35	Laboriosam eaque id ut ut aut.	2016-11-16 11:06:10.884044	\N
440	28	10	Recusandae qui cupiditate dolorum quasi nesciunt rerum atque voluptas.	2016-11-16 11:07:10.93495	\N
441	21	15	Reprehenderit nobis aliquam adipisci.	2016-11-16 11:08:10.932023	\N
442	5	22	Aspernatur dolorum non repellat quidem.	2016-11-16 11:09:10.895061	\N
443	11	49	Dolorem voluptas eum non.	2016-11-16 11:09:45.639192	\N
444	19	5	Perferendis ut quis voluptate quos dignissimos occaecati tempora.	2016-11-16 11:10:10.886975	\N
445	3	28	Sint at soluta sunt dolores consequatur.	2016-11-16 11:11:10.90627	\N
446	43	19	Dolorum odio modi voluptates.	2016-11-16 11:12:10.914015	\N
447	50	22	Dignissimos sunt harum quasi aut.	2016-11-16 11:13:10.903378	\N
448	10	2	Qui adipisci perferendis qui voluptas architecto quas quia.	2016-11-16 11:14:10.918672	\N
449	24	4	Autem dolorum deleniti ut rem earum.	2016-11-16 11:14:45.640689	\N
450	22	40	Aut magnam eveniet necessitatibus rerum sed possimus.	2016-11-16 11:15:10.936927	\N
451	37	0	Eligendi qui molestiae quisquam.	2016-11-16 11:16:10.974284	\N
452	35	29	Expedita nihil velit qui sequi cumque perspiciatis ut.	2016-11-16 11:17:11.203447	\N
453	19	2	Cupiditate ducimus quia recusandae.	2016-11-16 11:18:11.005291	\N
454	38	41	Provident veritatis cum enim excepturi a quibusdam molestias quisquam quasi.	2016-11-16 11:19:10.937092	\N
455	16	19	Et quia numquam.	2016-11-16 11:19:45.662864	\N
456	28	5	Occaecati et quidem.	2016-11-16 11:20:11.00387	\N
457	2	45	Corrupti doloremque non blanditiis fugiat et aut doloremque.	2016-11-16 11:21:10.977796	\N
458	4	22	Expedita magnam debitis at vel eum.	2016-11-16 11:22:10.969895	\N
459	1	17	Ut velit facilis ratione ut.	2016-11-16 11:23:10.977004	\N
460	50	10	Incidunt expedita deserunt qui debitis asperiores nostrum.	2016-11-16 11:24:10.959618	\N
461	10	43	Quisquam sint accusamus quibusdam ex soluta placeat provident ad.	2016-11-16 11:24:45.648698	\N
462	50	22	Cum velit vel aut.	2016-11-16 11:25:11.033132	\N
463	49	1	Inventore occaecati minus dolore deleniti eveniet beatae unde voluptatem qui.	2016-11-16 11:26:11.037318	\N
464	38	6	Voluptas explicabo odit.	2016-11-16 11:27:10.993683	\N
465	43	15	Earum nisi odio et repellendus molestiae accusantium aliquam aut.	2016-11-16 11:28:11.065539	\N
466	28	34	Sed sunt voluptatem sit.	2016-11-16 11:29:11.050829	\N
467	18	11	Aut ipsum in voluptatibus odit qui temporibus nostrum magni.	2016-11-16 11:29:45.661258	\N
468	12	16	Optio magnam molestiae voluptatem consequatur blanditiis et tempora.	2016-11-16 11:30:11.03287	\N
469	37	21	Amet dolor eos in ut aut aut est accusamus.	2016-11-16 11:31:11.047568	\N
470	11	43	Optio officia id quisquam occaecati aut quae dolor.	2016-11-16 11:32:11.075459	\N
471	18	37	Est non est sunt architecto qui unde sequi.	2016-11-16 11:33:11.04292	\N
472	24	33	Sit fugit est ut nisi ut et amet assumenda sed.	2016-11-16 11:34:11.042209	\N
473	33	0	Autem unde culpa quae laborum odio.	2016-11-16 11:34:45.683087	\N
474	6	21	Maxime laudantium tempora autem maxime.	2016-11-16 11:35:11.070755	\N
475	13	38	Sapiente ad totam magnam aut omnis.	2016-11-16 11:36:11.08886	\N
476	42	6	Dolores cumque est vel neque id.	2016-11-16 11:37:11.076571	\N
477	49	45	Est velit vero ut molestiae enim est qui porro.	2016-11-16 11:39:45.710342	\N
478	20	31	Labore repellendus quas magni.	2016-11-16 11:44:45.734385	\N
479	47	21	Et non et architecto autem quasi placeat est.	2016-11-16 11:49:45.723915	\N
480	27	5	Quibusdam ipsum ut in minima dolor a.	2016-11-16 11:54:45.779403	\N
481	1	41	Enim et consequuntur et.	2016-11-16 11:59:45.823926	\N
482	18	42	Reiciendis qui itaque dolorum provident consequuntur beatae assumenda voluptas.	2016-11-16 12:04:46.002543	\N
483	24	0	Molestiae eligendi vero modi itaque in.	2016-11-16 12:09:45.871175	\N
484	10	23	Excepturi dolorum distinctio earum illum.	2016-11-16 12:14:45.834878	\N
485	8	5	Ut enim facere autem exercitationem animi praesentium corrupti aperiam.	2016-11-16 12:19:45.797164	\N
486	16	18	Quam consequatur fugit fugit sequi et possimus vel qui.	2016-11-16 12:24:45.797294	\N
487	17	19	Iure voluptatum velit nostrum possimus unde.	2016-11-16 12:29:45.806339	\N
488	44	8	Earum nisi voluptatem id consectetur sequi.	2016-11-16 12:34:45.81181	\N
489	0	0	Quaerat sapiente atque corporis et eveniet repudiandae omnis.	2016-11-16 12:39:45.819586	\N
490	9	24	Illum veniam sint reiciendis quis.	2016-11-16 12:44:45.819754	\N
491	49	12	Sit autem quae fugiat voluptates enim commodi ut earum.	2016-11-16 12:49:45.826128	\N
492	16	38	Voluptate eos quibusdam voluptatum iste dolor deserunt.	2016-11-16 12:54:45.831615	\N
493	18	28	Nesciunt enim sed vel architecto autem et harum.	2016-11-16 12:59:45.836479	\N
494	25	1	Excepturi explicabo aliquam.	2016-11-16 13:04:45.91362	\N
495	7	0	Nisi velit nobis et consequuntur.	2016-11-16 13:09:45.96556	\N
496	27	11	Maxime sint dicta.	2016-11-16 13:14:46.018566	\N
497	35	48	Aliquam molestias eligendi necessitatibus voluptatum necessitatibus sed culpa est.	2016-11-16 13:19:46.017636	\N
498	45	44	Dolores molestias quasi quidem ut nesciunt tenetur et iure.	2016-11-16 13:24:46.010941	\N
499	18	37	Commodi mollitia nihil quia porro officiis optio.	2016-11-16 13:29:46.016997	\N
500	11	7	Est et eaque natus amet qui beatae qui natus.	2016-11-16 13:34:46.005551	\N
501	21	21	Maiores consectetur voluptatibus.	2016-11-16 13:39:46.015779	\N
502	4	46	Explicabo et quo enim unde dolor qui quia cupiditate.	2016-11-16 13:44:46.025152	\N
503	3	4	Veritatis non aspernatur.	2016-11-16 13:49:46.022041	\N
504	12	27	Vel ipsum qui ab nemo dolore et.	2016-11-16 13:54:46.029429	\N
505	34	43	Fuga eum impedit magnam fugit nostrum ratione quasi vel voluptatibus.	2016-11-16 13:59:46.025105	\N
506	45	24	Et nobis occaecati ut omnis neque.	2016-11-16 14:04:46.024679	\N
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rtyx
--

SELECT pg_catalog.setval('comments_id_seq', 506, true);


--
-- Data for Name: favs; Type: TABLE DATA; Schema: public; Owner: rtyx
--

COPY favs (id, link_id, user_id, creation_date) FROM stdin;
1	27	5	2016-11-16 11:54:45.785263
2	35	23	2016-11-16 11:55:10.723806
3	46	23	2016-11-16 11:55:11.615151
4	1	42	2016-11-16 11:55:12.624659
5	35	36	2016-11-16 11:55:13.630785
6	34	19	2016-11-16 11:55:14.635543
7	26	48	2016-11-16 11:55:15.686135
8	16	37	2016-11-16 11:55:16.68088
9	29	14	2016-11-16 11:55:17.685799
10	13	7	2016-11-16 11:55:18.689572
11	48	1	2016-11-16 11:55:19.699599
12	36	16	2016-11-16 11:55:20.702641
13	45	0	2016-11-16 11:55:21.709
14	46	32	2016-11-16 11:55:22.710498
15	30	33	2016-11-16 11:55:23.717268
16	5	11	2016-11-16 11:55:24.721019
17	30	4	2016-11-16 11:55:25.726834
18	12	0	2016-11-16 11:55:26.730642
19	37	15	2016-11-16 11:55:27.732748
20	40	46	2016-11-16 11:55:28.738999
21	10	21	2016-11-16 11:55:29.745678
22	47	42	2016-11-16 11:55:30.750331
23	31	9	2016-11-16 11:55:31.757309
24	17	42	2016-11-16 11:55:32.760414
25	49	29	2016-11-16 11:55:33.763761
26	15	46	2016-11-16 11:55:34.768588
27	14	31	2016-11-16 11:55:35.775091
28	48	4	2016-11-16 11:55:36.776876
29	6	35	2016-11-16 11:55:37.780072
30	19	0	2016-11-16 11:55:38.785005
31	6	18	2016-11-16 11:55:39.794775
32	8	27	2016-11-16 11:55:40.794561
33	1	43	2016-11-16 11:55:41.79964
34	48	17	2016-11-16 11:55:42.805573
35	6	1	2016-11-16 11:55:43.808216
36	1	10	2016-11-16 11:55:44.810754
37	27	34	2016-11-16 11:55:45.817196
38	7	26	2016-11-16 11:55:46.82153
39	25	36	2016-11-16 11:55:47.827146
40	48	10	2016-11-16 11:55:48.831035
41	8	21	2016-11-16 11:55:49.837022
42	38	24	2016-11-16 11:55:50.843127
43	55	50	2016-11-16 11:56:03.980727
49	56	50	2016-11-16 11:59:44.165326
50	1	41	2016-11-16 11:59:45.8794
54	50	50	2016-11-16 12:00:19.951046
55	48	50	2016-11-16 12:00:47.338181
56	41	50	2016-11-16 12:02:49.638386
57	28	50	2016-11-16 12:03:45.951946
58	43	50	2016-11-16 12:03:52.757434
59	49	50	2016-11-16 12:03:55.98463
62	18	42	2016-11-16 12:04:46.007329
63	24	0	2016-11-16 12:09:45.885368
64	10	23	2016-11-16 12:14:45.840321
65	8	5	2016-11-16 12:19:45.808034
66	16	18	2016-11-16 12:24:45.804397
67	17	19	2016-11-16 12:29:45.817385
68	44	8	2016-11-16 12:34:45.818923
69	0	0	2016-11-16 12:39:45.826038
70	9	24	2016-11-16 12:44:45.831619
71	49	12	2016-11-16 12:49:45.832805
72	16	38	2016-11-16 12:54:45.83924
73	18	28	2016-11-16 12:59:45.845412
74	25	1	2016-11-16 13:04:45.919093
75	\N	50	2016-11-16 13:09:04.148656
76	\N	50	2016-11-16 13:09:22.95882
77	\N	50	2016-11-16 13:09:31.017427
78	\N	50	2016-11-16 13:09:39.092862
79	7	0	2016-11-16 13:09:45.995761
80	\N	50	2016-11-16 13:10:02.129587
83	22	50	2016-11-16 13:10:15.610254
84	27	11	2016-11-16 13:14:46.028644
85	35	48	2016-11-16 13:19:46.03416
86	45	44	2016-11-16 13:24:46.049119
87	18	37	2016-11-16 13:29:46.025231
88	11	7	2016-11-16 13:34:46.019948
89	21	21	2016-11-16 13:39:46.023412
91	4	46	2016-11-16 13:44:46.038684
92	3	4	2016-11-16 13:49:46.036285
93	12	27	2016-11-16 13:54:46.053221
94	34	43	2016-11-16 13:59:46.033701
95	45	24	2016-11-16 14:04:46.033876
\.


--
-- Name: favs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rtyx
--

SELECT pg_catalog.setval('favs_id_seq', 95, true);


--
-- Data for Name: links; Type: TABLE DATA; Schema: public; Owner: rtyx
--

COPY links (id, url, title, comments, creation_date, ogtitle, ogdescription, ogimage, user_id, favs) FROM stdin;
34	http://faustino.name	magnetic static asynchronous	6	2016-11-15 16:22:32.229981	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	15	6
36	https://elmer.info	Kenya	6	2016-11-15 16:22:32.231032	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	20	10
35	http://anne.info	Liechtenstein transmit TCP	10	2016-11-15 16:22:32.230274	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	41	12
12	https://roselyn.biz	Manager	9	2016-11-15 16:22:32.071135	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	46	13
11	http://spencer.name	Savings Account Qatar	8	2016-11-15 16:22:32.069436	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	30	10
15	http://lacy.org	Marshall Islands transmit	17	2016-11-15 16:22:32.073715	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	26	8
7	http://lizeth.net	Supervisor	12	2016-11-15 16:22:32.049965	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	39	12
37	https://penelope.org	GB Manors	9	2016-11-15 16:22:32.238219	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	9	10
41	http://vada.net	driver Gorgeous Fresh Hat	10	2016-11-15 16:22:32.314959	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	45	12
42	http://mazie.net	niches Springs New Zealand Dollar	8	2016-11-15 16:22:32.315804	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	7	7
32	https://rory.biz	strategize Avon Optional	9	2016-11-15 16:22:32.217619	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	9	10
5	https://cristal.info	User-friendly matrices calculate	9	2016-11-15 16:22:32.043849	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	21	6
14	http://mitchell.com	navigating Shoes utilisation	6	2016-11-15 16:22:32.072794	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	25	7
30	https://elenora.biz	Cambridgeshire Investor	9	2016-11-15 16:22:32.215858	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	2	11
19	http://amelia.net	Keyboard digital	11	2016-11-15 16:22:32.164756	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	43	15
56	http://www.seg-social.es/Internet_1/Trabajadores/CotizacionRecaudaci10777/Regimenes/RegimenEspecialTrab10724/TrabAutInfoGen2k9/DebeCoti2k9Cuant/index.htm	Autonomos	0	2016-11-16 11:58:17.281562	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	50	1
27	http://lavina.name	Electronics	11	2016-11-15 16:22:32.212242	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	23	12
9	https://burley.com	Keys HDD deposit	10	2016-11-15 16:22:32.054221	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	39	12
28	https://mozell.org	Jewelery Gorgeous Senior	8	2016-11-15 16:22:32.214825	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	41	10
29	http://torey.name	French Polynesia Practical Steel Cheese	8	2016-11-15 16:22:32.215173	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	6	6
1	http://alexandrea.org	Baby auxiliary 4th generation	9	2016-11-15 16:22:32.035345	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	50	17
24	https://susanna.net	Solutions Computer	15	2016-11-15 16:22:32.210291	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	7	16
40	http://melody.name	primary	7	2016-11-15 16:22:32.240108	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	28	12
31	https://damaris.biz	Gloves bus orchid	11	2016-11-15 16:22:32.216898	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	32	12
4	http://jaiden.biz	Avon neural	13	2016-11-15 16:22:32.044196	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	11	14
23	http://ottilie.org	cross-platform	11	2016-11-15 16:22:32.206281	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	4	7
33	https://gustave.org	Borders	9	2016-11-15 16:22:32.227421	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	4	18
13	https://austin.info	next-generation invoice Officer	10	2016-11-15 16:22:32.071658	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	43	7
22	https://jett.name	Stream	8	2016-11-15 16:22:32.167539	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	9	8
2	http://eunice.com	cross-platform	11	2016-11-15 16:22:32.040141	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	32	11
25	https://jaycee.info	functionalities yellow	12	2016-11-15 16:22:32.211275	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	29	13
39	https://savion.com	Rustic Plastic Ball Berkshire	10	2016-11-15 16:22:32.239403	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	45	6
21	https://alyce.info	Missouri	6	2016-11-15 16:22:32.166222	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	21	9
43	http://teresa.biz	lavender Colombian Peso Unidad de Valor Real niches	13	2016-11-15 16:22:32.317289	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	5	11
3	https://theron.com	Buckinghamshire	9	2016-11-15 16:22:32.040667	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	30	15
17	https://guadalupe.name	innovative migration middleware	14	2016-11-15 16:22:32.074609	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	4	18
6	https://dorcas.net	open-source	7	2016-11-15 16:22:32.048687	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	39	8
45	http://favian.biz	Program Functionality	9	2016-11-15 16:22:32.323241	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	10	11
46	http://francisca.com	Wooden bluetooth SMTP	5	2016-11-15 16:22:32.324456	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	25	5
20	https://lewis.name	green	9	2016-11-15 16:22:32.165524	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	45	12
47	https://quincy.info	South Dakota	9	2016-11-15 16:22:32.329863	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	29	14
26	http://lavada.name	Germany	10	2016-11-15 16:22:32.212007	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	22	9
48	http://adrienne.net	hard drive Assistant	5	2016-11-15 16:22:32.34149	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	33	11
8	https://dasia.name	Generic Granite Sausages Borders	11	2016-11-15 16:22:32.053716	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	6	13
49	http://alysha.info	methodical Borders	11	2016-11-15 16:22:32.348521	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	26	13
38	https://arely.name	fuchsia Rubber	11	2016-11-15 16:22:32.238662	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	44	8
50	https://leann.name	circuit	12	2016-11-15 16:22:32.348805	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	7	10
18	https://alverta.name	experiences real-time program	13	2016-11-15 16:22:32.164465	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	26	7
10	http://pierre.net	Advanced enable	14	2016-11-15 16:22:32.059696	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	22	13
16	https://brooks.name	FTP Centralized	13	2016-11-15 16:22:32.074374	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	14	18
44	https://magnus.info	efficient	8	2016-11-15 16:22:32.322438	\N	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	20	5
\.


--
-- Name: links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rtyx
--

SELECT pg_catalog.setval('links_id_seq', 56, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: rtyx
--

COPY users (id, user_name, email, password) FROM stdin;
1	Susanna.Streich63	Jerrell.Hahn@hotmail.com	$2a$10$yhVsBbX.2nomOi/RrIFxdulxjgx5DeYNXTa83GybdjPTsXSdPju5y
2	Deborah.Kihn	Lawson_Durgan99@gmail.com	$2a$10$HdbL4hkcAhI2SpccSjLAduji8mP0v6irf7gZN8wdWAdFvT0xmzhjy
3	Irma_Bechtelar26	Dejon20@yahoo.com	$2a$10$.kP2qS53L/GpF2X0l64SMOtHSNYMmKWFqch4prXoYVKxE3InnyBVm
4	Reed_Dicki73	Devon12@yahoo.com	$2a$10$jh55wyQT/TBJFQdlTR6jeeEacQ0LIK74eWSFrzQ/JeRU1GF7mTlKq
5	Karine27	Rosalinda46@gmail.com	$2a$10$dLE2o/nL9pkKba9j2RnEZuxLiGI52qD/rc.xtUKjLFeu4.IYWNGuy
6	Edison_Schaefer	Travon_Cruickshank@hotmail.com	$2a$10$t1y.LEyCpiVtzeSgZhtZnOLgU9NCU0KHA7xDJ.JMKCXnha4zEkGp6
7	Michel_Orn44	Wilber_Murphy@gmail.com	$2a$10$dZ19DN8bTh4jeKmIcWofCOWGEv60/aZV46Tk5lqmsW6GNtNvsw4.K
8	Crystel4	Sadie_Nolan@gmail.com	$2a$10$q7iNsmbvl1mXoiYQnOuCEOrseyTrYt/TK2LDZ4nm1K8IhXG7MmSpa
9	Imani69	Robb20@gmail.com	$2a$10$TN3MBqJREgstS2/GCKVTjeF4Q1Z8Nj.8npFt/e6spNbHVMOL/9zGe
10	Maida5	Freda.Schuppe@hotmail.com	$2a$10$ElVpVQ292Oq.7/W5di0Jl.PBFEBYSEZP0qsj2p6bJ.ZqqZTg7FyjG
11	Nora30	Ethel.Weissnat6@yahoo.com	$2a$10$8QARvThPWXFZy1hL5lDBY.D7XWIAVRLnaqZG3QlQwtoPUzB1FnQDe
12	Abraham.Waters93	Clifton95@yahoo.com	$2a$10$7PtzLxpfWnDPJXg5esBmauveeEdoTIZ/ckDVJ4xt0cXdm4vnpviGu
13	Shaina_Gleason	Stanton2@yahoo.com	$2a$10$VJgnb75p27CxsTzG5fSkweFfTa6j7vq7ePoPKZw85ORYEtcp6RH0W
14	Sydney42	Carlos.Swaniawski53@yahoo.com	$2a$10$H51dOlMmZ3XeOphaC0cw3O29U0n878n43jaR7jywS115dEw5hV4gi
15	Alba55	Rory.Terry68@hotmail.com	$2a$10$H0n3iaBgj0m0/A00YEyPY.Tvmlb3/uzXaWfdGxGc1izbAa/U4jzsW
16	Sheldon_McKenzie23	Sarina70@gmail.com	$2a$10$izpxBudAmsrH18NOUMZxMumDEuHPV/2.c1b/IF7TQkM4tS0psB8Wu
17	Alexandra_McLaughlin19	Sabryna_Runolfsson46@yahoo.com	$2a$10$i0yhMwlbMTvpBGwarV8DMu34Nx4ua72cml4zESBAkUnLNpTnhMOmm
18	Kamille.Denesik97	Jolie_Corwin25@gmail.com	$2a$10$JZq2L8LxezCoSXZVwxjoQ.LM86DvnTkJJRC4DWcXiC4TEKKwwq3kq
19	Albin.Abbott4	Zechariah_McGlynn@gmail.com	$2a$10$3BKwvRHlOequeOkFAf9Dae3wPjvjVBVzdjmNA4EJMZdQZKHJQDhDu
20	Boyd6	Johann18@gmail.com	$2a$10$YmPfDWWphO.Ub1oNQlok0.sfYKGHZ7jr0E0nHdEfC1DpInXAVce7m
21	Sammy87	Cyrus58@hotmail.com	$2a$10$mimI4yMggOuDBju.wWZ0IODg4VI8DWCqPqxcWRWROHne43W6NeUAO
22	Laverna.Hegmann29	Wilbert.Barrows86@gmail.com	$2a$10$2TpdsUX..xdpL3hQB562se6ZY2vwsWsEwt7sno1Y3pFxFLoHuhsuS
23	Alysa_Luettgen	Jerrod56@hotmail.com	$2a$10$52WYS2CD5e8XJPDk2N/aEOW0b2cCS87tHi8kQvYGpT.PWtDQB8Cge
24	Josie17	Elton67@gmail.com	$2a$10$ONHbabkJXg3WswrA7MKy/.926v0RUCY9j2nUmPq9NBRt1A6iJxIC.
25	Raphael.Bins13	Jaida.Gibson26@gmail.com	$2a$10$ShU8cqFrlvb0a4sVJnM5XOMl8GmOnzqA6t2cRoMKz3evKO0kIrKfW
26	Carli.Marvin65	Robert.Fisher@gmail.com	$2a$10$XkkOkcMnl/ZqZRXzkRnfAOSJRMvO874qWnGSyz9FqF/vQZNEo7wBm
27	Damian81	Lavada78@gmail.com	$2a$10$Zad0QuWCRSWxnL74nBnYyucpHMP5vszCEXpIgiNI/x5MrB9DQCBAW
28	Carson_Zemlak13	Otha.Ondricka@gmail.com	$2a$10$b9cPItrnFSSrToLp.uf0VecMcw3CsqLSudMtbHTNA9sR2zWgZfKnC
29	Frederique52	Olga.Hickle@yahoo.com	$2a$10$g/Ue4LevYkTGO76xbFCsxeB8nL.dgbJi0Ytp5lCjWHtv/g0MsjrXS
30	Nola0	Violet_Howe21@hotmail.com	$2a$10$eAeKhCddNorol8tZPdAVk.sT2wwrHfRa8F0qzLoLraml3ocrrMHCO
31	Lucienne.Bogisich	Imogene_Ernser22@yahoo.com	$2a$10$QV.gr1DC555p2f59QvPkf.8wLgKyTTwqef/CZAqqpWgwMJe2wXDja
32	Birdie_Wolf	Elvis10@hotmail.com	$2a$10$90XI0BWGvjGdQchgR6cqP.7SFl4b6N7iKhOVj1SHZ8Bv9r7eyOOxC
33	Betsy80	Muhammad_Gutkowski48@yahoo.com	$2a$10$NzP2FyPcUf5rEa6uoTIiS.blnuIzmKo2LlctyacmtmXUTr1n1.ioe
34	Macy.Balistreri	Sheldon_OKon40@hotmail.com	$2a$10$Bx5QtxFpHkD0X2Xfw2wF2.aRVFJzHTNz/p9oSR1HnL7h9Og3nvoCK
35	Clarabelle.Wehner	Bailee.Crooks33@hotmail.com	$2a$10$7dk7.Y9ShTfDo9mfxjw5VudySIIjHjUR8tmgV2W/cwlrBQ8qv/sR2
36	Jedediah68	Xzavier.Runolfsson@gmail.com	$2a$10$MFipNZYTgL2KvmIBPpqiHudiNxGfYfyqxQczsg6dWsg4kZGH3cLw6
37	Alysha9	Hubert.Gutkowski69@yahoo.com	$2a$10$GTwC0stWHpOpogVKx0EQYuD0fDw50Uf3gvaQ32K4B43cQdS3On6YW
38	Adrianna18	Brian_Wilderman@yahoo.com	$2a$10$sZy/DaPjvzitowv6gs.UqeGyw7uwK94mozEd3szWLX6Tu4Q8TgF3G
39	Tyrell.Cartwright	Connor94@gmail.com	$2a$10$hRmBvDONUeU01OeMsnlgmOy3utSTba9papl/MtWiR6hmidWwXqkUK
40	Angelo_Hills	Carlee.Tremblay@gmail.com	$2a$10$4x8bo9C86zrdlUBD4UXGnuondpvzdoR3jfx5vYXqB5qBEOJvtD1qq
41	Jakob_Buckridge	Tianna.Erdman@gmail.com	$2a$10$3geamGm/iqOF6AEK1bIe3OYztCX6fco3YlhpoyjELUgZhic4X2HWC
42	Judge.Stamm35	Quinn_Hessel1@yahoo.com	$2a$10$wBQiAXNpbjujr43ZtDqwnOxAQlJCi0N.du1ZhcbgqPWbqBCKeCRRe
43	Emile_Jaskolski	Margot96@hotmail.com	$2a$10$gwQPy9ljy3f08oyRePsCJeNwu3tAXVFas3zDkWpOsvooTS.3DLC3C
44	Delores.Jacobi26	Queenie.Hartmann@hotmail.com	$2a$10$277zEhRhwVDvqC7tTPbYb.lhxMvwWPBXjVPbjUBCoJ7b/ZB19U9LK
45	Rashad_Watsica96	Emelie60@yahoo.com	$2a$10$fUSMNEBIJUCHB2vm3j5gOuhBfMfkpL8M/zp8sgjN7xC.x288oDyje
46	Jordan.Hammes93	Stephania80@hotmail.com	$2a$10$CrIoRi8fCppH7FyOqDV9zO06Gkh/v8UyxLXhYOyPL5cSA1vmqSVYq
47	Maci23	Anderson67@yahoo.com	$2a$10$NLZTLA4DJhou3BsBowiMveTpDizU2I1Z8xYw0X91ftmgNBiZvj4w2
48	Kaylie.Kerluke	Alena_Anderson7@yahoo.com	$2a$10$2XX/9C5quzzfRUXNYpCK3e2UtWl0rY9TCWGKlfZbLQ5qIFR1uiZ1G
49	Lenna_Kuphal	Judge_Raynor75@hotmail.com	$2a$10$EdxLJGiOko/cnIsrtroTi.t.blvkRcweIR36DLR7uUpZ8.CypAi5K
50	Ashly67	Mateo_Shields59@yahoo.com	$2a$10$ZHfd99Po5p/Y1cMTVFfB..q.jtDDHSNq3VPOZmpJDoWU7pPW1CBHO
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rtyx
--

SELECT pg_catalog.setval('users_id_seq', 50, true);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: rtyx
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: favs favs_pkey; Type: CONSTRAINT; Schema: public; Owner: rtyx
--

ALTER TABLE ONLY favs
    ADD CONSTRAINT favs_pkey PRIMARY KEY (id);


--
-- Name: links links_pkey; Type: CONSTRAINT; Schema: public; Owner: rtyx
--

ALTER TABLE ONLY links
    ADD CONSTRAINT links_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: rtyx
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: uq_favs; Type: INDEX; Schema: public; Owner: rtyx
--

CREATE UNIQUE INDEX uq_favs ON favs USING btree (link_id, user_id);


--
-- PostgreSQL database dump complete
--

