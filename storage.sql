--
-- PostgreSQL database dump
--

\restrict E7RW2EBXoArxcordkqTbujfA6f7Xo7nUJ6I7JPXZTEhX3CT5Byjcg6A8PTJSyzK

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-10-29 15:48:59

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 19212)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    category_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    created_by integer
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 19219)
-- Name: categories_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_category_id_seq OWNER TO postgres;

--
-- TOC entry 5036 (class 0 OID 0)
-- Dependencies: 220
-- Name: categories_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_category_id_seq OWNED BY public.categories.category_id;


--
-- TOC entry 221 (class 1259 OID 19220)
-- Name: orderitems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orderitems (
    order_item_id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    price_at_purchase numeric(10,2)
);


ALTER TABLE public.orderitems OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 19227)
-- Name: orderitems_order_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orderitems_order_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orderitems_order_item_id_seq OWNER TO postgres;

--
-- TOC entry 5037 (class 0 OID 0)
-- Dependencies: 222
-- Name: orderitems_order_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orderitems_order_item_id_seq OWNED BY public.orderitems.order_item_id;


--
-- TOC entry 223 (class 1259 OID 19228)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    user_id integer,
    order_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(20) DEFAULT 'new'::character varying,
    processed_by integer
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 19234)
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_order_id_seq OWNER TO postgres;

--
-- TOC entry 5038 (class 0 OID 0)
-- Dependencies: 224
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;


--
-- TOC entry 225 (class 1259 OID 19235)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    product_id integer NOT NULL,
    category_id integer,
    name character varying(100) NOT NULL,
    description text,
    unit character varying(20),
    price numeric(10,2),
    created_by integer,
    modified_by integer
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 19242)
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_product_id_seq OWNER TO postgres;

--
-- TOC entry 5039 (class 0 OID 0)
-- Dependencies: 226
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;


--
-- TOC entry 227 (class 1259 OID 19243)
-- Name: stock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock (
    stock_id integer NOT NULL,
    product_id integer NOT NULL,
    location_id integer NOT NULL,
    quantity integer DEFAULT 0 NOT NULL,
    status character varying(20) DEFAULT 'available'::character varying,
    date_received timestamp without time zone,
    last_checked_by integer,
    last_check_date timestamp without time zone
);


ALTER TABLE public.stock OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 19252)
-- Name: stock_stock_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stock_stock_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stock_stock_id_seq OWNER TO postgres;

--
-- TOC entry 5040 (class 0 OID 0)
-- Dependencies: 228
-- Name: stock_stock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stock_stock_id_seq OWNED BY public.stock.stock_id;


--
-- TOC entry 229 (class 1259 OID 19253)
-- Name: storagecells; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.storagecells (
    location_id integer NOT NULL,
    warehouse_id integer,
    cell_code character varying(50) NOT NULL
);


ALTER TABLE public.storagecells OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 19258)
-- Name: storagecells_location_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.storagecells_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.storagecells_location_id_seq OWNER TO postgres;

--
-- TOC entry 5041 (class 0 OID 0)
-- Dependencies: 230
-- Name: storagecells_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.storagecells_location_id_seq OWNED BY public.storagecells.location_id;


--
-- TOC entry 231 (class 1259 OID 19259)
-- Name: suppliers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suppliers (
    supplier_id integer NOT NULL,
    name character varying(100) NOT NULL,
    contacts character varying(255),
    address text
);


ALTER TABLE public.suppliers OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 19266)
-- Name: suppliers_supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.suppliers_supplier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.suppliers_supplier_id_seq OWNER TO postgres;

--
-- TOC entry 5042 (class 0 OID 0)
-- Dependencies: 232
-- Name: suppliers_supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.suppliers_supplier_id_seq OWNED BY public.suppliers.supplier_id;


--
-- TOC entry 233 (class 1259 OID 19267)
-- Name: supplies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplies (
    supply_id integer NOT NULL,
    supplier_id integer,
    supply_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    accepted_by integer
);


ALTER TABLE public.supplies OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 19272)
-- Name: supplies_supply_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.supplies_supply_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.supplies_supply_id_seq OWNER TO postgres;

--
-- TOC entry 5043 (class 0 OID 0)
-- Dependencies: 234
-- Name: supplies_supply_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.supplies_supply_id_seq OWNED BY public.supplies.supply_id;


