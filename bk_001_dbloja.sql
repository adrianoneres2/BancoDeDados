--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: loja; Type: SCHEMA; Schema: -; Owner: usrloja
--

CREATE SCHEMA loja;


ALTER SCHEMA loja OWNER TO usrloja;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = loja, pg_catalog;

--
-- Name: sq_idusuario; Type: SEQUENCE; Schema: loja; Owner: usrloja
--

CREATE SEQUENCE sq_idusuario
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_idusuario OWNER TO usrloja;

--
-- Name: sq_produto; Type: SEQUENCE; Schema: loja; Owner: usrloja
--

CREATE SEQUENCE sq_produto
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_produto OWNER TO usrloja;

--
-- Name: sq_tbproduto; Type: SEQUENCE; Schema: loja; Owner: usrloja
--

CREATE SEQUENCE sq_tbproduto
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_tbproduto OWNER TO usrloja;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ta_item_venda; Type: TABLE; Schema: loja; Owner: usrloja; Tablespace: 
--

CREATE TABLE ta_item_venda (
    id_item_venda numeric(8,0) NOT NULL,
    id_produto numeric(4,0) NOT NULL,
    id_status_item_venda numeric(1,0) NOT NULL,
    id_venda numeric(5,0) NOT NULL,
    vl_venda numeric(12,2),
    id_usuario_cancelamento numeric(4,0)
);


ALTER TABLE ta_item_venda OWNER TO usrloja;

--
-- Name: ta_modulo_perfil; Type: TABLE; Schema: loja; Owner: usrloja; Tablespace: 
--

CREATE TABLE ta_modulo_perfil (
    id_modulo_perfil numeric(3,0) NOT NULL,
    id_perfil numeric(3,0) NOT NULL,
    id_modulo numeric(2,0) NOT NULL
);


ALTER TABLE ta_modulo_perfil OWNER TO usrloja;

--
-- Name: ta_usuario_perfil; Type: TABLE; Schema: loja; Owner: usrloja; Tablespace: 
--

CREATE TABLE ta_usuario_perfil (
    id_usuario numeric(4,0) NOT NULL,
    id_perfil numeric(3,0) NOT NULL,
    id_usuario_perfil numeric(5,0) NOT NULL,
    st_ativo character varying(1) DEFAULT 'S'::character varying NOT NULL,
    CONSTRAINT ck_usuarioperfilativo CHECK (((st_ativo)::text = ANY ((ARRAY['S'::character varying, 'N'::character varying])::text[])))
);


ALTER TABLE ta_usuario_perfil OWNER TO usrloja;

--
-- Name: tb_cep; Type: TABLE; Schema: loja; Owner: usrloja; Tablespace: 
--

CREATE TABLE tb_cep (
    id_cep numeric NOT NULL
);


ALTER TABLE tb_cep OWNER TO usrloja;

--
-- Name: tb_compra; Type: TABLE; Schema: loja; Owner: usrloja; Tablespace: 
--

CREATE TABLE tb_compra (
    id_compra numeric(5,0) NOT NULL,
    id_status_compra numeric NOT NULL,
    id_usuario numeric(4,0) NOT NULL,
    nr_nota_fiscal numeric(10,0),
    vl_total numeric(5,2) NOT NULL,
    dt_compra timestamp without time zone NOT NULL,
    dt_compra_finalizada timestamp without time zone
);


ALTER TABLE tb_compra OWNER TO usrloja;

--
-- Name: tb_modulo; Type: TABLE; Schema: loja; Owner: usrloja; Tablespace: 
--

CREATE TABLE tb_modulo (
    id_modulo numeric(2,0) NOT NULL,
    nm_modulo character varying(50) NOT NULL
);


ALTER TABLE tb_modulo OWNER TO usrloja;

--
-- Name: tb_perfil; Type: TABLE; Schema: loja; Owner: usrloja; Tablespace: 
--

