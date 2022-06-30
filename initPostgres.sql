--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

-- Started on 2022-06-29 12:15:42

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
-- TOC entry 219 (class 1255 OID 16493)
-- Name: token_generator(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.token_generator(password text) RETURNS text
    LANGUAGE plpgsql
    AS $$
declare
token text;
begin
SELECT md5(random()::text) ;
return token;
end;
$$;


ALTER FUNCTION public.token_generator(password text) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 214 (class 1259 OID 16444)
-- Name: bank_accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bank_accounts (
    id integer NOT NULL,
    bank_id integer NOT NULL,
    user_id integer NOT NULL,
    balance real NOT NULL,
    account_name character varying NOT NULL
);


ALTER TABLE public.bank_accounts OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16443)
-- Name: bank_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bank_accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bank_accounts_id_seq OWNER TO postgres;

--
-- TOC entry 3356 (class 0 OID 0)
-- Dependencies: 213
-- Name: bank_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bank_accounts_id_seq OWNED BY public.bank_accounts.id;


--
-- TOC entry 212 (class 1259 OID 16421)
-- Name: banks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.banks (
    bank_name text NOT NULL,
    bank_id integer NOT NULL
);


ALTER TABLE public.banks OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16420)
-- Name: banks_bank_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.banks_bank_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.banks_bank_id_seq OWNER TO postgres;

--
-- TOC entry 3357 (class 0 OID 0)
-- Dependencies: 211
-- Name: banks_bank_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.banks_bank_id_seq OWNED BY public.banks.bank_id;


--
-- TOC entry 217 (class 1259 OID 24695)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    category_name character varying NOT NULL,
    user_id character varying NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 24700)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- TOC entry 3358 (class 0 OID 0)
-- Dependencies: 218
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- TOC entry 216 (class 1259 OID 24686)
-- Name: expenses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.expenses (
    id integer NOT NULL,
    expense_name character varying NOT NULL,
    user_id integer NOT NULL,
    date_added date DEFAULT CURRENT_DATE,
    category_id integer NOT NULL,
    amount numeric,
    bank_account_id integer
);


ALTER TABLE public.expenses OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 24685)
-- Name: expenses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.expenses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.expenses_id_seq OWNER TO postgres;

--
-- TOC entry 3359 (class 0 OID 0)
-- Dependencies: 215
-- Name: expenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.expenses_id_seq OWNED BY public.expenses.id;


--
-- TOC entry 210 (class 1259 OID 16398)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying NOT NULL,
    last_name character varying NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL,
    token text
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16397)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3360 (class 0 OID 0)
-- Dependencies: 209
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3187 (class 2604 OID 16447)
-- Name: bank_accounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_accounts ALTER COLUMN id SET DEFAULT nextval('public.bank_accounts_id_seq'::regclass);


--
-- TOC entry 3186 (class 2604 OID 16424)
-- Name: banks bank_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banks ALTER COLUMN bank_id SET DEFAULT nextval('public.banks_bank_id_seq'::regclass);


--
-- TOC entry 3190 (class 2604 OID 24701)
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- TOC entry 3188 (class 2604 OID 24689)
-- Name: expenses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expenses ALTER COLUMN id SET DEFAULT nextval('public.expenses_id_seq'::regclass);


--
-- TOC entry 3185 (class 2604 OID 16401)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3346 (class 0 OID 16444)
-- Dependencies: 214
-- Data for Name: bank_accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bank_accounts (id, bank_id, user_id, balance, account_name) FROM stdin;
3	1	2	2000.02	Cuenta Bac
4	2	22	800	Cuenta Banco Atlantida
6	3	22	900	Cuenta Banco Ficohsa
7	3	2	9000	Cuenta Banco Occidente
11	1	22	2001	Cuenta Nueva Bac1
12	2	22	5000	dsadsad
13	1	25	5000	Cuenta Bac
\.


--
-- TOC entry 3344 (class 0 OID 16421)
-- Dependencies: 212
-- Data for Name: banks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.banks (bank_name, bank_id) FROM stdin;
Bac	1
Banco Atlantida	2
Ficohsa	3
\.


--
-- TOC entry 3349 (class 0 OID 24695)
-- Dependencies: 217
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (category_name, user_id, id) FROM stdin;
Housing	25	1
Transportation	25	2
Food	25	3
Utilities	25	4
Clothing	25	5
Medical/Healthcare	25	6
Insurance	25	7
Household Items/Supplies	25	8
Personal	25	9
Debt	25	10
Education	25	11
Savings	25	12
Entertainment	25	13
Debt	22	1
\.


