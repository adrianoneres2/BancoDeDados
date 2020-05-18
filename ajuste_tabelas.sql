select * from pg_tables where tablename like '%status%';


alter table loja.tp_status_compra rename to tp_compra;
alter table loja.tp_status_item_venda rename to tp_item_venda
alter table loja.tp_status_venda rename to tp_venda
commit;

select * from information_schema.columns where column_name like '%status%';

alter table loja.ta_item_venda rename id_status_item_venda to id_tipo_item_venda;
alter table loja.tb_compra rename id_status_compra to id_tipo_compra;
alter table loja.tb_venda rename id_status_venda to id_tipo_venda;
alter table loja.tp_compra rename id_status_compra to id_tipo_compra;
alter table loja.tp_compra rename ds_status_compra to nm_status_compra;
alter table loja.tp_item_venda rename id_status_item_venda to id_tipo_item_venda;
alter table loja.tp_item_venda rename nm_status_item_venda to nm_tipo_item_venda
alter table loja.tp_venda rename id_status_venda to id_tipo_venda;
alter table loja.tp_venda rename ds_status_venda to ds_tipo_venda;
alter table loja.tp_venda rename ds_tipo_venda to nm_tipo_venda;
alter table loja.tp_compra rename nm_status_compra to nm_tipo_compra;
commit;

select * from information_schema.columns where column_name like '%ds_%';

alter table loja.tp_categoria rename ds_categoria to nm_categoria;
alter table loja.tp_forma_pagamento rename ds_forma_pagamento to nm_forma_pagamento;
alter table loja.tp_genero rename ds_genero to nm_genero;
commit;





