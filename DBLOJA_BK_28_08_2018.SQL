--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5 (Debian 10.5-1.pgdg90+1)
-- Dumped by pg_dump version 10.5 (Ubuntu 10.5-0ubuntu0.18.04)

-- Started on 2018-08-28 23:09:32 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE dbloja;
--
-- TOC entry 3010 (class 1262 OID 16386)
-- Name: dbloja; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE dbloja WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


\connect dbloja

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
-- TOC entry 3 (class 2615 OID 16387)
-- Name: loja; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA loja;


--
-- TOC entry 1 (class 3079 OID 12980)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3012 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 218 (class 1259 OID 16599)
-- Name: sq_idproduto; Type: SEQUENCE; Schema: loja; Owner: -
--

CREATE SEQUENCE loja.sq_idproduto
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 197 (class 1259 OID 16388)
-- Name: sq_idusuario; Type: SEQUENCE; Schema: loja; Owner: -
--

CREATE SEQUENCE loja.sq_idusuario
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 198 (class 1259 OID 16390)
-- Name: sq_produto; Type: SEQUENCE; Schema: loja; Owner: -
--

CREATE SEQUENCE loja.sq_produto
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 199 (class 1259 OID 16392)
-- Name: sq_tbproduto; Type: SEQUENCE; Schema: loja; Owner: -
--

CREATE SEQUENCE loja.sq_tbproduto
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 200 (class 1259 OID 16394)
-- Name: sq_teste; Type: SEQUENCE; Schema: loja; Owner: -
--

CREATE SEQUENCE loja.sq_teste
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 201 (class 1259 OID 16396)
-- Name: ta_item_venda; Type: TABLE; Schema: loja; Owner: -
--

CREATE TABLE loja.ta_item_venda (
    id_item_venda numeric(8,0) NOT NULL,
    id_produto numeric(4,0) NOT NULL,
    id_tipo_item_venda numeric(1,0) NOT NULL,
    id_venda numeric(5,0) NOT NULL,
    vl_venda numeric(12,2),
    id_usuario_cancelamento numeric(4,0)
);


--
-- TOC entry 202 (class 1259 OID 16399)
-- Name: ta_perfil_funcionalidade; Type: TABLE; Schema: loja; Owner: -
--

CREATE TABLE loja.ta_perfil_funcionalidade (
    id_perfil_funcionalidade numeric(3,0) NOT NULL,
    id_perfil numeric(3,0) NOT NULL,
    id_funcionalidade numeric(2,0) NOT NULL
);


--
-- TOC entry 203 (class 1259 OID 16402)
-- Name: tb_cep; Type: TABLE; Schema: loja; Owner: -
--

CREATE TABLE loja.tb_cep (
    id_cep numeric NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 16408)
-- Name: tb_compra; Type: TABLE; Schema: loja; Owner: -
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


--
-- TOC entry 205 (class 1259 OID 16414)
-- Name: tb_funcionalidade; Type: TABLE; Schema: loja; Owner: -
--

CREATE TABLE loja.tb_funcionalidade (
    id_funcionalidade numeric(2,0) NOT NULL,
    nm_funcionalidade character varying(50) NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 16417)
-- Name: tb_perfil; Type: TABLE; Schema: loja; Owner: -
--

CREATE TABLE loja.tb_perfil (
    id_perfil numeric(3,0) NOT NULL,
    nm_perfil character varying(100) NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 16420)
-- Name: tb_produto; Type: TABLE; Schema: loja; Owner: -
--