CREATE TABLE tb_perfil (
    id_perfil numeric(3,0) NOT NULL,
    nm_perfil character varying(100) NOT NULL
);


ALTER TABLE tb_perfil OWNER TO usrloja;

--
-- Name: tb_produto; Type: TABLE; Schema: loja; Owner: usrloja; Tablespace: 
--

CREATE TABLE tb_produto (
    id_produto numeric(4,0) NOT NULL,
    qt_produto numeric(4,0) NOT NULL,
    id_sub_categoria numeric(3,0) NOT NULL,
    nm_produto character varying(50) NOT NULL,
    vl_custo numeric(12,2) NOT NULL,
    vl_venda numeric(12,2) NOT NULL,
    nu_codigo_barra character varying(30),
    vl_percentual_desconto numeric(3,2),
    im_produto bytea,
    dt_produto date DEFAULT now() NOT NULL
);


ALTER TABLE tb_produto OWNER TO usrloja;

--
-- Name: tb_usuario; Type: TABLE; Schema: loja; Owner: usrloja; Tablespace: 
--

CREATE TABLE tb_usuario (
    id_usuario numeric(4,0) NOT NULL,
    nm_usuario character varying(150) NOT NULL,
    nm_senha character varying(8) NOT NULL,
    dt_cadastro timestamp without time zone DEFAULT now() NOT NULL,
    ds_complemento character varying(2000),
    ds_referencia character varying(500),
    nr_telefone_fixo character varying(23),
    nr_telefone_celular character varying(23) NOT NULL,
    nm_sexo character varying(1) DEFAULT 'M'::character varying NOT NULL,
    nr_rg numeric(15,0) NOT NULL,
    dt_nascimento timestamp without time zone NOT NULL,
    nm_email character varying(250) NOT NULL,
    st_usuario_ativo character varying(1) DEFAULT 'S'::character varying NOT NULL,
    id_usuario_cadastro numeric(4,0) NOT NULL,
    CONSTRAINT ck_stusuarioativo CHECK (((st_usuario_ativo)::text = ANY ((ARRAY['S'::character varying, 'N'::character varying])::text[]))),
    CONSTRAINT ck_usuarioativo CHECK (((st_usuario_ativo)::text = ANY ((ARRAY['S'::character varying, 'N'::character varying])::text[])))
);


ALTER TABLE tb_usuario OWNER TO usrloja;

--
-- Name: tb_venda; Type: TABLE; Schema: loja; Owner: usrloja; Tablespace: 
--

CREATE TABLE tb_venda (
    id_venda numeric(5,0) NOT NULL,
    id_status_venda numeric(1,0) NOT NULL,
    id_usuario numeric(4,0) NOT NULL,
    id_forma_pagamento numeric(2,0),
    dt_venda timestamp without time zone NOT NULL,
    dt_venda_finalizada timestamp without time zone,
    id_usuario_cliente numeric(4,0) NOT NULL
);


ALTER TABLE tb_venda OWNER TO usrloja;

--
-- Name: tp_categoria; Type: TABLE; Schema: loja; Owner: usrloja; Tablespace: 
--

CREATE TABLE tp_categoria (
    id_categoria numeric(2,0) NOT NULL,
    ds_categoria character varying(50) NOT NULL
);


ALTER TABLE tp_categoria OWNER TO usrloja;

--
-- Name: tp_forma_pagamento; Type: TABLE; Schema: loja; Owner: usrloja; Tablespace: 
--

CREATE TABLE tp_forma_pagamento (
    id_forma_pagamento numeric(2,0) NOT NULL,
    ds_forma_pagamento character varying(20)
);


ALTER TABLE tp_forma_pagamento OWNER TO usrloja;

--
-- Name: tp_genero; Type: TABLE; Schema: loja; Owner: usrloja; Tablespace: 
--

CREATE TABLE tp_genero (
    id_genero numeric(1,0) NOT NULL,
    ds_genero character varying(50) NOT NULL
);


ALTER TABLE tp_genero OWNER TO usrloja;