--
-- TOC entry 235 (class 1259 OID 19273)
-- Name: supplyitems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplyitems (
    supply_item_id integer NOT NULL,
    supply_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    purchase_price numeric(10,2)
);


ALTER TABLE public.supplyitems OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 19280)
-- Name: supplyitems_supply_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.supplyitems_supply_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.supplyitems_supply_item_id_seq OWNER TO postgres;

--
-- TOC entry 5044 (class 0 OID 0)
-- Dependencies: 236
-- Name: supplyitems_supply_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.supplyitems_supply_item_id_seq OWNED BY public.supplyitems.supply_item_id;


--
-- TOC entry 237 (class 1259 OID 19281)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    login character varying(50) NOT NULL,
    password_hash character varying(255) NOT NULL,
    role character varying(20) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 19288)
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_user_id_seq OWNER TO postgres;

--
-- TOC entry 5045 (class 0 OID 0)
-- Dependencies: 238
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- TOC entry 239 (class 1259 OID 19289)
-- Name: warehouses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.warehouses (
    warehouse_id integer NOT NULL,
    name character varying(100) NOT NULL,
    address text,
    manager_id integer
);


ALTER TABLE public.warehouses OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 19296)
-- Name: warehouses_warehouse_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.warehouses_warehouse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.warehouses_warehouse_id_seq OWNER TO postgres;

--
-- TOC entry 5046 (class 0 OID 0)
-- Dependencies: 240
-- Name: warehouses_warehouse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.warehouses_warehouse_id_seq OWNED BY public.warehouses.warehouse_id;


--
-- TOC entry 4805 (class 2604 OID 19297)
-- Name: categories category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN category_id SET DEFAULT nextval('public.categories_category_id_seq'::regclass);


--
-- TOC entry 4806 (class 2604 OID 19298)
-- Name: orderitems order_item_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems ALTER COLUMN order_item_id SET DEFAULT nextval('public.orderitems_order_item_id_seq'::regclass);


--
-- TOC entry 4807 (class 2604 OID 19299)
-- Name: orders order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- TOC entry 4810 (class 2604 OID 19300)
-- Name: products product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- TOC entry 4811 (class 2604 OID 19301)
-- Name: stock stock_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock ALTER COLUMN stock_id SET DEFAULT nextval('public.stock_stock_id_seq'::regclass);


--
-- TOC entry 4814 (class 2604 OID 19302)
-- Name: storagecells location_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storagecells ALTER COLUMN location_id SET DEFAULT nextval('public.storagecells_location_id_seq'::regclass);


--
-- TOC entry 4815 (class 2604 OID 19303)
-- Name: suppliers supplier_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers ALTER COLUMN supplier_id SET DEFAULT nextval('public.suppliers_supplier_id_seq'::regclass);


--
-- TOC entry 4816 (class 2604 OID 19304)
-- Name: supplies supply_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplies ALTER COLUMN supply_id SET DEFAULT nextval('public.supplies_supply_id_seq'::regclass);


--
-- TOC entry 4818 (class 2604 OID 19305)
-- Name: supplyitems supply_item_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplyitems ALTER COLUMN supply_item_id SET DEFAULT nextval('public.supplyitems_supply_item_id_seq'::regclass);


--
-- TOC entry 4819 (class 2604 OID 19306)
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- TOC entry 4820 (class 2604 OID 19307)
-- Name: warehouses warehouse_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouses ALTER COLUMN warehouse_id SET DEFAULT nextval('public.warehouses_warehouse_id_seq'::regclass);


--
-- TOC entry 5009 (class 0 OID 19212)
-- Dependencies: 219
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (category_id, name, description, created_by) FROM stdin;
2	Катушки	Безынерционные и мультипликаторные	1
3	Приманки	Воблеры, блесны, силикон	2
4	Лески и шнуры	Плетенки, монолески, флюорокарбон	3
5	Аксессуары	Садки, подсачеки, коробки	4
1	Новая категория	Описание №1	3
6	Зимняя рыбалка	Ледобуры, балансиры, мормышки	1
7	Экипировка	Костюмы, сапоги, перчатки для рыбалки	2
8	Электроника	Эхолоты, навигаторы, фонари	3
\.


