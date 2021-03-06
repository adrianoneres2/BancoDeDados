PGDMP                         x            dbloja    10.5 (Debian 10.5-1.pgdg90+1) %   10.12 (Ubuntu 10.12-0ubuntu0.18.04.1) k    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    16386    dbloja    DATABASE     v   CREATE DATABASE dbloja WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';
    DROP DATABASE dbloja;
             usrloja    false                        2615    16387    loja    SCHEMA        CREATE SCHEMA loja;
    DROP SCHEMA loja;
             usrloja    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12980    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16716 
   sq_idcaixa    SEQUENCE     q   CREATE SEQUENCE loja.sq_idcaixa
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE loja.sq_idcaixa;
       loja       usrloja    false    4            �            1259    16599    sq_idproduto    SEQUENCE     s   CREATE SEQUENCE loja.sq_idproduto
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE loja.sq_idproduto;
       loja       usrloja    false    4            �            1259    16388    sq_idusuario    SEQUENCE     s   CREATE SEQUENCE loja.sq_idusuario
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE loja.sq_idusuario;
       loja       usrloja    false    4            �            1259    16749 
   sq_idvenda    SEQUENCE     q   CREATE SEQUENCE loja.sq_idvenda
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE loja.sq_idvenda;
       loja       usrloja    false    4            �            1259    16396    ta_item_venda    TABLE     Q  CREATE TABLE loja.ta_item_venda (
    id_item_venda numeric(8,0) NOT NULL,
    id_produto numeric(4,0) NOT NULL,
    id_venda numeric(5,0) NOT NULL,
    qt_item numeric(12,4) NOT NULL,
    vl_item numeric(12,4) NOT NULL,
    vl_desconto numeric(12,4) NOT NULL,
    id_usuario_autorizacao numeric(4,0),
    id_autorizacao numeric(2,0)
);
    DROP TABLE loja.ta_item_venda;
       loja         usrloja    false    4            �            1259    16399    ta_perfil_funcionalidade    TABLE     �   CREATE TABLE loja.ta_perfil_funcionalidade (
    id_perfil_funcionalidade numeric(3,0) NOT NULL,
    id_perfil numeric(3,0) NOT NULL,
    id_funcionalidade numeric(2,0) NOT NULL
);
 *   DROP TABLE loja.ta_perfil_funcionalidade;
       loja         usrloja    false    4            �            1259    16642    tb_caixa    TABLE     /  CREATE TABLE loja.tb_caixa (
    id_caixa numeric(15,0) NOT NULL,
    id_usuario_operador numeric(4,0) NOT NULL,
    dt_abertura timestamp without time zone NOT NULL,
    id_usuario_abertura numeric(4,0) NOT NULL,
    dt_fechamento timestamp without time zone,
    id_usuario_fechamento numeric(4,0)
);
    DROP TABLE loja.tb_caixa;
       loja         usrloja    false    4            �            1259    16402    tb_cep    TABLE     :   CREATE TABLE loja.tb_cep (
    id_cep numeric NOT NULL
);
    DROP TABLE loja.tb_cep;
       loja         usrloja    false    4            �            1259    16408 	   tb_compra    TABLE     @  CREATE TABLE loja.tb_compra (
    id_compra numeric(5,0) NOT NULL,
    id_tipo_compra numeric NOT NULL,
    id_usuario numeric(4,0) NOT NULL,
    nr_nota_fiscal numeric(10,0),
    vl_total numeric(5,2) NOT NULL,
    dt_compra timestamp without time zone NOT NULL,
    dt_compra_finalizada timestamp without time zone
);
    DROP TABLE loja.tb_compra;
       loja         usrloja    false    4            �            1259    16414    tb_funcionalidade    TABLE     �   CREATE TABLE loja.tb_funcionalidade (
    id_funcionalidade numeric(2,0) NOT NULL,
    nm_funcionalidade character varying(50) NOT NULL
);
 #   DROP TABLE loja.tb_funcionalidade;
       loja         usrloja    false    4            �            1259    16679    tb_parcelamento    TABLE     �  CREATE TABLE loja.tb_parcelamento (
    id_venda numeric(5,0) NOT NULL,
    nu_parcela numeric(2,0) NOT NULL,
    vl_parcela numeric(12,2) NOT NULL,
    CONSTRAINT ck_parcelamento_parcela CHECK ((nu_parcela = ANY (ARRAY[(1)::numeric, (2)::numeric, (3)::numeric, (4)::numeric, (5)::numeric, (6)::numeric, (7)::numeric, (8)::numeric, (9)::numeric, (10)::numeric, (11)::numeric, (12)::numeric, (13)::numeric, (14)::numeric, (15)::numeric, (16)::numeric, (17)::numeric, (18)::numeric, (19)::numeric, (20)::numeric, (21)::numeric, (22)::numeric, (23)::numeric, (24)::numeric, (25)::numeric, (26)::numeric, (27)::numeric, (28)::numeric, (29)::numeric, (30)::numeric, (31)::numeric, (32)::numeric, (33)::numeric, (34)::numeric, (35)::numeric])))
);
 !   DROP TABLE loja.tb_parcelamento;
       loja         usrloja    false    4            �            1259    16417 	   tb_perfil    TABLE       CREATE TABLE loja.tb_perfil (
    id_perfil numeric(3,0) NOT NULL,
    nm_perfil character varying(100) NOT NULL,
    st_perfil numeric(1,0) DEFAULT 1 NOT NULL,
    CONSTRAINT ck_perfil_stperfil CHECK ((st_perfil = ANY (ARRAY[(1)::numeric, (0)::numeric])))
);
    DROP TABLE loja.tb_perfil;
       loja         usrloja    false    4            �            1259    16420 
   tb_produto    TABLE     �  CREATE TABLE loja.tb_produto (
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
    DROP TABLE loja.tb_produto;
       loja         usrloja    false    4            �            1259    16427 
   tb_usuario    TABLE     �  CREATE TABLE loja.tb_usuario (
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
    DROP TABLE loja.tb_usuario;
       loja         usrloja    false    4            �            1259    16434    tb_venda    TABLE     �  CREATE TABLE loja.tb_venda (
    id_venda numeric(5,0) NOT NULL,
    id_forma_pagamento numeric(2,0),
    dt_venda timestamp without time zone,
    dt_venda_finalizada timestamp without time zone,
    id_usuario_cliente numeric(4,0) NOT NULL,
    id_caixa numeric(15,0),
    id_situacao_venda numeric(1,0) NOT NULL,
    id_venda_orcamento numeric(15,0),
    id_tipo_venda numeric(1,0) NOT NULL,
    CONSTRAINT ck_venda_data_final_forma_pag CHECK ((((dt_venda_finalizada IS NULL) AND (id_forma_pagamento IS NULL)) OR ((dt_venda_finalizada IS NOT NULL) AND (id_forma_pagamento IS NOT NULL)))),
    CONSTRAINT ck_venda_data_venda_id_caixa CHECK ((((dt_venda IS NULL) AND (id_caixa IS NULL)) OR ((dt_venda IS NOT NULL) AND (id_caixa IS NOT NULL))))
);
    DROP TABLE loja.tb_venda;
       loja         usrloja    false    4            �            1259    16739    tp_autorizacao    TABLE     �   CREATE TABLE loja.tp_autorizacao (
    id_autorizacao numeric(2,0) NOT NULL,
    nm_autorizacao character varying(100) NOT NULL
);
     DROP TABLE loja.tp_autorizacao;
       loja         usrloja    false    4            �            1259    16443    tp_categoria    TABLE     |   CREATE TABLE loja.tp_categoria (
    id_categoria numeric(2,0) NOT NULL,
    nm_categoria character varying(50) NOT NULL
);
    DROP TABLE loja.tp_categoria;
       loja         usrloja    false    4            �            1259    16452 	   tp_compra    TABLE     t   CREATE TABLE loja.tp_compra (
    id_tipo_compra numeric NOT NULL,
    nm_tipo_compra character varying NOT NULL
);
    DROP TABLE loja.tp_compra;
       loja         usrloja    false    4            �            1259    16446    tp_forma_pagamento    TABLE     �   CREATE TABLE loja.tp_forma_pagamento (
    id_forma_pagamento numeric(2,0) NOT NULL,
    nm_forma_pagamento character varying(20)
);
 $   DROP TABLE loja.tp_forma_pagamento;
       loja         usrloja    false    4            �            1259    16449 	   tp_genero    TABLE     s   CREATE TABLE loja.tp_genero (
    id_genero numeric(1,0) NOT NULL,
    nm_genero character varying(50) NOT NULL
);
    DROP TABLE loja.tp_genero;
       loja         usrloja    false    4            �            1259    16664    tp_situacao_venda    TABLE     �   CREATE TABLE loja.tp_situacao_venda (
    id_situacao_venda numeric(1,0) NOT NULL,
    nm_situacao_venda character varying(10) NOT NULL
);
 #   DROP TABLE loja.tp_situacao_venda;
       loja         usrloja    false    4            �            1259    16464    tp_sub_categoria    TABLE     �   CREATE TABLE loja.tp_sub_categoria (
    id_sub_categoria numeric(3,0) NOT NULL,
    id_categoria numeric(2,0) NOT NULL,
    nm_sub_categoria character varying(50) NOT NULL,
    id_genero numeric(1,0)
);
 "   DROP TABLE loja.tp_sub_categoria;
       loja         usrloja    false    4            �            1259    16724    tp_tipo_venda    TABLE        CREATE TABLE loja.tp_tipo_venda (
    id_tipo_venda numeric(1,0) NOT NULL,
    nm_tipo_venda character varying(20) NOT NULL
);
    DROP TABLE loja.tp_tipo_venda;
       loja         usrloja    false    4            �            1259    16714 
   sq_idcaixa    SEQUENCE     s   CREATE SEQUENCE public.sq_idcaixa
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.sq_idcaixa;
       public       usrloja    false    3            �            1259    16597    sq_idproduto    SEQUENCE     u   CREATE SEQUENCE public.sq_idproduto
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.sq_idproduto;
       public       usrloja    false    3            �          0    16396    ta_item_venda 
   TABLE DATA               �   COPY loja.ta_item_venda (id_item_venda, id_produto, id_venda, qt_item, vl_item, vl_desconto, id_usuario_autorizacao, id_autorizacao) FROM stdin;
    loja       usrloja    false    198   [�       �          0    16399    ta_perfil_funcionalidade 
   TABLE DATA               h   COPY loja.ta_perfil_funcionalidade (id_perfil_funcionalidade, id_perfil, id_funcionalidade) FROM stdin;
    loja       usrloja    false    199   x�       �          0    16642    tb_caixa 
   TABLE DATA               �   COPY loja.tb_caixa (id_caixa, id_usuario_operador, dt_abertura, id_usuario_abertura, dt_fechamento, id_usuario_fechamento) FROM stdin;
    loja       usrloja    false    214   ԇ       �          0    16402    tb_cep 
   TABLE DATA               &   COPY loja.tb_cep (id_cep) FROM stdin;
    loja       usrloja    false    200   G�       �          0    16408 	   tb_compra 
   TABLE DATA               �   COPY loja.tb_compra (id_compra, id_tipo_compra, id_usuario, nr_nota_fiscal, vl_total, dt_compra, dt_compra_finalizada) FROM stdin;
    loja       usrloja    false    201   d�       �          0    16414    tb_funcionalidade 
   TABLE DATA               O   COPY loja.tb_funcionalidade (id_funcionalidade, nm_funcionalidade) FROM stdin;
    loja       usrloja    false    202   ��       �          0    16679    tb_parcelamento 
   TABLE DATA               I   COPY loja.tb_parcelamento (id_venda, nu_parcela, vl_parcela) FROM stdin;
    loja       usrloja    false    216   I�       �          0    16417 	   tb_perfil 
   TABLE DATA               B   COPY loja.tb_perfil (id_perfil, nm_perfil, st_perfil) FROM stdin;
    loja       usrloja    false    203   f�       �          0    16420 
   tb_produto 
   TABLE DATA               �   COPY loja.tb_produto (id_produto, qt_produto, id_sub_categoria, nm_produto, vl_venda, nu_codigo_barra, im_produto, dt_produto, st_produto) FROM stdin;
    loja       usrloja    false    204   ��       �          0    16427 
   tb_usuario 
   TABLE DATA               �   COPY loja.tb_usuario (id_usuario, nm_usuario, nm_senha, dt_cadastro, nm_email, id_usuario_cadastro, id_perfil, st_usuario) FROM stdin;
    loja       usrloja    false    205   �       �          0    16434    tb_venda 
   TABLE DATA               �   COPY loja.tb_venda (id_venda, id_forma_pagamento, dt_venda, dt_venda_finalizada, id_usuario_cliente, id_caixa, id_situacao_venda, id_venda_orcamento, id_tipo_venda) FROM stdin;
    loja       usrloja    false    206   d�       �          0    16739    tp_autorizacao 
   TABLE DATA               F   COPY loja.tp_autorizacao (id_autorizacao, nm_autorizacao) FROM stdin;
    loja       usrloja    false    220   ��       �          0    16443    tp_categoria 
   TABLE DATA               @   COPY loja.tp_categoria (id_categoria, nm_categoria) FROM stdin;
    loja       usrloja    false    207   ��       �          0    16452 	   tp_compra 
   TABLE DATA               A   COPY loja.tp_compra (id_tipo_compra, nm_tipo_compra) FROM stdin;
    loja       usrloja    false    210   �       �          0    16446    tp_forma_pagamento 
   TABLE DATA               R   COPY loja.tp_forma_pagamento (id_forma_pagamento, nm_forma_pagamento) FROM stdin;
    loja       usrloja    false    208   -�       �          0    16449 	   tp_genero 
   TABLE DATA               7   COPY loja.tp_genero (id_genero, nm_genero) FROM stdin;
    loja       usrloja    false    209   h�       �          0    16664    tp_situacao_venda 
   TABLE DATA               O   COPY loja.tp_situacao_venda (id_situacao_venda, nm_situacao_venda) FROM stdin;
    loja       usrloja    false    215   ��       �          0    16464    tp_sub_categoria 
   TABLE DATA               e   COPY loja.tp_sub_categoria (id_sub_categoria, id_categoria, nm_sub_categoria, id_genero) FROM stdin;
    loja       usrloja    false    211   �       �          0    16724    tp_tipo_venda 
   TABLE DATA               C   COPY loja.tp_tipo_venda (id_tipo_venda, nm_tipo_venda) FROM stdin;
    loja       usrloja    false    219   :�       �           0    0 
   sq_idcaixa    SEQUENCE SET     7   SELECT pg_catalog.setval('loja.sq_idcaixa', 34, true);
            loja       usrloja    false    218            �           0    0    sq_idproduto    SEQUENCE SET     9   SELECT pg_catalog.setval('loja.sq_idproduto', 78, true);
            loja       usrloja    false    213            �           0    0    sq_idusuario    SEQUENCE SET     :   SELECT pg_catalog.setval('loja.sq_idusuario', 132, true);
            loja       usrloja    false    197            �           0    0 
   sq_idvenda    SEQUENCE SET     7   SELECT pg_catalog.setval('loja.sq_idvenda', 1, false);
            loja       usrloja    false    221            �           0    0 
   sq_idcaixa    SEQUENCE SET     9   SELECT pg_catalog.setval('public.sq_idcaixa', 1, false);
            public       usrloja    false    217            �           0    0    sq_idproduto    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.sq_idproduto', 1, false);
            public       usrloja    false    212            -           2606    16646    tb_caixa pk_caixa 
   CONSTRAINT     S   ALTER TABLE ONLY loja.tb_caixa
    ADD CONSTRAINT pk_caixa PRIMARY KEY (id_caixa);
 9   ALTER TABLE ONLY loja.tb_caixa DROP CONSTRAINT pk_caixa;
       loja         usrloja    false    214                       2606    16468    tb_funcionalidade pk_modulo 
   CONSTRAINT     f   ALTER TABLE ONLY loja.tb_funcionalidade
    ADD CONSTRAINT pk_modulo PRIMARY KEY (id_funcionalidade);
 C   ALTER TABLE ONLY loja.tb_funcionalidade DROP CONSTRAINT pk_modulo;
       loja         usrloja    false    202                       2606    16470 )   ta_perfil_funcionalidade pk_modulo_perfil 
   CONSTRAINT     {   ALTER TABLE ONLY loja.ta_perfil_funcionalidade
    ADD CONSTRAINT pk_modulo_perfil PRIMARY KEY (id_perfil_funcionalidade);
 Q   ALTER TABLE ONLY loja.ta_perfil_funcionalidade DROP CONSTRAINT pk_modulo_perfil;
       loja         usrloja    false    199                       2606    16472    tb_cep pk_tbcep 
   CONSTRAINT     O   ALTER TABLE ONLY loja.tb_cep
    ADD CONSTRAINT pk_tbcep PRIMARY KEY (id_cep);
 7   ALTER TABLE ONLY loja.tb_cep DROP CONSTRAINT pk_tbcep;
       loja         usrloja    false    200                       2606    16474    tb_compra pk_tbcompra 
   CONSTRAINT     X   ALTER TABLE ONLY loja.tb_compra
    ADD CONSTRAINT pk_tbcompra PRIMARY KEY (id_compra);
 =   ALTER TABLE ONLY loja.tb_compra DROP CONSTRAINT pk_tbcompra;
       loja         usrloja    false    201                       2606    16476    ta_item_venda pk_tbitemvenda 
   CONSTRAINT     c   ALTER TABLE ONLY loja.ta_item_venda
    ADD CONSTRAINT pk_tbitemvenda PRIMARY KEY (id_item_venda);
 D   ALTER TABLE ONLY loja.ta_item_venda DROP CONSTRAINT pk_tbitemvenda;
       loja         usrloja    false    198                       2606    16478    tb_perfil pk_tbperfil 
   CONSTRAINT     X   ALTER TABLE ONLY loja.tb_perfil
    ADD CONSTRAINT pk_tbperfil PRIMARY KEY (id_perfil);
 =   ALTER TABLE ONLY loja.tb_perfil DROP CONSTRAINT pk_tbperfil;
       loja         usrloja    false    203                       2606    16480    tb_produto pk_tbproduto 
   CONSTRAINT     [   ALTER TABLE ONLY loja.tb_produto
    ADD CONSTRAINT pk_tbproduto PRIMARY KEY (id_produto);
 ?   ALTER TABLE ONLY loja.tb_produto DROP CONSTRAINT pk_tbproduto;
       loja         usrloja    false    204                       2606    16484    tb_usuario pk_tbusuario 
   CONSTRAINT     [   ALTER TABLE ONLY loja.tb_usuario
    ADD CONSTRAINT pk_tbusuario PRIMARY KEY (id_usuario);
 ?   ALTER TABLE ONLY loja.tb_usuario DROP CONSTRAINT pk_tbusuario;
       loja         usrloja    false    205            !           2606    16486    tb_venda pk_tbvenda 
   CONSTRAINT     U   ALTER TABLE ONLY loja.tb_venda
    ADD CONSTRAINT pk_tbvenda PRIMARY KEY (id_venda);
 ;   ALTER TABLE ONLY loja.tb_venda DROP CONSTRAINT pk_tbvenda;
       loja         usrloja    false    206            2           2606    16728    tp_tipo_venda pk_tipo_venda 
   CONSTRAINT     b   ALTER TABLE ONLY loja.tp_tipo_venda
    ADD CONSTRAINT pk_tipo_venda PRIMARY KEY (id_tipo_venda);
 C   ALTER TABLE ONLY loja.tp_tipo_venda DROP CONSTRAINT pk_tipo_venda;
       loja         usrloja    false    219            #           2606    16488    tp_categoria pk_tpcategoria 
   CONSTRAINT     a   ALTER TABLE ONLY loja.tp_categoria
    ADD CONSTRAINT pk_tpcategoria PRIMARY KEY (id_categoria);
 C   ALTER TABLE ONLY loja.tp_categoria DROP CONSTRAINT pk_tpcategoria;
       loja         usrloja    false    207            %           2606    16490 &   tp_forma_pagamento pk_tpformapagamento 
   CONSTRAINT     r   ALTER TABLE ONLY loja.tp_forma_pagamento
    ADD CONSTRAINT pk_tpformapagamento PRIMARY KEY (id_forma_pagamento);
 N   ALTER TABLE ONLY loja.tp_forma_pagamento DROP CONSTRAINT pk_tpformapagamento;
       loja         usrloja    false    208            '           2606    16492    tp_genero pk_tpgenero 
   CONSTRAINT     X   ALTER TABLE ONLY loja.tp_genero
    ADD CONSTRAINT pk_tpgenero PRIMARY KEY (id_genero);
 =   ALTER TABLE ONLY loja.tp_genero DROP CONSTRAINT pk_tpgenero;
       loja         usrloja    false    209            /           2606    16668 $   tp_situacao_venda pk_tpsituacaovenda 
   CONSTRAINT     o   ALTER TABLE ONLY loja.tp_situacao_venda
    ADD CONSTRAINT pk_tpsituacaovenda PRIMARY KEY (id_situacao_venda);
 L   ALTER TABLE ONLY loja.tp_situacao_venda DROP CONSTRAINT pk_tpsituacaovenda;
       loja         usrloja    false    215            )           2606    16494    tp_compra pk_tpstatuscompra 
   CONSTRAINT     c   ALTER TABLE ONLY loja.tp_compra
    ADD CONSTRAINT pk_tpstatuscompra PRIMARY KEY (id_tipo_compra);
 C   ALTER TABLE ONLY loja.tp_compra DROP CONSTRAINT pk_tpstatuscompra;
       loja         usrloja    false    210            +           2606    16498 "   tp_sub_categoria pk_tpsubcategoria 
   CONSTRAINT     l   ALTER TABLE ONLY loja.tp_sub_categoria
    ADD CONSTRAINT pk_tpsubcategoria PRIMARY KEY (id_sub_categoria);
 J   ALTER TABLE ONLY loja.tp_sub_categoria DROP CONSTRAINT pk_tpsubcategoria;
       loja         usrloja    false    211            4           2606    16743 "   tp_autorizacao tp_autorizacao_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY loja.tp_autorizacao
    ADD CONSTRAINT tp_autorizacao_pkey PRIMARY KEY (id_autorizacao);
 J   ALTER TABLE ONLY loja.tp_autorizacao DROP CONSTRAINT tp_autorizacao_pkey;
       loja         usrloja    false    220                       2606    16604 "   tb_produto uk_produto_codigo_barra 
   CONSTRAINT     f   ALTER TABLE ONLY loja.tb_produto
    ADD CONSTRAINT uk_produto_codigo_barra UNIQUE (nu_codigo_barra);
 J   ALTER TABLE ONLY loja.tb_produto DROP CONSTRAINT uk_produto_codigo_barra;
       loja         usrloja    false    204                       2606    16502     tb_produto uk_produto_nucodbarra 
   CONSTRAINT     d   ALTER TABLE ONLY loja.tb_produto
    ADD CONSTRAINT uk_produto_nucodbarra UNIQUE (nu_codigo_barra);
 H   ALTER TABLE ONLY loja.tb_produto DROP CONSTRAINT uk_produto_nucodbarra;
       loja         usrloja    false    204                       2606    16504     tb_usuario uk_usuario_dtcadastro 
   CONSTRAINT     `   ALTER TABLE ONLY loja.tb_usuario
    ADD CONSTRAINT uk_usuario_dtcadastro UNIQUE (dt_cadastro);
 H   ALTER TABLE ONLY loja.tb_usuario DROP CONSTRAINT uk_usuario_dtcadastro;
       loja         usrloja    false    205                       2606    16506    tb_usuario uk_usuario_email 
   CONSTRAINT     X   ALTER TABLE ONLY loja.tb_usuario
    ADD CONSTRAINT uk_usuario_email UNIQUE (nm_email);
 C   ALTER TABLE ONLY loja.tb_usuario DROP CONSTRAINT uk_usuario_email;
       loja         usrloja    false    205            0           1259    16687    ix_parcelamento    INDEX     `   CREATE UNIQUE INDEX ix_parcelamento ON loja.tb_parcelamento USING btree (id_venda, nu_parcela);
 !   DROP INDEX loja.ix_parcelamento;
       loja         usrloja    false    216    216            	           1259    16602    ix_perfilfuncionalidade_unico    INDEX        CREATE UNIQUE INDEX ix_perfilfuncionalidade_unico ON loja.ta_perfil_funcionalidade USING btree (id_perfil, id_funcionalidade);
 /   DROP INDEX loja.ix_perfilfuncionalidade_unico;
       loja         usrloja    false    199    199            J           2606    16652 "   tb_caixa fk_caixa_usuario_abertura    FK CONSTRAINT     �   ALTER TABLE ONLY loja.tb_caixa
    ADD CONSTRAINT fk_caixa_usuario_abertura FOREIGN KEY (id_usuario_abertura) REFERENCES loja.tb_usuario(id_usuario);
 J   ALTER TABLE ONLY loja.tb_caixa DROP CONSTRAINT fk_caixa_usuario_abertura;
       loja       usrloja    false    214    2843    205            K           2606    16657 $   tb_caixa fk_caixa_usuario_fechamento    FK CONSTRAINT     �   ALTER TABLE ONLY loja.tb_caixa
    ADD CONSTRAINT fk_caixa_usuario_fechamento FOREIGN KEY (id_usuario_fechamento) REFERENCES loja.tb_usuario(id_usuario);
 L   ALTER TABLE ONLY loja.tb_caixa DROP CONSTRAINT fk_caixa_usuario_fechamento;
       loja       usrloja    false    214    2843    205            I           2606    16647 "   tb_caixa fk_caixa_usuario_operador    FK CONSTRAINT     �   ALTER TABLE ONLY loja.tb_caixa
    ADD CONSTRAINT fk_caixa_usuario_operador FOREIGN KEY (id_usuario_operador) REFERENCES loja.tb_usuario(id_usuario);
 J   ALTER TABLE ONLY loja.tb_caixa DROP CONSTRAINT fk_caixa_usuario_operador;
       loja       usrloja    false    214    2843    205            D           2606    16674    tb_venda fk_caixa_venda    FK CONSTRAINT     |   ALTER TABLE ONLY loja.tb_venda
    ADD CONSTRAINT fk_caixa_venda FOREIGN KEY (id_caixa) REFERENCES loja.tb_caixa(id_caixa);
 ?   ALTER TABLE ONLY loja.tb_venda DROP CONSTRAINT fk_caixa_venda;
       loja       usrloja    false    2861    214    206            G           2606    16507 *   tp_sub_categoria fk_categoria_subcategoria    FK CONSTRAINT     �   ALTER TABLE ONLY loja.tp_sub_categoria
    ADD CONSTRAINT fk_categoria_subcategoria FOREIGN KEY (id_categoria) REFERENCES loja.tp_categoria(id_categoria);
 R   ALTER TABLE ONLY loja.tp_sub_categoria DROP CONSTRAINT fk_categoria_subcategoria;
       loja       usrloja    false    2851    211    207            A           2606    16512     tb_venda fk_formapagamento_venda    FK CONSTRAINT     �   ALTER TABLE ONLY loja.tb_venda
    ADD CONSTRAINT fk_formapagamento_venda FOREIGN KEY (id_forma_pagamento) REFERENCES loja.tp_forma_pagamento(id_forma_pagamento);
 H   ALTER TABLE ONLY loja.tb_venda DROP CONSTRAINT fk_formapagamento_venda;
       loja       usrloja    false    208    206    2853            9           2606    16517 @   ta_perfil_funcionalidade fk_funcionalidade_perfil_funcionalidade    FK CONSTRAINT     �   ALTER TABLE ONLY loja.ta_perfil_funcionalidade
    ADD CONSTRAINT fk_funcionalidade_perfil_funcionalidade FOREIGN KEY (id_funcionalidade) REFERENCES loja.tb_funcionalidade(id_funcionalidade);
 h   ALTER TABLE ONLY loja.ta_perfil_funcionalidade DROP CONSTRAINT fk_funcionalidade_perfil_funcionalidade;
       loja       usrloja    false    202    199    2833            H           2606    16522 '   tp_sub_categoria fk_genero_subcategoria    FK CONSTRAINT     �   ALTER TABLE ONLY loja.tp_sub_categoria
    ADD CONSTRAINT fk_genero_subcategoria FOREIGN KEY (id_genero) REFERENCES loja.tp_genero(id_genero);
 O   ALTER TABLE ONLY loja.tp_sub_categoria DROP CONSTRAINT fk_genero_subcategoria;
       loja       usrloja    false    209    2855    211            =           2606    16527 )   tb_funcionalidade fk_modulo_perfil_modulo    FK CONSTRAINT     �   ALTER TABLE ONLY loja.tb_funcionalidade
    ADD CONSTRAINT fk_modulo_perfil_modulo FOREIGN KEY (id_funcionalidade) REFERENCES loja.tb_funcionalidade(id_funcionalidade);
 Q   ALTER TABLE ONLY loja.tb_funcionalidade DROP CONSTRAINT fk_modulo_perfil_modulo;
       loja       usrloja    false    202    202    2833            :           2606    16532 8   ta_perfil_funcionalidade fk_perfil_perfil_funcionalidade    FK CONSTRAINT     �   ALTER TABLE ONLY loja.ta_perfil_funcionalidade
    ADD CONSTRAINT fk_perfil_perfil_funcionalidade FOREIGN KEY (id_perfil) REFERENCES loja.tb_perfil(id_perfil);
 `   ALTER TABLE ONLY loja.ta_perfil_funcionalidade DROP CONSTRAINT fk_perfil_perfil_funcionalidade;
       loja       usrloja    false    2835    199    203            ?           2606    16537    tb_usuario fk_perfil_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY loja.tb_usuario
    ADD CONSTRAINT fk_perfil_usuario FOREIGN KEY (id_perfil) REFERENCES loja.tb_perfil(id_perfil);
 D   ALTER TABLE ONLY loja.tb_usuario DROP CONSTRAINT fk_perfil_usuario;
       loja       usrloja    false    203    205    2835            5           2606    16542 "   ta_item_venda fk_produto_itemvenda    FK CONSTRAINT     �   ALTER TABLE ONLY loja.ta_item_venda
    ADD CONSTRAINT fk_produto_itemvenda FOREIGN KEY (id_produto) REFERENCES loja.tb_produto(id_produto);
 J   ALTER TABLE ONLY loja.ta_item_venda DROP CONSTRAINT fk_produto_itemvenda;
       loja       usrloja    false    204    198    2837            C           2606    16669     tb_venda fk_situacao_venda_venda    FK CONSTRAINT     �   ALTER TABLE ONLY loja.tb_venda
    ADD CONSTRAINT fk_situacao_venda_venda FOREIGN KEY (id_situacao_venda) REFERENCES loja.tp_situacao_venda(id_situacao_venda);
 H   ALTER TABLE ONLY loja.tb_venda DROP CONSTRAINT fk_situacao_venda_venda;
       loja       usrloja    false    206    2863    215            ;           2606    16547     tb_compra fk_statuscompra_compra    FK CONSTRAINT     �   ALTER TABLE ONLY loja.tb_compra
    ADD CONSTRAINT fk_statuscompra_compra FOREIGN KEY (id_tipo_compra) REFERENCES loja.tp_compra(id_tipo_compra);
 H   ALTER TABLE ONLY loja.tb_compra DROP CONSTRAINT fk_statuscompra_compra;
       loja       usrloja    false    210    201    2857            >           2606    16562 "   tb_produto fk_subcategoria_produto    FK CONSTRAINT     �   ALTER TABLE ONLY loja.tb_produto
    ADD CONSTRAINT fk_subcategoria_produto FOREIGN KEY (id_sub_categoria) REFERENCES loja.tp_sub_categoria(id_sub_categoria);
 J   ALTER TABLE ONLY loja.tb_produto DROP CONSTRAINT fk_subcategoria_produto;
       loja       usrloja    false    211    204    2859            F           2606    16729    tb_venda fk_tipo_venda_venda    FK CONSTRAINT     �   ALTER TABLE ONLY loja.tb_venda
    ADD CONSTRAINT fk_tipo_venda_venda FOREIGN KEY (id_tipo_venda) REFERENCES loja.tp_tipo_venda(id_tipo_venda);
 D   ALTER TABLE ONLY loja.tb_venda DROP CONSTRAINT fk_tipo_venda_venda;
       loja       usrloja    false    206    2866    219            <           2606    16567    tb_compra fk_usuario_compra    FK CONSTRAINT     �   ALTER TABLE ONLY loja.tb_compra
    ADD CONSTRAINT fk_usuario_compra FOREIGN KEY (id_usuario) REFERENCES loja.tb_usuario(id_usuario);
 C   ALTER TABLE ONLY loja.tb_compra DROP CONSTRAINT fk_usuario_compra;
       loja       usrloja    false    205    201    2843            @           2606    16577    tb_usuario fk_usuario_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY loja.tb_usuario
    ADD CONSTRAINT fk_usuario_usuario FOREIGN KEY (id_usuario_cadastro) REFERENCES loja.tb_usuario(id_usuario);
 E   ALTER TABLE ONLY loja.tb_usuario DROP CONSTRAINT fk_usuario_usuario;
       loja       usrloja    false    2843    205    205            B           2606    16587    tb_venda fk_usuariovenda    FK CONSTRAINT     �   ALTER TABLE ONLY loja.tb_venda
    ADD CONSTRAINT fk_usuariovenda FOREIGN KEY (id_usuario_cliente) REFERENCES loja.tb_usuario(id_usuario);
 @   ALTER TABLE ONLY loja.tb_venda DROP CONSTRAINT fk_usuariovenda;
       loja       usrloja    false    2843    205    206            8           2606    16744 "   ta_item_venda fk_venda_autorizacao    FK CONSTRAINT     �   ALTER TABLE ONLY loja.ta_item_venda
    ADD CONSTRAINT fk_venda_autorizacao FOREIGN KEY (id_autorizacao) REFERENCES loja.tp_autorizacao(id_autorizacao);
 J   ALTER TABLE ONLY loja.ta_item_venda DROP CONSTRAINT fk_venda_autorizacao;
       loja       usrloja    false    220    198    2868            6           2606    16592     ta_item_venda fk_venda_itemvenda    FK CONSTRAINT     �   ALTER TABLE ONLY loja.ta_item_venda
    ADD CONSTRAINT fk_venda_itemvenda FOREIGN KEY (id_venda) REFERENCES loja.tb_venda(id_venda);
 H   ALTER TABLE ONLY loja.ta_item_venda DROP CONSTRAINT fk_venda_itemvenda;
       loja       usrloja    false    206    198    2849            L           2606    16682 %   tb_parcelamento fk_venda_parcelamento    FK CONSTRAINT     �   ALTER TABLE ONLY loja.tb_parcelamento
    ADD CONSTRAINT fk_venda_parcelamento FOREIGN KEY (id_venda) REFERENCES loja.tb_venda(id_venda);
 M   ALTER TABLE ONLY loja.tb_parcelamento DROP CONSTRAINT fk_venda_parcelamento;
       loja       usrloja    false    2849    206    216            7           2606    16734 *   ta_item_venda fk_venda_usuario_autorizacao    FK CONSTRAINT     �   ALTER TABLE ONLY loja.ta_item_venda
    ADD CONSTRAINT fk_venda_usuario_autorizacao FOREIGN KEY (id_usuario_autorizacao) REFERENCES loja.tb_usuario(id_usuario);
 R   ALTER TABLE ONLY loja.ta_item_venda DROP CONSTRAINT fk_venda_usuario_autorizacao;
       loja       usrloja    false    198    205    2843            E           2606    16719 !   tb_venda fk_venda_venda_orcamento    FK CONSTRAINT     �   ALTER TABLE ONLY loja.tb_venda
    ADD CONSTRAINT fk_venda_venda_orcamento FOREIGN KEY (id_venda_orcamento) REFERENCES loja.tb_venda(id_venda);
 I   ALTER TABLE ONLY loja.tb_venda DROP CONSTRAINT fk_venda_venda_orcamento;
       loja       usrloja    false    206    2849    206            �      x������ � �      �   L   x����0�ja�\�߻d�9"5 ���iI���LVr���������a,�b)�8*ŒmX����u��[������      �   c  x���[��0E��UdA\~��YA����t�j�J���p��"7܄1����Fmؓ��F��z�&_���8��IͼD_�y �}�ؠ)Rb[�v�b�s2�`�E���K���+v����<	��BH��(���7�J�G����l���G9D��;fX/��妼�s���έW�����ʨx��Yg�c��P�g�*+n'`>I�2w�!Ix�{����X��\�q�ɵi~f�G���?[���a�u�b<�ݩ�~Lg��$��k(�*��f�*xq+(;�~�bugM�hY�-�-3�����ۅ���~1u�˺3�sV^时�[F=
�=�>�˧!#.�i۶_4��7      �      x������ � �      �      x������ � �      �   �   x�e�A�@E��)8�qP���[W��T��&0��`����\L�d�}�}M�m�P���Y�5�d�m�I����zL#���va�Y��Z���Z�:Pl�B�I�����ghL�󻰁��Qt����hֿ��vpdeW��N�7��,��$���0�F��?��L�UE���Ehr8pu���,��w�      �      x������ � �      �   >   x�3�t��L�+I�4�2�-.=��(3�1�tL����,.)JL�/�s:'fV$Y1z\\\ ��      �   >  x��V�nA<�~���E��k|�YVN�L`��YX��-�or�r�'�c�̾� BQS�U�=h�$g�-C}��2l��3�z�9��{gA+c�f�7Lp���2�o����Y���/<gR ��Fu �� � �.�@ @(�_�Y7�Uz(��2�6�M.�u���hۃA{Z�؛�J,v���Smz�tX��	RXj��*�
B"�Y���@��%i�e�>�T'H!�ƹ�x�Ĕ}17�&H���X�����]�F���Rs��*!�����U(&@������BY�l&�aZ�Z�K����Q�Gd�,�G5���b��@��*�(#S"���$�9��<K�%6����ժ�We���64�Cށ*���6���Kw�q�y�T�ס^V�����&bB�	�����#�]�.��5?�e���k]-��v\��U]��`Z�<7L���Bs�M��3�-v]���S�?W/վls�ͦ�� }q��Y{�(Y��3�S:�.쎧?L�إ��i�cԩR�I��:m&ĩ��$H�U��� ��j�(���2=�ごX�B��{7��캌Y�-���u����n�-��IC!1e�ofT%���!�����-��튦�I*�6%�]�$���p�;b=��~|8ډQ"�ω�Z��r�A����*��_`����Y* S��^_q�+
����m ���M��~o���I%I��FO�fb��dę�`@!��☰N�n��R7,�A�-���z�Gnz�L���Dq�>߽<�HAG6s��o��
D_?N.i��ֶN}x_[�O\pow��}Aur2@��1��Qpl*�_dY��0��      �   R  x��VKn�0]3��Lp��l4-� ͢hwݰ��p�B��^�˞�됒[��M���y�	H�>�f���~��g�Y'�T������%����t�5{ɯR�\�7�痴ى�����܀�gu�YIT�،
8bD%m�e��G��0c��><�����	 �ޞ�o!@���z��wi�Tm�2��}ۤ�n@�QEc���9���lݿ:�}�5�`�����u�k �Q�(8=;"ث &j����Dw�F���Y]�WA<�G�Ѓ�)H��� !J#����<e�(���	��_e���Qb^�B��i�}�#�m۱�U$:2Z!�
�v�mO0�_h�Fb0 ��fy�=/3HԂ�HFF��ԙ;rq�2���1���D�����nfE�%�ƅ���ۜU��<3����y�}�c��k:���d���\5|�Sz!;H�G,>u���U���=_�ͯ�tAY6�
_ُD�g�hY~��B��CK��w>���FI6�!�)��x�l���o4ත7�fB�̭ir����P=R !I�>4�^ot%���y�-�`G�B�,*��}��^�;�+�Ϸ����REI-�p��8g�z��T��c�T�q҃*�'',u��j��0(9�)���0��f�&��q��<ܭ�������O��-Ѿ�G��t���g�i���{"��D��0�չhY���ͽc]�r�T��?�j���XD��.�\����̊�|Jb��;�=�}N<,���/%-�PV�6�l��>�}9�����)Z�5��bh"Mq+��gg�`V��.�D�!4$k�ӑN��*nnn���a�      �      x������ � �      �   $   x�3�tI-N��+��2�tN�KN�I�Mqc���� �	;      �   (   x�3�K-.)=��(3�ˈ�1'375����d 7F��� ϝl      �   0   x�3�t��K�ɬJLI�2�t�UHLJ-*��2�tN�KN����qqq �&      �   +   x�3�t���H�,��2�t.:�2%�$�˘����$+F��� ���      �   /   x�3��M,N.�����2�tK���1�9s2sS�J2�3�b���� ��      �   0   x�3�t��K�ɬJLI�2�t�UHLJ-*��2�tN�KN����qqq �&      �   C   x�3�4�tN�9�<�Ӑ��q�)-N�4�2�4��IL.�L>�6/3��3Ə�(�X��
���qqq ;�K      �   "   x�3�K�KI�2��/:�<175�$�+F��� n��     