--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5 (Debian 10.5-1.pgdg90+1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

-- Started on 2020-05-18 21:06:31 -03

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
-- TOC entry 4 (class 2615 OID 16387)
-- Name: loja; Type: SCHEMA; Schema: -; Owner: usrloja
--

CREATE SCHEMA loja;


ALTER SCHEMA loja OWNER TO usrloja;

--
-- TOC entry 1 (class 3079 OID 12980)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3058 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 216 (class 1259 OID 16716)
-- Name: sq_idcaixa; Type: SEQUENCE; Schema: loja; Owner: usrloja
--

CREATE SEQUENCE loja.sq_idcaixa
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE loja.sq_idcaixa OWNER TO usrloja;

--
-- TOC entry 212 (class 1259 OID 16599)
-- Name: sq_idproduto; Type: SEQUENCE; Schema: loja; Owner: usrloja
--

CREATE SEQUENCE loja.sq_idproduto
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE loja.sq_idproduto OWNER TO usrloja;

--
-- TOC entry 197 (class 1259 OID 16388)
-- Name: sq_idusuario; Type: SEQUENCE; Schema: loja; Owner: usrloja
--

CREATE SEQUENCE loja.sq_idusuario
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE loja.sq_idusuario OWNER TO usrloja;

--
-- TOC entry 219 (class 1259 OID 16749)
-- Name: sq_idvenda; Type: SEQUENCE; Schema: loja; Owner: usrloja
--

CREATE SEQUENCE loja.sq_idvenda
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE loja.sq_idvenda OWNER TO usrloja;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 198 (class 1259 OID 16396)
-- Name: ta_item_venda; Type: TABLE; Schema: loja; Owner: usrloja
--

CREATE TABLE loja.ta_item_venda (
    id_item_venda numeric(8,0) NOT NULL,
    id_produto numeric(4,0) NOT NULL,
    id_venda numeric(5,0) NOT NULL,
    qt_item numeric(12,4) NOT NULL,
    vl_item numeric(12,4) NOT NULL,
    vl_desconto numeric(12,4) NOT NULL,
    id_usuario_autorizacao numeric(4,0),
    id_autorizacao numeric(2,0)
);


ALTER TABLE loja.ta_item_venda OWNER TO usrloja;

--
-- TOC entry 199 (class 1259 OID 16399)
-- Name: ta_perfil_funcionalidade; Type: TABLE; Schema: loja; Owner: usrloja
--

CREATE TABLE loja.ta_perfil_funcionalidade (
    id_perfil_funcionalidade numeric(3,0) NOT NULL,
    id_perfil numeric(3,0) NOT NULL,
    id_funcionalidade numeric(2,0) NOT NULL
);


ALTER TABLE loja.ta_perfil_funcionalidade OWNER TO usrloja;

--
-- TOC entry 221 (class 1259 OID 16756)
-- Name: ta_venda_forma_pagamento; Type: TABLE; Schema: loja; Owner: usrloja
--

CREATE TABLE loja.ta_venda_forma_pagamento (
    id_venda_forma_pagamento numeric(10,0) NOT NULL,
    id_venda numeric(5,0) NOT NULL,
    id_forma_pagamento numeric(2,0) NOT NULL,
    id_bandeira numeric(2,0),
    vl_parcela numeric(12,4) NOT NULL
);


ALTER TABLE loja.ta_venda_forma_pagamento OWNER TO usrloja;

--
-- TOC entry 213 (class 1259 OID 16642)
-- Name: tb_caixa; Type: TABLE; Schema: loja; Owner: usrloja
--

CREATE TABLE loja.tb_caixa (
    id_caixa numeric(15,0) NOT NULL,
    id_usuario_operador numeric(4,0) NOT NULL,
    dt_abertura timestamp without time zone NOT NULL,
    id_usuario_abertura numeric(4,0) NOT NULL,
    dt_fechamento timestamp without time zone,
    id_usuario_fechamento numeric(4,0)
);


ALTER TABLE loja.tb_caixa OWNER TO usrloja;

--
-- TOC entry 200 (class 1259 OID 16402)
-- Name: tb_cep; Type: TABLE; Schema: loja; Owner: usrloja
--

CREATE TABLE loja.tb_cep (
    id_cep numeric NOT NULL
);


ALTER TABLE loja.tb_cep OWNER TO usrloja;

--
-- TOC entry 201 (class 1259 OID 16408)
-- Name: tb_compra; Type: TABLE; Schema: loja; Owner: usrloja
--

CREATE TABLE loja.tb_compra (
    id_compra numeric(5,0) NOT NULL,
    id_tipo_compra numeric NOT NULL,
    id_usuario numeric(4,0) NOT NULL,
    nr_nota_fiscal numeric(10,0),
    vl_total numeric(5,2) NOT NULL,
    dt_compra timestamp without time zone NOT NULL,
    dt_compra_finalizada timestamp without time zone
);


ALTER TABLE loja.tb_compra OWNER TO usrloja;

--
-- TOC entry 202 (class 1259 OID 16414)
-- Name: tb_funcionalidade; Type: TABLE; Schema: loja; Owner: usrloja
--

CREATE TABLE loja.tb_funcionalidade (
    id_funcionalidade numeric(2,0) NOT NULL,
    nm_funcionalidade character varying(50) NOT NULL
);


ALTER TABLE loja.tb_funcionalidade OWNER TO usrloja;

--
-- TOC entry 215 (class 1259 OID 16679)
-- Name: tb_parcelamento; Type: TABLE; Schema: loja; Owner: usrloja
--

CREATE TABLE loja.tb_parcelamento (
    id_venda numeric(5,0) NOT NULL,
    nu_parcela numeric(2,0) NOT NULL,
    vl_parcela numeric(12,2) NOT NULL,
    CONSTRAINT ck_parcelamento_parcela CHECK ((nu_parcela = ANY (ARRAY[(1)::numeric, (2)::numeric, (3)::numeric, (4)::numeric, (5)::numeric, (6)::numeric, (7)::numeric, (8)::numeric, (9)::numeric, (10)::numeric, (11)::numeric, (12)::numeric, (13)::numeric, (14)::numeric, (15)::numeric, (16)::numeric, (17)::numeric, (18)::numeric, (19)::numeric, (20)::numeric, (21)::numeric, (22)::numeric, (23)::numeric, (24)::numeric, (25)::numeric, (26)::numeric, (27)::numeric, (28)::numeric, (29)::numeric, (30)::numeric, (31)::numeric, (32)::numeric, (33)::numeric, (34)::numeric, (35)::numeric])))
);


ALTER TABLE loja.tb_parcelamento OWNER TO usrloja;

--
-- TOC entry 203 (class 1259 OID 16417)
-- Name: tb_perfil; Type: TABLE; Schema: loja; Owner: usrloja
--

CREATE TABLE loja.tb_perfil (
    id_perfil numeric(3,0) NOT NULL,
    nm_perfil character varying(100) NOT NULL,
    st_perfil numeric(1,0) DEFAULT 1 NOT NULL,
    CONSTRAINT ck_perfil_stperfil CHECK ((st_perfil = ANY (ARRAY[(1)::numeric, (0)::numeric])))
);


ALTER TABLE loja.tb_perfil OWNER TO usrloja;

--
-- TOC entry 204 (class 1259 OID 16420)
-- Name: tb_produto; Type: TABLE; Schema: loja; Owner: usrloja
--

CREATE TABLE loja.tb_produto (
    id_produto numeric(4,0) NOT NULL,
    qt_produto numeric(4,0) NOT NULL,
    id_sub_categoria numeric(3,0) NOT NULL,
    nm_produto character varying(50) NOT NULL,
    vl_venda numeric(12,2) NOT NULL,
    nu_codigo_barra character varying(30),
    im_produto bytea,
    dt_produto date DEFAULT now() NOT NULL,
    st_produto numeric(1,0) DEFAULT 1 NOT NULL,
    CONSTRAINT ck_produto_situacao CHECK ((st_produto = ANY (ARRAY[(1)::numeric, (0)::numeric])))
);


ALTER TABLE loja.tb_produto OWNER TO usrloja;

--
-- TOC entry 205 (class 1259 OID 16427)
-- Name: tb_usuario; Type: TABLE; Schema: loja; Owner: usrloja
--

CREATE TABLE loja.tb_usuario (
    id_usuario numeric(4,0) NOT NULL,
    nm_usuario character varying(150) NOT NULL,
    nm_senha character varying(8) NOT NULL,
    dt_cadastro timestamp without time zone DEFAULT now() NOT NULL,
    nm_email character varying(250) NOT NULL,
    id_usuario_cadastro numeric(4,0) NOT NULL,
    id_perfil numeric(3,0) NOT NULL,
    st_usuario numeric(1,0) DEFAULT 1 NOT NULL,
    CONSTRAINT ck_usuario_st_usuario CHECK ((st_usuario = ANY (ARRAY[(1)::numeric, (0)::numeric])))
);


ALTER TABLE loja.tb_usuario OWNER TO usrloja;

--
-- TOC entry 206 (class 1259 OID 16434)
-- Name: tb_venda; Type: TABLE; Schema: loja; Owner: usrloja
--

CREATE TABLE loja.tb_venda (
    id_venda numeric(5,0) NOT NULL,
    dt_venda timestamp without time zone,
    dt_venda_finalizada timestamp without time zone,
    id_usuario_cliente numeric(4,0) NOT NULL,
    id_caixa numeric(15,0),
    id_situacao_venda numeric(1,0) NOT NULL,
    id_venda_orcamento numeric(15,0),
    id_tipo_venda numeric(1,0) NOT NULL,
    CONSTRAINT ck_venda_data_venda_id_caixa CHECK ((((dt_venda IS NULL) AND (id_caixa IS NULL)) OR ((dt_venda IS NOT NULL) AND (id_caixa IS NOT NULL))))
);


ALTER TABLE loja.tb_venda OWNER TO usrloja;

--
-- TOC entry 218 (class 1259 OID 16739)
-- Name: tp_autorizacao; Type: TABLE; Schema: loja; Owner: usrloja
--

CREATE TABLE loja.tp_autorizacao (
    id_autorizacao numeric(2,0) NOT NULL,
    nm_autorizacao character varying(100) NOT NULL
);


ALTER TABLE loja.tp_autorizacao OWNER TO usrloja;

--
-- TOC entry 220 (class 1259 OID 16751)
-- Name: tp_bandeira; Type: TABLE; Schema: loja; Owner: usrloja
--

CREATE TABLE loja.tp_bandeira (
    id_bandeira numeric(2,0) NOT NULL,
    nm_bandeira character varying(20)
);


ALTER TABLE loja.tp_bandeira OWNER TO usrloja;

--
-- TOC entry 207 (class 1259 OID 16443)
-- Name: tp_categoria; Type: TABLE; Schema: loja; Owner: usrloja
--

CREATE TABLE loja.tp_categoria (
    id_categoria numeric(2,0) NOT NULL,
    nm_categoria character varying(50) NOT NULL
);


ALTER TABLE loja.tp_categoria OWNER TO usrloja;

--
-- TOC entry 210 (class 1259 OID 16452)
-- Name: tp_compra; Type: TABLE; Schema: loja; Owner: usrloja
--

CREATE TABLE loja.tp_compra (
    id_tipo_compra numeric NOT NULL,
    nm_tipo_compra character varying NOT NULL
);


ALTER TABLE loja.tp_compra OWNER TO usrloja;

--
-- TOC entry 208 (class 1259 OID 16446)
-- Name: tp_forma_pagamento; Type: TABLE; Schema: loja; Owner: usrloja
--

CREATE TABLE loja.tp_forma_pagamento (
    id_forma_pagamento numeric(2,0) NOT NULL,
    nm_forma_pagamento character varying(20)
);


ALTER TABLE loja.tp_forma_pagamento OWNER TO usrloja;

--
-- TOC entry 209 (class 1259 OID 16449)
-- Name: tp_genero; Type: TABLE; Schema: loja; Owner: usrloja
--

CREATE TABLE loja.tp_genero (
    id_genero numeric(1,0) NOT NULL,
    nm_genero character varying(50) NOT NULL
);


ALTER TABLE loja.tp_genero OWNER TO usrloja;

--
-- TOC entry 214 (class 1259 OID 16664)
-- Name: tp_situacao_venda; Type: TABLE; Schema: loja; Owner: usrloja
--

CREATE TABLE loja.tp_situacao_venda (
    id_situacao_venda numeric(1,0) NOT NULL,
    nm_situacao_venda character varying(10) NOT NULL
);


ALTER TABLE loja.tp_situacao_venda OWNER TO usrloja;

--
-- TOC entry 211 (class 1259 OID 16464)
-- Name: tp_sub_categoria; Type: TABLE; Schema: loja; Owner: usrloja
--

CREATE TABLE loja.tp_sub_categoria (
    id_sub_categoria numeric(3,0) NOT NULL,
    id_categoria numeric(2,0) NOT NULL,
    nm_sub_categoria character varying(50) NOT NULL,
    id_genero numeric(1,0)
);


ALTER TABLE loja.tp_sub_categoria OWNER TO usrloja;

--
-- TOC entry 217 (class 1259 OID 16724)
-- Name: tp_tipo_venda; Type: TABLE; Schema: loja; Owner: usrloja
--

CREATE TABLE loja.tp_tipo_venda (
    id_tipo_venda numeric(1,0) NOT NULL,
    nm_tipo_venda character varying(20) NOT NULL
);


ALTER TABLE loja.tp_tipo_venda OWNER TO usrloja;

--
-- TOC entry 222 (class 1259 OID 16761)
-- Name: sq_idvendaformapagamento; Type: SEQUENCE; Schema: public; Owner: usrloja
--

CREATE SEQUENCE public.sq_idvendaformapagamento
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sq_idvendaformapagamento OWNER TO usrloja;

--
-- TOC entry 3026 (class 0 OID 16396)
-- Dependencies: 198
-- Data for Name: ta_item_venda; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY loja.ta_item_venda (id_item_venda, id_produto, id_venda, qt_item, vl_item, vl_desconto, id_usuario_autorizacao, id_autorizacao) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 16399)
-- Dependencies: 199
-- Data for Name: ta_perfil_funcionalidade; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY loja.ta_perfil_funcionalidade (id_perfil_funcionalidade, id_perfil, id_funcionalidade) FROM stdin;
1	1	3
2	1	1
3	1	2
5	1	4
6	1	5
7	1	6
8	1	7
9	3	6
11	1	8
12	1	9
13	1	10
14	1	11
15	1	12
16	1	13
17	1	14
18	1	15
19	1	16
\.


