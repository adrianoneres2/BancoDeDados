--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5 (Debian 10.5-1.pgdg90+1)
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

-- Started on 2019-02-17 22:57:11 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 16387)
-- Name: loja; Type: SCHEMA; Schema: -; Owner: usrloja
--

CREATE SCHEMA loja;


ALTER SCHEMA loja OWNER TO usrloja;

--
-- TOC entry 218 (class 1259 OID 16599)
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
-- TOC entry 198 (class 1259 OID 16390)
-- Name: sq_produto; Type: SEQUENCE; Schema: loja; Owner: usrloja
--

CREATE SEQUENCE loja.sq_produto
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE loja.sq_produto OWNER TO usrloja;

--
-- TOC entry 199 (class 1259 OID 16392)
-- Name: sq_tbproduto; Type: SEQUENCE; Schema: loja; Owner: usrloja
--

CREATE SEQUENCE loja.sq_tbproduto
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE loja.sq_tbproduto OWNER TO usrloja;

--
-- TOC entry 200 (class 1259 OID 16394)
-- Name: sq_teste; Type: SEQUENCE; Schema: loja; Owner: usrloja
--

CREATE SEQUENCE loja.sq_teste
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE loja.sq_teste OWNER TO usrloja;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 201 (class 1259 OID 16396)
-- Name: ta_item_venda; Type: TABLE; Schema: loja; Owner: usrloja
--

CREATE TABLE loja.ta_item_venda (
    id_item_venda numeric(8,0) NOT NULL,
    id_produto numeric(4,0) NOT NULL,
    id_tipo_item_venda numeric(1,0) NOT NULL,
    id_venda numeric(5,0) NOT NULL,
    vl_venda numeric(12,2),
    id_usuario_cancelamento numeric(4,0)
);


ALTER TABLE loja.ta_item_venda OWNER TO usrloja;

--
-- TOC entry 202 (class 1259 OID 16399)
-- Name: ta_perfil_funcionalidade; Type: TABLE; Schema: loja; Owner: usrloja
--

CREATE TABLE loja.ta_perfil_funcionalidade (
    id_perfil_funcionalidade numeric(3,0) NOT NULL,
    id_perfil numeric(3,0) NOT NULL,
    id_funcionalidade numeric(2,0) NOT NULL
);


ALTER TABLE loja.ta_perfil_funcionalidade OWNER TO usrloja;

--
-- TOC entry 203 (class 1259 OID 16402)
-- Name: tb_cep; Type: TABLE; Schema: loja; Owner: usrloja
--

CREATE TABLE loja.tb_cep (
    id_cep numeric NOT NULL
);


ALTER TABLE loja.tb_cep OWNER TO usrloja;

--
-- TOC entry 204 (class 1259 OID 16408)
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
-- TOC entry 205 (class 1259 OID 16414)
-- Name: tb_funcionalidade; Type: TABLE; Schema: loja; Owner: usrloja
--

CREATE TABLE loja.tb_funcionalidade (
    id_funcionalidade numeric(2,0) NOT NULL,
    nm_funcionalidade character varying(50) NOT NULL
);


ALTER TABLE loja.tb_funcionalidade OWNER TO usrloja;

--
-- TOC entry 206 (class 1259 OID 16417)
-- Name: tb_perfil; Type: TABLE; Schema: loja; Owner: usrloja
--

CREATE TABLE loja.tb_perfil (
    id_perfil numeric(3,0) NOT NULL,
    nm_perfil character varying(100) NOT NULL
);


ALTER TABLE loja.tb_perfil OWNER TO usrloja;

--
-- TOC entry 207 (class 1259 OID 16420)
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
    dt_produto date DEFAULT now() NOT NULL
);


ALTER TABLE loja.tb_produto OWNER TO usrloja;

--
-- TOC entry 208 (class 1259 OID 16427)
-- Name: tb_usuario; Type: TABLE; Schema: loja; Owner: usrloja
--

