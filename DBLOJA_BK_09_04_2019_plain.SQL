--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5 (Debian 10.5-1.pgdg90+1)
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

-- Started on 2019-04-09 23:28:39 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

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
-- TOC entry 2913 (class 0 OID 16414)
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
11	Consulta de produtos
7	Alterar usuário
12	Ativar inativar produto
13	Alterar produto
9	Gerenciar Perfil
10	Ativar inativar perfil
14	Editar permissões de usuários
\.


--
-- TOC entry 2790 (class 2606 OID 16468)
-- Name: tb_funcionalidade pk_modulo; Type: CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_funcionalidade
    ADD CONSTRAINT pk_modulo PRIMARY KEY (id_funcionalidade);


--
-- TOC entry 2791 (class 2606 OID 16527)
-- Name: tb_funcionalidade fk_modulo_perfil_modulo; Type: FK CONSTRAINT; Schema: loja; Owner: usrloja
--

ALTER TABLE ONLY loja.tb_funcionalidade
    ADD CONSTRAINT fk_modulo_perfil_modulo FOREIGN KEY (id_funcionalidade) REFERENCES loja.tb_funcionalidade(id_funcionalidade);


-- Completed on 2019-04-09 23:28:39 -03

--
-- PostgreSQL database dump complete
--

