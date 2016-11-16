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

--

CREATE TABLE links (
    id integer NOT NULL,
    url text NOT NULL,
    title character varying(255) NOT NULL,
    comments integer,
    creation_date timestamp without time zone DEFAULT now(),
    ogtitle character varying(255),
    ogimage text DEFAULT 'http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg'::text,
    ogdescription text,
    user_id integer
);




--

--

CREATE SEQUENCE links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




--

--

ALTER SEQUENCE links_id_seq OWNED BY links.id;


--

--

CREATE TABLE users (
    id integer NOT NULL,
    user_name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL
);



--

--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




--

--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
--

ALTER TABLE ONLY links ALTER COLUMN id SET DEFAULT nextval('links_id_seq'::regclass);


--

--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--

--

COPY links (id, url, title, comments, creation_date, ogtitle, ogimage, ogdescription, user_id) FROM stdin;
215	http://lorenz.net	Buckinghamshire	\N	2016-11-10 16:22:37.008605	Get an email address at lorenz.net. It's ad-free, reliable email that's based on your own name | lorenz.net	http://lorenz.net/assets/realnames-50923a6bf6a76a632d7f744137b6842b.png	With RealNames, your email address is your name. You get email without ads that works with your favorite email program, in your web browser, and on your mobile phone or tablet.	49734
216	http://lucas.net	generate client-server	\N	2016-11-10 16:22:37.020201	Get an email address at lucas.net. It's ad-free, reliable email that's based on your own name | lucas.net	http://lucas.net/assets/realnames-50923a6bf6a76a632d7f744137b6842b.png	With RealNames, your email address is your name. You get email without ads that works with your favorite email program, in your web browser, and on your mobile phone or tablet.	50462
218	http://terrill.com	payment solid state	\N	2016-11-10 16:23:08.719679	Get an email address at terrill.com. It's ad-free, reliable email that's based on your own name | terrill.com	http://terrill.com/assets/realnames-50923a6bf6a76a632d7f744137b6842b.png	With RealNames, your email address is your name. You get email without ads that works with your favorite email program, in your web browser, and on your mobile phone or tablet.	73950
219	http://ruben.com	Developer Concrete	\N	2016-11-10 16:23:09.120866	Get an email address at ruben.com. It's ad-free, reliable email that's based on your own name | ruben.com	http://ruben.com/assets/realnames-50923a6bf6a76a632d7f744137b6842b.png	With RealNames, your email address is your name. You get email without ads that works with your favorite email program, in your web browser, and on your mobile phone or tablet.	70937
220	http://maximillia.com	Wells blue Customer	\N	2016-11-10 16:23:09.25238	Maximillia	//cdn.shopify.com/s/files/1/0170/8996/t/17/assets/header-logo.jpg?1075068475134906165	Free worldwide express Delivery on all orders over AU$100 and no import fees.	92080
221	https://freeman.com	Borders quantifying	\N	2016-11-10 16:23:09.354162	Home | Freeman | Leading Innovation in Brand Experience	https://s3.amazonaws.com/freeman-craft-assets/team/freeman.png	Freeman is a leading provider of integrated services for face-to-face marketing, specializing in convention management and trade show management.	5093
222	http://josephine.com	Shoals	\N	2016-11-10 16:23:10.613004	Josephine: Get Home Cooked Food From Your Neighbors	https://d38vx5lzznpfzl.cloudfront.net/assets/fb_share-7eee6a16afce29fc07051742404b4c7427de5f12b3b493f74929e9e478ef4e78.jpg	Order delicious home cooked meals online and pick them up directly\n            from loving cooks near you. Cheaper than delivery. Better than\n            take-out. Eat like family.	19105
217	http://buck.org	USB Computers mobile	3	2016-11-10 16:22:37.026253	Get an email address at buck.org. It's ad-free, reliable email that's based on your own name | buck.org	http://buck.org/assets/realnames-50923a6bf6a76a632d7f744137b6842b.png	With RealNames, your email address is your name. You get email without ads that works with your favorite email program, in your web browser, and on your mobile phone or tablet.	72440
223	https://clarissa.info	CSS matrix B2C	0	2016-11-10 16:37:02.869247	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	34420
224	http://margarita.info	payment quantifying	0	2016-11-10 16:37:02.88578	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	80870
225	http://yadira.com	Cyprus Yen	0	2016-11-10 16:37:02.889841	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	62785
226	http://lincoln.org	ROI Associate	0	2016-11-10 16:37:02.894226	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	71093
227	http://jerald.com	Club Wisconsin	0	2016-11-10 16:37:02.897991	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	55899
228	https://conrad.biz	backing up	0	2016-11-10 16:37:02.910128	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	69796
229	http://joel.com	Functionality	0	2016-11-10 16:37:02.913919	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	2223
230	https://william.biz	Fish	0	2016-11-10 16:37:02.919824	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	16185
231	http://bernadette.org	Bahrain Rustic Concrete Bike	0	2016-11-10 16:37:02.927079	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	6923
232	https://erin.net	bypassing success Unbranded Frozen Hat	0	2016-11-10 16:37:02.952147	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	33846
233	http://angelita.net	real-time ivory calculate	0	2016-11-10 16:37:07.67524	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	47492
234	http://micheal.com	CFA Franc BCEAO ubiquitous connecting	0	2016-11-10 16:37:07.67877	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	9392
235	http://javier.name	invoice Checking Account Gorgeous Rubber Keyboard	0	2016-11-10 16:37:07.682793	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	99892
236	http://erna.name	Automated	0	2016-11-10 16:37:07.684159	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	31841
237	https://abigale.info	Lempira system Industrial	0	2016-11-10 16:37:07.687714	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	42797
238	https://madalyn.com	COM	0	2016-11-10 16:37:07.690217	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	4792
239	http://amaya.net	Mouse	0	2016-11-10 16:37:07.691236	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	22632
240	http://eileen.com	mobile input	0	2016-11-10 16:37:07.694092	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	62044
241	http://naomie.name	system	0	2016-11-10 16:37:07.695003	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	53191
242	http://darryl.biz	Specialist	0	2016-11-10 16:37:07.712085	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	45673
243	http://chris.name	open-source Brand payment	0	2016-11-10 16:37:07.710433	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	60790
244	https://garret.biz	programming microchip Clothing	0	2016-11-10 16:37:07.714624	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	15607
245	http://shanie.org	Function-based Executive Intranet	0	2016-11-10 16:37:07.715317	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	38544
246	http://arlo.com	Automated Dominica	0	2016-11-10 16:37:07.716441	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	83669
254	http://faye.com	cutting-edge	0	2016-11-10 16:37:07.731689	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	71746
264	https://arely.com	Checking Account Branch brand	0	2016-11-10 16:37:07.752893	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	29149
272	https://orie.name	action-items optimizing	0	2016-11-10 16:37:07.768654	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	54434
281	https://doug.info	neural Clothing	0	2016-11-10 16:37:07.792623	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	65266
247	http://rylee.com	Table Savings Account	0	2016-11-10 16:37:07.71755	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	24151
255	https://zoey.info	Handcrafted Wooden Salad Legacy programming	0	2016-11-10 16:37:07.738628	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	91307
265	https://ari.org	interfaces withdrawal	0	2016-11-10 16:37:07.758237	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	10885
273	http://broderick.com	invoice Berkshire	0	2016-11-10 16:37:07.768915	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	60537
282	http://alba.com	Architect CSS	0	2016-11-10 16:37:07.793717	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	8902
248	http://tyson.com	Cambridgeshire integrated Hong Kong Dollar	0	2016-11-10 16:37:07.717966	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	84141
256	https://daniella.net	deposit PNG Philippines	0	2016-11-10 16:37:07.741111	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	56039
266	http://randy.org	Investment Account Baby SQL	0	2016-11-10 16:37:07.759164	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	88307
274	http://antonio.info	Bedfordshire	0	2016-11-10 16:37:07.770727	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	16788
249	https://brenda.info	Circle Station Shirt	0	2016-11-10 16:37:07.718684	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	66297
257	http://alan.name	productivity	0	2016-11-10 16:37:07.74354	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	71055
267	https://lavina.com	Human synthesize copy	0	2016-11-10 16:37:07.759485	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	73829
275	http://anais.biz	Kroon neural	0	2016-11-10 16:37:07.771747	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	15149
250	https://breanne.name	Djibouti	0	2016-11-10 16:37:07.719136	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	30562
259	https://joanie.org	Shoes Chicken	0	2016-11-10 16:37:07.748414	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	11492
268	https://arvel.org	Pennsylvania Pants Representative	0	2016-11-10 16:37:07.766953	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	48534
251	http://erna.net	protocol	0	2016-11-10 16:37:07.722596	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	24552
261	https://mervin.org	program quantifying	0	2016-11-10 16:37:07.75176	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	86817
269	http://albina.info	Cambridgeshire National	0	2016-11-10 16:37:07.767383	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	86990
278	https://adah.net	cyan Moldovan Leu	0	2016-11-10 16:37:07.780883	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	47678
252	https://myrna.biz	Place	0	2016-11-10 16:37:07.725147	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	22000
262	https://dane.info	mobile	0	2016-11-10 16:37:07.752033	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	46971
270	https://charley.name	Interactions	0	2016-11-10 16:37:07.767834	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	31656
279	http://deondre.info	North Carolina paradigm	0	2016-11-10 16:37:07.782025	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	43081
253	http://una.biz	Assurance Electronics	0	2016-11-10 16:37:07.729845	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	62290
263	http://cooper.info	copy 24 hour	0	2016-11-10 16:37:07.752623	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	28903
271	http://chasity.info	redundant	0	2016-11-10 16:37:07.768271	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	10961
280	https://abner.name	payment Suriname Turks and Caicos Islands	0	2016-11-10 16:37:07.791399	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	65333
258	https://jasper.name	withdrawal	0	2016-11-10 16:37:07.745403	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	53672
277	http://alvina.org	Inverse United States Minor Outlying Islands	0	2016-11-10 16:37:07.773671	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	77011
260	http://abdul.name	Malaysian Ringgit Steel Vermont	0	2016-11-10 16:37:07.75028	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	93420
276	https://theresa.biz	Cameroon Refined	0	2016-11-10 16:37:07.77336	\N	http://orig11.deviantart.net/41fc/f/2013/127/5/7/toon_link_by_sp415-d64ek9l.jpg	\N	40617
283	https://scotch.io/tutorials/laravel-social-authentication-with-socialite	Scotch	0	2016-11-10 16:46:06.743195	Laravel Social Authentication with Socialite	https://scotch.io/wp-content/uploads/2016/11/XlpqsqtvSBSVByrIMKpP_laravel-social-authentication.png.jpg	Laravel introduced a built in Authentication module in version 5.2. To set this up, you just  have to run php artisan make:auth and...	121
\.


