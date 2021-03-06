PGDMP     1    7                w            dbloja    10.5 (Debian 10.5-1.pgdg90+1) #   10.6 (Ubuntu 10.6-0ubuntu0.18.04.1) U    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                        2615    16387    loja    SCHEMA        CREATE SCHEMA loja;
    DROP SCHEMA loja;
             usrloja    false            �            1259    16599    sq_idproduto    SEQUENCE     s   CREATE SEQUENCE loja.sq_idproduto
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
       loja       usrloja    false    4            �            1259    16390 
   sq_produto    SEQUENCE     q   CREATE SEQUENCE loja.sq_produto
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE loja.sq_produto;
       loja       usrloja    false    4            �            1259    16392    sq_tbproduto    SEQUENCE     s   CREATE SEQUENCE loja.sq_tbproduto
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE loja.sq_tbproduto;
       loja       usrloja    false    4            �            1259    16394    sq_teste    SEQUENCE     o   CREATE SEQUENCE loja.sq_teste
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE loja.sq_teste;
       loja       usrloja    false    4            �            1259    16396    ta_item_venda    TABLE       CREATE TABLE loja.ta_item_venda (
    id_item_venda numeric(8,0) NOT NULL,
    id_produto numeric(4,0) NOT NULL,
    id_tipo_item_venda numeric(1,0) NOT NULL,
    id_venda numeric(5,0) NOT NULL,
    vl_venda numeric(12,2),
    id_usuario_cancelamento numeric(4,0)
);
    DROP TABLE loja.ta_item_venda;
       loja         usrloja    false    4            �            1259    16399    ta_perfil_funcionalidade    TABLE     �   CREATE TABLE loja.ta_perfil_funcionalidade (
    id_perfil_funcionalidade numeric(3,0) NOT NULL,
    id_perfil numeric(3,0) NOT NULL,
    id_funcionalidade numeric(2,0) NOT NULL
);
 *   DROP TABLE loja.ta_perfil_funcionalidade;
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
       loja         usrloja    false    4            �            1259    16417 	   tb_perfil    TABLE     t   CREATE TABLE loja.tb_perfil (
    id_perfil numeric(3,0) NOT NULL,
    nm_perfil character varying(100) NOT NULL
);
    DROP TABLE loja.tb_perfil;
       loja         usrloja    false    4            �            1259    16420 
   tb_produto    TABLE     Z  CREATE TABLE loja.tb_produto (
    id_produto numeric(4,0) NOT NULL,
    qt_produto numeric(4,0) NOT NULL,
    id_sub_categoria numeric(3,0) NOT NULL,
    nm_produto character varying(50) NOT NULL,
    vl_venda numeric(12,2) NOT NULL,
    nu_codigo_barra character varying(30),
    im_produto bytea,
    dt_produto date DEFAULT now() NOT NULL
);
    DROP TABLE loja.tb_produto;
       loja         usrloja    false    4            �            1259    16427 
   tb_usuario    TABLE     �  CREATE TABLE loja.tb_usuario (
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
    DROP TABLE loja.tb_usuario;
       loja         usrloja    false    4            �            1259    16434    tb_venda    TABLE     M  CREATE TABLE loja.tb_venda (
    id_venda numeric(5,0) NOT NULL,
    id_tipo_venda numeric(1,0) NOT NULL,
    id_usuario numeric(4,0) NOT NULL,
    id_forma_pagamento numeric(2,0),
    dt_venda timestamp without time zone NOT NULL,
    dt_venda_finalizada timestamp without time zone,
    id_usuario_cliente numeric(4,0) NOT NULL
);
    DROP TABLE loja.tb_venda;
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
       loja         usrloja    false    4            �            1259    16458    tp_item_venda    TABLE     �   CREATE TABLE loja.tp_item_venda (
    id_tipo_item_venda numeric(1,0) NOT NULL,
    nm_tipo_item_venda character varying(20) NOT NULL,
    vl_percentual_desconto numeric(3,2)
);
    DROP TABLE loja.tp_item_venda;
       loja         usrloja    false    4            �            1259    16464    tp_sub_categoria    TABLE     �   CREATE TABLE loja.tp_sub_categoria (
    id_sub_categoria numeric(3,0) NOT NULL,
    id_categoria numeric(2,0) NOT NULL,
    nm_sub_categoria character varying(50) NOT NULL,
    id_genero numeric(1,0)
);
 "   DROP TABLE loja.tp_sub_categoria;
       loja         usrloja    false    4            �            1259    16461    tp_venda    TABLE     z   CREATE TABLE loja.tp_venda (
    id_tipo_venda numeric(1,0) NOT NULL,
    nm_tipo_venda character varying(10) NOT NULL
);
    DROP TABLE loja.tp_venda;
       loja         usrloja    false    4            �          0    16396    ta_item_venda 
   TABLE DATA               �   COPY loja.ta_item_venda (id_item_venda, id_produto, id_tipo_item_venda, id_venda, vl_venda, id_usuario_cancelamento) FROM stdin;
    loja       usrloja    false    201   i       �          0    16399    ta_perfil_funcionalidade 
   TABLE DATA               h   COPY loja.ta_perfil_funcionalidade (id_perfil_funcionalidade, id_perfil, id_funcionalidade) FROM stdin;
    loja       usrloja    false    202   4i       �          0    16402    tb_cep 
   TABLE DATA               &   COPY loja.tb_cep (id_cep) FROM stdin;
    loja       usrloja    false    203   �i       �          0    16408 	   tb_compra 
   TABLE DATA               �   COPY loja.tb_compra (id_compra, id_tipo_compra, id_usuario, nr_nota_fiscal, vl_total, dt_compra, dt_compra_finalizada) FROM stdin;
    loja       usrloja    false    204   �i       �          0    16414    tb_funcionalidade 
   TABLE DATA               O   COPY loja.tb_funcionalidade (id_funcionalidade, nm_funcionalidade) FROM stdin;
    loja       usrloja    false    205   �i       �          0    16417 	   tb_perfil 
   TABLE DATA               7   COPY loja.tb_perfil (id_perfil, nm_perfil) FROM stdin;
    loja       usrloja    false    206   Uj       �          0    16420 
   tb_produto 
   TABLE DATA               �   COPY loja.tb_produto (id_produto, qt_produto, id_sub_categoria, nm_produto, vl_venda, nu_codigo_barra, im_produto, dt_produto) FROM stdin;
    loja       usrloja    false    207   �j       �          0    16427 
   tb_usuario 
   TABLE DATA               �   COPY loja.tb_usuario (id_usuario, nm_usuario, nm_senha, dt_cadastro, nm_email, in_usuario_ativo, id_usuario_cadastro, id_perfil) FROM stdin;
    loja       usrloja    false    208   wk       �          0    16434    tb_venda 
   TABLE DATA               �   COPY loja.tb_venda (id_venda, id_tipo_venda, id_usuario, id_forma_pagamento, dt_venda, dt_venda_finalizada, id_usuario_cliente) FROM stdin;
    loja       usrloja    false    209   Wm       �          0    16443    tp_categoria 
   TABLE DATA               @   COPY loja.tp_categoria (id_categoria, nm_categoria) FROM stdin;
    loja       usrloja    false    210   tm       �          0    16452 	   tp_compra 
   TABLE DATA               A   COPY loja.tp_compra (id_tipo_compra, nm_tipo_compra) FROM stdin;
    loja       usrloja    false    213   �m       �          0    16446    tp_forma_pagamento 
   TABLE DATA               R   COPY loja.tp_forma_pagamento (id_forma_pagamento, nm_forma_pagamento) FROM stdin;
    loja       usrloja    false    211   �m       �          0    16449 	   tp_genero 
   TABLE DATA               7   COPY loja.tp_genero (id_genero, nm_genero) FROM stdin;
    loja       usrloja    false    212   n       �          0    16458    tp_item_venda 
   TABLE DATA               e   COPY loja.tp_item_venda (id_tipo_item_venda, nm_tipo_item_venda, vl_percentual_desconto) FROM stdin;
    loja       usrloja    false    214   Nn       �          0    16464    tp_sub_categoria 
   TABLE DATA               e   COPY loja.tp_sub_categoria (id_sub_categoria, id_categoria, nm_sub_categoria, id_genero) FROM stdin;
    loja       usrloja    false    216   �n       �          0    16461    tp_venda 
   TABLE DATA               >   COPY loja.tp_venda (id_tipo_venda, nm_tipo_venda) FROM stdin;
    loja       usrloja    false    215   �n       �           0    0    sq_idproduto    SEQUENCE SET     9   SELECT pg_catalog.setval('loja.sq_idproduto', 31, true);
            loja       usrloja    false    218            �           0    0    sq_idusuario    SEQUENCE SET     :   SELECT pg_catalog.setval('loja.sq_idusuario', 112, true);
            loja       usrloja    false    197            �           0    0 
   sq_produto    SEQUENCE SET     7   SELECT pg_catalog.setval('loja.sq_produto', 11, true);
            loja       usrloja    false    198            �           0    0    sq_tbproduto    SEQUENCE SET     9   SELECT pg_catalog.setval('loja.sq_tbproduto', 1, false);
            loja       usrloja    false    199            �           0    0    sq_teste    SEQUENCE SET     5   SELECT pg_catalog.setval('loja.sq_teste', 1, false);
            loja       usrloja    false    200            �
           2606    16468    tb_funcionalidade pk_modulo 
   CONSTRAINT     f   ALTER TABLE ONLY loja.tb_funcionalidade
    ADD CONSTRAINT pk_modulo PRIMARY KEY (id_funcionalidade);
 C   ALTER TABLE ONLY loja.tb_funcionalidade DROP CONSTRAINT pk_modulo;
       loja         usrloja    false    205            �
           2606    16470 )   ta_perfil_funcionalidade pk_modulo_perfil 
   CONSTRAINT     {   ALTER TABLE ONLY loja.ta_perfil_funcionalidade
    ADD CONSTRAINT pk_modulo_perfil PRIMARY KEY (id_perfil_funcionalidade);
 Q   ALTER TABLE ONLY loja.ta_perfil_funcionalidade DROP CONSTRAINT pk_modulo_perfil;
       loja         usrloja    false    202            �
           2606    16472    tb_cep pk_tbcep 
   CONSTRAINT     O   ALTER TABLE ONLY loja.tb_cep
    ADD CONSTRAINT pk_tbcep PRIMARY KEY (id_cep);
 7   ALTER TABLE ONLY loja.tb_cep DROP CONSTRAINT pk_tbcep;
       loja         usrloja    false    203            �
           2606    16474    tb_compra pk_tbcompra 
   CONSTRAINT     X   ALTER TABLE ONLY loja.tb_compra
    ADD CONSTRAINT pk_tbcompra PRIMARY KEY (id_compra);
 =   ALTER TABLE ONLY loja.tb_compra DROP CONSTRAINT pk_tbcompra;
       loja         usrloja    false    204            �
           2606    16476    ta_item_venda pk_tbitemvenda 
   CONSTRAINT     c   ALTER TABLE ONLY loja.ta_item_venda
    ADD CONSTRAINT pk_tbitemvenda PRIMARY KEY (id_item_venda);
 D   ALTER TABLE ONLY loja.ta_item_venda DROP CONSTRAINT pk_tbitemvenda;
       loja         usrloja    false    201                       2606    16478    tb_perfil pk_tbperfil 
   CONSTRAINT     X   ALTER TABLE ONLY loja.tb_perfil
    ADD CONSTRAINT pk_tbperfil PRIMARY KEY (id_perfil);
 =   ALTER TABLE ONLY loja.tb_perfil DROP CONSTRAINT pk_tbperfil;
       loja         usrloja    false    206                       2606    16480    tb_produto pk_tbproduto 
   CONSTRAINT     [   ALTER TABLE ONLY loja.tb_produto
    ADD CONSTRAINT pk_tbproduto PRIMARY KEY (id_produto);
 ?   ALTER TABLE ONLY loja.tb_produto DROP CONSTRAINT pk_tbproduto;
       loja         usrloja    false    207                       2606    16482 "   tp_item_venda pk_tbstatusitemvenda 
   CONSTRAINT     n   ALTER TABLE ONLY loja.tp_item_venda
    ADD CONSTRAINT pk_tbstatusitemvenda PRIMARY KEY (id_tipo_item_venda);
 J   ALTER TABLE ONLY loja.tp_item_venda DROP CONSTRAINT pk_tbstatusitemvenda;
       loja         usrloja    false    214            	           2606    16484    tb_usuario pk_tbusuario 
   CONSTRAINT     [   ALTER TABLE ONLY loja.tb_usuario
    ADD CONSTRAINT pk_tbusuario PRIMARY KEY (id_usuario);
 ?   ALTER TABLE ONLY loja.tb_usuario DROP CONSTRAINT pk_tbusuario;
       loja         usrloja    false    208                       2606    16486    tb_venda pk_tbvenda 
   CONSTRAINT     U   ALTER TABLE ONLY loja.tb_venda
    ADD CONSTRAINT pk_tbvenda PRIMARY KEY (id_venda);
 ;   ALTER TABLE ONLY loja.tb_venda DROP CONSTRAINT pk_tbvenda;
       loja         usrloja    false    209                       2606    16488    tp_categoria pk_tpcategoria 
   CONSTRAINT     a   ALTER TABLE ONLY loja.tp_categoria
    ADD CONSTRAINT pk_tpcategoria PRIMARY KEY (id_categoria);
 C   ALTER TABLE ONLY loja.tp_categoria DROP CONSTRAINT pk_tpcategoria;
       loja         usrloja    false    210                       2606    16490 &   tp_forma_pagamento pk_tpformapagamento 
   CONSTRAINT     r   ALTER TABLE ONLY loja.tp_forma_pagamento
    ADD CONSTRAINT pk_tpformapagamento PRIMARY KEY (id_forma_pagamento);
 N   ALTER TABLE ONLY loja.tp_forma_pagamento DROP CONSTRAINT pk_tpformapagamento;
       loja         usrloja    false    211                       2606    16492    tp_genero pk_tpgenero 
   CONSTRAINT     X   ALTER TABLE ONLY loja.tp_genero
    ADD CONSTRAINT pk_tpgenero PRIMARY KEY (id_genero);
 =   ALTER TABLE ONLY loja.tp_genero DROP CONSTRAINT pk_tpgenero;
       loja         usrloja    false    212                       2606    16494    tp_compra pk_tpstatuscompra 
   CONSTRAINT     c   ALTER TABLE ONLY loja.tp_compra
    ADD CONSTRAINT pk_tpstatuscompra PRIMARY KEY (id_tipo_compra);
 C   ALTER TABLE ONLY loja.tp_compra DROP CONSTRAINT pk_tpstatuscompra;
       loja         usrloja    false    213                       2606    16496    tp_venda pk_tpstatusvenda 
   CONSTRAINT     `   ALTER TABLE ONLY loja.tp_venda
    ADD CONSTRAINT pk_tpstatusvenda PRIMARY KEY (id_tipo_venda);
 A   ALTER TABLE ONLY loja.tp_venda DROP CONSTRAINT pk_tpstatusvenda;
       loja         usrloja    false    215                       2606    16498 "   tp_sub_categoria pk_tpsubcategoria 
   CONSTRAINT     l   ALTER TABLE ONLY loja.tp_sub_categoria
    ADD CONSTRAINT pk_tpsubcategoria PRIMARY KEY (id_sub_categoria);
 J   ALTER TABLE ONLY loja.tp_sub_categoria DROP CONSTRAINT pk_tpsubcategoria;
       loja         usrloja    false    216                       2606    16604 "   tb_produto uk_produto_codigo_barra 
   CONSTRAINT     f   ALTER TABLE ONLY loja.tb_produto
    ADD CONSTRAINT uk_produto_codigo_barra UNIQUE (nu_codigo_barra);
 J   ALTER TABLE ONLY loja.tb_produto DROP CONSTRAINT uk_produto_codigo_barra;
       loja         usrloja    false    207                       2606    16502     tb_produto uk_produto_nucodbarra 
   CONSTRAINT     d   ALTER TABLE ONLY loja.tb_produto
    ADD CONSTRAINT uk_produto_nucodbarra UNIQUE (nu_codigo_barra);
 H   ALTER TABLE ONLY loja.tb_produto DROP CONSTRAINT uk_produto_nucodbarra;
       loja         usrloja    false    207                       2606    16504     tb_usuario uk_usuario_dtcadastro 
   CONSTRAINT     `   ALTER TABLE ONLY loja.tb_usuario
    ADD CONSTRAINT uk_usuario_dtcadastro UNIQUE (dt_cadastro);
 H   ALTER TABLE ONLY loja.tb_usuario DROP CONSTRAINT uk_usuario_dtcadastro;
       loja         usrloja    false    208                       2606    16506    tb_usuario uk_usuario_email 
   CONSTRAINT     X   ALTER TABLE ONLY loja.tb_usuario
    ADD CONSTRAINT uk_usuario_email UNIQUE (nm_email);
 C   ALTER TABLE ONLY loja.tb_usuario DROP CONSTRAINT uk_usuario_email;
       loja         usrloja    false    208            �
           1259    16602    ix_perfilfuncionalidade_unico    INDEX        CREATE UNIQUE INDEX ix_perfilfuncionalidade_unico ON loja.ta_perfil_funcionalidade USING btree (id_perfil, id_funcionalidade);
 /   DROP INDEX loja.ix_perfilfuncionalidade_unico;
       loja         usrloja    false    202    202            .           2606    16507 *   tp_sub_categoria fk_categoria_subcategoria    FK CONSTRAINT     �   ALTER TABLE ONLY loja.tp_sub_categoria
    ADD CONSTRAINT fk_categoria_subcategoria FOREIGN KEY (id_categoria) REFERENCES loja.tp_categoria(id_categoria);
 R   ALTER TABLE ONLY loja.tp_sub_categoria DROP CONSTRAINT fk_categoria_subcategoria;
       loja       usrloja    false    210    2833    216            *           2606    16512     tb_venda fk_formapagamento_venda    FK CONSTRAINT     �   ALTER TABLE ONLY loja.tb_venda
    ADD CONSTRAINT fk_formapagamento_venda FOREIGN KEY (id_forma_pagamento) REFERENCES loja.tp_forma_pagamento(id_forma_pagamento);
 H   ALTER TABLE ONLY loja.tb_venda DROP CONSTRAINT fk_formapagamento_venda;
       loja       usrloja    false    211    209    2835            "           2606    16517 @   ta_perfil_funcionalidade fk_funcionalidade_perfil_funcionalidade    FK CONSTRAINT     �   ALTER TABLE ONLY loja.ta_perfil_funcionalidade
    ADD CONSTRAINT fk_funcionalidade_perfil_funcionalidade FOREIGN KEY (id_funcionalidade) REFERENCES loja.tb_funcionalidade(id_funcionalidade);
 h   ALTER TABLE ONLY loja.ta_perfil_funcionalidade DROP CONSTRAINT fk_funcionalidade_perfil_funcionalidade;
       loja       usrloja    false    205    202    2815            /           2606    16522 '   tp_sub_categoria fk_genero_subcategoria    FK CONSTRAINT     �   ALTER TABLE ONLY loja.tp_sub_categoria
    ADD CONSTRAINT fk_genero_subcategoria FOREIGN KEY (id_genero) REFERENCES loja.tp_genero(id_genero);
 O   ALTER TABLE ONLY loja.tp_sub_categoria DROP CONSTRAINT fk_genero_subcategoria;
       loja       usrloja    false    212    216    2837            &           2606    16527 )   tb_funcionalidade fk_modulo_perfil_modulo    FK CONSTRAINT     �   ALTER TABLE ONLY loja.tb_funcionalidade
    ADD CONSTRAINT fk_modulo_perfil_modulo FOREIGN KEY (id_funcionalidade) REFERENCES loja.tb_funcionalidade(id_funcionalidade);
 Q   ALTER TABLE ONLY loja.tb_funcionalidade DROP CONSTRAINT fk_modulo_perfil_modulo;
       loja       usrloja    false    205    205    2815            #           2606    16532 8   ta_perfil_funcionalidade fk_perfil_perfil_funcionalidade    FK CONSTRAINT     �   ALTER TABLE ONLY loja.ta_perfil_funcionalidade
    ADD CONSTRAINT fk_perfil_perfil_funcionalidade FOREIGN KEY (id_perfil) REFERENCES loja.tb_perfil(id_perfil);
 `   ALTER TABLE ONLY loja.ta_perfil_funcionalidade DROP CONSTRAINT fk_perfil_perfil_funcionalidade;
       loja       usrloja    false    2817    206    202            (           2606    16537    tb_usuario fk_perfil_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY loja.tb_usuario
    ADD CONSTRAINT fk_perfil_usuario FOREIGN KEY (id_perfil) REFERENCES loja.tb_perfil(id_perfil);
 D   ALTER TABLE ONLY loja.tb_usuario DROP CONSTRAINT fk_perfil_usuario;
       loja       usrloja    false    206    208    2817                       2606    16542 "   ta_item_venda fk_produto_itemvenda    FK CONSTRAINT     �   ALTER TABLE ONLY loja.ta_item_venda
    ADD CONSTRAINT fk_produto_itemvenda FOREIGN KEY (id_produto) REFERENCES loja.tb_produto(id_produto);
 J   ALTER TABLE ONLY loja.ta_item_venda DROP CONSTRAINT fk_produto_itemvenda;
       loja       usrloja    false    2819    201    207            $           2606    16547     tb_compra fk_statuscompra_compra    FK CONSTRAINT     �   ALTER TABLE ONLY loja.tb_compra
    ADD CONSTRAINT fk_statuscompra_compra FOREIGN KEY (id_tipo_compra) REFERENCES loja.tp_compra(id_tipo_compra);
 H   ALTER TABLE ONLY loja.tb_compra DROP CONSTRAINT fk_statuscompra_compra;
       loja       usrloja    false    2839    204    213                       2606    16552 *   ta_item_venda fk_statusitemvenda_itemvenda    FK CONSTRAINT     �   ALTER TABLE ONLY loja.ta_item_venda
    ADD CONSTRAINT fk_statusitemvenda_itemvenda FOREIGN KEY (id_tipo_item_venda) REFERENCES loja.tp_item_venda(id_tipo_item_venda);
 R   ALTER TABLE ONLY loja.ta_item_venda DROP CONSTRAINT fk_statusitemvenda_itemvenda;
       loja       usrloja    false    2841    201    214            +           2606    16557    tb_venda fk_statusvenda_venda    FK CONSTRAINT     �   ALTER TABLE ONLY loja.tb_venda
    ADD CONSTRAINT fk_statusvenda_venda FOREIGN KEY (id_tipo_venda) REFERENCES loja.tp_venda(id_tipo_venda);
 E   ALTER TABLE ONLY loja.tb_venda DROP CONSTRAINT fk_statusvenda_venda;
       loja       usrloja    false    2843    215    209            '           2606    16562 "   tb_produto fk_subcategoria_produto    FK CONSTRAINT     �   ALTER TABLE ONLY loja.tb_produto
    ADD CONSTRAINT fk_subcategoria_produto FOREIGN KEY (id_sub_categoria) REFERENCES loja.tp_sub_categoria(id_sub_categoria);
 J   ALTER TABLE ONLY loja.tb_produto DROP CONSTRAINT fk_subcategoria_produto;
       loja       usrloja    false    207    2845    216            %           2606    16567    tb_compra fk_usuario_compra    FK CONSTRAINT     �   ALTER TABLE ONLY loja.tb_compra
    ADD CONSTRAINT fk_usuario_compra FOREIGN KEY (id_usuario) REFERENCES loja.tb_usuario(id_usuario);
 C   ALTER TABLE ONLY loja.tb_compra DROP CONSTRAINT fk_usuario_compra;
       loja       usrloja    false    208    2825    204                        2606    16572 "   ta_item_venda fk_usuario_itemvenda    FK CONSTRAINT     �   ALTER TABLE ONLY loja.ta_item_venda
    ADD CONSTRAINT fk_usuario_itemvenda FOREIGN KEY (id_usuario_cancelamento) REFERENCES loja.tb_usuario(id_usuario);
 J   ALTER TABLE ONLY loja.ta_item_venda DROP CONSTRAINT fk_usuario_itemvenda;
       loja       usrloja    false    201    2825    208            )           2606    16577    tb_usuario fk_usuario_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY loja.tb_usuario
    ADD CONSTRAINT fk_usuario_usuario FOREIGN KEY (id_usuario_cadastro) REFERENCES loja.tb_usuario(id_usuario);
 E   ALTER TABLE ONLY loja.tb_usuario DROP CONSTRAINT fk_usuario_usuario;
       loja       usrloja    false    208    2825    208            ,           2606    16582    tb_venda fk_usuario_venda    FK CONSTRAINT     �   ALTER TABLE ONLY loja.tb_venda
    ADD CONSTRAINT fk_usuario_venda FOREIGN KEY (id_usuario) REFERENCES loja.tb_usuario(id_usuario);
 A   ALTER TABLE ONLY loja.tb_venda DROP CONSTRAINT fk_usuario_venda;
       loja       usrloja    false    208    209    2825            -           2606    16587    tb_venda fk_usuariovenda    FK CONSTRAINT     �   ALTER TABLE ONLY loja.tb_venda
    ADD CONSTRAINT fk_usuariovenda FOREIGN KEY (id_usuario_cliente) REFERENCES loja.tb_usuario(id_usuario);
 @   ALTER TABLE ONLY loja.tb_venda DROP CONSTRAINT fk_usuariovenda;
       loja       usrloja    false    208    2825    209            !           2606    16592     ta_item_venda fk_venda_itemvenda    FK CONSTRAINT     �   ALTER TABLE ONLY loja.ta_item_venda
    ADD CONSTRAINT fk_venda_itemvenda FOREIGN KEY (id_venda) REFERENCES loja.tb_venda(id_venda);
 H   ALTER TABLE ONLY loja.ta_item_venda DROP CONSTRAINT fk_venda_itemvenda;
       loja       usrloja    false    209    201    2831            �      x������ � �      �   >   x�˻ 1�X[̍������q(y�B�t+�v�,;�vq��F���8��E�J�>���
T      �      x������ � �      �      x������ � �      �   �   x�U�K
1��ur��@�o�ìf��M�
�����Y�����'|�B��n���n�'G�H2�M��5�OwM�$�Z4�|�c�ec��P���+�Ib|�ϰ��HG��h�0�z�`�����g��u��o�M      �   :   x�3�-.=��(3�˘�91�"�˄�9'35�$�ː�1%73/���(1%��+F��� �6�      �   �   x�}�M� F�p
�^��%z7M�ei���;*�mg�����������e|,#_�ߢ�ƒ���74
$XP��Ĭ�������p&I)����'��V�n�b7����~mO��7�|w~�?��%�d���L�R_�]m��ۚG����r�k�PBT@xx�^��+���c�N��'�ɾ�R��O�9      �   �  x�}�Mr�@���)�LM�ìD�N�U�Iy��D�(�T�8TΑ��$�BrV,x������a}ݱc�P*m,H�..��I��x!���,^Mb���t�a��C�B��u�.��n��R1��1�X^
�4�=M���P70X�+}2�����ݐ2��qH�_������R��i*���f��b^��dci����1)�^��8������2D�&�?b��Ƕ��k��Q$�v5�8�$2
Վn;��}���J��8� �Y��7yi�҇v[���~��}�����T�<ji��y�Nj�$5���cS���l��.EZZ��>��!��G�����ނ�p�i�@N��lqo���mZÔ�87����<���J˲�i̦���FۋnI���K��;��ѥ�ҹ�kN a��F�Mn�����0T����^�+�P�<>=�>� j�tB>��d��gY��$�      �      x������ � �      �      x�3�K-.)=��(3�+F��� =�      �   0   x�3�t��K�ɬJLI�2�t�UHLJ-*��2�tN�KN����qqq �&      �   !   x�3�tT(�,.I�2�tN,*9�8�+F��� ^�      �   /   x�3��M,N.�����2�tK���1�9s2sS�J2�3�b���� ��      �   #   x�3�t,�,����2�tN�KN�ILsc���� ��      �   %   x�3�4�tN�9�<�Ӑ��q�)-N�4����� u��      �   0   x�3�t��K�ɬJLI�2�t�UHLJ-*��2�tN�KN����qqq �&     