--
-- TOC entry 3049 (class 0 OID 16756)
-- Dependencies: 221
-- Data for Name: ta_venda_forma_pagamento; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY loja.ta_venda_forma_pagamento (id_venda_forma_pagamento, id_venda, id_forma_pagamento, id_bandeira, vl_parcela) FROM stdin;
\.


--
-- TOC entry 3041 (class 0 OID 16642)
-- Dependencies: 213
-- Data for Name: tb_caixa; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY loja.tb_caixa (id_caixa, id_usuario_operador, dt_abertura, id_usuario_abertura, dt_fechamento, id_usuario_fechamento) FROM stdin;
22	1	2019-08-24 13:52:26.684	1	2019-09-01 14:01:40.973	1
24	1	2019-09-01 14:03:46.693	1	2019-09-01 14:03:59.645	1
25	1	2019-09-01 14:45:11.753	1	2019-09-01 14:45:48.922	1
26	1	2019-09-01 14:48:05.723	124	2019-11-05 23:05:38.577	1
27	1	2019-11-05 23:05:52.918	1	2019-11-05 23:06:09.1	1
28	1	2019-11-12 23:48:27.556	1	2019-11-12 23:48:53.708	1
29	1	2019-11-15 12:24:37.577	1	2019-12-08 19:47:53.556	1
30	1	2019-12-08 19:48:05.373	1	2020-01-05 18:17:20.698	1
31	1	2020-01-05 20:27:09.98	1	2020-01-05 21:31:58.808	1
32	1	2020-01-05 21:36:15.119	1	2020-02-09 15:12:55.783	1
34	132	2020-03-14 21:04:53.461	1	\N	\N
33	1	2020-02-09 15:13:14.644	1	2020-04-18 22:31:36.991	1
36	1	2020-04-18 22:39:46.217	1	\N	\N
35	127	2020-04-18 21:29:05.34	1	2020-04-18 22:40:25.618	1
37	127	2020-04-18 22:40:59.88	1	2020-04-18 22:41:18.461	1
38	127	2020-04-18 22:41:53.346	1	2020-04-18 22:44:02.753	1
39	127	2020-04-18 22:45:35.395	1	\N	\N
8	1	2019-08-23 21:55:45.603	1	2019-08-24 16:52:14.664352	1
9	1	2019-08-23 22:08:59.103	1	2019-08-24 16:52:14.664352	1
10	1	2019-08-23 22:16:58.817	1	2019-08-24 16:52:14.664352	1
11	1	2019-08-23 22:19:46.869	100	2019-08-24 16:52:14.664352	1
12	1	2019-08-23 22:29:10.165	106	2019-08-24 16:52:14.664352	1
16	1	2019-08-23 22:43:50.719	1	2019-08-24 16:52:14.664352	1
19	113	2019-08-24 12:19:05.359	1	2019-08-24 16:52:14.664352	1
20	113	2019-08-24 12:28:40.457	1	2019-08-24 16:52:14.664352	1
21	1	2019-08-24 13:44:04.69	1	2019-08-24 16:52:14.664352	1
\.