CREATE TABLE loja.tb_usuario (
    id_usuario numeric(4,0) NOT NULL,
    nm_usuario character varying(150) NOT NULL,
    nm_senha character varying(8) NOT NULL,
    dt_cadastro timestamp without time zone DEFAULT now() NOT NULL,
    nm_email character varying(250) NOT NULL,
    in_usuario_ativo character varying(1) DEFAULT 'S'::character varying NOT NULL,
    id_usuario_cadastro numeric(4,0) NOT NULL,
    id_perfil numeric(3,0) NOT NULL,
    CONSTRAINT ck_stusuarioativo CHECK (((in_usuario_ativo)::text = ANY (ARRAY[('S'::character varying)::text, ('N'::character varying)::text]))),
    CONSTRAINT ck_usuarioativo CHECK (((in_usuario_ativo)::text = ANY (ARRAY[('S'::character varying)::text, ('N'::character varying)::text])))
);


ALTER TABLE loja.tb_usuario OWNER TO usrloja;

--
-- TOC entry 209 (class 1259 OID 16434)
-- Name: tb_venda; Type: TABLE; Schema: loja; Owner: usrloja
--

CREATE TABLE loja.tb_venda (
    id_venda numeric(5,0) NOT NULL,
    id_tipo_venda numeric(1,0) NOT NULL,
    id_usuario numeric(4,0) NOT NULL,
    id_forma_pagamento numeric(2,0),
    dt_venda timestamp without time zone NOT NULL,
    dt_venda_finalizada timestamp without time zone,
    id_usuario_cliente numeric(4,0) NOT NULL
);


ALTER TABLE loja.tb_venda OWNER TO usrloja;

--
-- TOC entry 210 (class 1259 OID 16443)
-- Name: tp_categoria; Type: TABLE; Schema: loja; Owner: usrloja
--

CREATE TABLE loja.tp_categoria (
    id_categoria numeric(2,0) NOT NULL,
    nm_categoria character varying(50) NOT NULL
);


ALTER TABLE loja.tp_categoria OWNER TO usrloja;

--
-- TOC entry 213 (class 1259 OID 16452)
-- Name: tp_compra; Type: TABLE; Schema: loja; Owner: usrloja
--

CREATE TABLE loja.tp_compra (
    id_tipo_compra numeric NOT NULL,
    nm_tipo_compra character varying NOT NULL
);


ALTER TABLE loja.tp_compra OWNER TO usrloja;

--
-- TOC entry 211 (class 1259 OID 16446)
-- Name: tp_forma_pagamento; Type: TABLE; Schema: loja; Owner: usrloja
--

CREATE TABLE loja.tp_forma_pagamento (
    id_forma_pagamento numeric(2,0) NOT NULL,
    nm_forma_pagamento character varying(20)
);


ALTER TABLE loja.tp_forma_pagamento OWNER TO usrloja;

--
-- TOC entry 212 (class 1259 OID 16449)
-- Name: tp_genero; Type: TABLE; Schema: loja; Owner: usrloja
--

CREATE TABLE loja.tp_genero (
    id_genero numeric(1,0) NOT NULL,
    nm_genero character varying(50) NOT NULL
);


ALTER TABLE loja.tp_genero OWNER TO usrloja;

--
-- TOC entry 214 (class 1259 OID 16458)
-- Name: tp_item_venda; Type: TABLE; Schema: loja; Owner: usrloja
--

CREATE TABLE loja.tp_item_venda (
    id_tipo_item_venda numeric(1,0) NOT NULL,
    nm_tipo_item_venda character varying(20) NOT NULL,
    vl_percentual_desconto numeric(3,2)
);


ALTER TABLE loja.tp_item_venda OWNER TO usrloja;

--
-- TOC entry 216 (class 1259 OID 16464)
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
-- TOC entry 215 (class 1259 OID 16461)
-- Name: tp_venda; Type: TABLE; Schema: loja; Owner: usrloja
--