CREATE TABLE loja.tb_produto (
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


--
-- TOC entry 208 (class 1259 OID 16427)
-- Name: tb_usuario; Type: TABLE; Schema: loja; Owner: -
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


--
-- TOC entry 209 (class 1259 OID 16434)
-- Name: tb_venda; Type: TABLE; Schema: loja; Owner: -
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


--
-- TOC entry 210 (class 1259 OID 16443)
-- Name: tp_categoria; Type: TABLE; Schema: loja; Owner: -
--

CREATE TABLE loja.tp_categoria (
    id_categoria numeric(2,0) NOT NULL,
    nm_categoria character varying(50) NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 16452)
-- Name: tp_compra; Type: TABLE; Schema: loja; Owner: -
--

CREATE TABLE loja.tp_compra (
    id_tipo_compra numeric NOT NULL,
    nm_tipo_compra character varying NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 16446)
-- Name: tp_forma_pagamento; Type: TABLE; Schema: loja; Owner: -
--

CREATE TABLE loja.tp_forma_pagamento (
    id_forma_pagamento numeric(2,0) NOT NULL,
    nm_forma_pagamento character varying(20)
);


--
-- TOC entry 212 (class 1259 OID 16449)
-- Name: tp_genero; Type: TABLE; Schema: loja; Owner: -
--

CREATE TABLE loja.tp_genero (
    id_genero numeric(1,0) NOT NULL,
    nm_genero character varying(50) NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 16458)
-- Name: tp_item_venda; Type: TABLE; Schema: loja; Owner: -
--

CREATE TABLE loja.tp_item_venda (
    id_tipo_item_venda numeric(1,0) NOT NULL,
    nm_tipo_item_venda character varying(20) NOT NULL,
    vl_percentual_desconto numeric(3,2)
);


--
-- TOC entry 216 (class 1259 OID 16464)
-- Name: tp_sub_categoria; Type: TABLE; Schema: loja; Owner: -
--

CREATE TABLE loja.tp_sub_categoria (
    id_sub_categoria numeric(3,0) NOT NULL,
    id_categoria numeric(2,0) NOT NULL,
    nm_sub_categoria character varying(50) NOT NULL,
    id_genero numeric(1,0)
);


--
-- TOC entry 215 (class 1259 OID 16461)
-- Name: tp_venda; Type: TABLE; Schema: loja; Owner: -
--

CREATE TABLE loja.tp_venda (
    id_tipo_venda numeric(1,0) NOT NULL,
    nm_tipo_venda character varying(10) NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 16597)
-- Name: sq_idproduto; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sq_idproduto
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2987 (class 0 OID 16396)
-- Dependencies: 201
-- Data for Name: ta_item_venda; Type: TABLE DATA; Schema: loja; Owner: -
--



--
-- TOC entry 2988 (class 0 OID 16399)
-- Dependencies: 202
-- Data for Name: ta_perfil_funcionalidade; Type: TABLE DATA; Schema: loja; Owner: -
--

INSERT INTO loja.ta_perfil_funcionalidade (id_perfil_funcionalidade, id_perfil, id_funcionalidade) VALUES (1, 1, 3);
INSERT INTO loja.ta_perfil_funcionalidade (id_perfil_funcionalidade, id_perfil, id_funcionalidade) VALUES (2, 1, 1);
INSERT INTO loja.ta_perfil_funcionalidade (id_perfil_funcionalidade, id_perfil, id_funcionalidade) VALUES (3, 1, 2);
INSERT INTO loja.ta_perfil_funcionalidade (id_perfil_funcionalidade, id_perfil, id_funcionalidade) VALUES (5, 1, 4);
INSERT INTO loja.ta_perfil_funcionalidade (id_perfil_funcionalidade, id_perfil, id_funcionalidade) VALUES (6, 1, 5);
INSERT INTO loja.ta_perfil_funcionalidade (id_perfil_funcionalidade, id_perfil, id_funcionalidade) VALUES (7, 1, 6);
INSERT INTO loja.ta_perfil_funcionalidade (id_perfil_funcionalidade, id_perfil, id_funcionalidade) VALUES (8, 1, 7);
INSERT INTO loja.ta_perfil_funcionalidade (id_perfil_funcionalidade, id_perfil, id_funcionalidade) VALUES (9, 3, 6);
INSERT INTO loja.ta_perfil_funcionalidade (id_perfil_funcionalidade, id_perfil, id_funcionalidade) VALUES (10, 3, 3);


--
-- TOC entry 2989 (class 0 OID 16402)
-- Dependencies: 203
-- Data for Name: tb_cep; Type: TABLE DATA; Schema: loja; Owner: -
--



--
-- TOC entry 2990 (class 0 OID 16408)
-- Dependencies: 204
-- Data for Name: tb_compra; Type: TABLE DATA; Schema: loja; Owner: -
--



--
-- TOC entry 2991 (class 0 OID 16414)
-- Dependencies: 205
-- Data for Name: tb_funcionalidade; Type: TABLE DATA; Schema: loja; Owner: -
--

INSERT INTO loja.tb_funcionalidade (id_funcionalidade, nm_funcionalidade) VALUES (1, 'Compra');
INSERT INTO loja.tb_funcionalidade (id_funcionalidade, nm_funcionalidade) VALUES (2, 'Venda');
INSERT INTO loja.tb_funcionalidade (id_funcionalidade, nm_funcionalidade) VALUES (3, 'Cadastro de usuários');
INSERT INTO loja.tb_funcionalidade (id_funcionalidade, nm_funcionalidade) VALUES (4, 'Cadastro de produtos');
INSERT INTO loja.tb_funcionalidade (id_funcionalidade, nm_funcionalidade) VALUES (5, 'Cadastro de clientes');
INSERT INTO loja.tb_funcionalidade (id_funcionalidade, nm_funcionalidade) VALUES (6, 'Consulta de usuários');
INSERT INTO loja.tb_funcionalidade (id_funcionalidade, nm_funcionalidade) VALUES (7, 'Alterar de usuario');


--
-- TOC entry 2992 (class 0 OID 16417)
-- Dependencies: 206
-- Data for Name: tb_perfil; Type: TABLE DATA; Schema: loja; Owner: -
--

INSERT INTO loja.tb_perfil (id_perfil, nm_perfil) VALUES (1, 'administrador');
INSERT INTO loja.tb_perfil (id_perfil, nm_perfil) VALUES (2, 'Usuário');
INSERT INTO loja.tb_perfil (id_perfil, nm_perfil) VALUES (3, 'Caixa');
INSERT INTO loja.tb_perfil (id_perfil, nm_perfil) VALUES (4, 'Cliente');


--
-- TOC entry 2993 (class 0 OID 16420)
-- Dependencies: 207
-- Data for Name: tb_produto; Type: TABLE DATA; Schema: loja; Owner: -
--



--
-- TOC entry 2994 (class 0 OID 16427)
-- Dependencies: 208
-- Data for Name: tb_usuario; Type: TABLE DATA; Schema: loja; Owner: -
--

INSERT INTO loja.tb_usuario (id_usuario, nm_usuario, nm_senha, dt_cadastro, nm_email, in_usuario_ativo, id_usuario_cadastro, id_perfil) VALUES (1, 'Adriano Neres', '123456', '2018-08-13 22:21:58.041', 'adriano@email.com', 'S', 1, 1);
INSERT INTO loja.tb_usuario (id_usuario, nm_usuario, nm_senha, dt_cadastro, nm_email, in_usuario_ativo, id_usuario_cadastro, id_perfil) VALUES (101, 'Noemi Caldeira de Moura', '123456', '2018-08-23 23:55:56.773', 'noemicaldeira@gmail.com', 'S', 1, 1);
INSERT INTO loja.tb_usuario (id_usuario, nm_usuario, nm_senha, dt_cadastro, nm_email, in_usuario_ativo, id_usuario_cadastro, id_perfil) VALUES (100, 'ANA JULIA CALDEIRA', '123456', '2018-08-13 22:21:09.982', 'anacaldeira@gmail.com', 'S', 1, 1);
INSERT INTO loja.tb_usuario (id_usuario, nm_usuario, nm_senha, dt_cadastro, nm_email, in_usuario_ativo, id_usuario_cadastro, id_perfil) VALUES (102, 'Usuario teste', '123456', '2018-08-24 21:45:00.261', 'usuario@teste.com', 'N', 1, 2);
INSERT INTO loja.tb_usuario (id_usuario, nm_usuario, nm_senha, dt_cadastro, nm_email, in_usuario_ativo, id_usuario_cadastro, id_perfil) VALUES (103, 'Maria angélica de Jesus', '0102', '2018-08-26 14:13:33.724', 'mariaangelica@gmail.com', 'S', 101, 3);
INSERT INTO loja.tb_usuario (id_usuario, nm_usuario, nm_senha, dt_cadastro, nm_email, in_usuario_ativo, id_usuario_cadastro, id_perfil) VALUES (104, 'Francisca angelica de jesus', '123', '2018-08-26 14:37:09.425', 'franciscaangelica@gmail.com', 'N', 103, 1);


--
-- TOC entry 2995 (class 0 OID 16434)
-- Dependencies: 209
-- Data for Name: tb_venda; Type: TABLE DATA; Schema: loja; Owner: -
--



--
-- TOC entry 2996 (class 0 OID 16443)
-- Dependencies: 210
-- Data for Name: tp_categoria; Type: TABLE DATA; Schema: loja; Owner: -
--

INSERT INTO loja.tp_categoria (id_categoria, nm_categoria) VALUES (1, 'Vestuário');


--
-- TOC entry 2999 (class 0 OID 16452)
-- Dependencies: 213
-- Data for Name: tp_compra; Type: TABLE DATA; Schema: loja; Owner: -
--

INSERT INTO loja.tp_compra (id_tipo_compra, nm_tipo_compra) VALUES (1, 'Finalizada');
INSERT INTO loja.tp_compra (id_tipo_compra, nm_tipo_compra) VALUES (2, 'Em aberto');
INSERT INTO loja.tp_compra (id_tipo_compra, nm_tipo_compra) VALUES (3, 'Cancelada');


--
-- TOC entry 2997 (class 0 OID 16446)
-- Dependencies: 211
-- Data for Name: tp_forma_pagamento; Type: TABLE DATA; Schema: loja; Owner: -
--

INSERT INTO loja.tp_forma_pagamento (id_forma_pagamento, nm_forma_pagamento) VALUES (1, 'A vista');
INSERT INTO loja.tp_forma_pagamento (id_forma_pagamento, nm_forma_pagamento) VALUES (2, 'Cartão');


--
-- TOC entry 2998 (class 0 OID 16449)
-- Dependencies: 212
-- Data for Name: tp_genero; Type: TABLE DATA; Schema: loja; Owner: -
--

INSERT INTO loja.tp_genero (id_genero, nm_genero) VALUES (1, 'Masculino');
INSERT INTO loja.tp_genero (id_genero, nm_genero) VALUES (2, 'Feminino');
INSERT INTO loja.tp_genero (id_genero, nm_genero) VALUES (3, 'Alimenticio');


--
-- TOC entry 3000 (class 0 OID 16458)
-- Dependencies: 214
-- Data for Name: tp_item_venda; Type: TABLE DATA; Schema: loja; Owner: -
--

INSERT INTO loja.tp_item_venda (id_tipo_item_venda, nm_tipo_item_venda, vl_percentual_desconto) VALUES (1, 'Ativo', NULL);
INSERT INTO loja.tp_item_venda (id_tipo_item_venda, nm_tipo_item_venda, vl_percentual_desconto) VALUES (2, 'Cancelado', NULL);


--
-- TOC entry 3002 (class 0 OID 16464)
-- Dependencies: 216
-- Data for Name: tp_sub_categoria; Type: TABLE DATA; Schema: loja; Owner: -
--

INSERT INTO loja.tp_sub_categoria (id_sub_categoria, id_categoria, nm_sub_categoria, id_genero) VALUES (1, 1, 'Calça', 1);
INSERT INTO loja.tp_sub_categoria (id_sub_categoria, id_categoria, nm_sub_categoria, id_genero) VALUES (2, 1, 'Blusa', 2);


--
-- TOC entry 3001 (class 0 OID 16461)
-- Dependencies: 215
-- Data for Name: tp_venda; Type: TABLE DATA; Schema: loja; Owner: -
--

INSERT INTO loja.tp_venda (id_tipo_venda, nm_tipo_venda) VALUES (1, 'Finalizada');
INSERT INTO loja.tp_venda (id_tipo_venda, nm_tipo_venda) VALUES (2, 'Em aberto');
INSERT INTO loja.tp_venda (id_tipo_venda, nm_tipo_venda) VALUES (3, 'Cancelada');


--
-- TOC entry 3013 (class 0 OID 0)
-- Dependencies: 218
-- Name: sq_idproduto; Type: SEQUENCE SET; Schema: loja; Owner: -
--

SELECT pg_catalog.setval('loja.sq_idproduto', 4, true);


--
-- TOC entry 3014 (class 0 OID 0)
-- Dependencies: 197
-- Name: sq_idusuario; Type: SEQUENCE SET; Schema: loja; Owner: -
--

SELECT pg_catalog.setval('loja.sq_idusuario', 104, true);


--
-- TOC entry 3015 (class 0 OID 0)
-- Dependencies: 198
-- Name: sq_produto; Type: SEQUENCE SET; Schema: loja; Owner: -
--

SELECT pg_catalog.setval('loja.sq_produto', 11, true);


--
-- TOC entry 3016 (class 0 OID 0)
-- Dependencies: 199
-- Name: sq_tbproduto; Type: SEQUENCE SET; Schema: loja; Owner: -
--

SELECT pg_catalog.setval('loja.sq_tbproduto', 1, false);


--
-- TOC entry 3017 (class 0 OID 0)
-- Dependencies: 200
-- Name: sq_teste; Type: SEQUENCE SET; Schema: loja; Owner: -
--

SELECT pg_catalog.setval('loja.sq_teste', 1, false);


--
-- TOC entry 3018 (class 0 OID 0)
-- Dependencies: 217
-- Name: sq_idproduto; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sq_idproduto', 1, false);


--
-- TOC entry 2815 (class 2606 OID 16468)
-- Name: tb_funcionalidade pk_modulo; Type: CONSTRAINT; Schema: loja; Owner: -
--

ALTER TABLE ONLY loja.tb_funcionalidade
    ADD CONSTRAINT pk_modulo PRIMARY KEY (id_funcionalidade);


--
-- TOC entry 2809 (class 2606 OID 16470)
-- Name: ta_perfil_funcionalidade pk_modulo_perfil; Type: CONSTRAINT; Schema: loja; Owner: -
--

ALTER TABLE ONLY loja.ta_perfil_funcionalidade
    ADD CONSTRAINT pk_modulo_perfil PRIMARY KEY (id_perfil_funcionalidade);


--
-- TOC entry 2811 (class 2606 OID 16472)
-- Name: tb_cep pk_tbcep; Type: CONSTRAINT; Schema: loja; Owner: -
--

ALTER TABLE ONLY loja.tb_cep
    ADD CONSTRAINT pk_tbcep PRIMARY KEY (id_cep);


--
-- TOC entry 2813 (class 2606 OID 16474)
-- Name: tb_compra pk_tbcompra; Type: CONSTRAINT; Schema: loja; Owner: -
--

ALTER TABLE ONLY loja.tb_compra
    ADD CONSTRAINT pk_tbcompra PRIMARY KEY (id_compra);


--
-- TOC entry 2806 (class 2606 OID 16476)
-- Name: ta_item_venda pk_tbitemvenda; Type: CONSTRAINT; Schema: loja; Owner: -
--

ALTER TABLE ONLY loja.ta_item_venda
    ADD CONSTRAINT pk_tbitemvenda PRIMARY KEY (id_item_venda);


--
-- TOC entry 2817 (class 2606 OID 16478)
-- Name: tb_perfil pk_tbperfil; Type: CONSTRAINT; Schema: loja; Owner: -
--

ALTER TABLE ONLY loja.tb_perfil
    ADD CONSTRAINT pk_tbperfil PRIMARY KEY (id_perfil);


--
-- TOC entry 2819 (class 2606 OID 16480)
-- Name: tb_produto pk_tbproduto; Type: CONSTRAINT; Schema: loja; Owner: -
--

ALTER TABLE ONLY loja.tb_produto
    ADD CONSTRAINT pk_tbproduto PRIMARY KEY (id_produto);


--
-- TOC entry 2839 (class 2606 OID 16482)
-- Name: tp_item_venda pk_tbstatusitemvenda; Type: CONSTRAINT; Schema: loja; Owner: -
--

ALTER TABLE ONLY loja.tp_item_venda
    ADD CONSTRAINT pk_tbstatusitemvenda PRIMARY KEY (id_tipo_item_venda);


--
-- TOC entry 2823 (class 2606 OID 16484)
-- Name: tb_usuario pk_tbusuario; Type: CONSTRAINT; Schema: loja; Owner: -
--

ALTER TABLE ONLY loja.tb_usuario
    ADD CONSTRAINT pk_tbusuario PRIMARY KEY (id_usuario);


--
-- TOC entry 2829 (class 2606 OID 16486)
-- Name: tb_venda pk_tbvenda; Type: CONSTRAINT; Schema: loja; Owner: -
--

ALTER TABLE ONLY loja.tb_venda
    ADD CONSTRAINT pk_tbvenda PRIMARY KEY (id_venda);


--
-- TOC entry 2831 (class 2606 OID 16488)
-- Name: tp_categoria pk_tpcategoria; Type: CONSTRAINT; Schema: loja; Owner: -
--

ALTER TABLE ONLY loja.tp_categoria
    ADD CONSTRAINT pk_tpcategoria PRIMARY KEY (id_categoria);


--
-- TOC entry 2833 (class 2606 OID 16490)
-- Name: tp_forma_pagamento pk_tpformapagamento; Type: CONSTRAINT; Schema: loja; Owner: -
--

ALTER TABLE ONLY loja.tp_forma_pagamento
    ADD CONSTRAINT pk_tpformapagamento PRIMARY KEY (id_forma_pagamento);


--
-- TOC entry 2835 (class 2606 OID 16492)
-- Name: tp_genero pk_tpgenero; Type: CONSTRAINT; Schema: loja; Owner: -
--

ALTER TABLE ONLY loja.tp_genero
    ADD CONSTRAINT pk_tpgenero PRIMARY KEY (id_genero);


--
-- TOC entry 2837 (class 2606 OID 16494)
-- Name: tp_compra pk_tpstatuscompra; Type: CONSTRAINT; Schema: loja; Owner: -
--

ALTER TABLE ONLY loja.tp_compra
    ADD CONSTRAINT pk_tpstatuscompra PRIMARY KEY (id_tipo_compra);


--
-- TOC entry 2841 (class 2606 OID 16496)
-- Name: tp_venda pk_tpstatusvenda; Type: CONSTRAINT; Schema: loja; Owner: -
--

ALTER TABLE ONLY loja.tp_venda
    ADD CONSTRAINT pk_tpstatusvenda PRIMARY KEY (id_tipo_venda);


--
-- TOC entry 2843 (class 2606 OID 16498)
-- Name: tp_sub_categoria pk_tpsubcategoria; Type: CONSTRAINT; Schema: loja; Owner: -
--

ALTER TABLE ONLY loja.tp_sub_categoria
    ADD CONSTRAINT pk_tpsubcategoria PRIMARY KEY (id_sub_categoria);


--
-- TOC entry 2821 (class 2606 OID 16502)
-- Name: tb_produto uk_produto_nucodbarra; Type: CONSTRAINT; Schema: loja; Owner: -
--

ALTER TABLE ONLY loja.tb_produto
    ADD CONSTRAINT uk_produto_nucodbarra UNIQUE (nu_codigo_barra);


--
-- TOC entry 2825 (class 2606 OID 16504)
-- Name: tb_usuario uk_usuario_dtcadastro; Type: CONSTRAINT; Schema: loja; Owner: -
--

ALTER TABLE ONLY loja.tb_usuario
    ADD CONSTRAINT uk_usuario_dtcadastro UNIQUE (dt_cadastro);


--
-- TOC entry 2827 (class 2606 OID 16506)
-- Name: tb_usuario uk_usuario_email; Type: CONSTRAINT; Schema: loja; Owner: -
--

ALTER TABLE ONLY loja.tb_usuario
    ADD CONSTRAINT uk_usuario_email UNIQUE (nm_email);


--
-- TOC entry 2807 (class 1259 OID 16602)
-- Name: ix_perfilfuncionalidade_unico; Type: INDEX; Schema: loja; Owner: -
--

CREATE UNIQUE INDEX ix_perfilfuncionalidade_unico ON loja.ta_perfil_funcionalidade USING btree (id_perfil, id_funcionalidade);


--
-- TOC entry 2860 (class 2606 OID 16507)
-- Name: tp_sub_categoria fk_categoria_subcategoria; Type: FK CONSTRAINT; Schema: loja; Owner: -
--

ALTER TABLE ONLY loja.tp_sub_categoria
    ADD CONSTRAINT fk_categoria_subcategoria FOREIGN KEY (id_categoria) REFERENCES loja.tp_categoria(id_categoria);


--
-- TOC entry 2856 (class 2606 OID 16512)
-- Name: tb_venda fk_formapagamento_venda; Type: FK CONSTRAINT; Schema: loja; Owner: -
--

ALTER TABLE ONLY loja.tb_venda
    ADD CONSTRAINT fk_formapagamento_venda FOREIGN KEY (id_forma_pagamento) REFERENCES loja.tp_forma_pagamento(id_forma_pagamento);


--
-- TOC entry 2848 (class 2606 OID 16517)
-- Name: ta_perfil_funcionalidade fk_funcionalidade_perfil_funcionalidade; Type: FK CONSTRAINT; Schema: loja; Owner: -
--

ALTER TABLE ONLY loja.ta_perfil_funcionalidade
    ADD CONSTRAINT fk_funcionalidade_perfil_funcionalidade FOREIGN KEY (id_funcionalidade) REFERENCES loja.tb_funcionalidade(id_funcionalidade);


--
-- TOC entry 2861 (class 2606 OID 16522)
-- Name: tp_sub_categoria fk_genero_subcategoria; Type: FK CONSTRAINT; Schema: loja; Owner: -
--

ALTER TABLE ONLY loja.tp_sub_categoria
    ADD CONSTRAINT fk_genero_subcategoria FOREIGN KEY (id_genero) REFERENCES loja.tp_genero(id_genero);


--
-- TOC entry 2852 (class 2606 OID 16527)
-- Name: tb_funcionalidade fk_modulo_perfil_modulo; Type: FK CONSTRAINT; Schema: loja; Owner: -
--

ALTER TABLE ONLY loja.tb_funcionalidade
    ADD CONSTRAINT fk_modulo_perfil_modulo FOREIGN KEY (id_funcionalidade) REFERENCES loja.tb_funcionalidade(id_funcionalidade);


--
-- TOC entry 2849 (class 2606 OID 16532)
-- Name: ta_perfil_funcionalidade fk_perfil_perfil_funcionalidade; Type: FK CONSTRAINT; Schema: loja; Owner: -
--

ALTER TABLE ONLY loja.ta_perfil_funcionalidade
    ADD CONSTRAINT fk_perfil_perfil_funcionalidade FOREIGN KEY (id_perfil) REFERENCES loja.tb_perfil(id_perfil);


--
-- TOC entry 2854 (class 2606 OID 16537)
-- Name: tb_usuario fk_perfil_usuario; Type: FK CONSTRAINT; Schema: loja; Owner: -
--

ALTER TABLE ONLY loja.tb_usuario
    ADD CONSTRAINT fk_perfil_usuario FOREIGN KEY (id_perfil) REFERENCES loja.tb_perfil(id_perfil);


--
-- TOC entry 2844 (class 2606 OID 16542)
-- Name: ta_item_venda fk_produto_itemvenda; Type: FK CONSTRAINT; Schema: loja; Owner: -
--

ALTER TABLE ONLY loja.ta_item_venda
    ADD CONSTRAINT fk_produto_itemvenda FOREIGN KEY (id_produto) REFERENCES loja.tb_produto(id_produto);


--
-- TOC entry 2850 (class 2606 OID 16547)
-- Name: tb_compra fk_statuscompra_compra; Type: FK CONSTRAINT; Schema: loja; Owner: -
--

ALTER TABLE ONLY loja.tb_compra
    ADD CONSTRAINT fk_statuscompra_compra FOREIGN KEY (id_tipo_compra) REFERENCES loja.tp_compra(id_tipo_compra);


--
-- TOC entry 2845 (class 2606 OID 16552)
-- Name: ta_item_venda fk_statusitemvenda_itemvenda; Type: FK CONSTRAINT; Schema: loja; Owner: -
--

ALTER TABLE ONLY loja.ta_item_venda
    ADD CONSTRAINT fk_statusitemvenda_itemvenda FOREIGN KEY (id_tipo_item_venda) REFERENCES loja.tp_item_venda(id_tipo_item_venda);


--
-- TOC entry 2857 (class 2606 OID 16557)
-- Name: tb_venda fk_statusvenda_venda; Type: FK CONSTRAINT; Schema: loja; Owner: -
--

ALTER TABLE ONLY loja.tb_venda
    ADD CONSTRAINT fk_statusvenda_venda FOREIGN KEY (id_tipo_venda) REFERENCES loja.tp_venda(id_tipo_venda);


--
-- TOC entry 2853 (class 2606 OID 16562)
-- Name: tb_produto fk_subcategoria_produto; Type: FK CONSTRAINT; Schema: loja; Owner: -
--

ALTER TABLE ONLY loja.tb_produto
    ADD CONSTRAINT fk_subcategoria_produto FOREIGN KEY (id_sub_categoria) REFERENCES loja.tp_sub_categoria(id_sub_categoria);


--
-- TOC entry 2851 (class 2606 OID 16567)
-- Name: tb_compra fk_usuario_compra; Type: FK CONSTRAINT; Schema: loja; Owner: -
--

ALTER TABLE ONLY loja.tb_compra
    ADD CONSTRAINT fk_usuario_compra FOREIGN KEY (id_usuario) REFERENCES loja.tb_usuario(id_usuario);


--
-- TOC entry 2846 (class 2606 OID 16572)
-- Name: ta_item_venda fk_usuario_itemvenda; Type: FK CONSTRAINT; Schema: loja; Owner: -
--

ALTER TABLE ONLY loja.ta_item_venda
    ADD CONSTRAINT fk_usuario_itemvenda FOREIGN KEY (id_usuario_cancelamento) REFERENCES loja.tb_usuario(id_usuario);


--
-- TOC entry 2855 (class 2606 OID 16577)
-- Name: tb_usuario fk_usuario_usuario; Type: FK CONSTRAINT; Schema: loja; Owner: -
--

ALTER TABLE ONLY loja.tb_usuario
    ADD CONSTRAINT fk_usuario_usuario FOREIGN KEY (id_usuario_cadastro) REFERENCES loja.tb_usuario(id_usuario);


--
-- TOC entry 2858 (class 2606 OID 16582)
-- Name: tb_venda fk_usuario_venda; Type: FK CONSTRAINT; Schema: loja; Owner: -
--

ALTER TABLE ONLY loja.tb_venda
    ADD CONSTRAINT fk_usuario_venda FOREIGN KEY (id_usuario) REFERENCES loja.tb_usuario(id_usuario);


--
-- TOC entry 2859 (class 2606 OID 16587)
-- Name: tb_venda fk_usuariovenda; Type: FK CONSTRAINT; Schema: loja; Owner: -
--

ALTER TABLE ONLY loja.tb_venda
    ADD CONSTRAINT fk_usuariovenda FOREIGN KEY (id_usuario_cliente) REFERENCES loja.tb_usuario(id_usuario);


--
-- TOC entry 2847 (class 2606 OID 16592)
-- Name: ta_item_venda fk_venda_itemvenda; Type: FK CONSTRAINT; Schema: loja; Owner: -
--

ALTER TABLE ONLY loja.ta_item_venda
    ADD CONSTRAINT fk_venda_itemvenda FOREIGN KEY (id_venda) REFERENCES loja.tb_venda(id_venda);


-- Completed on 2018-08-28 23:09:32 -03

--
-- PostgreSQL database dump complete
--