--
-- TOC entry 3028 (class 0 OID 16402)
-- Dependencies: 200
-- Data for Name: tb_cep; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY loja.tb_cep (id_cep) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 16408)
-- Dependencies: 201
-- Data for Name: tb_compra; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY loja.tb_compra (id_compra, id_tipo_compra, id_usuario, nr_nota_fiscal, vl_total, dt_compra, dt_compra_finalizada) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 16414)
-- Dependencies: 202
-- Data for Name: tb_funcionalidade; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY loja.tb_funcionalidade (id_funcionalidade, nm_funcionalidade) FROM stdin;
1	Compra
2	Venda
3	Cadastro de usuários
4	Cadastro de produtos
5	Cadastro de clientes
6	Consulta de usuários
8	Ativar inativar usuário
11	Consulta de produtos
7	Alterar usuário
12	Ativar inativar produto
13	Alterar produto
9	Gerenciar Perfil
10	Ativar inativar perfil
14	Editar permissões de usuários
15	Abrir Caixa
16	Fechar Caixa
\.


--
-- TOC entry 3043 (class 0 OID 16679)
-- Dependencies: 215
-- Data for Name: tb_parcelamento; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY loja.tb_parcelamento (id_venda, nu_parcela, vl_parcela) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 16417)
-- Dependencies: 203
-- Data for Name: tb_perfil; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY loja.tb_perfil (id_perfil, nm_perfil, st_perfil) FROM stdin;
4	Cliente	1
2	Usuário	1
1	Administrador	1
3	Caixa	1
\.