--
--

SELECT pg_catalog.setval('links_id_seq', 283, true);




COPY users (id, user_name, email, password) FROM stdin;
1	Niko Marquardt DVM	Annamarie_Feil80@yahoo.com	$2a$10$hSKqT5JduC.lGgnUqIvLc.L2ntgp0n8L7WsfWcYa58In44PapHIcq
2	Toby Davis	Gennaro96@hotmail.com	$2a$10$1ZfB7Gq6qvOoCbRwgZettO.QTkde9v3VoxCMLz1EF44FkkqgW91dm
3	Rylan Labadie	Stephon.Sauer13@hotmail.com	$2a$10$UUU1YHcagXgRPb8k1cXm1.dfAPx2BaH0/5RVYqxIyNAJlX1UU4Xn6
4	Bettie Lowe	Justyn2@yahoo.com	$2a$10$RV78x130zMeX/t.0e6jLrOWLRJbFbdldUINCqi5djJrk.jFW4lEOe
5	Asha Rogahn DVM	Janis.Will@hotmail.com	$2a$10$3ruqv2cJuXCWvDvP3s/vheTFp1XxrtF/dTrc5gTND4az2FfUbPXZy
6	Jane Rolfson PhD	Tina.Bergnaum@yahoo.com	$2a$10$v5n.BuCTz6S1.o7xinrL1epuzmLX9QIz6pa5TLgXvZkg38LGDA9Ee
7	Gussie Heidenreich	Waylon_Hane@gmail.com	$2a$10$qI2/hq9cGBE8CZoSrQAC.Ow4slynGsm08M2w/oEVuWfc48s4iSlnC
8	Salvatore Weimann	Dashawn92@hotmail.com	$2a$10$s9GI45RBOn6GO9w.rEltrevUT4wHEZ8GaLZvp95ykMP4yRMWaIAu.
9	Rashad Welch	Hermina.Kovacek@gmail.com	$2a$10$1pKLCfLAP3FN2vfoRcYgHeCXjPM4xAVbfqW6giWWXqtblCfmfxuo.
10	Mayra Bins	Austen.Gleichner90@gmail.com	$2a$10$7qQwlf2q6qti9PCbXi./AOaN1J0kKafcNZvAxg5NZuORRGpmkHSh.
11	Sandrine Pollich V	Chadrick_Hackett83@yahoo.com	$2a$10$7vIBFdZ9bAqmmYXUoNEIm.ZT9gyHmZA1WxynHiBJ3PVS3E3qn8gTu
12	Trinity Ortiz	Lowell.Watsica@hotmail.com	$2a$10$SWAZBvmtkzhQOfG1BUieBuv7VeozBXxJFJf0F7kkaNYTpR0FxHt7G
13	Willard Schmidt	Aracely.Zemlak@yahoo.com	$2a$10$9a4rA85LERDBRH4zHtigxeaavLEUMuZkruDdePayFoUqMLXtvSC5O
14	Rene Dickinson	Nathanial.Ritchie42@gmail.com	$2a$10$js/Hu8knWGYVrT.SNlTAf.04OocXYx8PpFiBUyY1YlKbcClSiY2GO
15	Marty Wilderman Jr.	Ulices_Wyman@gmail.com	$2a$10$45aiJfIiLHbmSWurIkejV.JpvW91flIu8AC.l9SvK7ibX5lLXL2he
16	Valentina Rolfson	Elinor.Cormier39@gmail.com	$2a$10$fYa6PecljrDVfR6u8Y17G.o6KqVeyCiyAtxFcvoaIr0fCoYgA1VHK
17	Oral Walsh	Tod.Schamberger@hotmail.com	$2a$10$qnE33/.XLvXeNaT65GRWz.fneGssig3a4ZFEg0fJq2DFibDyTDohW
18	Justen Purdy	Jesus46@hotmail.com	$2a$10$L5a8JJHPGgkZTv6yoQ7kW.3XNPUqWNp.qoTX.cQmtDk1yeFRKczF2
19	Vincent MacGyver	Matilda.Tremblay42@yahoo.com	$2a$10$qmKP7pH71ko/f1h/3sZ3devlyOG0dXBq1xr8aY9U1W.3Rw4.1UWv.
20	Cecil Cole	Shanon19@yahoo.com	$2a$10$NChkCp1TunvBKOfkI53s7.3Kqbw8QBwrG.No.ef8O2jipT6atZlJ2
21	Delpha Casper	Freddie_Gaylord3@yahoo.com	$2a$10$Juu7DTu5hJvYivPpXYTtceDC/O0DYzJDAEzYY6VxatQwtubgAeb8a
22	Cruz Parker	Alfonzo_Gleason48@hotmail.com	$2a$10$KNHYs5cfNPjyQabzo610P.2tUojjXFkpT3.ghko6PGIsiat.MdRa2
23	Austyn Emard	Alejandra.Stanton@gmail.com	$2a$10$.dKGsPzcilSQiHaM.GEnJe3l5nG30EU7nfbGsx7OFKjRHiQEogJeu
24	Sabryna Terry	Terrance28@gmail.com	$2a$10$RxA6ga./CJgRi2Cbwmrtuulv4TAdjSN34DRTY4Ej6vEGbQNdGcqGi
25	Kailey Jones I	Kay.Lesch@hotmail.com	$2a$10$dj3TkcsJNjFAqeGT1HC3rO8f0J1TSaaJau0762SZ3j0dGIPrpKcga
26	Sandra Dooley	Zetta.Auer35@hotmail.com	$2a$10$RLXX.OVVf38ZT5Adm3t0Q.pYdS2n305AjurK2a4Thqabk3LLDo7uK
27	Edison Torphy	Jennings21@gmail.com	$2a$10$JGcYHmi/VWSONFd2cATUKOYPf9vXKwr77aXAvYQcBUqmJtMxSVVQm
28	Ms. Faye Durgan	Keanu70@yahoo.com	$2a$10$BNSlIz3aKuGBGHXixtZ7zO2mQ2hbMd8U2OrS.2KUnxTuM0F7bMwSq
29	Rosina Kuvalis Jr.	Sarina_Kuphal39@yahoo.com	$2a$10$2PZIdj6CNBhQaR3gKTg7OeuHbpfh4eHDKvnv4EY6eKUEoM.i3Vrqu
30	Veda Jacobi	Jaquan.Roob@gmail.com	$2a$10$kZTlR3atCy.COaOywL3kk.8g.YhU2.g8Ap/JdmVE87KYBjG7mc6l2
31	Hoyt Haag	Aaron79@yahoo.com	$2a$10$bMxpRV4tT/zPOoIHzX7x8.m4dpmGeUubkuPZ7lYq1GiYRdzGrxe8e
32	Myles Streich	Malachi_Gusikowski@yahoo.com	$2a$10$.2f2MYc/H2sqWRx4cjSO8.PB4tjzVH5why3gvitfAQTHacAwrUt0G
33	Verla Schmeler	Kyler54@yahoo.com	$2a$10$kw0Dto4CFwjJ7J7xZL3lDOds3nlSVtzQRcjMU6qwSi6VaZcQ0XaQi
34	Veda Nicolas	Liliana94@gmail.com	$2a$10$6ciD3TCnf1oCUccMt4p7L.onMm1UsM.GGfeAlx8Vx.bJErgn1dkXy
35	Samara Veum Sr.	Claude_Johnston@gmail.com	$2a$10$wxYRVxkJD9LkLKtBiHakSecurWoDBdPomixSsgO0FkRIi5CCYf4kK
36	Rigoberto Mann	Joel_Reinger18@hotmail.com	$2a$10$5f/VIosPPl5/G0VhB5bqLOXMFqjgLEahXBQg9oqdSYCNmGyCU6Y7i
37	Andres Cassin	Salvador.Predovic44@gmail.com	$2a$10$4CTvN/6FJcwPrH8Du4P3yOWYJyxJ4w9pp42WZWQF2LevesnNlpzRe
38	Ashlee Steuber	Maia_Bogisich@hotmail.com	$2a$10$dGZYOjavSHI0WmnCdamXEOjAyLnQkSUavORfBzhXJk5eG1pELawZi
39	Cary Schuster	Uriel_Moore16@hotmail.com	$2a$10$GzvzyM3UFZIDkVdf0/BCtO56KWMtYMeycHnUaIgbdXFxbxtJcip5O
40	Johann Little	Isidro_Rippin84@hotmail.com	$2a$10$BVEqwLq0ZgDTTisOuijPhOQmUIACDgbki1oMG4qcz8iWAdEgCrQHC
41	Dr. Austyn Kling	Renee71@gmail.com	$2a$10$ltjtPDTCytQ8WtHfVg8vre3g.xCh.vp6WRsJm9yDGCdm6JmHuzWHq
42	Efren Lynch	Harmony.Witting@hotmail.com	$2a$10$.DAZNty3hy8TadBBi1i.j.03NYnTTUEmutz6wTSIGN/Pg5UuX1t5S
43	Davon Emard	Haylee79@gmail.com	$2a$10$8ibDJLSrupLqJTH48vFKA.XSSLKIzzxtfz/30U/VgWbmXJ6UVF47O
44	Alysha Adams	Curtis.Treutel@hotmail.com	$2a$10$Cw0F83Gd1MpAsTh4cDGWH.BtJ5/LGFik7M2vNU0cp6/95KAhCKsLy
45	Tianna Mosciski	Maida_Okuneva89@gmail.com	$2a$10$ZGprzZ4HygKvbKN85ZwCJ.W/LFFQjKQ4xEXLtGm/TvacC0FOu3Ky.
46	Dewayne Schmeler	Leanne_Nader@gmail.com	$2a$10$6HZM3VkMZGLOzi/ZqB9sX.CwJrRgqQY7e0Q29OWh.fOaoYWmOZAP.
47	Mrs. Marianna Turner	Frankie85@yahoo.com	$2a$10$AhZHuz0ERiMLVBgtkJmDCuhEnXdKIFO2G15DoWJWVEfahqSBwomEa
48	Jenifer Barrows	Margarita.Kunze@yahoo.com	$2a$10$rBucbh1FxLXnETPdl4iYTO6slRpXqSakdDvm/pbyF3STZmW/W1Doe
49	Randal Labadie	Reid_Blick55@gmail.com	$2a$10$Sg.rzu17gLs8A5Nsvxi5fuBAIhaA2sCZew5xR6/2SiYYf3Bj5O93y
50	Lavonne Rogahn	Jamie41@yahoo.com	$2a$10$RC4oLlDbuE7EqR2mcS2L/uV46uWGcaFzY3TgS9oitB0Uiyd15oX5G
51	Anais Hand	Maybell_Koepp39@hotmail.com	$2a$10$G9uyOL2GKRhah9DMhOU08uvRWVnAHQ7k9GvN5yX.8hmpmasQG199m
52	Ray Kessler	Selena_Zulauf@gmail.com	$2a$10$pKi0c3xYeJK.gJDpn.Z3zuq/c5ILGEyCVFFWC2pGIpLtqbAl2tr3W
53	Leslie Frami	Hobart83@yahoo.com	$2a$10$sCHt0CYdlp.I9ixqF551P.sMKEG6Ye7NS3VVP523kpCXZdB5m1ikm
54	Ms. Deondre Schroeder	Frida_Jacobi@yahoo.com	$2a$10$VxZOLkKirm4N6WRu2AnO3.RJaNZh1VlryMWT31FTH1ayhBKJXY062
55	George Crona	Lloyd_Lind@yahoo.com	$2a$10$QEbz/xUhEvoCBYbT7lkDAOxH5OvAf4Wr.5fzydqxtDdbZU1lQqZBC
56	Hazel Hoeger	Frederic83@gmail.com	$2a$10$7slA9/JheDvPrPQoo.Nf..Y1lNwLnc5JL.WcoXoJwJM/OFtK9PnZ.
57	Ellis Beer	Libbie_Rippin30@gmail.com	$2a$10$7ebFqX8L05MRbZKEWk5Wb.rMOF0zCv.YBQXZYbPuuDb.6GS8pS7s6
58	Alvera Steuber	Bertrand_Treutel@hotmail.com	$2a$10$LhfKRNz6V.NnGBmZ2mdSQurAb2zPyHZznFXNcsNW12d0i9mjvkqqO
59	Ms. Juliana Huel	Lauriane.Bailey8@yahoo.com	$2a$10$5hkJEtb8WQfb8F94mxYaZe95Ow.NxKpILBNEekmjZ0D0vh07Me0Si
60	Lucious Mosciski	Dave59@yahoo.com	$2a$10$.HgoHW7QN5M.kin5eVHfxesCyOC5xdFKYpgB4V5zfPdnouVvEVWxi
61	Dolores Huels DVM	Ilene20@yahoo.com	$2a$10$2kVY5pY4s9P6ZfXdKlJyzuojSRR0271jMZqU5JkdcU6XCydwfbLpS
65	Jabari O'Connell	Mossie_Barrows51@hotmail.com	$2a$10$ApD3fxwuCrIb/UbL30LsAuRgEnCUDdclzledF3YoajqH0YieRQwZW
69	Rosetta Hackett	Lilyan6@yahoo.com	$2a$10$AG8VDy4.oPqKt3lqOBcsZufr7hMNXWJ./y/mRH0h0ZVzVjWeaDRbi
72	Miss Eleanora O'Reilly	Chanelle_Bogan@hotmail.com	$2a$10$KkWVzVWXCKAr8j/4Gybz1OZWiXMRW9vZN9UhTDNpGSl9fzCaxGjuu
76	Wyatt Paucek	Arvel_Schoen@yahoo.com	$2a$10$RxbAdA.d1IfhzYdNePGDKuYAg1A0kp5TF/Hr8lvSaf6Ggsa6XZzfi
80	Mason Ankunding	Lamar_Cartwright@gmail.com	$2a$10$KQDkJu8bQbfE8X5AOI8VY.he9tkhEeApwjqj76xpj7SuXs/KxV/GC
86	Maximillian Hilll V	Virgie.Hartmann44@yahoo.com	$2a$10$2Y.8kwl4rK53p.8N2SdCwe88HIhz5ZtG1tizkenAKzuvIs2yUvGrq
92	Nathen Lakin	Veronica.Simonis74@gmail.com	$2a$10$Nvmhk6ShCiZUkfrqX2BC5eD0qPtlWtWs5SFd.Lvw6DDPMcTF7R0ee
99	Leslie Hammes	Amelie_Mann@hotmail.com	$2a$10$z20d11PaIzqBkxom4qpLM.gBrMjqv/LEHliKTpu4A6HoNbWli/nKW
107	Margret Cummings	Anne41@hotmail.com	$2a$10$a2i98Ivsg/qdWkivdMGM1OwaxoydVQLLiu75Qj8oHJPLyxmSkVkne
115	Jonatan Windler I	Lukas.Lind@hotmail.com	$2a$10$pi.UAtptFXgr2mVo2u1S8u4iiMbyPKQxk9z/3Cq.RGUJecGyoBIVK
62	Jayme Kshlerin	Barrett.Champlin@yahoo.com	$2a$10$IvzeaOHcs43ZRJMEDpcL9uykqA.fM6ne/m0Lpns1I1trjpxy5kyn.
67	Ima Reinger	Joanne_Witting33@yahoo.com	$2a$10$r5NmSOpgMevlSU9giny9E..OtgSub/NYGVe/Acm2GozZwVFWQ1ULq
70	Stacey Heidenreich	Sigmund75@gmail.com	$2a$10$MJeJ.cy0z.cOpNOyf82uU.moI/SGdBb91SlruzpKK7S/E62d2jQhu
74	Violette Cummings	Gracie_Hegmann63@hotmail.com	$2a$10$jC3osbjinKPoH1xBtToW0eGAoldiUA041VyDK.3kPCNxVg175Uvny
78	Eleanora Kuphal	Angus62@hotmail.com	$2a$10$Hox7DXm9bpEbzh.tFWfweevNh97ftC32UjH37XCUMguXffIsxWuNi
83	Jazmin McDermott	Addison_Mayert@hotmail.com	$2a$10$T2pRepdXMPZkMd79382AuuhjV4W.LwzO0qgYE1IGS47jEqsaxMz0i
84	Jazmin Hilpert	Theodora29@hotmail.com	$2a$10$/uTa4wpIQtGc.SJTEalVZeGlnKpoF852Ty.Es4poTsHf.y00OFZa.
89	Dr. Ronaldo Waelchi	Jesse_Daniel@gmail.com	$2a$10$BPmu0BYXLNBkYHx.caucJeMbqzmrDk3PvzLcZxhMW.yp/Jh7ToXai
93	Alvena Nicolas	Ayla.Price4@yahoo.com	$2a$10$HbXgD44hTKENOTVDLwox4.8HH/xKSy6GN5r5B2F0ddzi4np1IIHZC
97	Elwyn King	Alva99@gmail.com	$2a$10$uXv2cRDu2s74.CqXiYKyPOZ44G6zhC0DEbYyzAOJiYsgHUkrDgRAy
100	Danial Schultz	Alvina_Gusikowski33@hotmail.com	$2a$10$GyO8W0NFJusevriUq28cNe0jEgdYXJ/bwFyTNgkhOqA9BEY8KWX5S
104	Eleazar Glover	Fred52@yahoo.com	$2a$10$70vlwVyOISNOFE4zp7P9Q.2gU1RuHchCGEfRN9pfL8ZMoPO7eC5AK
108	Assunta Labadie	Reed0@gmail.com	$2a$10$IaOzGTalDHgs0naGt4g.puD1Bef7WfbGNsVMVGYFom5WHxyJypTZ2
112	Keely West IV	Raquel_Ritchie79@yahoo.com	$2a$10$W30uLsD/7jOPsNrfw9VoG.JRH3z5KRessz0vM90xd.M0trJpXkgka
114	Aurore Terry	Aida29@gmail.com	$2a$10$UYZMjweqJazrfQznzublX.9CttrIy7j3rRYOLyzvvlCrK/lgKTspK
119	Kiera Wolff	Ruthe.Jacobs@gmail.com	$2a$10$KcqRkxO6/D2E/mjhuJ9BlOm/tBFH9L9ocdMMQ5yJlkhQudvJOYR0a
63	Aleen Emard	Amparo_Koch@yahoo.com	$2a$10$O0zQ4YKN2YjkVDsOjz3H0OP3QUpLZV7xYoMsRFx49pXqgq8kuS336
64	Dr. Manuel Dietrich	Savion.Stehr@yahoo.com	$2a$10$GDpQvWONGIKzQitWhtnbneGy/NA8kjX81saeVvKONxoE27XAa4Ntq
68	Winfield Paucek	Arjun_Carter@gmail.com	$2a$10$79GkCWTV6aicXhAY83XX.OzJ7OMai8Tc7KDvAR9fDUFiqMHpNzXr.
71	Della Goyette	Isobel18@yahoo.com	$2a$10$4ruylN1fkAS6r2Bwd5sUfePoRVJtkWM6jRlBLbmhfAXW2GGl91sq2
73	Terence Schimmel	Verner_Johnson@hotmail.com	$2a$10$t4rD.RfWYZwM7uZD2E1uPOK7I0kpimsO0EltZjb9Rj9ls2Mi4Pnty
77	Kaleb Cole	Dandre_Rippin@gmail.com	$2a$10$cW3ZEEkzE4pdwhxt0ML0xuRP.ajePvzeUrfKOG5xbUcG56AM7tu3a
79	Nannie Strosin	Reba_Dietrich80@hotmail.com	$2a$10$GLbLOuiziqO90dxuXKAeTeUVd9d2ucrwHnbeCcSyKYMk.Sg19ckxS
81	Faustino Connelly IV	Laverne31@gmail.com	$2a$10$7cFUtFXX5.bfUWFefUjrn.hSOaJCJX4lmsES4PhIhETv0FDQqiaD2
87	Ms. Rocio Hoeger	Erin.Gibson@gmail.com	$2a$10$zRlfoPV.1oZ3e.ozsCl4F.VbI9zmIGQyt7eC17zyaiewhiKpRjY8m
88	Sabina Wehner	Alexander.Walsh65@gmail.com	$2a$10$vfjG9lCMZ82JBX3SfTFxE.8CEH19TU1O7MiVbZrXI4xZZ190IzfkC
91	Hazle Ruecker	Frederique_Hegmann67@hotmail.com	$2a$10$Fnz1MWsy2ASEQXuH12kK.ueMNicwVQ6rqIn9qa6zp8ZeNumj45Dam
95	Judah Schneider	Della_Stark@yahoo.com	$2a$10$/XDSYje3M3whM8ahHYSSuef09WeQSTwAls1Gs..Ay7GTEd.Br.3T.
96	Domenico Sauer	Enid8@yahoo.com	$2a$10$k8EanLkLnY2P1kbEUlmwz.4zvhTG0kzDHIjJ9Eq47/F8hFUudn0ey
102	Lilian Schowalter	Rodrigo.Jakubowski30@gmail.com	$2a$10$d4Y0r8utkATyquN6Ds1oee04hJXjlQ2oQP9UrkAiFRXBtODsSd19C
103	Priscilla Kulas	Elmer83@gmail.com	$2a$10$Z27nOThratgAntq08OyThOWBN60Ffhps51rLcOcSWtRjYXDJoYf2m
106	Miss Jaunita Bosco	Deshawn21@hotmail.com	$2a$10$Bm7pPCRoF6CdDxDVK3tIIeMZpasrm.IgXoW2VmFqmr3mqR.e2Yy66
110	Willa Hills	Arely88@hotmail.com	$2a$10$.lMriEe96NHH7LBHRMjAOuDRD1neOtB6GQWKM923PLMueyu82N5MG
111	Ora Cremin	Patricia11@yahoo.com	$2a$10$H2DKDURLMAi9Itw5gcRhuuIpjRsRbDGN6v5knFMZ5DpdqC/pDfadK
117	Ruthie O'Keefe	Zaria5@yahoo.com	$2a$10$cJBRnBKYOtKR.8vVKKNSAeooSK3eC.cJAVP/qUJoUxTAz1ouaE0pq
118	Grant Kihn	Audreanne_Larkin@hotmail.com	$2a$10$5L.z8RXAU6XdLUi9gsvTmeeFq28NVHkr2sbbRzX1Y9o5wXU6K/imy
66	Jan Hoeger	Florian.Smitham68@hotmail.com	$2a$10$tTp0.JmeUhYQvMvUI9Qq0Ouon44ZwoyVgMayEY.kI13GTMbWjsX0e
75	Jaunita Dietrich	Mitchell.Carter17@hotmail.com	$2a$10$K2HwD4f3K/GFBsW2VdvAbOdP2D3QqLrirt91smQfpZwnZllFcZvdS
82	Mr. Travis Ruecker	Dovie.Grimes3@gmail.com	$2a$10$mOlO27tnrxWmtmvqSGh92O4z5yRWkKfXDKIdUg59gknSWzSTt5xRC
85	Dorothy Ullrich	Llewellyn_Lynch@hotmail.com	$2a$10$5YAOvMbJeC7XPjfbZP5hPepZs5ILWkKdkl98hU6/VzLzVdb7i5VZ.
90	Jovanny Murphy	Erwin13@hotmail.com	$2a$10$s9IGfiPFFhuq2AeUBilhiOOj8UKuK68VKbVro3HPpECopV3a8wAtu
94	Gladyce Windler	Stephania_Bartell@gmail.com	$2a$10$EVxuL2WIR..7MY6/aSnVouZvJ0J7duIt884zJNGrsfRvxv5cU1AD2
98	Erika Murray	Toy_Witting@gmail.com	$2a$10$KQGPVKYi1nG.SrtSMxa.7uuYGQvBf9dan.hifSNlQC8c4uqDS3T9W
101	Garfield Pfeffer MD	Lillian.Boehm17@gmail.com	$2a$10$s9Ntd6C.sYih5XRW.cNWm.C1uwLnBVPsEFsSFSjZj.55ZtpqvKuOm
105	Dr. Kenna Rutherford	Mozelle_Farrell@yahoo.com	$2a$10$Yo3MfdxGbU6l6u8xaDyUweCZGHMQUqDN4/FGsvLXr1HaHTqTrthrS
109	Ruben Stamm	Blaze62@yahoo.com	$2a$10$BbeM9DcqMGl6ViHa9Q0Ut.yjNnLhhVbIdOmbON0blYcv7VkC10kFW
113	Dr. Felipa Bergnaum	Janet.Mills@gmail.com	$2a$10$HNInvxccLotXiXL9gcrThuXZYkmebeRN6AqMPqHSpW8n0A2fmOAda
116	Phoebe Thompson	Raphaelle_Huels@gmail.com	$2a$10$2N55WBEXOW/i/HnEJb0gIOTOybbrC7Wu5nxSKawwk24q2b6y7Cqje
120	Kenneth Predovic	Geraldine31@yahoo.com	$2a$10$6tlk30B5F.poebaMpWThEOrOD2BUH8NmF/HTolE3OrPFFksm2cp9W
121	samsung	samsung@samsung.com	$2a$10$hI9yPebpGY9cn1sVbRM96uQhvP8ZXOvn8Rmys0q.MINw/OzimaCDi
\.


--

--

SELECT pg_catalog.setval('users_id_seq', 121, true);


--

--

ALTER TABLE ONLY links
    ADD CONSTRAINT links_pkey PRIMARY KEY (id);


--

--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--

--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--