--
-- Name: tp_status_compra; Type: TABLE; Schema: loja; Owner: usrloja; Tablespace: 
--

CREATE TABLE tp_status_compra (
    id_status_compra numeric NOT NULL,
    ds_status_compra character varying NOT NULL
);


ALTER TABLE tp_status_compra OWNER TO usrloja;

--
-- Name: tp_status_item_venda; Type: TABLE; Schema: loja; Owner: usrloja; Tablespace: 
--

CREATE TABLE tp_status_item_venda (
    id_status_item_venda numeric(1,0) NOT NULL,
    nm_status_item_venda character varying(20) NOT NULL,
    vl_percentual_desconto numeric(3,2)
);


ALTER TABLE tp_status_item_venda OWNER TO usrloja;

--
-- Name: tp_status_venda; Type: TABLE; Schema: loja; Owner: usrloja; Tablespace: 
--

CREATE TABLE tp_status_venda (
    id_status_venda numeric(1,0) NOT NULL,
    ds_status_venda character varying(10) NOT NULL
);


ALTER TABLE tp_status_venda OWNER TO usrloja;

--
-- Name: tp_sub_categoria; Type: TABLE; Schema: loja; Owner: usrloja; Tablespace: 
--

CREATE TABLE tp_sub_categoria (
    id_sub_categoria numeric(3,0) NOT NULL,
    id_categoria numeric(2,0) NOT NULL,
    nm_sub_categoria character varying(50) NOT NULL,
    id_genero numeric(1,0)
);


ALTER TABLE tp_sub_categoria OWNER TO usrloja;

--
-- Name: sq_idusuario; Type: SEQUENCE SET; Schema: loja; Owner: usrloja
--

SELECT pg_catalog.setval('sq_idusuario', 96, true);


--
-- Name: sq_produto; Type: SEQUENCE SET; Schema: loja; Owner: usrloja
--

SELECT pg_catalog.setval('sq_produto', 11, true);


--
-- Name: sq_tbproduto; Type: SEQUENCE SET; Schema: loja; Owner: usrloja
--

SELECT pg_catalog.setval('sq_tbproduto', 1, false);


--
-- Data for Name: ta_item_venda; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY ta_item_venda (id_item_venda, id_produto, id_status_item_venda, id_venda, vl_venda, id_usuario_cancelamento) FROM stdin;
\.


--
-- Data for Name: ta_modulo_perfil; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY ta_modulo_perfil (id_modulo_perfil, id_perfil, id_modulo) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	2	1
7	2	4
8	2	5
9	3	2
10	1	4
\.


--
-- Data for Name: ta_usuario_perfil; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY ta_usuario_perfil (id_usuario, id_perfil, id_usuario_perfil, st_ativo) FROM stdin;
\.


--
-- Data for Name: tb_cep; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY tb_cep (id_cep) FROM stdin;
\.


--
-- Data for Name: tb_compra; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY tb_compra (id_compra, id_status_compra, id_usuario, nr_nota_fiscal, vl_total, dt_compra, dt_compra_finalizada) FROM stdin;
\.


--
-- Data for Name: tb_modulo; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY tb_modulo (id_modulo, nm_modulo) FROM stdin;
1	Compra
2	Venda
3	Cadastro de usuários
4	Cadastro de produtos
5	Cadastro de clientes
\.


--
-- Data for Name: tb_perfil; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY tb_perfil (id_perfil, nm_perfil) FROM stdin;
1	administrador
2	Usuário
3	Caixa
4	Cliente
\.


--
-- Data for Name: tb_produto; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY tb_produto (id_produto, qt_produto, id_sub_categoria, nm_produto, vl_custo, vl_venda, nu_codigo_barra, vl_percentual_desconto, im_produto, dt_produto) FROM stdin;
5	1	1	Produto teste 1	10.10	20.20	123456	0.00	\N	2015-09-12
7	1	1	Produto teste 2	10.10	20.20	123457	0.00	\N	2015-09-12
9	1	2	Produto teste 3	10.10	20.20	123458	0.00	\N	2015-09-12
10	1	2	Produto teste 4	10.10	20.20	\N	0.00	\N	2015-09-12
11	1	2	Produto teste 5	10.10	20.20	\N	0.00	\N	2015-09-12
\.