--
-- TOC entry 3032 (class 0 OID 16420)
-- Dependencies: 204
-- Data for Name: tb_produto; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY loja.tb_produto (id_produto, qt_produto, id_sub_categoria, nm_produto, vl_venda, nu_codigo_barra, im_produto, dt_produto, st_produto) FROM stdin;
53	30	2	calça jeans99	105.50	7899871546645	\N	2019-02-25	1
75	100	2	prod 2020	19.90	32164578964	\N	2020-01-05	1
76	10	4	prod 20202	19.90	121241561567878	\N	2020-01-05	1
62	30	2	teste novo 2	105.50	88888888	\N	2019-02-26	1
63	30	1	calça jeans	10.00	78977456321546645	\N	2019-02-26	1
65	30	2	calça jeans	105.50	7894563219999	\N	2019-02-26	1
27	10	1	teste novo 4	1.00	123456879887	\N	2019-01-31	1
66	1	4	picanha	10.00	13222198899	\N	2019-02-26	1
77	10	1	prod 20203	19.90	1212422261567878	\N	2020-01-13	1
67	2	2	produto teste 	10.00	13222189898989	\N	2019-02-27	1
29	10	2	teste novo 4	10.00	"12345622289"	\N	2019-02-17	1
22	10	2	teste novo 6	10.00	92345622289	\N	2019-01-31	1
25	10	2	teste novo 7	10.00	92345322289	\N	2019-01-31	1
55	30	1	calça jeans	105.50	132221999	\N	2019-02-25	1
20	10	2	teste novo 3	10.00	12345622289	\N	2019-01-31	1
28	10	1	teste novo 2	10.00	132221	\N	2019-02-16	1
19	10	2	teste novo 3	10.00	12345687989	\N	2019-01-31	1
68	30	2	calça jeans	105.99	189456321546645	\N	2019-03-01	1
15	11	2	Vestido de Ouro	1000.00	123456879	\N	2019-02-23	0
26	1	2	teste novo 8	11.00	13222178787	\N	2019-01-31	0
44	100	2	Calcinha Rosa	29.90	456132465	\N	2019-02-23	1
69	100	1	Tigela Toque Mágico	29.90	804040	\N	2019-04-13	1
42	52	1	calça jeans6	35.00	13222199988	\N	2019-02-25	1
78	200	3	Cerveja Budwiser 296ml 	1.99	7891991011877	\N	2020-03-14	1
70	20	3	Tapué	25.90	49768548	\N	2019-05-13	1
71	10	1	calça jeans	10.00	16497855412	\N	2019-06-06	1
41	30	1	calça jeans	205.00	78949741546645	\N	2019-02-22	1
61	30	4	calça jeans	105.50	9451754	\N	2019-02-26	1
54	30	2	calça jeans	105.50	789456321545	\N	2019-02-25	1
79	1	1	Proto teste codbarras	10.00	7771113399	\N	2020-04-18	1
18	20	2	teste novo	10.00	21798465	\N	2019-01-31	0
43	1	2	Relógio garmin	250.99	231231312654	\N	2019-02-23	1
16	300	2	Celular	259.88	999888	\N	2019-02-23	0
60	30	2	calça jeans3	105.50		\N	2019-02-26	0
46	34	2	Celular	10.99	99988898	\N	2019-02-23	1
72	50	4	Cerveja Pilsen	1.89	2123564561	\N	2019-06-29	1
73	10	3	pizza	14.90	p001	\N	2019-07-13	1
52	10	2	Note book	1999.99	3446589456123	\N	2019-02-25	1
32	99	2	Camiseta amarela	59.88	12345678985	\N	2019-02-23	0
17	10	1	sfdadf	1.00	12345688887	\N	2019-01-31	0
56	30	2	calça jeans88	10.00	789456321546645	\N	2019-02-25	1
59	30	1	calça jeans	105.50	784456321546645	\N	2019-02-26	1
74	1	4	garrafa Tupperware 001	29.90	123456789	\N	2019-12-08	1
\.