CREATE TABLE loja.tp_venda (
    id_tipo_venda numeric(1,0) NOT NULL,
    nm_tipo_venda character varying(10) NOT NULL
);


ALTER TABLE loja.tp_venda OWNER TO usrloja;

--
-- TOC entry 2989 (class 0 OID 16396)
-- Dependencies: 201
-- Data for Name: ta_item_venda; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY loja.ta_item_venda (id_item_venda, id_produto, id_tipo_item_venda, id_venda, vl_venda, id_usuario_cancelamento) FROM stdin;
\.


--
-- TOC entry 2990 (class 0 OID 16399)
-- Dependencies: 202
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
\.


--
-- TOC entry 2991 (class 0 OID 16402)
-- Dependencies: 203
-- Data for Name: tb_cep; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY loja.tb_cep (id_cep) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 16408)
-- Dependencies: 204
-- Data for Name: tb_compra; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY loja.tb_compra (id_compra, id_tipo_compra, id_usuario, nr_nota_fiscal, vl_total, dt_compra, dt_compra_finalizada) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 16414)
-- Dependencies: 205
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
9	Cadastrar Perfil
10	Manter Perfil
11	Consulta de produtos
7	Alterar usuário
\.


--
-- TOC entry 2994 (class 0 OID 16417)
-- Dependencies: 206
-- Data for Name: tb_perfil; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY loja.tb_perfil (id_perfil, nm_perfil) FROM stdin;
2	Usuário
3	Caixa
4	Cliente
1	Administrador
\.


--
-- TOC entry 2995 (class 0 OID 16420)
-- Dependencies: 207
-- Data for Name: tb_produto; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY loja.tb_produto (id_produto, qt_produto, id_sub_categoria, nm_produto, vl_venda, nu_codigo_barra, im_produto, dt_produto) FROM stdin;
15	10	1	produto teste	10.00	123456879	\N	2019-01-31
16	1	2	rrrrrr	10.00	999888	\N	2019-01-31
17	10	1	sfdadf	1.00	12345688887	\N	2019-01-31
18	20	2	teste novo	10.00	21798465	\N	2019-01-31
19	10	2	teste novo 3	10.00	12345687989	\N	2019-01-31
20	10	2	teste novo 3	10.00	12345622289	\N	2019-01-31
22	10	2	teste novo 6	10.00	92345622289	\N	2019-01-31
25	10	2	teste novo 7	10.00	92345322289	\N	2019-01-31
26	1	2	teste novo 8	11.00	13222178787	\N	2019-01-31
27	10	1	teste novo 4	1.00	123456879887	\N	2019-01-31
28	10	1	teste novo 2	10.00	132221	\N	2019-02-16
29	10	2	teste novo 4	10.00	"12345622289"	\N	2019-02-17
\.


--
-- TOC entry 2996 (class 0 OID 16427)
-- Dependencies: 208
-- Data for Name: tb_usuario; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY loja.tb_usuario (id_usuario, nm_usuario, nm_senha, dt_cadastro, nm_email, in_usuario_ativo, id_usuario_cadastro, id_perfil) FROM stdin;
102	Usuario teste	123456	2018-08-24 21:45:00.261	usuario@teste.com	S	1	4
101	Noemi Caldeira de Moura	123456	2018-08-23 23:55:56.773	noemicaldeira@gmail.com	S	1	1
103	Maria Angélica de Jesus	0102	2018-08-26 14:13:33.724	mariaangelica@gmail.com	S	101	4
108	testeteste	123456	2019-01-28 22:50:09.581	teste3@teste.com	N	1	3
110	cleuber junior	123456	2019-02-10 22:48:14.047	cleuber@teste.com	N	1	1
1	Adriano Neres	123456	2018-08-13 22:21:58.041	adriano@email.com	S	1	1
104	Francisca angelica de jesus	123	2018-08-26 14:37:09.425	franciscaangelica@gmail.com	N	103	1
106	Julia	123456	2019-01-26 23:45:26.045	gatinha@gatinha.com	N	1	1
109	teste002	123456	2019-01-31 22:26:01.45	teste002@teste.com	S	1	2
107	teste	123456	2019-01-26 23:59:48.529	teste2@teste.com	S	1	4
111	teste999	123456	2019-02-16 22:38:27.546	teste999@teste.com	S	1	3
112	teste9924	123456	2019-02-16 23:18:55.988	teste9924@teste.com	S	111	3
105	teste	123456	2019-01-26 23:43:30.579	teste@teste.com	N	1	2
100	ANA JULIA CALDEIRA	123456	2018-08-13 22:21:09.982	anacaldeira@gmail.com	S	1	2
\.