--
-- Data for Name: tb_usuario; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY tb_usuario (id_usuario, nm_usuario, nm_senha, dt_cadastro, ds_complemento, ds_referencia, nr_telefone_fixo, nr_telefone_celular, nm_sexo, nr_rg, dt_nascimento, nm_email, st_usuario_ativo, id_usuario_cadastro) FROM stdin;
77	teste com try	asdf	2016-04-23 20:44:56.214152		sdf		999999999	m	12121	2016-04-23 00:00:00	diva80@email.com.br	S	1
79	Diva Neres 4	111612	2016-04-23 20:54:20.130264	teste	ceilandia	999999999	999999999	f	9873214	2016-04-16 00:00:00	diva75@email.com.br	S	1
81	Diva Neres 8	111612	2016-04-23 20:57:21.266958	teste	ceilandia	999999999	999999999	f	9871114	2016-04-16 00:00:00	diva77@email.com.br	S	1
91	sfdasdf	sadsa	2016-05-28 23:09:45.700603				9988745	m	2121	2016-05-05 00:00:00	asfsdf	S	1
94	asf	sdf	2016-06-25 23:26:03.801	asdf	asdf	99999554	11254545	m	9874985	2016-06-24 00:00:00	ans123@gmail.com	S	1
61	Adriano Neres	123456	2016-04-23 19:02:53.336039	teste	teste	999999999	999999999	m	1661873	2016-04-01 00:00:00	adriano@email.com	S	1
25	100000025	123456	2016-04-07 00:05:44.721711	testes	teste	6199999999	6199999999	m	1000025	2016-04-01 00:00:00	adriano3@gmail.com	S	1
26	100000026	123456	2016-04-07 00:06:39.386831	testes	teste	6199999999	6199999999	m	1000026	2016-04-01 00:00:00	adriano4@gmail.com	S	1
29	100000029	123456	2016-04-07 00:08:00.887707	testes	teste	6199999999	6199999999	m	1000029	2016-04-01 00:00:00	adriano5@gmail.com	S	1
30	100000030	123456	2016-04-07 00:13:19.642733	testes	teste	6199999999	6199999999	m	1000030	2016-04-01 00:00:00	adrianosss@gmail.com	S	1
31	100000031	123456	2016-04-07 00:13:58.501696	testes	teste	6199999999	6199999999	m	1000031	2016-04-01 00:00:00	adrianoss2s@gmail.com	S	1
32	100000032	123456	2016-04-07 00:19:35.63657	testes	teste	6199999999	6199999999	m	1000032	2016-04-01 00:00:00	adrianoss8s@gmail.com	S	1
33	100000033	123456	2016-04-17 22:20:21.196357	casa	casa	96122069	96122063	f	1000033	2015-07-07 00:00:00	noemicaldeira@caldeira.com	S	1
34	100000034	123456	2016-04-22 23:33:54.126753	testes	testes	6199999999	6199999999	m	1000034	2015-12-01 00:00:00	teste@teste.com	S	1
52	100000052	111612	2016-04-23 16:05:20.833112	ad	ceilandia	999999999	999999999	f	1000052	2016-04-01 00:00:00	diva5@email.com.br	S	1
41	100000041	123456	2016-04-23 13:25:37.159363		ceilandia	999999999	999999999	f	1000041	2016-04-01 00:00:00	email@email.com	S	1
35	100000035	111612	2016-04-23 11:35:02.579394	ad	asdf	zxcv	vd	m	1000035	2016-04-23 00:00:00	email123@email.com.br	S	1
72	asf	12312	2016-04-23 19:31:58.273563				999999999	f	11155999	2016-04-01 00:00:00	teste@email321.com	S	1
76	Teste rg	12312	2016-04-23 19:46:09.780492				999999999	f	11155321	2016-04-01 00:00:00	teste@email999.com	S	1
78	teste com try 2	111612	2016-04-23 20:46:34.397091	ad	ceilandia	999999999	999999999	m	957124	2016-04-23 00:00:00	diva02@email.com.br	S	1
80	Diva Neres 7	111612	2016-04-23 20:55:50.030936	teste	ceilandia	999999999	999999999	f	9873114	2016-04-16 00:00:00	diva76@email.com.br	S	1
82	Diva Neres 2	111612	2016-04-30 00:23:02.627789	ad	ceilandia	999999999	999999999	m	11155978	2016-04-04 00:00:00	diva8@email.com.br	S	1
83	asf	111612	2016-05-19 21:32:46.441792	ad	ceilandia	999999999	999999999	m	116121216	2016-05-01 00:00:00	asdfasdf@asdf.com	S	1
86	asdf	asdf	2016-05-28 22:42:22.107438	asd	asdf	fasdf	asdf	m	0	2016-05-13 00:00:00	div977@email.com.br	S	1
92	teste teste	321654	2016-06-18 21:12:34.562613	adsf	asdf	99999999	99999999	m	1887412	2016-06-01 00:00:00	testestestes@gmail.com	S	1
93	ASDFASDF	123654	2016-06-25 19:34:10.455781	ASDF	SDFA	99999999	9999999	m	1382467	2016-06-01 00:00:00	N@EMAIL.COM	S	1
9	10000009	123456	2016-01-23 21:05:08.166547	Complemento	ReferÃªncia	36151310	36161310	m	1000009	2016-01-21 22:00:00	9@email.com	S	1
10	100000010	123456	2016-01-23 21:06:35.849571	Complemento	ReferÃªncia	36151310	36161310	m	1000010	2016-01-21 22:00:00	10@email.com	S	1
11	100000011	123456	2016-01-25 18:13:11.416972	comp	ref	36151310	99920909	m	1000011	1979-01-31 21:00:00	11@email.com	S	1
13	100000013	ana	2016-01-26 00:40:16.857386	comp	ref	36151310	99920909	f	1000013	2012-01-20 22:06:00	13@email.com	S	1
14	100000014	123456	2016-01-29 00:59:08.196067	comp	ref	36151310	99920909	f	1000014	2012-01-20 22:06:00	14@email.com	S	1
15	100000015	ana	2016-01-29 01:02:57.645774	asdfa	asf	36151310	99920909	m	1000015	1978-12-31 21:02:00	15@email.com	S	1
16	100000016	123	2016-01-29 22:59:24.354088	sdfsf	dsf	36151310	99920909	f	1000016	2012-01-20 22:06:00	16@email.com	S	1
18	100000018	123456	2016-01-30 22:52:59.166408	com	ref	33741061	99990698	m	1000018	2016-01-01 00:00:00	18@email.com	S	1
43	100000043	111612	2016-04-23 13:33:07.061618		asdf	999999999	999999999	f	1000043	2016-04-01 00:00:00	diva2@email.com.br	S	1
50	100000050	111612	2016-04-23 14:10:49.565476	ad	ceilandia	999999999	999999999	f	1000050	2016-04-01 00:00:00	diva22@email.com.br	S	1
19	100000019	123456	2016-04-06 23:46:12.461909	testes	teste	6199999999	6199999999	m	1000019	2016-04-01 00:00:00	adriano@gmail.com	S	1
22	100000022	123456	2016-04-07 00:02:56.48444	testes	teste	6199999999	6199999999	m	1000022	2016-04-01 00:00:00	adriano2@gmail.com	S	1
39	100000039	333555	2016-04-23 12:38:25.925595	ad	asdf	zxcv	vd	f	1000039	2016-04-12 00:00:00	email1238@email.com.br	S	1
\.


