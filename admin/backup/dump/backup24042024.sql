--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2024-04-24 17:47:35

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
-- TOC entry 225 (class 1255 OID 73946)
-- Name: verif_admin(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.verif_admin(text, text) RETURNS integer
    LANGUAGE plpgsql
    AS '
	declare p_login alias for $1;
	declare p_password alias for $2;
	declare id integer;
	declare retour integer;
	
begin
	select into id id_admin from admin where login=p_login and password=p_password;
	if not found 
	then
	  retour = 0;
	else
	  retour =1;
	end if;  
	return retour;
end;
';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 73910)
-- Name: admin; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.admin (
    id_admin integer NOT NULL,
    login text,
    password text
);


--
-- TOC entry 219 (class 1259 OID 73909)
-- Name: admin_id_admin_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.admin_id_admin_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4884 (class 0 OID 0)
-- Dependencies: 219
-- Name: admin_id_admin_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.admin_id_admin_seq OWNED BY public.admin.id_admin;


--
-- TOC entry 218 (class 1259 OID 73901)
-- Name: catégorie; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."catégorie" (
    id_categorie integer NOT NULL,
    nom_categorie text
);


--
-- TOC entry 217 (class 1259 OID 73900)
-- Name: catégorie_id_categorie_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."catégorie_id_categorie_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4885 (class 0 OID 0)
-- Dependencies: 217
-- Name: catégorie_id_categorie_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."catégorie_id_categorie_seq" OWNED BY public."catégorie".id_categorie;


--
-- TOC entry 216 (class 1259 OID 73892)
-- Name: client; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.client (
    id_client integer NOT NULL,
    nom_client text,
    prenom_client text,
    adresse_client text,
    tel_client text
);


--
-- TOC entry 215 (class 1259 OID 73891)
-- Name: client_id_client_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.client_id_client_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4886 (class 0 OID 0)
-- Dependencies: 215
-- Name: client_id_client_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.client_id_client_seq OWNED BY public.client.id_client;


--
-- TOC entry 224 (class 1259 OID 73928)
-- Name: instrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.instrument (
    id_instrument integer NOT NULL,
    reference_instrument text,
    nom_instrument text,
    couleur_instrument text,
    prix_instrument numeric(15,2),
    id_marque integer NOT NULL,
    id_categorie integer NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 73927)
-- Name: instrument_id_instrument_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.instrument_id_instrument_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4887 (class 0 OID 0)
-- Dependencies: 223
-- Name: instrument_id_instrument_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.instrument_id_instrument_seq OWNED BY public.instrument.id_instrument;


--
-- TOC entry 222 (class 1259 OID 73919)
-- Name: marque; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.marque (
    id_marque integer NOT NULL,
    nom_marque text
);


--
-- TOC entry 221 (class 1259 OID 73918)
-- Name: marque_id_marque_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.marque_id_marque_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4888 (class 0 OID 0)
-- Dependencies: 221
-- Name: marque_id_marque_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.marque_id_marque_seq OWNED BY public.marque.id_marque;


--
-- TOC entry 4711 (class 2604 OID 73913)
-- Name: admin id_admin; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin ALTER COLUMN id_admin SET DEFAULT nextval('public.admin_id_admin_seq'::regclass);


--
-- TOC entry 4710 (class 2604 OID 73904)
-- Name: catégorie id_categorie; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."catégorie" ALTER COLUMN id_categorie SET DEFAULT nextval('public."catégorie_id_categorie_seq"'::regclass);


--
-- TOC entry 4709 (class 2604 OID 73895)
-- Name: client id_client; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.client ALTER COLUMN id_client SET DEFAULT nextval('public.client_id_client_seq'::regclass);


--
-- TOC entry 4713 (class 2604 OID 73931)
-- Name: instrument id_instrument; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.instrument ALTER COLUMN id_instrument SET DEFAULT nextval('public.instrument_id_instrument_seq'::regclass);


--
-- TOC entry 4712 (class 2604 OID 73922)
-- Name: marque id_marque; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.marque ALTER COLUMN id_marque SET DEFAULT nextval('public.marque_id_marque_seq'::regclass);


--
-- TOC entry 4874 (class 0 OID 73910)
-- Dependencies: 220
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.admin (id_admin, login, password) VALUES (1, 'Nolwenn', '1234');
INSERT INTO public.admin (id_admin, login, password) VALUES (2, 'Bob', 'Bob');


--
-- TOC entry 4872 (class 0 OID 73901)
-- Dependencies: 218
-- Data for Name: catégorie; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."catégorie" (id_categorie, nom_categorie) VALUES (1, 'Instrument à vent');
INSERT INTO public."catégorie" (id_categorie, nom_categorie) VALUES (2, 'Instrument à cordes');
INSERT INTO public."catégorie" (id_categorie, nom_categorie) VALUES (3, 'Instrument à percussion');
INSERT INTO public."catégorie" (id_categorie, nom_categorie) VALUES (4, 'Clavier');


--
-- TOC entry 4870 (class 0 OID 73892)
-- Dependencies: 216
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.client (id_client, nom_client, prenom_client, adresse_client, tel_client) VALUES (1, 'Jean', 'Marc', 'Rue Paul Pastur 15 7800 ATH', '0457/785263');


--
-- TOC entry 4878 (class 0 OID 73928)
-- Dependencies: 224
-- Data for Name: instrument; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4876 (class 0 OID 73919)
-- Dependencies: 222
-- Data for Name: marque; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4889 (class 0 OID 0)
-- Dependencies: 219
-- Name: admin_id_admin_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.admin_id_admin_seq', 2, true);


--
-- TOC entry 4890 (class 0 OID 0)
-- Dependencies: 217
-- Name: catégorie_id_categorie_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."catégorie_id_categorie_seq"', 4, true);


--
-- TOC entry 4891 (class 0 OID 0)
-- Dependencies: 215
-- Name: client_id_client_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.client_id_client_seq', 1, true);


--
-- TOC entry 4892 (class 0 OID 0)
-- Dependencies: 223
-- Name: instrument_id_instrument_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.instrument_id_instrument_seq', 1, false);


--
-- TOC entry 4893 (class 0 OID 0)
-- Dependencies: 221
-- Name: marque_id_marque_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.marque_id_marque_seq', 1, false);


--
-- TOC entry 4719 (class 2606 OID 73917)
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id_admin);


--
-- TOC entry 4717 (class 2606 OID 73908)
-- Name: catégorie catégorie_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."catégorie"
    ADD CONSTRAINT "catégorie_pkey" PRIMARY KEY (id_categorie);


--
-- TOC entry 4715 (class 2606 OID 73899)
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id_client);


--
-- TOC entry 4723 (class 2606 OID 73935)
-- Name: instrument instrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.instrument
    ADD CONSTRAINT instrument_pkey PRIMARY KEY (id_instrument);


--
-- TOC entry 4721 (class 2606 OID 73926)
-- Name: marque marque_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.marque
    ADD CONSTRAINT marque_pkey PRIMARY KEY (id_marque);


--
-- TOC entry 4724 (class 2606 OID 73941)
-- Name: instrument instrument_id_categorie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.instrument
    ADD CONSTRAINT instrument_id_categorie_fkey FOREIGN KEY (id_categorie) REFERENCES public."catégorie"(id_categorie);


--
-- TOC entry 4725 (class 2606 OID 73936)
-- Name: instrument instrument_id_marque_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.instrument
    ADD CONSTRAINT instrument_id_marque_fkey FOREIGN KEY (id_marque) REFERENCES public.marque(id_marque);


-- Completed on 2024-04-24 17:47:36

--
-- PostgreSQL database dump complete
--