--
-- TOC entry 3033 (class 0 OID 16427)
-- Dependencies: 205
-- Data for Name: tb_usuario; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY loja.tb_usuario (id_usuario, nm_usuario, nm_senha, dt_cadastro, nm_email, id_usuario_cadastro, id_perfil, st_usuario) FROM stdin;
103	Maria Angélica de Jesus	0102	2018-08-26 14:13:33.724	mariaangelica@gmail.com	101	4	1
109	teste002	123456	2019-01-31 22:26:01.45	teste002@teste.com	1	2	1
113	teste	123456	2019-02-25 21:45:37.111	teste@teste.com.br	1	1	1
101	Noemi Caldeira de Moura	123456	2018-08-23 23:55:56.773	noemicaldeira@gmail.com	1	1	1
114	teste	123456	2019-02-25 21:47:54.169	teste998@teste.com.br	1	2	1
115	teste	123456	2019-02-25 21:52:53.895	teste974@teste.com.br	1	1	1
116	teste	123456	2019-02-25 21:55:41.968	teste254@teste.com.br	1	3	1
117	teste	123456	2019-02-25 21:56:21.244	teste354@teste.com.br	1	3	1
118	teste	123456	2019-02-25 21:58:13.494	teste854@teste.com.br	1	4	1
119	teste	123456	2019-02-25 21:59:05.921	teste2254@teste.com.br	1	2	1
120	teste	123456	2019-02-25 21:59:45.959	teste544@teste.com.br	1	2	1
121	teste	123456	2019-02-25 22:02:21.322	teste35874@teste.com.br	1	2	1
106	Julia ju	123456	2019-01-26 23:45:26.045	ju@ju.com	1	2	1
122	teste	123456	2019-02-25 22:06:31.11	teste3547@teste.com.br	1	3	1
108	testeteste	123456	2019-01-28 22:50:09.581	teste3@teste.com	1	3	1
112	teste9924	123456	2019-02-16 23:18:55.988	teste9924@teste.com	111	3	1
105	teste	123456	2019-01-26 23:43:30.579	teste@teste.com	1	2	1
107	teste	123456	2019-01-26 23:59:48.529	teste2@teste.com	1	4	1
131	Novo caixa	123456	2020-02-17 22:01:55.048	caixa@caixa.com.br	1	3	1
126	usuario teste 	123456	2019-02-27 21:59:20.955	teste35999@teste.com.br	1	3	0
104	Francisca angelica de jesus	123	2018-08-26 14:37:09.425	franciscaangelica@gmail.com	103	1	0
132	Noemi 2	123456	2020-03-14 21:03:04.089	noemicaldeira2@gmail.com	1	1	1
127	Devassa Tropical Lager 2	123456	2019-04-06 23:56:15.706	devassa@devassa.com.br	1	1	1
1	Adriano Neres	123456	2018-08-13 22:21:58.041	adriano@email.com	1	1	1
111	teste999	123456	2019-02-16 22:38:27.546	teste999@teste.com	1	3	0
128	Nalva	123456	2019-08-03 15:16:20.951	nalva@n.com.br	1	4	1
124	123456	123456	2019-02-26 21:43:09.298	teste3594@teste.com.br	1	1	0
100	ANA JULIA CALDEIRA	123456	2018-08-13 22:21:09.982	anacaldeira@gmail.com	1	1	1
123	123456	123456	2019-02-25 22:07:20.97	teste3545@teste.com.br	1	3	0
110	cleuber junior	123456	2019-02-10 22:48:14.047	cleuber@teste.com	1	4	1
129	usuário 2020	123456	2020-01-05 13:02:12.364	u2020@u2020	1	2	1
102	Usuario teste	123456	2018-08-24 21:45:00.261	usuario@teste.com	1	4	1
125	123456	123456	2019-02-26 22:04:06.535	teste6354@teste.com.br	1	3	0
130	usuario1 2020	123456	2020-01-05 18:24:02.427	u2020@u2020.com	1	4	1
\.


--
-- TOC entry 3034 (class 0 OID 16434)
-- Dependencies: 206
-- Data for Name: tb_venda; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY loja.tb_venda (id_venda, dt_venda, dt_venda_finalizada, id_usuario_cliente, id_caixa, id_situacao_venda, id_venda_orcamento, id_tipo_venda) FROM stdin;
1	2020-04-18 20:49:39.155	\N	1	33	2	\N	1
6	2020-04-18 21:29:10.292	\N	127	35	2	\N	1
\.


--
-- TOC entry 3046 (class 0 OID 16739)
-- Dependencies: 218
-- Data for Name: tp_autorizacao; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY loja.tp_autorizacao (id_autorizacao, nm_autorizacao) FROM stdin;
1	Desconto
2	Cancelamento
\.


--
-- TOC entry 3048 (class 0 OID 16751)
-- Dependencies: 220
-- Data for Name: tp_bandeira; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY loja.tp_bandeira (id_bandeira, nm_bandeira) FROM stdin;
1	Visa
2	Master Carde
\.


--
-- TOC entry 3035 (class 0 OID 16443)
-- Dependencies: 207
-- Data for Name: tp_categoria; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY loja.tp_categoria (id_categoria, nm_categoria) FROM stdin;
1	Vestuário
2	Alimentício
\.


--
-- TOC entry 3038 (class 0 OID 16452)
-- Dependencies: 210
-- Data for Name: tp_compra; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY loja.tp_compra (id_tipo_compra, nm_tipo_compra) FROM stdin;
1	Finalizada
2	Em aberto
3	Cancelada
\.


--
-- TOC entry 3036 (class 0 OID 16446)
-- Dependencies: 208
-- Data for Name: tp_forma_pagamento; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY loja.tp_forma_pagamento (id_forma_pagamento, nm_forma_pagamento) FROM stdin;
1	Dinheiro
2	Crédito
3	Débito
\.