--
-- TOC entry 5011 (class 0 OID 19220)
-- Dependencies: 221
-- Data for Name: orderitems; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orderitems (order_item_id, order_id, product_id, quantity, price_at_purchase) FROM stdin;
3	2	2	1	3200.00
4	2	3	5	450.00
6	3	3	3	450.00
8	4	2	1	3200.00
9	5	4	3	1200.00
2	1	4	9	4991.32
\.


--
-- TOC entry 5013 (class 0 OID 19228)
-- Dependencies: 223
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, user_id, order_date, status, processed_by) FROM stdin;
1	1	2026-10-02 16:50:13	в обработке	2
2	2	2026-10-27 15:06:38	Новый	3
3	3	2026-10-18 19:08:01	в обработке	4
4	4	2026-10-04 22:04:24	завершен	5
5	5	2026-10-03 09:42:58	завершен	1
6	3	2026-10-27 21:30:50.442675	new	4
8	3	2026-10-27 21:34:31.898133	new	4
9	5	2026-10-25 21:34:31.898133	Создан	2
7	5	2026-10-25 21:30:50.442675	завершен	2
\.


--
-- TOC entry 5015 (class 0 OID 19235)
-- Dependencies: 225
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (product_id, category_id, name, description, unit, price, created_by, modified_by) FROM stdin;
2	2	Катушка "Карп-3000"	Безынерционная, 5+1 подшипников, байтраннер	шт	3520.00	2	2
4	4	Шнур плетеный "PowerPro" 0.2мм	Плетенка 4-жильная, 150м, разрывная 12кг	шт	1020.00	4	4
3	3	Воблер "Окунь-Killer" 70мм	Плавающий воблер, расцветка "окунь", 2 тройника	шт	420.75	3	3
1	2	самая лучшая катушка	Полное описание нового товара	шт	100.00	1	2
\.


--
-- TOC entry 5017 (class 0 OID 19243)
-- Dependencies: 227
-- Data for Name: stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stock (stock_id, product_id, location_id, quantity, status, date_received, last_checked_by, last_check_date) FROM stdin;
4	4	4	2	available	2026-10-08 15:44:38	4	2026-10-27 06:20:45
1	1	1	76	зарезервирован	2026-10-03 03:26:17	1	2026-10-24 10:49:52
2	2	2	48	зарезервирован	2026-10-23 00:09:51	2	2026-10-19 23:27:07
3	3	3	42	доступен	2026-10-23 23:43:50	3	2026-10-17 21:54:59
\.


--
-- TOC entry 5019 (class 0 OID 19253)
-- Dependencies: 229
-- Data for Name: storagecells; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.storagecells (location_id, warehouse_id, cell_code) FROM stdin;
2	2	B-02-05
3	3	C-03-12
4	4	D-04-08
5	5	E-05-20
1	2	CELL-623
\.


--
-- TOC entry 5021 (class 0 OID 19259)
-- Dependencies: 231
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suppliers (supplier_id, name, contacts, address) FROM stdin;
2	ИП Сомов С.С.	+7(812)555-44-33	г. Санкт-Петербург, наб. Мойки, 8
3	ООО "Карп-Мастер"	+7(846)777-88-99	г. Самара, ул. Волжская, 42
4	АО "Фидер-Про"	+7(831)222-33-44	г. Нижний Новгород, ул. Озерная, 7
5	ООО "Спиннинг-Центр"	+7(343)999-00-11	г. Екатеринбург, ул. Рыбацкая, 23
8	ООО "Щука-Трейд"	+7(846)555-11-22, sales@schuka-trade.ru	г. Самара, ул. Волжская, д. 100
9	АО "Озёрный Край"	+7(831)777-88-99, info@ozerniy-krai.ru	г. Нижний Новгород, ул. Озёрная, д. 50
10	ООО "Фидер-Мастер"	+7(343)444-55-66, zakaz@fider-master.ru	г. Екатеринбург, ул. Спортивная, д. 15
1	ООО "Новый Поставщик"	+78790418124	г. Санкт-Петербург, наб. Мойки,92
11	ООО "Щука-Мастер"	+7(495)777-88-99, schuka@master.ru	г. Казань, ул. Озёрная, д. 25
\.