--
-- Data for Name: tb_venda; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY tb_venda (id_venda, id_status_venda, id_usuario, id_forma_pagamento, dt_venda, dt_venda_finalizada, id_usuario_cliente) FROM stdin;
\.


--
-- Data for Name: tp_categoria; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY tp_categoria (id_categoria, ds_categoria) FROM stdin;
1	Vestuário
\.


--
-- Data for Name: tp_forma_pagamento; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY tp_forma_pagamento (id_forma_pagamento, ds_forma_pagamento) FROM stdin;
1	A vista
2	Cartão
\.


--
-- Data for Name: tp_genero; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY tp_genero (id_genero, ds_genero) FROM stdin;
1	Masculino
2	Feminino
3	Alimenticio
\.


--
-- Data for Name: tp_status_compra; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY tp_status_compra (id_status_compra, ds_status_compra) FROM stdin;
1	Finalizada
2	Em aberto
3	Cancelada
\.


--
-- Data for Name: tp_status_item_venda; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY tp_status_item_venda (id_status_item_venda, nm_status_item_venda, vl_percentual_desconto) FROM stdin;
1	Ativo	\N
2	Cancelado	\N
\.


--
-- Data for Name: tp_status_venda; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY tp_status_venda (id_status_venda, ds_status_venda) FROM stdin;
1	Finalizada
2	Em aberto
3	Cancelada
\.