--
-- TOC entry 3037 (class 0 OID 16449)
-- Dependencies: 209
-- Data for Name: tp_genero; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY loja.tp_genero (id_genero, nm_genero) FROM stdin;
1	Masculino
2	Feminino
3	Alimenticio
\.


--
-- TOC entry 3042 (class 0 OID 16664)
-- Dependencies: 214
-- Data for Name: tp_situacao_venda; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY loja.tp_situacao_venda (id_situacao_venda, nm_situacao_venda) FROM stdin;
1	Finalizada
2	Em aberto
3	Cancelada
\.


--
-- TOC entry 3039 (class 0 OID 16464)
-- Dependencies: 211
-- Data for Name: tp_sub_categoria; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY loja.tp_sub_categoria (id_sub_categoria, id_categoria, nm_sub_categoria, id_genero) FROM stdin;
1	1	Calça	1
2	1	Blusa	2
3	2	lacticínios	\N
4	2	Carnes	\N
\.


--
-- TOC entry 3045 (class 0 OID 16724)
-- Dependencies: 217
-- Data for Name: tp_tipo_venda; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY loja.tp_tipo_venda (id_tipo_venda, nm_tipo_venda) FROM stdin;
1	Venda
2	Orçamento
\.


--
-- TOC entry 3059 (class 0 OID 0)
-- Dependencies: 216
-- Name: sq_idcaixa; Type: SEQUENCE SET; Schema: loja; Owner: usrloja
--

SELECT pg_catalog.setval('loja.sq_idcaixa', 40, true);


--
-- TOC entry 3060 (class 0 OID 0)
-- Dependencies: 212
-- Name: sq_idproduto; Type: SEQUENCE SET; Schema: loja; Owner: usrloja
--

SELECT pg_catalog.setval('loja.sq_idproduto', 79, true);


--
-- TOC entry 3061 (class 0 OID 0)
-- Dependencies: 197
-- Name: sq_idusuario; Type: SEQUENCE SET; Schema: loja; Owner: usrloja
--

SELECT pg_catalog.setval('loja.sq_idusuario', 132, true);


--
-- TOC entry 3062 (class 0 OID 0)
-- Dependencies: 219
-- Name: sq_idvenda; Type: SEQUENCE SET; Schema: loja; Owner: usrloja
--

SELECT pg_catalog.setval('loja.sq_idvenda', 6, true);


--
-- TOC entry 3063 (class 0 OID 0)
-- Dependencies: 222
-- Name: sq_idvendaformapagamento; Type: SEQUENCE SET; Schema: public; Owner: usrloja
--

SELECT pg_catalog.setval('public.sq_idvendaformapagamento', 1, false);


--
-- TOC entry 2866 (class 2606 OID 16646)
-- Name: tb_caixa pk_caixa; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_caixa
    ADD CONSTRAINT pk_caixa PRIMARY KEY (id_caixa);


--
-- TOC entry 2838 (class 2606 OID 16468)
-- Name: tb_funcionalidade pk_modulo; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_funcionalidade
    ADD CONSTRAINT pk_modulo PRIMARY KEY (id_funcionalidade);


--
-- TOC entry 2832 (class 2606 OID 16470)
-- Name: ta_perfil_funcionalidade pk_modulo_perfil; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.ta_perfil_funcionalidade
    ADD CONSTRAINT pk_modulo_perfil PRIMARY KEY (id_perfil_funcionalidade);


--
-- TOC entry 2877 (class 2606 OID 16760)
-- Name: ta_venda_forma_pagamento pk_tavendaformapagamento; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.ta_venda_forma_pagamento
    ADD CONSTRAINT pk_tavendaformapagamento PRIMARY KEY (id_venda_forma_pagamento);


--
-- TOC entry 2834 (class 2606 OID 16472)
-- Name: tb_cep pk_tbcep; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_cep
    ADD CONSTRAINT pk_tbcep PRIMARY KEY (id_cep);


--
-- TOC entry 2836 (class 2606 OID 16474)
-- Name: tb_compra pk_tbcompra; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_compra
    ADD CONSTRAINT pk_tbcompra PRIMARY KEY (id_compra);


--
-- TOC entry 2829 (class 2606 OID 16476)
-- Name: ta_item_venda pk_tbitemvenda; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.ta_item_venda
    ADD CONSTRAINT pk_tbitemvenda PRIMARY KEY (id_item_venda);


--
-- TOC entry 2840 (class 2606 OID 16478)
-- Name: tb_perfil pk_tbperfil; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_perfil
    ADD CONSTRAINT pk_tbperfil PRIMARY KEY (id_perfil);


--
-- TOC entry 2842 (class 2606 OID 16480)
-- Name: tb_produto pk_tbproduto; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_produto
    ADD CONSTRAINT pk_tbproduto PRIMARY KEY (id_produto);


--
-- TOC entry 2848 (class 2606 OID 16484)
-- Name: tb_usuario pk_tbusuario; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_usuario
    ADD CONSTRAINT pk_tbusuario PRIMARY KEY (id_usuario);


--
-- TOC entry 2854 (class 2606 OID 16486)
-- Name: tb_venda pk_tbvenda; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_venda
    ADD CONSTRAINT pk_tbvenda PRIMARY KEY (id_venda);


--
-- TOC entry 2871 (class 2606 OID 16728)
-- Name: tp_tipo_venda pk_tipo_venda; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tp_tipo_venda
    ADD CONSTRAINT pk_tipo_venda PRIMARY KEY (id_tipo_venda);


--
-- TOC entry 2875 (class 2606 OID 16755)
-- Name: tp_bandeira pk_tpbandeira; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tp_bandeira
    ADD CONSTRAINT pk_tpbandeira PRIMARY KEY (id_bandeira);