--
-- TOC entry 2997 (class 0 OID 16434)
-- Dependencies: 209
-- Data for Name: tb_venda; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY loja.tb_venda (id_venda, id_tipo_venda, id_usuario, id_forma_pagamento, dt_venda, dt_venda_finalizada, id_usuario_cliente) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 16443)
-- Dependencies: 210
-- Data for Name: tp_categoria; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY loja.tp_categoria (id_categoria, nm_categoria) FROM stdin;
1	Vestuário
\.


--
-- TOC entry 3001 (class 0 OID 16452)
-- Dependencies: 213
-- Data for Name: tp_compra; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY loja.tp_compra (id_tipo_compra, nm_tipo_compra) FROM stdin;
1	Finalizada
2	Em aberto
3	Cancelada
\.


--
-- TOC entry 2999 (class 0 OID 16446)
-- Dependencies: 211
-- Data for Name: tp_forma_pagamento; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY loja.tp_forma_pagamento (id_forma_pagamento, nm_forma_pagamento) FROM stdin;
1	A vista
2	Cartão
\.


--
-- TOC entry 3000 (class 0 OID 16449)
-- Dependencies: 212
-- Data for Name: tp_genero; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY loja.tp_genero (id_genero, nm_genero) FROM stdin;
1	Masculino
2	Feminino
3	Alimenticio
\.


--
-- TOC entry 3002 (class 0 OID 16458)
-- Dependencies: 214
-- Data for Name: tp_item_venda; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY loja.tp_item_venda (id_tipo_item_venda, nm_tipo_item_venda, vl_percentual_desconto) FROM stdin;
1	Ativo	\N
2	Cancelado	\N
\.


--
-- TOC entry 3004 (class 0 OID 16464)
-- Dependencies: 216
-- Data for Name: tp_sub_categoria; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY loja.tp_sub_categoria (id_sub_categoria, id_categoria, nm_sub_categoria, id_genero) FROM stdin;
1	1	Calça	1
2	1	Blusa	2
\.


--
-- TOC entry 3003 (class 0 OID 16461)
-- Dependencies: 215
-- Data for Name: tp_venda; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY loja.tp_venda (id_tipo_venda, nm_tipo_venda) FROM stdin;
1	Finalizada
2	Em aberto
3	Cancelada
\.


--
-- TOC entry 3011 (class 0 OID 0)
-- Dependencies: 218
-- Name: sq_idproduto; Type: SEQUENCE SET; Schema: loja; Owner: usrloja
--

SELECT pg_catalog.setval('loja.sq_idproduto', 31, true);


--
-- TOC entry 3012 (class 0 OID 0)
-- Dependencies: 197
-- Name: sq_idusuario; Type: SEQUENCE SET; Schema: loja; Owner: usrloja
--

SELECT pg_catalog.setval('loja.sq_idusuario', 112, true);


--
-- TOC entry 3013 (class 0 OID 0)
-- Dependencies: 198
-- Name: sq_produto; Type: SEQUENCE SET; Schema: loja; Owner: usrloja
--