--
-- Data for Name: tp_sub_categoria; Type: TABLE DATA; Schema: loja; Owner: usrloja
--

COPY tp_sub_categoria (id_sub_categoria, id_categoria, nm_sub_categoria, id_genero) FROM stdin;
1	1	Calça	1
2	1	Calça	2
\.


--
-- Name: pk_modulo; Type: CONSTRAINT; Schema: loja; Owner: usrloja; Tablespace: 
--

ALTER TABLE ONLY tb_modulo
    ADD CONSTRAINT pk_modulo PRIMARY KEY (id_modulo);


--
-- Name: pk_modulo_perfil; Type: CONSTRAINT; Schema: loja; Owner: usrloja; Tablespace: 
--

ALTER TABLE ONLY ta_modulo_perfil
    ADD CONSTRAINT pk_modulo_perfil PRIMARY KEY (id_modulo_perfil);


--
-- Name: pk_tausuarioperfil; Type: CONSTRAINT; Schema: loja; Owner: usrloja; Tablespace: 
--

ALTER TABLE ONLY ta_usuario_perfil
    ADD CONSTRAINT pk_tausuarioperfil PRIMARY KEY (id_usuario_perfil);


--
-- Name: pk_tbcep; Type: CONSTRAINT; Schema: loja; Owner: usrloja; Tablespace: 
--

ALTER TABLE ONLY tb_cep
    ADD CONSTRAINT pk_tbcep PRIMARY KEY (id_cep);


--
-- Name: pk_tbcompra; Type: CONSTRAINT; Schema: loja; Owner: usrloja; Tablespace: 
--

ALTER TABLE ONLY tb_compra
    ADD CONSTRAINT pk_tbcompra PRIMARY KEY (id_compra);


--
-- Name: pk_tbitemvenda; Type: CONSTRAINT; Schema: loja; Owner: usrloja; Tablespace: 
--

ALTER TABLE ONLY ta_item_venda
    ADD CONSTRAINT pk_tbitemvenda PRIMARY KEY (id_item_venda);


--
-- Name: pk_tbperfil; Type: CONSTRAINT; Schema: loja; Owner: usrloja; Tablespace: 
--

ALTER TABLE ONLY tb_perfil
    ADD CONSTRAINT pk_tbperfil PRIMARY KEY (id_perfil);


--
-- Name: pk_tbproduto; Type: CONSTRAINT; Schema: loja; Owner: usrloja; Tablespace: 
--

ALTER TABLE ONLY tb_produto
    ADD CONSTRAINT pk_tbproduto PRIMARY KEY (id_produto);