--
-- TOC entry 5023 (class 0 OID 19267)
-- Dependencies: 233
-- Data for Name: supplies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplies (supply_id, supplier_id, supply_date, accepted_by) FROM stdin;
2	2	2026-10-16 23:29:24	3
3	3	2026-10-01 00:37:03	4
4	4	2026-10-16 00:02:17	4
5	5	2026-10-05 02:33:09	3
1	1	2026-10-10 02:16:35	4
\.


--
-- TOC entry 5025 (class 0 OID 19273)
-- Dependencies: 235
-- Data for Name: supplyitems; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplyitems (supply_item_id, supply_id, product_id, quantity, purchase_price) FROM stdin;
2	2	3	200	280.00
3	3	2	40	2100.00
4	4	4	150	750.00
1	1	1	277	6748.48
\.


--
-- TOC entry 5027 (class 0 OID 19281)
-- Dependencies: 237
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, login, password_hash, role) FROM stdin;
3	ivanov	test	менеджер
4	petrov	p1234	менеджер
5	koshkina	koshka	бухгалтер
2	cat	hash_0.32657533752307777	администратор
1	new_user	hash_0.9995586692604479	администратор
6	catfish	catfish324	кладовщик
7	cottonEyeJoe	test	менеджер
8	bigBadWolf	wolf1	комплектовщик
\.


--
-- TOC entry 5029 (class 0 OID 19289)
-- Dependencies: 239
-- Data for Name: warehouses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.warehouses (warehouse_id, name, address, manager_id) FROM stdin;
2	Склад "Северный"	г. Санкт-Петербург, ул. Портовая, 12	2
3	Склад "Южный"	г. Краснодар, ул. Складская, 8	3
4	Склад "Волга"	г. Нижний Новгород, ул. Речная, 3	4
5	Склад "Урал"	г. Екатеринбург, ул. Тагильская, 17	5
1	склад_0.29	г. Санкт-Петербург, ул. Портовая, 14	3
\.


--
-- TOC entry 5047 (class 0 OID 0)
-- Dependencies: 220
-- Name: categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_category_id_seq', 9, true);


--
-- TOC entry 5048 (class 0 OID 0)
-- Dependencies: 222
-- Name: orderitems_order_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orderitems_order_item_id_seq', 9, true);


--
-- TOC entry 5049 (class 0 OID 0)
-- Dependencies: 224
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 9, true);


--
-- TOC entry 5050 (class 0 OID 0)
-- Dependencies: 226
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_product_id_seq', 8, true);


--
-- TOC entry 5051 (class 0 OID 0)
-- Dependencies: 228
-- Name: stock_stock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stock_stock_id_seq', 5, true);


--
-- TOC entry 5052 (class 0 OID 0)
-- Dependencies: 230
-- Name: storagecells_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.storagecells_location_id_seq', 5, true);


--
-- TOC entry 5053 (class 0 OID 0)
-- Dependencies: 232
-- Name: suppliers_supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.suppliers_supplier_id_seq', 11, true);


--
-- TOC entry 5054 (class 0 OID 0)
-- Dependencies: 234
-- Name: supplies_supply_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.supplies_supply_id_seq', 5, true);


--
-- TOC entry 5055 (class 0 OID 0)
-- Dependencies: 236
-- Name: supplyitems_supply_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.supplyitems_supply_item_id_seq', 5, true);


--
-- TOC entry 5056 (class 0 OID 0)
-- Dependencies: 238
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 8, true);


--
-- TOC entry 5057 (class 0 OID 0)
-- Dependencies: 240
-- Name: warehouses_warehouse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.warehouses_warehouse_id_seq', 5, true);


--
-- TOC entry 4822 (class 2606 OID 19309)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- TOC entry 4824 (class 2606 OID 19311)
-- Name: orderitems orderitems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_pkey PRIMARY KEY (order_item_id);


--
-- TOC entry 4826 (class 2606 OID 19313)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- TOC entry 4828 (class 2606 OID 19315)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- TOC entry 4830 (class 2606 OID 19317)
-- Name: stock stock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_pkey PRIMARY KEY (stock_id);


