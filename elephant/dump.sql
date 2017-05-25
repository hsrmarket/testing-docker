--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: hsrmarket; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA hsrmarket;


ALTER SCHEMA hsrmarket OWNER TO postgres;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = hsrmarket, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: accounts; Type: TABLE; Schema: hsrmarket; Owner: postgres
--

CREATE TABLE accounts (
    account_id integer NOT NULL,
    firstname character varying(100) NOT NULL,
    lastname character varying(100) NOT NULL,
    studentid integer NOT NULL,
    email character varying(256) NOT NULL,
    tel character varying(12) NOT NULL,
    address_id integer NOT NULL,
    pw character varying(256),
    isadmin boolean DEFAULT false NOT NULL
);


ALTER TABLE accounts OWNER TO postgres;

--
-- Name: accounts_account_id_seq; Type: SEQUENCE; Schema: hsrmarket; Owner: postgres
--

CREATE SEQUENCE accounts_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE accounts_account_id_seq OWNER TO postgres;

--
-- Name: accounts_account_id_seq; Type: SEQUENCE OWNED BY; Schema: hsrmarket; Owner: postgres
--

ALTER SEQUENCE accounts_account_id_seq OWNED BY accounts.account_id;


--
-- Name: address; Type: TABLE; Schema: hsrmarket; Owner: postgres
--

CREATE TABLE address (
    address_id integer NOT NULL,
    streetname character varying(256) NOT NULL,
    streetnumber character varying(256) NOT NULL,
    zip integer NOT NULL,
    city character varying(256)
);


ALTER TABLE address OWNER TO postgres;

--
-- Name: address_address_id_seq; Type: SEQUENCE; Schema: hsrmarket; Owner: postgres
--

CREATE SEQUENCE address_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE address_address_id_seq OWNER TO postgres;

--
-- Name: address_address_id_seq; Type: SEQUENCE OWNED BY; Schema: hsrmarket; Owner: postgres
--

ALTER SEQUENCE address_address_id_seq OWNED BY address.address_id;


--
-- Name: articleaccountallocation; Type: TABLE; Schema: hsrmarket; Owner: postgres
--

CREATE TABLE articleaccountallocation (
    account_id integer NOT NULL,
    article_id integer NOT NULL
);


ALTER TABLE articleaccountallocation OWNER TO postgres;

--
-- Name: articles; Type: TABLE; Schema: hsrmarket; Owner: postgres
--

CREATE TABLE articles (
    article_id integer NOT NULL,
    name character varying(256) NOT NULL,
    description text NOT NULL,
    price numeric(10,2) NOT NULL,
    image character varying(256) NOT NULL,
    creationdate date DEFAULT ('now'::text)::date NOT NULL,
    condition integer NOT NULL
);


ALTER TABLE articles OWNER TO postgres;

--
-- Name: articles_article_id_seq; Type: SEQUENCE; Schema: hsrmarket; Owner: postgres
--

CREATE SEQUENCE articles_article_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE articles_article_id_seq OWNER TO postgres;

--
-- Name: articles_article_id_seq; Type: SEQUENCE OWNED BY; Schema: hsrmarket; Owner: postgres
--

ALTER SEQUENCE articles_article_id_seq OWNED BY articles.article_id;


--
-- Name: books; Type: TABLE; Schema: hsrmarket; Owner: postgres
--

CREATE TABLE books (
    book_id integer NOT NULL,
    author character varying(256) NOT NULL,
    publisher character varying(256) NOT NULL,
    isbn character varying(256) NOT NULL
);


ALTER TABLE books OWNER TO postgres;

--
-- Name: electronics; Type: TABLE; Schema: hsrmarket; Owner: postgres
--

CREATE TABLE electronics (
    electronic_id integer NOT NULL,
    manufacturer character varying(256) NOT NULL,
    modell character varying(256) NOT NULL
);


ALTER TABLE electronics OWNER TO postgres;

--
-- Name: officesupplies; Type: TABLE; Schema: hsrmarket; Owner: postgres
--

CREATE TABLE officesupplies (
    officesupplie_id integer NOT NULL
);


ALTER TABLE officesupplies OWNER TO postgres;

--
-- Name: otherarticles; Type: TABLE; Schema: hsrmarket; Owner: postgres
--

CREATE TABLE otherarticles (
    otherarticle_id integer NOT NULL
);


ALTER TABLE otherarticles OWNER TO postgres;

--
-- Name: purchase; Type: TABLE; Schema: hsrmarket; Owner: postgres
--

CREATE TABLE purchase (
    purchase_id integer NOT NULL,
    iscompleted boolean DEFAULT false NOT NULL,
    purchasedate date DEFAULT ('now'::text)::date NOT NULL,
    article_id integer NOT NULL,
    buyer_id integer NOT NULL,
    seller_id integer
);


ALTER TABLE purchase OWNER TO postgres;

--
-- Name: purchase_purchase_id_seq; Type: SEQUENCE; Schema: hsrmarket; Owner: postgres
--

CREATE SEQUENCE purchase_purchase_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE purchase_purchase_id_seq OWNER TO postgres;

--
-- Name: purchase_purchase_id_seq; Type: SEQUENCE OWNED BY; Schema: hsrmarket; Owner: postgres
--