--
-- TOC entry 3348 (class 0 OID 24686)
-- Dependencies: 216
-- Data for Name: expenses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.expenses (id, expense_name, user_id, date_added, category_id, amount, bank_account_id) FROM stdin;
1	Netflix Subscription	22	2022-06-28	13	100	1
2	Doctor	22	2022-06-28	6	100	1
3	Vacations	22	2022-06-28	13	100	1
6	Pago Doctor	22	2022-06-27	6	700	2
\.


--
-- TOC entry 3342 (class 0 OID 16398)
-- Dependencies: 210
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, last_name, email, password, token) FROM stdin;
5	Samuel	Flores	samuelflores@gmail.com	$2a$10$hbEkcXcytt5NgpKm9g4/y./nbxxgpo0FIG.3o3XobkIrTRkM4A.4C	\N
22	Toby	Jair	toby9698@gmail.com	$2a$08$9P5GUBiUSMjDF2H1rZwhJ.KGV8n0r8XqqNtD4JDQbSH6fpfxZY6cm	65b91c9aa9492e33d481b29ddccd49da
2	Saul	Flores	saulflores@gmail.com	$2a$08$MQPUT3rX8Gi2ceJbUKIahecvBVE/YcXY2Bzi3spPSrf6pX8QYKwUS	c83dc8c0379f50b37798839296ac7322
24	Toby2	flores	toby98@gmail.com	$2a$08$6q4yxEjjeZM4MI4UWUZdveOCThYV3nrsqOGcP9TCZscMe6WDzOBnO	06976c5d99ca857c929aec07b84c4727
23	Toby	Jair2	toby9622298@gmail.com	$2a$08$yMFiWjpJWVzhK5fmA3IQTefiKnFw3z5JC3HDovIY8IlME6LN5wXV.	920faba266813df9b1bc3d8cdac2632f
25	Rina	Reyes	rina@gmail.com	$2a$08$kpqz4tPJLd3AQATSZbY32OL3Q0cqMGULxkjFtLr9AtJVUyfNvQHri	5ec2bfbd440a9e29aacc0acdeed99e8b
26	Default	User	default@gmail.com	$2a$08$sE0w9o.nP3pWR3URaTXkV.sfSR42AOTePN7G3.SRK0otWPPZNiq4y	a1fdc1885c6cce25f2864e15ddd86d77
\.


--
-- TOC entry 3361 (class 0 OID 0)
-- Dependencies: 213
-- Name: bank_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bank_accounts_id_seq', 13, true);


--
-- TOC entry 3362 (class 0 OID 0)
-- Dependencies: 211
-- Name: banks_bank_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.banks_bank_id_seq', 2, true);


--
-- TOC entry 3363 (class 0 OID 0)
-- Dependencies: 218
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 2, true);


--
-- TOC entry 3364 (class 0 OID 0)
-- Dependencies: 215
-- Name: expenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.expenses_id_seq', 6, true);


--
-- TOC entry 3365 (class 0 OID 0)
-- Dependencies: 209
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 26, true);


--
-- TOC entry 3197 (class 2606 OID 16449)
-- Name: bank_accounts bank_accounts_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_accounts
    ADD CONSTRAINT bank_accounts_pk PRIMARY KEY (id);


--
-- TOC entry 3194 (class 2606 OID 16428)
-- Name: banks banks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banks
    ADD CONSTRAINT banks_pkey PRIMARY KEY (bank_id);


--
-- TOC entry 3199 (class 2606 OID 24693)
-- Name: expenses expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expenses
    ADD CONSTRAINT expenses_pkey PRIMARY KEY (id);


--
-- TOC entry 3192 (class 2606 OID 16403)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3195 (class 1259 OID 16455)
-- Name: bank_accounts_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX bank_accounts_id_idx ON public.bank_accounts USING btree (id);


--
-- TOC entry 3200 (class 2606 OID 16456)
-- Name: bank_accounts fk_bank; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_accounts
    ADD CONSTRAINT fk_bank FOREIGN KEY (bank_id) REFERENCES public.banks(bank_id);


--
-- TOC entry 3201 (class 2606 OID 16461)
-- Name: bank_accounts fk_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_accounts
    ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES public.users(id);


-- Completed on 2022-06-29 12:15:42

--
-- PostgreSQL database dump complete
--