--
-- TOC entry 2856 (class 2606 OID 16488)
-- Name: tp_categoria pk_tpcategoria; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tp_categoria
    ADD CONSTRAINT pk_tpcategoria PRIMARY KEY (id_categoria);


--
-- TOC entry 2858 (class 2606 OID 16490)
-- Name: tp_forma_pagamento pk_tpformapagamento; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tp_forma_pagamento
    ADD CONSTRAINT pk_tpformapagamento PRIMARY KEY (id_forma_pagamento);


--
-- TOC entry 2860 (class 2606 OID 16492)
-- Name: tp_genero pk_tpgenero; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tp_genero
    ADD CONSTRAINT pk_tpgenero PRIMARY KEY (id_genero);


--
-- TOC entry 2868 (class 2606 OID 16668)
-- Name: tp_situacao_venda pk_tpsituacaovenda; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tp_situacao_venda
    ADD CONSTRAINT pk_tpsituacaovenda PRIMARY KEY (id_situacao_venda);


--
-- TOC entry 2862 (class 2606 OID 16494)
-- Name: tp_compra pk_tpstatuscompra; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tp_compra
    ADD CONSTRAINT pk_tpstatuscompra PRIMARY KEY (id_tipo_compra);


--
-- TOC entry 2864 (class 2606 OID 16498)
-- Name: tp_sub_categoria pk_tpsubcategoria; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tp_sub_categoria
    ADD CONSTRAINT pk_tpsubcategoria PRIMARY KEY (id_sub_categoria);


--
-- TOC entry 2873 (class 2606 OID 16743)
-- Name: tp_autorizacao tp_autorizacao_pkey; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tp_autorizacao
    ADD CONSTRAINT tp_autorizacao_pkey PRIMARY KEY (id_autorizacao);


--
-- TOC entry 2844 (class 2606 OID 16604)
-- Name: tb_produto uk_produto_codigo_barra; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_produto
    ADD CONSTRAINT uk_produto_codigo_barra UNIQUE (nu_codigo_barra);


--
-- TOC entry 2846 (class 2606 OID 16502)
-- Name: tb_produto uk_produto_nucodbarra; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_produto
    ADD CONSTRAINT uk_produto_nucodbarra UNIQUE (nu_codigo_barra);


--
-- TOC entry 2850 (class 2606 OID 16504)
-- Name: tb_usuario uk_usuario_dtcadastro; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_usuario
    ADD CONSTRAINT uk_usuario_dtcadastro UNIQUE (dt_cadastro);


--
-- TOC entry 2852 (class 2606 OID 16506)
-- Name: tb_usuario uk_usuario_email; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_usuario
    ADD CONSTRAINT uk_usuario_email UNIQUE (nm_email);


--
-- TOC entry 2869 (class 1259 OID 16687)
-- Name: ix_parcelamento; Type: INDEX; Schema: loja; Owner: usrloja
--

CREATE UNIQUE INDEX ix_parcelamento ON loja.tb_parcelamento USING btree (id_venda, nu_parcela);


--
-- TOC entry 2830 (class 1259 OID 16602)
-- Name: ix_perfilfuncionalidade_unico; Type: INDEX; Schema: loja; Owner: usrloja
--

CREATE UNIQUE INDEX ix_perfilfuncionalidade_unico ON loja.ta_perfil_funcionalidade USING btree (id_perfil, id_funcionalidade);


--
-- TOC entry 2898 (class 2606 OID 16652)
-- Name: tb_caixa fk_caixa_usuario_abertura; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_caixa
    ADD CONSTRAINT fk_caixa_usuario_abertura FOREIGN KEY (id_usuario_abertura) REFERENCES loja.tb_usuario(id_usuario);


--
-- TOC entry 2899 (class 2606 OID 16657)
-- Name: tb_caixa fk_caixa_usuario_fechamento; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_caixa
    ADD CONSTRAINT fk_caixa_usuario_fechamento FOREIGN KEY (id_usuario_fechamento) REFERENCES loja.tb_usuario(id_usuario);


--
-- TOC entry 2897 (class 2606 OID 16647)
-- Name: tb_caixa fk_caixa_usuario_operador; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_caixa
    ADD CONSTRAINT fk_caixa_usuario_operador FOREIGN KEY (id_usuario_operador) REFERENCES loja.tb_usuario(id_usuario);


--
-- TOC entry 2892 (class 2606 OID 16674)
-- Name: tb_venda fk_caixa_venda; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_venda
    ADD CONSTRAINT fk_caixa_venda FOREIGN KEY (id_caixa) REFERENCES loja.tb_caixa(id_caixa);


--
-- TOC entry 2895 (class 2606 OID 16507)
-- Name: tp_sub_categoria fk_categoria_subcategoria; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tp_sub_categoria
    ADD CONSTRAINT fk_categoria_subcategoria FOREIGN KEY (id_categoria) REFERENCES loja.tp_categoria(id_categoria);


--
-- TOC entry 2903 (class 2606 OID 16773)
-- Name: ta_venda_forma_pagamento fk_forma_pagamento_bandeira; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.ta_venda_forma_pagamento
    ADD CONSTRAINT fk_forma_pagamento_bandeira FOREIGN KEY (id_bandeira) REFERENCES loja.tp_bandeira(id_bandeira);


--
-- TOC entry 2902 (class 2606 OID 16768)
-- Name: ta_venda_forma_pagamento fk_forma_pagamento_forma; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.ta_venda_forma_pagamento
    ADD CONSTRAINT fk_forma_pagamento_forma FOREIGN KEY (id_forma_pagamento) REFERENCES loja.tp_forma_pagamento(id_forma_pagamento);


--
-- TOC entry 2882 (class 2606 OID 16517)
-- Name: ta_perfil_funcionalidade fk_funcionalidade_perfil_funcionalidade; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.ta_perfil_funcionalidade
    ADD CONSTRAINT fk_funcionalidade_perfil_funcionalidade FOREIGN KEY (id_funcionalidade) REFERENCES loja.tb_funcionalidade(id_funcionalidade);