--
-- Name: pk_tbstatusitemvenda; Type: CONSTRAINT; Schema: loja; Owner: usrloja; Tablespace: 
--

ALTER TABLE ONLY tp_status_item_venda
    ADD CONSTRAINT pk_tbstatusitemvenda PRIMARY KEY (id_status_item_venda);


--
-- Name: pk_tbusuario; Type: CONSTRAINT; Schema: loja; Owner: usrloja; Tablespace: 
--

ALTER TABLE ONLY tb_usuario
    ADD CONSTRAINT pk_tbusuario PRIMARY KEY (id_usuario);


--
-- Name: pk_tbvenda; Type: CONSTRAINT; Schema: loja; Owner: usrloja; Tablespace: 
--

ALTER TABLE ONLY tb_venda
    ADD CONSTRAINT pk_tbvenda PRIMARY KEY (id_venda);


--
-- Name: pk_tpcategoria; Type: CONSTRAINT; Schema: loja; Owner: usrloja; Tablespace: 
--

ALTER TABLE ONLY tp_categoria
    ADD CONSTRAINT pk_tpcategoria PRIMARY KEY (id_categoria);


--
-- Name: pk_tpformapagamento; Type: CONSTRAINT; Schema: loja; Owner: usrloja; Tablespace: 
--

ALTER TABLE ONLY tp_forma_pagamento
    ADD CONSTRAINT pk_tpformapagamento PRIMARY KEY (id_forma_pagamento);


--
-- Name: pk_tpgenero; Type: CONSTRAINT; Schema: loja; Owner: usrloja; Tablespace: 
--

ALTER TABLE ONLY tp_genero
    ADD CONSTRAINT pk_tpgenero PRIMARY KEY (id_genero);


--
-- Name: pk_tpstatuscompra; Type: CONSTRAINT; Schema: loja; Owner: usrloja; Tablespace: 
--

ALTER TABLE ONLY tp_status_compra
    ADD CONSTRAINT pk_tpstatuscompra PRIMARY KEY (id_status_compra);


--
-- Name: pk_tpstatusvenda; Type: CONSTRAINT; Schema: loja; Owner: usrloja; Tablespace: 
--

ALTER TABLE ONLY tp_status_venda
    ADD CONSTRAINT pk_tpstatusvenda PRIMARY KEY (id_status_venda);


--
-- Name: pk_tpsubcategoria; Type: CONSTRAINT; Schema: loja; Owner: usrloja; Tablespace: 
--

ALTER TABLE ONLY tp_sub_categoria
    ADD CONSTRAINT pk_tpsubcategoria PRIMARY KEY (id_sub_categoria);


--
-- Name: uk_produto_nucodbarra; Type: CONSTRAINT; Schema: loja; Owner: usrloja; Tablespace: 
--

ALTER TABLE ONLY tb_produto
    ADD CONSTRAINT uk_produto_nucodbarra UNIQUE (nu_codigo_barra);


--
-- Name: uk_usuario_dtcadastro; Type: CONSTRAINT; Schema: loja; Owner: usrloja; Tablespace: 
--

ALTER TABLE ONLY tb_usuario
    ADD CONSTRAINT uk_usuario_dtcadastro UNIQUE (dt_cadastro);


--
-- Name: uk_usuario_email; Type: CONSTRAINT; Schema: loja; Owner: usrloja; Tablespace: 
--

ALTER TABLE ONLY tb_usuario
    ADD CONSTRAINT uk_usuario_email UNIQUE (nm_email);


--
-- Name: uk_usuario_rgunico; Type: CONSTRAINT; Schema: loja; Owner: usrloja; Tablespace: 
--

ALTER TABLE ONLY tb_usuario
    ADD CONSTRAINT uk_usuario_rgunico UNIQUE (nr_rg);


--
-- Name: uk_usuperfil_usuarioperfil; Type: CONSTRAINT; Schema: loja; Owner: usrloja; Tablespace: 
--

