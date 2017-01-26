-----PARTICIONAMENTO DE TABELAS
SELECT * FROM DBA_TABLESPACES;
select table_name,
   partition_name,
   high_value,
   num_rows,
   TABLESPACE_NAME
   from dba_tab_partitions
  where table_name='TB_ARQUIVO'
  AND TABLE_OWNER = 'DBPLATAFORMABR'
  AND TABLESPACE_NAME = 'TD_DBPLATAFORMA';

select table_name,
   partition_name,
   high_value,
   num_rows,
   TABLESPACE_NAME
   from dba_tab_partitions
  where table_name='TB_ARQUIVO'
  AND TABLE_OWNER = 'DBPLATAFORMABR_31'
  AND TABLESPACE_NAME = 'TD_DBPLATAFORMA_31';
  
--- REGISTROS PARTICIONADOS ATÉ A DATA INFORMADA.
ALTER TABLE DBPLATAFORMABR.TB_ARQUIVO ADD PARTITION PT_201701 VALUES LESS THAN (TO_DATE('31-12-2017','dd-MM-yyyy'));