SELECT pg_catalog.setval('loja.sq_produto', 11, true);


--
-- TOC entry 3014 (class 0 OID 0)
-- Dependencies: 199
-- Name: sq_tbproduto; Type: SEQUENCE SET; Schema: loja; Owner: usrloja
--

SELECT pg_catalog.setval('loja.sq_tbproduto', 1, false);


--
-- TOC entry 3015 (class 0 OID 0)
-- Dependencies: 200
-- Name: sq_teste; Type: SEQUENCE SET; Schema: loja; Owner: usrloja
--

SELECT pg_catalog.setval('loja.sq_teste', 1, false);


--
-- TOC entry 2815 (class 2606 OID 16468)
-- Name: tb_funcionalidade pk_modulo; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_funcionalidade
    ADD CONSTRAINT pk_modulo PRIMARY KEY (id_funcionalidade);


--
-- TOC entry 2809 (class 2606 OID 16470)
-- Name: ta_perfil_funcionalidade pk_modulo_perfil; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.ta_perfil_funcionalidade
    ADD CONSTRAINT pk_modulo_perfil PRIMARY KEY (id_perfil_funcionalidade);


--
-- TOC entry 2811 (class 2606 OID 16472)
-- Name: tb_cep pk_tbcep; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_cep
    ADD CONSTRAINT pk_tbcep PRIMARY KEY (id_cep);


--
-- TOC entry 2813 (class 2606 OID 16474)
-- Name: tb_compra pk_tbcompra; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_compra
    ADD CONSTRAINT pk_tbcompra PRIMARY KEY (id_compra);


--
-- TOC entry 2806 (class 2606 OID 16476)
-- Name: ta_item_venda pk_tbitemvenda; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.ta_item_venda
    ADD CONSTRAINT pk_tbitemvenda PRIMARY KEY (id_item_venda);


--
-- TOC entry 2817 (class 2606 OID 16478)
-- Name: tb_perfil pk_tbperfil; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_perfil
    ADD CONSTRAINT pk_tbperfil PRIMARY KEY (id_perfil);


--
-- TOC entry 2819 (class 2606 OID 16480)
-- Name: tb_produto pk_tbproduto; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_produto
    ADD CONSTRAINT pk_tbproduto PRIMARY KEY (id_produto);


--
-- TOC entry 2841 (class 2606 OID 16482)
-- Name: tp_item_venda pk_tbstatusitemvenda; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tp_item_venda
    ADD CONSTRAINT pk_tbstatusitemvenda PRIMARY KEY (id_tipo_item_venda);


--
-- TOC entry 2825 (class 2606 OID 16484)
-- Name: tb_usuario pk_tbusuario; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_usuario
    ADD CONSTRAINT pk_tbusuario PRIMARY KEY (id_usuario);


--
-- TOC entry 2831 (class 2606 OID 16486)
-- Name: tb_venda pk_tbvenda; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_venda
    ADD CONSTRAINT pk_tbvenda PRIMARY KEY (id_venda);


--
-- TOC entry 2833 (class 2606 OID 16488)
-- Name: tp_categoria pk_tpcategoria; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tp_categoria
    ADD CONSTRAINT pk_tpcategoria PRIMARY KEY (id_categoria);


--
-- TOC entry 2835 (class 2606 OID 16490)
-- Name: tp_forma_pagamento pk_tpformapagamento; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tp_forma_pagamento
    ADD CONSTRAINT pk_tpformapagamento PRIMARY KEY (id_forma_pagamento);


--
-- TOC entry 2837 (class 2606 OID 16492)
-- Name: tp_genero pk_tpgenero; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tp_genero
    ADD CONSTRAINT pk_tpgenero PRIMARY KEY (id_genero);