--
-- TOC entry 4832 (class 2606 OID 19319)
-- Name: storagecells storagecells_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storagecells
    ADD CONSTRAINT storagecells_pkey PRIMARY KEY (location_id);


--
-- TOC entry 4834 (class 2606 OID 19321)
-- Name: suppliers suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (supplier_id);


--
-- TOC entry 4836 (class 2606 OID 19323)
-- Name: supplies supplies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplies
    ADD CONSTRAINT supplies_pkey PRIMARY KEY (supply_id);


--
-- TOC entry 4838 (class 2606 OID 19325)
-- Name: supplyitems supplyitems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplyitems
    ADD CONSTRAINT supplyitems_pkey PRIMARY KEY (supply_item_id);


--
-- TOC entry 4840 (class 2606 OID 19327)
-- Name: users users_login_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_login_key UNIQUE (login);


--
-- TOC entry 4842 (class 2606 OID 19329)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 4844 (class 2606 OID 19331)
-- Name: warehouses warehouses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouses
    ADD CONSTRAINT warehouses_pkey PRIMARY KEY (warehouse_id);


--
-- TOC entry 4845 (class 2606 OID 19332)
-- Name: categories categories_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(user_id);


--
-- TOC entry 4846 (class 2606 OID 19337)
-- Name: orderitems orderitems_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON DELETE CASCADE;


--
-- TOC entry 4847 (class 2606 OID 19342)
-- Name: orderitems orderitems_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- TOC entry 4848 (class 2606 OID 19347)
-- Name: orders orders_processed_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_processed_by_fkey FOREIGN KEY (processed_by) REFERENCES public.users(user_id);


--
-- TOC entry 4849 (class 2606 OID 19352)
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 4850 (class 2606 OID 19357)
-- Name: products products_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(category_id);


--
-- TOC entry 4851 (class 2606 OID 19362)
-- Name: products products_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(user_id);


--
-- TOC entry 4852 (class 2606 OID 19367)
-- Name: products products_modified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_modified_by_fkey FOREIGN KEY (modified_by) REFERENCES public.users(user_id);


--
-- TOC entry 4853 (class 2606 OID 19372)
-- Name: stock stock_last_checked_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_last_checked_by_fkey FOREIGN KEY (last_checked_by) REFERENCES public.users(user_id);


--
-- TOC entry 4854 (class 2606 OID 19377)
-- Name: stock stock_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.storagecells(location_id);


--
-- TOC entry 4855 (class 2606 OID 19382)
-- Name: stock stock_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- TOC entry 4856 (class 2606 OID 19387)
-- Name: storagecells storagecells_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storagecells
    ADD CONSTRAINT storagecells_warehouse_id_fkey FOREIGN KEY (warehouse_id) REFERENCES public.warehouses(warehouse_id) ON DELETE CASCADE;


--
-- TOC entry 4857 (class 2606 OID 19392)
-- Name: supplies supplies_accepted_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplies
    ADD CONSTRAINT supplies_accepted_by_fkey FOREIGN KEY (accepted_by) REFERENCES public.users(user_id);


--
-- TOC entry 4858 (class 2606 OID 19397)
-- Name: supplies supplies_supplier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplies
    ADD CONSTRAINT supplies_supplier_id_fkey FOREIGN KEY (supplier_id) REFERENCES public.suppliers(supplier_id);


--
-- TOC entry 4859 (class 2606 OID 19402)
-- Name: supplyitems supplyitems_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplyitems
    ADD CONSTRAINT supplyitems_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- TOC entry 4860 (class 2606 OID 19407)
-- Name: supplyitems supplyitems_supply_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplyitems
    ADD CONSTRAINT supplyitems_supply_id_fkey FOREIGN KEY (supply_id) REFERENCES public.supplies(supply_id) ON DELETE CASCADE;


--
-- TOC entry 4861 (class 2606 OID 19412)
-- Name: warehouses warehouses_manager_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouses
    ADD CONSTRAINT warehouses_manager_id_fkey FOREIGN KEY (manager_id) REFERENCES public.users(user_id);


-- Completed on 2026-10-29 15:48:59

--
-- PostgreSQL database dump complete
--

\unrestrict E7RW2EBXoArxcordkqTbujfA6f7Xo7nUJ6I7JPXZTEhX3CT5Byjcg6A8PTJSyzK