ALTER TABLE ONLY ta_usuario_perfil
    ADD CONSTRAINT uk_usuperfil_usuarioperfil UNIQUE (id_usuario, id_perfil);


--
-- Name: fk_categoria_subcategoria; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY tp_sub_categoria
    ADD CONSTRAINT fk_categoria_subcategoria FOREIGN KEY (id_categoria) REFERENCES tp_categoria(id_categoria);


--
-- Name: fk_formapagamento_venda; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY tb_venda
    ADD CONSTRAINT fk_formapagamento_venda FOREIGN KEY (id_forma_pagamento) REFERENCES tp_forma_pagamento(id_forma_pagamento);


--
-- Name: fk_genero_subcategoria; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY tp_sub_categoria
    ADD CONSTRAINT fk_genero_subcategoria FOREIGN KEY (id_genero) REFERENCES tp_genero(id_genero);


--
-- Name: fk_modulo_perfil_modulo; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY tb_modulo
    ADD CONSTRAINT fk_modulo_perfil_modulo FOREIGN KEY (id_modulo) REFERENCES tb_modulo(id_modulo);


--
-- Name: fk_perfil_usuarioperfil; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY ta_usuario_perfil
    ADD CONSTRAINT fk_perfil_usuarioperfil FOREIGN KEY (id_perfil) REFERENCES tb_perfil(id_perfil);


--
-- Name: fk_produto_itemvenda; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY ta_item_venda
    ADD CONSTRAINT fk_produto_itemvenda FOREIGN KEY (id_produto) REFERENCES tb_produto(id_produto);


--
-- Name: fk_statuscompra_compra; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY tb_compra
    ADD CONSTRAINT fk_statuscompra_compra FOREIGN KEY (id_status_compra) REFERENCES tp_status_compra(id_status_compra);


--
-- Name: fk_statusitemvenda_itemvenda; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY ta_item_venda
    ADD CONSTRAINT fk_statusitemvenda_itemvenda FOREIGN KEY (id_status_item_venda) REFERENCES tp_status_item_venda(id_status_item_venda);


--
-- Name: fk_statusvenda_venda; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY tb_venda
    ADD CONSTRAINT fk_statusvenda_venda FOREIGN KEY (id_status_venda) REFERENCES tp_status_venda(id_status_venda);


--
-- Name: fk_subcategoria_produto; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY tb_produto
    ADD CONSTRAINT fk_subcategoria_produto FOREIGN KEY (id_sub_categoria) REFERENCES tp_sub_categoria(id_sub_categoria);


--
-- Name: fk_usuario_compra; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY tb_compra
    ADD CONSTRAINT fk_usuario_compra FOREIGN KEY (id_usuario) REFERENCES tb_usuario(id_usuario);


--
-- Name: fk_usuario_itemvenda; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY ta_item_venda
    ADD CONSTRAINT fk_usuario_itemvenda FOREIGN KEY (id_usuario_cancelamento) REFERENCES tb_usuario(id_usuario);


--
-- Name: fk_usuario_usuarioperfil; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY ta_usuario_perfil
    ADD CONSTRAINT fk_usuario_usuarioperfil FOREIGN KEY (id_usuario) REFERENCES tb_usuario(id_usuario);


--
-- Name: fk_usuario_venda; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY tb_venda
    ADD CONSTRAINT fk_usuario_venda FOREIGN KEY (id_usuario) REFERENCES tb_usuario(id_usuario);


--
-- Name: fk_usuariovenda; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY tb_venda
    ADD CONSTRAINT fk_usuariovenda FOREIGN KEY (id_usuario_cliente) REFERENCES tb_usuario(id_usuario);


--
-- Name: fk_venda_itemvenda; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY ta_item_venda
    ADD CONSTRAINT fk_venda_itemvenda FOREIGN KEY (id_venda) REFERENCES tb_venda(id_venda);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