--
-- TOC entry 2839 (class 2606 OID 16494)
-- Name: tp_compra pk_tpstatuscompra; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tp_compra
    ADD CONSTRAINT pk_tpstatuscompra PRIMARY KEY (id_tipo_compra);


--
-- TOC entry 2843 (class 2606 OID 16496)
-- Name: tp_venda pk_tpstatusvenda; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tp_venda
    ADD CONSTRAINT pk_tpstatusvenda PRIMARY KEY (id_tipo_venda);


--
-- TOC entry 2845 (class 2606 OID 16498)
-- Name: tp_sub_categoria pk_tpsubcategoria; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tp_sub_categoria
    ADD CONSTRAINT pk_tpsubcategoria PRIMARY KEY (id_sub_categoria);


--
-- TOC entry 2821 (class 2606 OID 16604)
-- Name: tb_produto uk_produto_codigo_barra; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_produto
    ADD CONSTRAINT uk_produto_codigo_barra UNIQUE (nu_codigo_barra);


--
-- TOC entry 2823 (class 2606 OID 16502)
-- Name: tb_produto uk_produto_nucodbarra; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_produto
    ADD CONSTRAINT uk_produto_nucodbarra UNIQUE (nu_codigo_barra);


--
-- TOC entry 2827 (class 2606 OID 16504)
-- Name: tb_usuario uk_usuario_dtcadastro; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_usuario
    ADD CONSTRAINT uk_usuario_dtcadastro UNIQUE (dt_cadastro);


--
-- TOC entry 2829 (class 2606 OID 16506)
-- Name: tb_usuario uk_usuario_email; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_usuario
    ADD CONSTRAINT uk_usuario_email UNIQUE (nm_email);


--
-- TOC entry 2807 (class 1259 OID 16602)
-- Name: ix_perfilfuncionalidade_unico; Type: INDEX; Schema: loja; Owner: usrloja
--

CREATE UNIQUE INDEX ix_perfilfuncionalidade_unico ON loja.ta_perfil_funcionalidade USING btree (id_perfil, id_funcionalidade);


--
-- TOC entry 2862 (class 2606 OID 16507)
-- Name: tp_sub_categoria fk_categoria_subcategoria; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tp_sub_categoria
    ADD CONSTRAINT fk_categoria_subcategoria FOREIGN KEY (id_categoria) REFERENCES loja.tp_categoria(id_categoria);


--
-- TOC entry 2858 (class 2606 OID 16512)
-- Name: tb_venda fk_formapagamento_venda; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_venda
    ADD CONSTRAINT fk_formapagamento_venda FOREIGN KEY (id_forma_pagamento) REFERENCES loja.tp_forma_pagamento(id_forma_pagamento);


--
-- TOC entry 2850 (class 2606 OID 16517)
-- Name: ta_perfil_funcionalidade fk_funcionalidade_perfil_funcionalidade; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.ta_perfil_funcionalidade
    ADD CONSTRAINT fk_funcionalidade_perfil_funcionalidade FOREIGN KEY (id_funcionalidade) REFERENCES loja.tb_funcionalidade(id_funcionalidade);


--
-- TOC entry 2863 (class 2606 OID 16522)
-- Name: tp_sub_categoria fk_genero_subcategoria; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tp_sub_categoria
    ADD CONSTRAINT fk_genero_subcategoria FOREIGN KEY (id_genero) REFERENCES loja.tp_genero(id_genero);


--
-- TOC entry 2854 (class 2606 OID 16527)
-- Name: tb_funcionalidade fk_modulo_perfil_modulo; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_funcionalidade
    ADD CONSTRAINT fk_modulo_perfil_modulo FOREIGN KEY (id_funcionalidade) REFERENCES loja.tb_funcionalidade(id_funcionalidade);


--
-- TOC entry 2851 (class 2606 OID 16532)
-- Name: ta_perfil_funcionalidade fk_perfil_perfil_funcionalidade; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.ta_perfil_funcionalidade
    ADD CONSTRAINT fk_perfil_perfil_funcionalidade FOREIGN KEY (id_perfil) REFERENCES loja.tb_perfil(id_perfil);


