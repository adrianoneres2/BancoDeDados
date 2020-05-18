---Verifica onde estão as tabelas.
SELECT owner,
         segment_name,
         segment_type,
         tablespace_name
FROM dba_segments
WHERE owner = 'DBPLATAFORMABR_31';

--- Mover todas as tabelas para outro schema.
SELECT ' alter table '
        || owner
        || '.'
        || table_name
        || ' move tablespace NOVA_TABLESPACE;' CMD
FROM dba_tables
WHERE owner = 'DBPLATAFORMABR_31';