--
-- TOC entry 2896 (class 2606 OID 16522)
-- Name: tp_sub_categoria fk_genero_subcategoria; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tp_sub_categoria
    ADD CONSTRAINT fk_genero_subcategoria FOREIGN KEY (id_genero) REFERENCES loja.tp_genero(id_genero);


--
-- TOC entry 2886 (class 2606 OID 16527)
-- Name: tb_funcionalidade fk_modulo_perfil_modulo; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_funcionalidade
    ADD CONSTRAINT fk_modulo_perfil_modulo FOREIGN KEY (id_funcionalidade) REFERENCES loja.tb_funcionalidade(id_funcionalidade);


--
-- TOC entry 2883 (class 2606 OID 16532)
-- Name: ta_perfil_funcionalidade fk_perfil_perfil_funcionalidade; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.ta_perfil_funcionalidade
    ADD CONSTRAINT fk_perfil_perfil_funcionalidade FOREIGN KEY (id_perfil) REFERENCES loja.tb_perfil(id_perfil);


--
-- TOC entry 2888 (class 2606 OID 16537)
-- Name: tb_usuario fk_perfil_usuario; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_usuario
    ADD CONSTRAINT fk_perfil_usuario FOREIGN KEY (id_perfil) REFERENCES loja.tb_perfil(id_perfil);


--
-- TOC entry 2878 (class 2606 OID 16542)
-- Name: ta_item_venda fk_produto_itemvenda; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.ta_item_venda
    ADD CONSTRAINT fk_produto_itemvenda FOREIGN KEY (id_produto) REFERENCES loja.tb_produto(id_produto);


--
-- TOC entry 2891 (class 2606 OID 16669)
-- Name: tb_venda fk_situacao_venda_venda; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_venda
    ADD CONSTRAINT fk_situacao_venda_venda FOREIGN KEY (id_situacao_venda) REFERENCES loja.tp_situacao_venda(id_situacao_venda);


--
-- TOC entry 2884 (class 2606 OID 16547)
-- Name: tb_compra fk_statuscompra_compra; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_compra
    ADD CONSTRAINT fk_statuscompra_compra FOREIGN KEY (id_tipo_compra) REFERENCES loja.tp_compra(id_tipo_compra);


--
-- TOC entry 2887 (class 2606 OID 16562)
-- Name: tb_produto fk_subcategoria_produto; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_produto
    ADD CONSTRAINT fk_subcategoria_produto FOREIGN KEY (id_sub_categoria) REFERENCES loja.tp_sub_categoria(id_sub_categoria);


--
-- TOC entry 2894 (class 2606 OID 16729)
-- Name: tb_venda fk_tipo_venda_venda; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_venda
    ADD CONSTRAINT fk_tipo_venda_venda FOREIGN KEY (id_tipo_venda) REFERENCES loja.tp_tipo_venda(id_tipo_venda);


--
-- TOC entry 2885 (class 2606 OID 16567)
-- Name: tb_compra fk_usuario_compra; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_compra
    ADD CONSTRAINT fk_usuario_compra FOREIGN KEY (id_usuario) REFERENCES loja.tb_usuario(id_usuario);


--
-- TOC entry 2889 (class 2606 OID 16577)
-- Name: tb_usuario fk_usuario_usuario; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_usuario
    ADD CONSTRAINT fk_usuario_usuario FOREIGN KEY (id_usuario_cadastro) REFERENCES loja.tb_usuario(id_usuario);


--
-- TOC entry 2890 (class 2606 OID 16587)
-- Name: tb_venda fk_usuariovenda; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_venda
    ADD CONSTRAINT fk_usuariovenda FOREIGN KEY (id_usuario_cliente) REFERENCES loja.tb_usuario(id_usuario);


--
-- TOC entry 2881 (class 2606 OID 16744)
-- Name: ta_item_venda fk_venda_autorizacao; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.ta_item_venda
    ADD CONSTRAINT fk_venda_autorizacao FOREIGN KEY (id_autorizacao) REFERENCES loja.tp_autorizacao(id_autorizacao);


--
-- TOC entry 2901 (class 2606 OID 16763)
-- Name: ta_venda_forma_pagamento fk_venda_forma_venda; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.ta_venda_forma_pagamento
    ADD CONSTRAINT fk_venda_forma_venda FOREIGN KEY (id_venda) REFERENCES loja.tb_venda(id_venda);


--
-- TOC entry 2879 (class 2606 OID 16592)
-- Name: ta_item_venda fk_venda_itemvenda; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.ta_item_venda
    ADD CONSTRAINT fk_venda_itemvenda FOREIGN KEY (id_venda) REFERENCES loja.tb_venda(id_venda);


--
-- TOC entry 2900 (class 2606 OID 16682)
-- Name: tb_parcelamento fk_venda_parcelamento; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_parcelamento
    ADD CONSTRAINT fk_venda_parcelamento FOREIGN KEY (id_venda) REFERENCES loja.tb_venda(id_venda);


--
-- TOC entry 2880 (class 2606 OID 16734)
-- Name: ta_item_venda fk_venda_usuario_autorizacao; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.ta_item_venda
    ADD CONSTRAINT fk_venda_usuario_autorizacao FOREIGN KEY (id_usuario_autorizacao) REFERENCES loja.tb_usuario(id_usuario);


--
-- TOC entry 2893 (class 2606 OID 16719)
-- Name: tb_venda fk_venda_venda_orcamento; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_venda
    ADD CONSTRAINT fk_venda_venda_orcamento FOREIGN KEY (id_venda_orcamento) REFERENCES loja.tb_venda(id_venda);


-- Completed on 2020-05-18 21:06:31 -03

--
-- PostgreSQL database dump complete
--