--
-- TOC entry 2856 (class 2606 OID 16537)
-- Name: tb_usuario fk_perfil_usuario; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_usuario
    ADD CONSTRAINT fk_perfil_usuario FOREIGN KEY (id_perfil) REFERENCES loja.tb_perfil(id_perfil);


--
-- TOC entry 2846 (class 2606 OID 16542)
-- Name: ta_item_venda fk_produto_itemvenda; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.ta_item_venda
    ADD CONSTRAINT fk_produto_itemvenda FOREIGN KEY (id_produto) REFERENCES loja.tb_produto(id_produto);


--
-- TOC entry 2852 (class 2606 OID 16547)
-- Name: tb_compra fk_statuscompra_compra; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_compra
    ADD CONSTRAINT fk_statuscompra_compra FOREIGN KEY (id_tipo_compra) REFERENCES loja.tp_compra(id_tipo_compra);


--
-- TOC entry 2847 (class 2606 OID 16552)
-- Name: ta_item_venda fk_statusitemvenda_itemvenda; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.ta_item_venda
    ADD CONSTRAINT fk_statusitemvenda_itemvenda FOREIGN KEY (id_tipo_item_venda) REFERENCES loja.tp_item_venda(id_tipo_item_venda);


--
-- TOC entry 2859 (class 2606 OID 16557)
-- Name: tb_venda fk_statusvenda_venda; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_venda
    ADD CONSTRAINT fk_statusvenda_venda FOREIGN KEY (id_tipo_venda) REFERENCES loja.tp_venda(id_tipo_venda);


--
-- TOC entry 2855 (class 2606 OID 16562)
-- Name: tb_produto fk_subcategoria_produto; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_produto
    ADD CONSTRAINT fk_subcategoria_produto FOREIGN KEY (id_sub_categoria) REFERENCES loja.tp_sub_categoria(id_sub_categoria);


--
-- TOC entry 2853 (class 2606 OID 16567)
-- Name: tb_compra fk_usuario_compra; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_compra
    ADD CONSTRAINT fk_usuario_compra FOREIGN KEY (id_usuario) REFERENCES loja.tb_usuario(id_usuario);


--
-- TOC entry 2848 (class 2606 OID 16572)
-- Name: ta_item_venda fk_usuario_itemvenda; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.ta_item_venda
    ADD CONSTRAINT fk_usuario_itemvenda FOREIGN KEY (id_usuario_cancelamento) REFERENCES loja.tb_usuario(id_usuario);


--
-- TOC entry 2857 (class 2606 OID 16577)
-- Name: tb_usuario fk_usuario_usuario; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_usuario
    ADD CONSTRAINT fk_usuario_usuario FOREIGN KEY (id_usuario_cadastro) REFERENCES loja.tb_usuario(id_usuario);


--
-- TOC entry 2860 (class 2606 OID 16582)
-- Name: tb_venda fk_usuario_venda; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_venda
    ADD CONSTRAINT fk_usuario_venda FOREIGN KEY (id_usuario) REFERENCES loja.tb_usuario(id_usuario);


--
-- TOC entry 2861 (class 2606 OID 16587)
-- Name: tb_venda fk_usuariovenda; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_venda
    ADD CONSTRAINT fk_usuariovenda FOREIGN KEY (id_usuario_cliente) REFERENCES loja.tb_usuario(id_usuario);


--
-- TOC entry 2849 (class 2606 OID 16592)
-- Name: ta_item_venda fk_venda_itemvenda; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.ta_item_venda
    ADD CONSTRAINT fk_venda_itemvenda FOREIGN KEY (id_venda) REFERENCES loja.tb_venda(id_venda);


-- Completed on 2019-02-17 22:57:11 -03

--
-- PostgreSQL database dump complete
--

