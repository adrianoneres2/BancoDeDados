---Consulta segmento de indices do usuário.
SELECT owner,
    segment_name,
    segment_type,
    tablespace_name
  FROM dba_segments
  WHERE owner = 'DBPLATAFORMABR'
  AND SEGMENT_TYPE LIKE '%INDEX%';

---Consulta para verificar a localização dos segmentos(tabelas/indices/lob) nas tablesapces.
SELECT owner,
       segment_name,
       segment_type,
       tablespace_name
FROM dba_segments
WHERE owner = 'DBPLATAFORMABR';

---Mover indices para outra tablespace
SELECT ' alter index '
      || owner
      || '.'
      || index_name
      || ' rebuild tablespace TI_DBPLATAFORMA_31;' CMD
FROM dba_indexes
WHERE index_type <> 'LOB' AND owner = 'DBPLATAFORMABR_31';

--- Rebuild de indice inválido.
SELECT ' alter index ' 
        || owner 
        || '.' 
        || index_name 
        || ' rebuild;' CMD
FROM dba_indexes
WHERE owner = 'DBPLATAFORMABR_31' AND status <> 'VALID';