ALTER SEQUENCE purchase_purchase_id_seq OWNED BY purchase.purchase_id;


--
-- Name: tags; Type: TABLE; Schema: hsrmarket; Owner: postgres
--

CREATE TABLE tags (
    tag_id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE tags OWNER TO postgres;

--
-- Name: tags_tag_id_seq; Type: SEQUENCE; Schema: hsrmarket; Owner: postgres
--

CREATE SEQUENCE tags_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tags_tag_id_seq OWNER TO postgres;

--
-- Name: tags_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: hsrmarket; Owner: postgres
--

ALTER SEQUENCE tags_tag_id_seq OWNED BY tags.tag_id;


--
-- Name: tagsallocation; Type: TABLE; Schema: hsrmarket; Owner: postgres
--

CREATE TABLE tagsallocation (
    article_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE tagsallocation OWNER TO postgres;

--
-- Name: accounts account_id; Type: DEFAULT; Schema: hsrmarket; Owner: postgres
--

ALTER TABLE ONLY accounts ALTER COLUMN account_id SET DEFAULT nextval('accounts_account_id_seq'::regclass);


--
-- Name: address address_id; Type: DEFAULT; Schema: hsrmarket; Owner: postgres
--

ALTER TABLE ONLY address ALTER COLUMN address_id SET DEFAULT nextval('address_address_id_seq'::regclass);


--
-- Name: articles article_id; Type: DEFAULT; Schema: hsrmarket; Owner: postgres
--

ALTER TABLE ONLY articles ALTER COLUMN article_id SET DEFAULT nextval('articles_article_id_seq'::regclass);


--
-- Name: purchase purchase_id; Type: DEFAULT; Schema: hsrmarket; Owner: postgres
--

ALTER TABLE ONLY purchase ALTER COLUMN purchase_id SET DEFAULT nextval('purchase_purchase_id_seq'::regclass);


--
-- Name: tags tag_id; Type: DEFAULT; Schema: hsrmarket; Owner: postgres
--

ALTER TABLE ONLY tags ALTER COLUMN tag_id SET DEFAULT nextval('tags_tag_id_seq'::regclass);


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: hsrmarket; Owner: postgres
--

COPY accounts (account_id, firstname, lastname, studentid, email, tel, address_id, pw, isadmin) FROM stdin;
1	Frasier	Boggas	2132918	fboggas0@ycombinator.com	353-9951	1	0d6b7ff7c000803ed007e148861c874ca99c7ad9ae3e5a0ac8a4997cdb68255b	f
2	Enrica	Ulster	9320182	eulster1@wordpress.com	274-2775	2	0d6b7ff7c000803ed007e148861c874ca99c7ad9ae3e5a0ac8a4997cdb68255b	f
3	Edvard	Geany	8808825	egeany2@nhs.uk	852-3383	3	0d6b7ff7c000803ed007e148861c874ca99c7ad9ae3e5a0ac8a4997cdb68255b	f
4	Wilmar	Witherington	1113244	wwitherington3@cyberchimps.com	383-2633	4	0d6b7ff7c000803ed007e148861c874ca99c7ad9ae3e5a0ac8a4997cdb68255b	f
5	Rhianna	MacGebenay	5095089	rmacgebenay4@dyndns.org	388-9149	5	0d6b7ff7c000803ed007e148861c874ca99c7ad9ae3e5a0ac8a4997cdb68255b	f
6	Fanni	Shortell	-1492832	fshortell5@imgur.com	8417-9675	6	0d6b7ff7c000803ed007e148861c874ca99c7ad9ae3e5a0ac8a4997cdb68255b	f
7	Germayne	Vockings	787939	gvockings6@wisc.edu	8808-7146	7	0d6b7ff7c000803ed007e148861c874ca99c7ad9ae3e5a0ac8a4997cdb68255b	f
8	Bettine	Vass	7214504	bvass7@smugmug.com	8420-4020	8	0d6b7ff7c000803ed007e148861c874ca99c7ad9ae3e5a0ac8a4997cdb68255b	f
9	Charlean	Vautier	169257	cvautier8@examiner.com	3739-0229	9	0d6b7ff7c000803ed007e148861c874ca99c7ad9ae3e5a0ac8a4997cdb68255b	t
10	Hank	Maffucci	8165029	hmaffucci9@blogs.com	6523-7368	10	0d6b7ff7c000803ed007e148861c874ca99c7ad9ae3e5a0ac8a4997cdb68255b	t
\.


--
-- Name: accounts_account_id_seq; Type: SEQUENCE SET; Schema: hsrmarket; Owner: postgres
--

SELECT pg_catalog.setval('accounts_account_id_seq', 11, false);


--
-- Data for Name: address; Type: TABLE DATA; Schema: hsrmarket; Owner: postgres
--

COPY address (address_id, streetname, streetnumber, zip, city) FROM stdin;
1	Morrow	1	6666	Remas
2	Packers	8080	6832	Betzdorf
3	Fulton	95	2425445	Gândara de Aquém
4	Ridgeway	3565	8585	Matur
5	Hoffman	6	4600741	Casa Nova
6	Scofield	0	418077	San Agustín
7	Anhalt	296	2323	Lirang
8	Lighthouse Bay	9769	6595	Ekpoma
9	Transport	23209	2658	Aegela
10	Lighthouse Bay	4	9000	Gulong
\.


--
-- Name: address_address_id_seq; Type: SEQUENCE SET; Schema: hsrmarket; Owner: postgres
--

SELECT pg_catalog.setval('address_address_id_seq', 11, false);


--
-- Data for Name: articleaccountallocation; Type: TABLE DATA; Schema: hsrmarket; Owner: postgres
--

COPY articleaccountallocation (account_id, article_id) FROM stdin;
5	1
10	2
2	3
4	4
10	5
9	6
8	7
10	8
7	9
3	10
6	11
5	12
3	13
10	14
7	15
6	16
1	17
3	18
10	19
7	20
6	21
7	22
7	23
5	24
2	25
6	26
7	27
1	28
4	29
4	30
5	31
2	32
10	33
2	34
8	35
1	36
4	37
7	38
2	39
6	40
6	41
5	42
3	43
5	44
2	45
4	46
5	47
9	48
2	49
7	50
6	51
3	52
9	53
9	54
6	55
10	56
10	57
2	58
4	59
9	60
10	61
4	62
3	63
2	64
1	65
2	66
3	67
9	68
6	69
9	70
5	71
1	72
1	73
8	74
10	75
10	76
8	77
7	78
3	79
4	80
3	81
7	82
2	83
5	84
1	85
2	86
9	87
2	88
3	89
8	90
2	91
6	92
3	93
7	94
9	95
3	96
9	97
10	98
7	99
1	100
1	101
5	102
5	103
6	104
6	105
6	106
10	107
10	108
8	109
5	110
6	111
7	112
10	113
6	114
3	115
7	116
7	117
2	118
4	119
10	120
3	121
2	122
5	123
1	124
1	125
10	126
2	127
2	128
7	129
4	130
9	131
2	132
2	133
3	134
4	135
9	136
3	137
7	138
1	139
5	140
5	141
9	142
5	143
3	144
5	145
1	146
9	147
10	148
9	149
7	150
8	151
7	152
9	153
3	154
5	155
1	156
6	157
10	158
2	159
1	160
8	161
4	162
4	163
5	164
7	165
6	166
6	167
4	168
1	169
3	170
10	171
2	172
9	173
2	174
9	175
9	176
7	177
3	178
8	179
6	180
2	181
6	182
10	183
7	184
6	185
10	186
2	187
7	188
4	189
4	190
9	191
6	192
5	193
10	194
1	195
3	196
4	197
5	198
10	199
8	200
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: hsrmarket; Owner: postgres
--

COPY articles (article_id, name, description, price, image, creationdate, condition) FROM stdin;
1	Phased	Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.	72.63		2017-03-28	4
2	Switchable	Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.	51.65		2016-07-31	2
3	24/7	Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.	52.81		2016-08-04	2
4	empowering	Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.	14.71		2016-11-16	3
5	forecast	Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.	58.42		2017-01-19	4
6	Front-line	Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.	75.48		2016-06-25	3
7	Customizable	Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.	97.74		2017-05-01	3
8	holistic	Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.	54.42		2016-07-01	1
9	core	Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.	75.77		2016-09-10	1
10	system engine	Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.	18.23		2016-11-07	3
11	system-worthy	Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.	93.72		2016-12-03	2
12	policy	Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.	24.45		2016-07-30	1
13	software	Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.	40.23		2017-02-26	1
14	Sharable	Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.	19.30		2016-01-09	5
15	composite	Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.	87.56		2016-07-10	5
16	parallelism	Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.	50.06		2016-07-30	2
17	Public-key	In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.	33.23		2016-06-04	5
18	transitional	Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.	29.91		2016-06-28	5
19	pricing structure	Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.	76.86		2016-09-09	5
20	synergy	Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.	70.01		2016-04-20	1
21	human-resource	Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.	20.62		2016-04-21	5
22	human-resource	Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.	41.28		2016-12-03	5
23	interactive	Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.	55.79		2016-10-24	4
24	Configurable	Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.	35.04		2016-12-17	4
25	artificial intelligence	In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.	54.14		2016-01-15	3
26	standardization	Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.	54.74		2016-03-03	4
27	cohesive	Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.	75.92		2016-04-27	5
28	needs-based	Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.	5.18		2016-04-11	5
29	approach	Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.	38.49		2016-11-29	2
30	Quality-focused	Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.	93.15		2016-09-05	3
31	discrete	Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.	38.11		2016-10-13	1
32	Networked	Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.	28.72		2016-12-03	5
33	utilisation	Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.	91.93		2016-09-12	2
34	matrices	Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.	70.25		2017-04-12	3
35	analyzing	Sed ante. Vivamus tortor. Duis mattis egestas metus.	65.97		2016-11-11	5
36	Public-key	Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.	94.24		2017-04-12	4
37	user-facing	Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.	33.56		2017-03-03	4
38	demand-driven	Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.	68.55		2017-03-24	2
39	Operative	Fusce consequat. Nulla nisl. Nunc nisl.	28.17		2016-07-02	5
40	bi-directional	In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.	48.21		2016-03-22	4
41	capability	Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.	39.17		2016-01-02	1
42	De-engineered	Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.	98.09		2016-06-24	2
43	hardware	Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.	42.59		2016-03-26	5
44	monitoring	Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.	24.92		2016-06-30	5
45	adapter	Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.	8.36		2016-02-23	2
46	content-based	Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.	52.36		2016-01-24	2
47	circuit	Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.	19.17		2017-02-18	4
48	policy	Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.	39.83		2016-09-14	4
49	Proactive	In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.	76.73		2017-01-24	2
50	Sharable	Fusce consequat. Nulla nisl. Nunc nisl.	61.43		2016-05-08	1
51	matrix	Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.	5.17		2016-02-27	2
52	homogeneous	Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.	81.25		2016-01-13	2
53	Switchable	Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.	74.57		2016-03-06	3
54	help-desk	Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.	62.36		2016-07-20	3
55	time-frame	Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.	34.27		2016-07-21	3
56	User-friendly	Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.	29.48		2016-02-03	5
57	Optimized	Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.	87.78		2016-07-09	5
58	attitude-oriented	Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.	57.19		2016-12-22	3
59	core	Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.	13.52		2016-05-26	1
60	object-oriented	Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.	18.70		2016-10-21	4
61	bi-directional	Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.	12.21		2016-04-20	5
62	Re-contextualized	Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.	82.54		2016-12-25	1
63	neural-net	Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.	28.70		2016-10-10	5
64	Ameliorated	Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.	58.00		2016-02-19	3
65	bandwidth-monitored	Sed ante. Vivamus tortor. Duis mattis egestas metus.	5.22		2016-03-17	4
66	local	Phasellus in felis. Donec semper sapien a libero. Nam dui.	40.49		2016-11-11	2
67	Cross-group	Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.	8.02		2016-01-15	1
68	multimedia	Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.	63.05		2017-02-07	2
69	knowledge base	Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.	45.25		2016-04-25	5
70	holistic	Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.	17.42		2016-10-23	4
71	Reverse-engineered	Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.	46.67		2016-09-04	5
72	collaboration	Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.	70.96		2017-03-11	5
73	model	Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.	67.80		2016-06-08	3
74	initiative	Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.	7.69		2016-08-19	5
75	transitional	Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.	28.99		2016-01-21	4
76	infrastructure	Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.	67.62		2016-02-24	1
77	toolset	Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.	67.52		2016-08-08	2
78	Programmable	In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.	93.15		2016-03-12	2
79	leading edge	Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.	75.36		2016-09-15	4
80	encompassing	Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.	70.66		2016-04-17	4
81	benchmark	Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.	61.91		2016-07-15	2
82	Future-proofed	Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.	9.47		2017-02-12	3
83	well-modulated	Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.	91.60		2016-11-10	4
84	Centralized	Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.	80.70		2016-09-13	5
85	hybrid	Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.	84.28		2017-04-27	4
86	application	Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.	13.97		2016-10-05	3
87	challenge	Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.	33.96		2017-02-06	4
88	cohesive	Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.	69.40		2016-08-06	1
89	toolset	Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.	19.14		2016-06-02	2
90	client-server	Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.	88.86		2016-03-05	2
91	Configurable	Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.	91.01		2016-07-23	3
92	frame	Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.	31.80		2016-04-14	2
93	Extended	In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.	37.59		2016-02-18	4
94	client-driven	Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.	65.84		2017-03-26	2
95	instruction set	Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.	10.15		2017-03-18	5
96	client-server	Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.	44.83		2016-12-26	1
97	asynchronous	In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.	29.00		2017-01-08	4
98	full-range	Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.	56.59		2017-03-28	3
99	hardware	Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.	81.91		2016-12-31	1
100	high-level	Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.	68.84		2016-07-07	5
101	utilisation	Fusce consequat. Nulla nisl. Nunc nisl.	84.68		2016-07-28	5
102	workforce	Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.	14.89		2016-08-13	1
103	success	Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.	54.84		2017-03-18	3
104	productivity	In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.	8.34		2017-03-03	5
105	zero administration	Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.	25.08		2016-04-22	3
106	Innovative	Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.	76.32		2017-01-03	5
107	6th generation	Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.	57.87		2016-11-16	1
108	instruction set	Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.	95.56		2016-06-23	3
109	systematic	In congue. Etiam justo. Etiam pretium iaculis justo.	53.87		2016-12-24	5
110	contextually-based	Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.	79.78		2016-06-02	5
111	projection	Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.	75.86		2016-10-08	2
112	Advanced	Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.	25.92		2017-01-20	5
113	Function-based	Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.	82.36		2016-04-08	5
114	toolset	Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.	51.42		2017-01-05	4
115	object-oriented	In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.	5.80		2016-12-26	5
116	multi-state	Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.	53.65		2016-10-12	2
117	contextually-based	Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.	88.03		2017-02-18	5
118	scalable	In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.	35.66		2016-12-31	4
119	Realigned	Phasellus in felis. Donec semper sapien a libero. Nam dui.	41.44		2016-05-27	5
120	algorithm	Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.	79.33		2016-04-19	1
121	Automated	Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.	81.97		2017-05-14	2
122	paradigm	Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.	77.94		2017-05-19	2
123	solution	In congue. Etiam justo. Etiam pretium iaculis justo.	26.82		2017-02-23	2
124	Synchronised	Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.	98.11		2017-03-21	4
125	Customizable	Fusce consequat. Nulla nisl. Nunc nisl.	34.90		2016-01-11	5
126	Integrated	Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.	54.72		2016-03-29	3
127	multi-tasking	Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.	20.00		2017-02-19	5
128	help-desk	In congue. Etiam justo. Etiam pretium iaculis justo.	88.17		2016-02-03	3
129	homogeneous	Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.	9.46		2017-01-19	5
130	Managed	Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.	55.75		2016-06-04	2
131	throughput	Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.	55.81		2016-02-18	5
132	attitude	Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.	26.95		2016-07-04	3
133	Managed	Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.	71.32		2016-12-10	5
134	customer loyalty	Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.	54.40		2016-10-31	1
135	24 hour	Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.	51.61		2016-01-23	5
136	neutral	Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.	71.07		2016-06-22	1
137	knowledge user	Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.	36.30		2017-04-07	1
138	dynamic	Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.	59.98		2016-12-23	2
139	protocol	Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.	54.07		2016-04-08	4
140	Proactive	Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.	65.56		2016-05-09	1
141	full-range	Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.	42.49		2016-05-18	2
142	even-keeled	Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.	51.33		2017-03-10	5
143	uniform	Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.	48.19		2016-07-13	5
144	Multi-channelled	Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.	43.23		2016-05-29	1
145	explicit	Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.	73.96		2016-02-22	3
146	Down-sized	Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.	38.34		2017-03-15	1
147	frame	In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.	90.51		2016-07-11	1
148	firmware	Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.	85.40		2016-09-01	2
149	protocol	Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.	41.53		2017-02-10	1
150	groupware	Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.	83.81		2016-07-18	3
151	Streamlined	Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.	18.89		2016-05-09	1
152	eco-centric	Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.	86.72		2016-06-17	3
153	capacity	Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.	33.72		2017-04-09	2
154	systemic	Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.	71.77		2016-11-29	3
155	hardware	Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.	42.40		2017-03-26	5
156	multi-state	Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.	43.05		2016-01-21	5
157	frame	Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.	13.86		2016-03-05	1
158	Organized	Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.	97.72		2016-07-14	5
159	4th generation	Phasellus in felis. Donec semper sapien a libero. Nam dui.	65.50		2016-08-28	1
160	content-based	Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.	95.94		2016-05-12	2
161	Customizable	Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.	77.99		2017-01-28	2
162	Polarised	Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.	92.17		2016-10-30	2
163	methodology	Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.	22.89		2016-02-25	5
164	contingency	Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.	79.33		2017-04-12	4
165	instruction set	Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.	33.84		2016-07-22	3
166	pricing structure	Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.	84.66		2016-12-12	2
167	strategy	Sed ante. Vivamus tortor. Duis mattis egestas metus.	76.83		2016-10-23	1
168	impactful	In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.	53.90		2016-05-21	4
169	context-sensitive	Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.	60.35		2016-04-25	4
170	neutral	Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.	68.12		2016-12-11	5
171	Assimilated	Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.	20.05		2016-04-11	2
172	Switchable	Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.	55.32		2017-05-23	1
173	Object-based	Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.	92.24		2016-07-10	5
174	multi-state	Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.	88.65		2016-11-12	1
175	pricing structure	Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.	42.61		2017-01-30	1
176	info-mediaries	Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.	81.56		2016-10-05	1
177	incremental	Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.	16.63		2017-04-25	4
178	fault-tolerant	Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.	26.42		2016-02-14	5
179	Centralized	Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.	81.45		2017-04-18	4
180	upward-trending	Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.	30.53		2016-10-17	1
181	national	Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.	71.52		2016-10-04	4
182	Configurable	Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.	33.42		2017-02-09	3
183	Phased	Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.	87.62		2017-05-05	2
184	attitude-oriented	Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.	65.85		2016-08-15	1
185	foreground	Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.	10.20		2017-01-26	5
186	Reverse-engineered	Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.	53.98		2016-11-26	3
187	Switchable	Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.	33.59		2016-03-02	2
188	moratorium	Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.	9.56		2016-09-25	5
189	upward-trending	Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.	70.01		2016-01-08	5
190	synergy	Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.	96.48		2017-01-20	4
191	groupware	Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.	32.64		2016-11-17	1
192	approach	Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.	64.90		2016-07-13	4
193	interface	Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.	31.71		2016-02-23	5
194	customer loyalty	Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.	27.68		2017-01-16	2
195	Public-key	Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.	93.02		2016-03-11	3
196	help-desk	Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.	7.55		2017-03-18	4
197	Ergonomic	Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.	99.41		2016-11-20	3
198	framework	Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.	49.06		2016-08-30	5
199	optimizing	Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.	65.35		2016-12-30	3
200	Extended	Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.	95.33		2016-02-24	1
\.


--
-- Name: articles_article_id_seq; Type: SEQUENCE SET; Schema: hsrmarket; Owner: postgres
--

SELECT pg_catalog.setval('articles_article_id_seq', 201, false);


--
-- Data for Name: books; Type: TABLE DATA; Schema: hsrmarket; Owner: postgres
--

COPY books (book_id, author, publisher, isbn) FROM stdin;
1	Ignaz Aspinall	Moen and Sons	090140679-1
2	Templeton Storrs	Mayert, Lakin and Lockman	346964327-X
3	Sergeant Gouldthorp	Miller Inc	240313840-1
4	Kev Bouch	Wintheiser and Sons	502382646-5
5	Marylee Petroff	Haley LLC	257147955-5
6	Wat Kurt	Cremin LLC	750788946-7
7	Waylen Sendley	Friesen, Leffler and Balistreri	873882093-5
8	Kristen McGrae	Okuneva-Moore	570957072-9
9	Perkin Caulier	Dickinson-Wiza	402135253-8
10	Nevil Spincke	Collier, Jones and Thiel	966376113-X
11	Isacco Suckling	Wolf-Hilll	785110873-X
12	Wadsworth Galland	Kirlin Inc	653280548-3
13	Leontine Romanin	Heidenreich-Padberg	035403910-5
14	Kaela Spens	Brekke Group	041546517-6
15	Courtenay Ladd	Jaskolski-McGlynn	144101704-6
16	Queenie Arnoult	Kiehn, Hermann and Mohr	889684215-8
17	Ramon Sawter	Bernhard, Ebert and Nienow	053940041-6
18	Virgilio Menchenton	Boehm, Little and Feil	994323657-4
19	Alick Dassindale	Lueilwitz, Beier and Yundt	438289904-4
20	Paul Laneham	Stehr-Predovic	193924821-3
21	Pauline Baal	Kutch-Hyatt	995563321-2
22	Cristy Wingate	Pfannerstill-McLaughlin	900254910-5
23	Claudio Karus	Lind LLC	734063753-2
24	Cissiee Rumsby	Rohan, Shanahan and Schneider	561468211-2
25	Eudora Rizzolo	Rutherford, Hickle and Jerde	451393362-3
26	Cherice Buncombe	Prohaska, Boyer and Swift	386510309-X
27	Coleen Cornewall	Wilderman, McKenzie and Gerhold	558968434-X
28	Eleen Faloon	Hansen, Swift and Stracke	168398354-8
29	Stanislas Nelissen	Blanda and Sons	543639089-7
30	Norah McCard	Bergnaum, Thompson and Buckridge	747943080-9
31	Guss Cansfield	Reichert Inc	359484124-3
32	Justinn Sudddard	Ryan, Beahan and Keebler	037051465-3
33	Auberta Spores	Roberts Group	492956653-3
34	Chelsey Clowser	Walter LLC	529193363-1
35	Gilligan Verrico	Kihn-Koch	568870087-4
36	Marita Stanlick	Howell and Sons	095232330-3
37	Christian Gresty	Wiza-Greenholt	924985765-9
38	Pepito Epple	Nitzsche, Lakin and Spinka	795900422-6
39	Baxter Sprackling	Ziemann-Paucek	326583269-4
40	Horatius Reckless	Lakin LLC	523846871-7
41	Francene Sloley	Langworth, Mraz and Price	155729345-7
42	Angeline Maciocia	Koch, Ankunding and McDermott	268600812-1
43	Sampson Sapena	Reinger and Sons	411147397-0
44	Wilbert Ducham	Hickle-Hermann	097865003-4
45	Nicolas Driver	Walsh-Sipes	866172605-0
46	Wendie Ramme	Casper, McKenzie and West	687440513-6
47	Anjela Henrichsen	Sporer, Hartmann and Haag	273828503-1
48	Redford Karel	Thiel-Bergstrom	711720559-8
49	Gwenette Mistry	Morissette, Gutmann and O'Connell	857296328-6
50	Teddi Martins	Schmeler, Volkman and Volkman	073161965-X
\.


--
-- Data for Name: electronics; Type: TABLE DATA; Schema: hsrmarket; Owner: postgres
--

COPY electronics (electronic_id, manufacturer, modell) FROM stdin;
51	Mycat	S14141
52	Miboo	S60139S
53	Centimia	M1907
54	Oyoloo	W16332A
55	Nlounge	S0181XD
56	Einti	L27
57	Roodel	S0401
58	Wordpedia	S82312P
59	Twitterwire	S93516A
60	Yacero	S85171D
61	Yabox	S80879
62	Kamba	S72442A
63	Wikido	M47812
64	Blogpad	F52
65	Zoonoodle	M71349
66	Blogtags	Q410
67	Minyx	S238XXA
68	Trudeo	S68626
69	Devbug	H833X
70	Photospace	T79A0XA
71	Rhynoodle	S61451
72	Realmix	S42121A
73	Photospace	H023
74	Trupe	O318X13
75	Twitterbridge	S32048B
76	Vipe	M80862D
77	Plambee	S35403A
78	Quatz	T675XXD
79	Wikivu	M24446
80	Vimbo	S43081D
81	Innotype	S5780
82	Bubbletube	S3091XS
83	Zoombox	H2103
84	Gabcube	Q9381
85	Npath	S42109A
86	Einti	S79091P
87	Twinder	S99031A
88	Edgetag	S65802A
89	Chatterpoint	Y0889XA
90	Aimbu	W5629XS
91	Riffwire	D38
92	Zoomlounge	T3273
93	Midel	S52254
94	Yodo	Z223
95	Youspan	I70244
96	Meemm	S52354J
97	Thoughtbeat	T23619A
98	Photofeed	V337XXD
99	Topdrive	T3110
100	Realmix	S92236
\.


--
-- Data for Name: officesupplies; Type: TABLE DATA; Schema: hsrmarket; Owner: postgres
--

COPY officesupplies (officesupplie_id) FROM stdin;
101
102
103
104
105
106
107
108
109
110
111
112
113
114
115
116
117
118
119
120
121
122
123
124
125
126
127
128
129
130
131
132
133
134
135
136
137
138
139
140
141
142
143
144
145
146
147
148
149
150
\.


--
-- Data for Name: otherarticles; Type: TABLE DATA; Schema: hsrmarket; Owner: postgres
--

COPY otherarticles (otherarticle_id) FROM stdin;
151
152
153
154
155
156
157
158
159
160
161
162
163
164
165
166
167
168
169
170
171
172
173
174
175
176
177
178
179
180
181
182
183
184
185
186
187
188
189
190
191
192
193
194
195
196
197
198
199
200
\.


--
-- Data for Name: purchase; Type: TABLE DATA; Schema: hsrmarket; Owner: postgres
--

COPY purchase (purchase_id, iscompleted, purchasedate, article_id, buyer_id, seller_id) FROM stdin;
1	f	2017-04-22	9	1	7
2	f	2016-08-12	10	4	3
3	t	2017-02-09	13	5	3
4	f	2016-08-28	24	9	5
5	t	2016-06-30	25	3	2
6	f	2017-05-22	41	2	6
7	f	2016-10-23	57	4	10
8	f	2016-11-11	58	8	2
9	t	2016-06-06	69	2	6
10	f	2016-11-09	62	7	4
11	t	2016-11-05	70	10	9
12	f	2016-11-24	71	7	5
13	f	2017-01-17	113	9	10
14	f	2017-04-01	123	8	5
15	f	2017-02-01	136	4	9
16	f	2017-02-20	137	6	3
17	t	2017-03-08	142	8	9
18	t	2017-03-27	143	6	5
19	t	2017-02-28	154	10	3
20	t	2017-05-20	155	8	5
21	f	2016-11-18	158	4	10
22	t	2016-06-13	164	9	5
23	t	2017-03-12	184	3	7
24	t	2017-03-15	193	6	5
\.


--
-- Name: purchase_purchase_id_seq; Type: SEQUENCE SET; Schema: hsrmarket; Owner: postgres
--

SELECT pg_catalog.setval('purchase_purchase_id_seq', 25, false);


--
-- Data for Name: tags; Type: TABLE DATA; Schema: hsrmarket; Owner: postgres
--

COPY tags (tag_id, name) FROM stdin;
\.


--
-- Name: tags_tag_id_seq; Type: SEQUENCE SET; Schema: hsrmarket; Owner: postgres
--

SELECT pg_catalog.setval('tags_tag_id_seq', 15, true);


--
-- Data for Name: tagsallocation; Type: TABLE DATA; Schema: hsrmarket; Owner: postgres
--

COPY tagsallocation (article_id, tag_id) FROM stdin;
\.


--
-- Name: purchase UNIQUE_ARTICLE; Type: CONSTRAINT; Schema: hsrmarket; Owner: postgres
--

ALTER TABLE ONLY purchase
    ADD CONSTRAINT "UNIQUE_ARTICLE" UNIQUE (article_id);


--
-- Name: accounts UNIQUE_MAIL; Type: CONSTRAINT; Schema: hsrmarket; Owner: postgres
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT "UNIQUE_MAIL" UNIQUE (email);


--
-- Name: articleaccountallocation idx_articleaccountallocation; Type: CONSTRAINT; Schema: hsrmarket; Owner: postgres
--

ALTER TABLE ONLY articleaccountallocation
    ADD CONSTRAINT idx_articleaccountallocation UNIQUE (account_id, article_id);


--
-- Name: accounts pk_accounts; Type: CONSTRAINT; Schema: hsrmarket; Owner: postgres
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT pk_accounts PRIMARY KEY (account_id);


--
-- Name: address pk_address; Type: CONSTRAINT; Schema: hsrmarket; Owner: postgres
--

ALTER TABLE ONLY address
    ADD CONSTRAINT pk_address PRIMARY KEY (address_id);


--
-- Name: articles pk_articles; Type: CONSTRAINT; Schema: hsrmarket; Owner: postgres
--

ALTER TABLE ONLY articles
    ADD CONSTRAINT pk_articles PRIMARY KEY (article_id);


--
-- Name: purchase pk_kaufauftrag; Type: CONSTRAINT; Schema: hsrmarket; Owner: postgres
--

ALTER TABLE ONLY purchase
    ADD CONSTRAINT pk_kaufauftrag PRIMARY KEY (purchase_id);


--
-- Name: tags pk_tags; Type: CONSTRAINT; Schema: hsrmarket; Owner: postgres
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT pk_tags PRIMARY KEY (tag_id);


--
-- Name: tagsallocation pk_tagsallocation; Type: CONSTRAINT; Schema: hsrmarket; Owner: postgres
--

ALTER TABLE ONLY tagsallocation
    ADD CONSTRAINT pk_tagsallocation UNIQUE (article_id, tag_id);


--
-- Name: idx_accounts; Type: INDEX; Schema: hsrmarket; Owner: postgres
--

CREATE INDEX idx_accounts ON accounts USING btree (address_id);


--
-- Name: idx_books; Type: INDEX; Schema: hsrmarket; Owner: postgres
--

CREATE INDEX idx_books ON books USING btree (book_id);


--
-- Name: idx_electronics; Type: INDEX; Schema: hsrmarket; Owner: postgres
--

CREATE INDEX idx_electronics ON electronics USING btree (electronic_id);


--
-- Name: idx_officesupplies; Type: INDEX; Schema: hsrmarket; Owner: postgres
--

CREATE INDEX idx_officesupplies ON officesupplies USING btree (officesupplie_id);


--
-- Name: idx_otherarticles; Type: INDEX; Schema: hsrmarket; Owner: postgres
--

CREATE INDEX idx_otherarticles ON otherarticles USING btree (otherarticle_id);


--
-- Name: idx_purchase; Type: INDEX; Schema: hsrmarket; Owner: postgres
--

CREATE INDEX idx_purchase ON purchase USING btree (article_id, purchase_id);


--
-- Name: idx_purchase_0; Type: INDEX; Schema: hsrmarket; Owner: postgres
--

CREATE INDEX idx_purchase_0 ON purchase USING btree (seller_id);


--
-- Name: accounts fk_accounts_address; Type: FK CONSTRAINT; Schema: hsrmarket; Owner: postgres
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT fk_accounts_address FOREIGN KEY (address_id) REFERENCES address(address_id);


--
-- Name: articleaccountallocation fk_articleaccountallocation; Type: FK CONSTRAINT; Schema: hsrmarket; Owner: postgres
--

ALTER TABLE ONLY articleaccountallocation
    ADD CONSTRAINT fk_articleaccountallocation FOREIGN KEY (account_id) REFERENCES accounts(account_id);


--
-- Name: articleaccountallocation fk_articleaccountallocation_article; Type: FK CONSTRAINT; Schema: hsrmarket; Owner: postgres
--

ALTER TABLE ONLY articleaccountallocation
    ADD CONSTRAINT fk_articleaccountallocation_article FOREIGN KEY (article_id) REFERENCES articles(article_id);


--
-- Name: books fk_books_articles; Type: FK CONSTRAINT; Schema: hsrmarket; Owner: postgres
--

ALTER TABLE ONLY books
    ADD CONSTRAINT fk_books_articles FOREIGN KEY (book_id) REFERENCES articles(article_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: electronics fk_electronics_articles; Type: FK CONSTRAINT; Schema: hsrmarket; Owner: postgres
--

ALTER TABLE ONLY electronics
    ADD CONSTRAINT fk_electronics_articles FOREIGN KEY (electronic_id) REFERENCES articles(article_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: officesupplies fk_officesupplies_articles; Type: FK CONSTRAINT; Schema: hsrmarket; Owner: postgres
--

ALTER TABLE ONLY officesupplies
    ADD CONSTRAINT fk_officesupplies_articles FOREIGN KEY (officesupplie_id) REFERENCES articles(article_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: otherarticles fk_otherarticles_articles; Type: FK CONSTRAINT; Schema: hsrmarket; Owner: postgres
--

ALTER TABLE ONLY otherarticles
    ADD CONSTRAINT fk_otherarticles_articles FOREIGN KEY (otherarticle_id) REFERENCES articles(article_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: purchase fk_purchase_accounts; Type: FK CONSTRAINT; Schema: hsrmarket; Owner: postgres
--

ALTER TABLE ONLY purchase
    ADD CONSTRAINT fk_purchase_accounts FOREIGN KEY (buyer_id) REFERENCES accounts(account_id);


--
-- Name: purchase fk_purchase_accounts_seller; Type: FK CONSTRAINT; Schema: hsrmarket; Owner: postgres
--

ALTER TABLE ONLY purchase
    ADD CONSTRAINT fk_purchase_accounts_seller FOREIGN KEY (seller_id) REFERENCES accounts(account_id);


--
-- Name: purchase fk_purchase_articles; Type: FK CONSTRAINT; Schema: hsrmarket; Owner: postgres
--

ALTER TABLE ONLY purchase
    ADD CONSTRAINT fk_purchase_articles FOREIGN KEY (article_id) REFERENCES articles(article_id);


--
-- Name: tagsallocation fk_tagsallocation_articles; Type: FK CONSTRAINT; Schema: hsrmarket; Owner: postgres
--

ALTER TABLE ONLY tagsallocation
    ADD CONSTRAINT fk_tagsallocation_articles FOREIGN KEY (article_id) REFERENCES articles(article_id);


--
-- Name: tagsallocation fk_tagsallocation_tags; Type: FK CONSTRAINT; Schema: hsrmarket; Owner: postgres
--

ALTER TABLE ONLY tagsallocation
    ADD CONSTRAINT fk_tagsallocation_tags FOREIGN KEY (tag_id) REFERENCES tags(tag_id);


--
-- PostgreSQL database dump complete
--

