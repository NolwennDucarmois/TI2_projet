--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2024-05-17 17:17:24

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
-- TOC entry 235 (class 1255 OID 82168)
-- Name: ajout_instru(text, text, text, numeric, integer, integer, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.ajout_instru(text, text, text, numeric, integer, integer, text) RETURNS integer
    LANGUAGE plpgsql
    AS '
  declare p_reference alias for $1;
  declare p_nom alias for $2;
  declare p_couleur alias for $3;
  declare p_prix alias for $4;
  declare p_id_marque alias for $5;
  declare p_id_categorie alias for $6;
  declare p_image alias for $7;
  declare id integer;
  declare retour integer;
  
begin
	select into id id_instrument from instrument where reference_instrument = p_reference;
	if not found
	then
	  insert into instrument (reference_instrument,nom_instrument,couleur_instrument,prix_instrument,id_marque, id_categorie, image_instrument) values
	    (p_reference,p_nom,p_couleur,p_prix,p_id_marque,p_id_categorie,p_image);
		select into id id_instrument from instrument where reference_instrument = p_reference;
	  if not found
	  then	
	    retour = -1;  --échec de la requête
	  else
	    retour = 1;   -- insertion ok
	  end if;
	else
	  retour = 0;      -- déjà en BD
	end if;
 return retour;
 end;
 ';


--
-- TOC entry 229 (class 1255 OID 73998)
-- Name: delete_instru(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.delete_instru(integer) RETURNS integer
    LANGUAGE plpgsql
    AS '
	declare p_id alias for $1;
	declare retour integer;
BEGIN
	delete from instrument where id_instrument=p_id;
	RETURN 1;
END;
';


--
-- TOC entry 230 (class 1255 OID 90364)
-- Name: update_instru(integer, text, numeric); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_instru(integer, text, numeric) RETURNS integer
    LANGUAGE plpgsql
    AS '
	declare p_id alias for $1;
	declare p_couleur alias for $2;
	declare p_prix alias for $3;
	declare id integer;
	declare retour integer;
begin
	select into id id_instrument from instrument where id_instrument = p_id;
	if found 
	then
		update instrument 
		set couleur_instrument = p_couleur, 
		prix_instrument = p_prix
		where id_instrument = p_id;
		select into id id_instrument from instrument where id_instrument = p_id;
		if not found
		then	
	    	retour = -1;  --échec de la requête
	  	else
	    	retour = 1;   -- modification ok
	  	end if;
	else
		retour=0;
	end if;
	return retour;
end;
';


--
-- TOC entry 243 (class 1255 OID 90361)
-- Name: update_instru(integer, text, numeric, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_instru(integer, text, numeric, text) RETURNS integer
    LANGUAGE plpgsql
    AS '
	declare p_id alias for $1;
	declare p_couleur alias for $2;
	declare p_prix alias for $3;
	declare p_image alias for $4;
	declare id integer;
	declare retour integer;
begin
	select into id id_instrument from instrument where id_instrument = p_id;
	if found 
	then
		update instrument 
		set couleur_instrument = p_couleur, 
		prix_instrument = p_prix,
		image_instrument = p_image where id_instrument = p_id;
		select into id id_instrument from instrument where id_instrument = p_id;
		if not found
		then	
	    	retour = -1;  --échec de la requête
	  	else
	    	retour = 1;   -- modification ok
	  	end if;
	else
		retour=0;
	end if;
	return retour;
end;
';


--
-- TOC entry 228 (class 1255 OID 73946)
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
-- TOC entry 4903 (class 0 OID 0)
-- Dependencies: 219
-- Name: admin_id_admin_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.admin_id_admin_seq OWNED BY public.admin.id_admin;


--
-- TOC entry 218 (class 1259 OID 73901)
-- Name: categorie; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categorie (
    id_categorie integer NOT NULL,
    nom_categorie text,
    image_categorie text
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
-- TOC entry 4904 (class 0 OID 0)
-- Dependencies: 217
-- Name: catégorie_id_categorie_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."catégorie_id_categorie_seq" OWNED BY public.categorie.id_categorie;


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
-- TOC entry 4905 (class 0 OID 0)
-- Dependencies: 215
-- Name: client_id_client_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.client_id_client_seq OWNED BY public.client.id_client;


--
-- TOC entry 224 (class 1259 OID 82203)
-- Name: instrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.instrument (
    id_instrument integer NOT NULL,
    reference_instrument text,
    nom_instrument text,
    couleur_instrument text,
    prix_instrument numeric(15,2),
    image_instrument text,
    id_marque integer NOT NULL,
    id_categorie integer NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 82202)
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
-- TOC entry 4906 (class 0 OID 0)
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
-- TOC entry 4907 (class 0 OID 0)
-- Dependencies: 221
-- Name: marque_id_marque_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.marque_id_marque_seq OWNED BY public.marque.id_marque;


--
-- TOC entry 227 (class 1259 OID 82229)
-- Name: vue_categorie; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vue_categorie AS
 SELECT categorie.id_categorie,
    categorie.nom_categorie,
    categorie.image_categorie,
    instrument.id_instrument,
    instrument.reference_instrument,
    instrument.nom_instrument,
    instrument.couleur_instrument,
    instrument.prix_instrument,
    instrument.image_instrument,
    instrument.id_marque
   FROM (public.categorie
     JOIN public.instrument ON ((categorie.id_categorie = instrument.id_categorie)));


--
-- TOC entry 226 (class 1259 OID 82225)
-- Name: vue_instruments; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vue_instruments AS
 SELECT instrument.id_instrument,
    instrument.reference_instrument,
    instrument.nom_instrument,
    instrument.couleur_instrument,
    instrument.prix_instrument,
    instrument.image_instrument,
    marque.id_marque,
    marque.nom_marque,
    categorie.id_categorie,
    categorie.nom_categorie
   FROM ((public.instrument
     JOIN public.categorie ON ((categorie.id_categorie = instrument.id_categorie)))
     JOIN public.marque ON ((marque.id_marque = instrument.id_marque)));


--
-- TOC entry 225 (class 1259 OID 82221)
-- Name: vue_marque; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vue_marque AS
 SELECT marque.id_marque,
    marque.nom_marque,
    instrument.id_instrument,
    instrument.reference_instrument,
    instrument.nom_instrument,
    instrument.couleur_instrument,
    instrument.prix_instrument,
    instrument.image_instrument,
    instrument.id_categorie
   FROM (public.marque
     JOIN public.instrument ON ((instrument.id_marque = marque.id_marque)));


--
-- TOC entry 4727 (class 2604 OID 73913)
-- Name: admin id_admin; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin ALTER COLUMN id_admin SET DEFAULT nextval('public.admin_id_admin_seq'::regclass);


--
-- TOC entry 4726 (class 2604 OID 73904)
-- Name: categorie id_categorie; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categorie ALTER COLUMN id_categorie SET DEFAULT nextval('public."catégorie_id_categorie_seq"'::regclass);


--
-- TOC entry 4725 (class 2604 OID 73895)
-- Name: client id_client; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.client ALTER COLUMN id_client SET DEFAULT nextval('public.client_id_client_seq'::regclass);


--
-- TOC entry 4729 (class 2604 OID 82206)
-- Name: instrument id_instrument; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.instrument ALTER COLUMN id_instrument SET DEFAULT nextval('public.instrument_id_instrument_seq'::regclass);


--
-- TOC entry 4728 (class 2604 OID 73922)
-- Name: marque id_marque; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.marque ALTER COLUMN id_marque SET DEFAULT nextval('public.marque_id_marque_seq'::regclass);


--
-- TOC entry 4893 (class 0 OID 73910)
-- Dependencies: 220
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.admin (id_admin, login, password) VALUES (1, 'Nolwenn', '1234');
INSERT INTO public.admin (id_admin, login, password) VALUES (2, 'Bob', 'Bob');


--
-- TOC entry 4891 (class 0 OID 73901)
-- Dependencies: 218
-- Data for Name: categorie; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.categorie (id_categorie, nom_categorie, image_categorie) VALUES (1, 'Instrument à vent', 'instru_vent.jpg');
INSERT INTO public.categorie (id_categorie, nom_categorie, image_categorie) VALUES (2, 'Instrument à cordes', 'instru_cordes.jpg');
INSERT INTO public.categorie (id_categorie, nom_categorie, image_categorie) VALUES (3, 'Instrument à percussion', 'instru_percussion.jpg');
INSERT INTO public.categorie (id_categorie, nom_categorie, image_categorie) VALUES (4, 'Clavier', 'instru_clavier.jpg');


--
-- TOC entry 4889 (class 0 OID 73892)
-- Dependencies: 216
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.client (id_client, nom_client, prenom_client, adresse_client, tel_client) VALUES (1, 'Jean', 'Marc', 'Rue Paul Pastur 15 7800 ATH', '0457/785263');


--
-- TOC entry 4897 (class 0 OID 82203)
-- Dependencies: 224
-- Data for Name: instrument; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.instrument (id_instrument, reference_instrument, nom_instrument, couleur_instrument, prix_instrument, image_instrument, id_marque, id_categorie) VALUES (1, '10013', 'Clarinette E13', 'Noir', 1300.00, 'clarinetteE13.jpg', 1, 1);
INSERT INTO public.instrument (id_instrument, reference_instrument, nom_instrument, couleur_instrument, prix_instrument, image_instrument, id_marque, id_categorie) VALUES (9, '10025', 'Accordéon', 'Noir et Rouge', 4680.00, 'accordeonPiano.jpg', 8, 4);
INSERT INTO public.instrument (id_instrument, reference_instrument, nom_instrument, couleur_instrument, prix_instrument, image_instrument, id_marque, id_categorie) VALUES (3, '10014', 'Piano Droit Serie SU', 'Noir', 189000.00, 'pianoDroitSerieSU.jpg', 2, 4);


--
-- TOC entry 4895 (class 0 OID 73919)
-- Dependencies: 222
-- Data for Name: marque; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.marque (id_marque, nom_marque) VALUES (1, 'Buffet Crampon');
INSERT INTO public.marque (id_marque, nom_marque) VALUES (2, 'Yamaha');
INSERT INTO public.marque (id_marque, nom_marque) VALUES (3, 'Millenium');
INSERT INTO public.marque (id_marque, nom_marque) VALUES (4, 'Salvi');
INSERT INTO public.marque (id_marque, nom_marque) VALUES (5, 'Bach');
INSERT INTO public.marque (id_marque, nom_marque) VALUES (6, 'Meinl');
INSERT INTO public.marque (id_marque, nom_marque) VALUES (7, 'Conrad Götz');
INSERT INTO public.marque (id_marque, nom_marque) VALUES (8, 'Scandalli');


--
-- TOC entry 4908 (class 0 OID 0)
-- Dependencies: 219
-- Name: admin_id_admin_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.admin_id_admin_seq', 2, true);


--
-- TOC entry 4909 (class 0 OID 0)
-- Dependencies: 217
-- Name: catégorie_id_categorie_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."catégorie_id_categorie_seq"', 4, true);


--
-- TOC entry 4910 (class 0 OID 0)
-- Dependencies: 215
-- Name: client_id_client_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.client_id_client_seq', 1, true);


--
-- TOC entry 4911 (class 0 OID 0)
-- Dependencies: 223
-- Name: instrument_id_instrument_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.instrument_id_instrument_seq', 11, true);


--
-- TOC entry 4912 (class 0 OID 0)
-- Dependencies: 221
-- Name: marque_id_marque_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.marque_id_marque_seq', 8, true);


--
-- TOC entry 4735 (class 2606 OID 73917)
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id_admin);


--
-- TOC entry 4733 (class 2606 OID 73908)
-- Name: categorie catégorie_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categorie
    ADD CONSTRAINT "catégorie_pkey" PRIMARY KEY (id_categorie);


--
-- TOC entry 4731 (class 2606 OID 73899)
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id_client);


--
-- TOC entry 4739 (class 2606 OID 82210)
-- Name: instrument instrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.instrument
    ADD CONSTRAINT instrument_pkey PRIMARY KEY (id_instrument);


--
-- TOC entry 4737 (class 2606 OID 73926)
-- Name: marque marque_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.marque
    ADD CONSTRAINT marque_pkey PRIMARY KEY (id_marque);


--
-- TOC entry 4740 (class 2606 OID 82216)
-- Name: instrument instrument_id_categorie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.instrument
    ADD CONSTRAINT instrument_id_categorie_fkey FOREIGN KEY (id_categorie) REFERENCES public.categorie(id_categorie);


--
-- TOC entry 4741 (class 2606 OID 82211)
-- Name: instrument instrument_id_marque_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.instrument
    ADD CONSTRAINT instrument_id_marque_fkey FOREIGN KEY (id_marque) REFERENCES public.marque(id_marque);


-- Completed on 2024-05-17 17:17:24

--
-- PostgreSQL database dump complete
--

