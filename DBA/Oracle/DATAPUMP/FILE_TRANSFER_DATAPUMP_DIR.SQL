SELECT * FROM ALL_DB_LINKS;
SELECT * FROM V$INSTANCE;

-- drop DATABASE LINK DBL_AMAZON_RIO;
-- drop public DATABASE LINK DBL_AMAZON_RIO;

SET DEFINE OFF;
--- O DATABASE LINK É USADO PARA CONECTAR OS DOIS SERVIDORES.
CREATE public DATABASE LINK DBL_AMAZON_RIO CONNECT TO master IDENTIFIED BY "*ay&F6WV$K" USING '(DESCRIPTION =
    (ADDRESS_LIST =
      (LOAD_BALANCE = ON)
      (FAILOVER = ON)
      (ADDRESS = (PROTOCOL = TCP)(HOST = saude-devel.c5zf0ow6n1dq.sa-east-1.rds.amazonaws.com)(PORT = 1521))
    )
 (CONNECT_DATA = 
  (SERVICE_NAME = ORCL) 
  (SERVER = DEDICATED)
   (FAILOVER_MODE = 
  (TYPE = SESSION) 
  (METHOD = SELECT)
   )
  )
  )';
   
-- SELECT * FROM dual@REMOTE_FSWDEVEL;
-- SELECT * FROM dual@DBL_AMAZON_RIO;
-- select * from dba_directories;


SET DEFINE OFF;
--------- JOGA O ARQUIVO DO SERVIDOR LOCAL PARA DIRETORIO DATAPUMP DO SERVIDOR REMOTO.
SET SERVEROUTPUT ON
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY HH24:MI:SS';
BEGIN

  dbms_output.put_line('Inicio : '||SYSDATE);

  DBMS_FILE_TRANSFER.put_file(
        source_directory_object       =>  'DATA_PUMP_DIR',
        source_file_name              =>  'DBCNES.dmp',
        destination_directory_object  =>  'DATA_PUMP_DIR',
        destination_file_name         =>  'DBCNES.dmp',
        destination_database          =>  'DBL_AMAZON_RIO');
        
    dbms_output.put_line('Fim : '||SYSDATE);
        
    exception when others then
    dbms_output.put_line('Erro! '||'The error code is ' || SQLCODE || '- ' || SQLERRM);

END;
/

--- O DATABASE LINK É USADO PARA CONECTAR OS DOIS SERVIDORES.
---DROP DATABASE LINK REMOTE_FSWDEVEL
CREATE DATABASE LINK REMOTE_FSWDEVEL CONNECT TO system IDENTIFIED BY dbactis USING 'FSWDEVEL';

select * from dual@REMOTE_FSWDEVEL;

--------- PEGA O ARQUIVO DO SERVIDOR REMOTO NO DIRETORIO DO DATAPUMP E JOGA NO SERVIDOR LOCAL DADAUMPDIR
SET SERVEROUTPUT ON;
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY HH24:MI:SS';
BEGIN
  dbms_output.put_line('Inicio : '||SYSDATE);

  DBMS_FILE_TRANSFER.get_file(
        source_directory_object       =>  'DIR_DUMP',
        source_file_name              =>  'adriano.dmp',
        source_database               =>  'REMOTE_FSWDEVEL',
        destination_directory_object  =>  'DATA_PUMP_DIR',
        destination_file_name         =>  'adriano.dmp');
        
  dbms_output.put_line('Fim : '||SYSDATE);
    
  exception when others then
    dbms_output.put_line('Erro! '||'The error code is ' || SQLCODE || '- ' || SQLERRM);
        
END;
/




--- O DATABASE LINK É USADO PARA CONECTAR OS DOIS SERVIDORES.
CREATE DATABASE LINK REMOTE_DEVELMS CONNECT TO system IDENTIFIED BY msdeveldf02 USING 'DEVELMS';

--------- PEGA O ARQUIVO DO SERVIDOR REMOTO NO DIRETORIO DO DATAPUMP E JOGA NO SERVIDOR LOCAL DADAUMPDIR
SET SERVEROUTPUT ON;
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY HH24:MI:SS';
BEGIN
  dbms_output.put_line('Inicio : '||SYSDATE);

  DBMS_FILE_TRANSFER.get_file(
        source_directory_object       =>  'IMPORTA',
        source_file_name              =>  'DBPLATAFORMA_PROD.dmp',
        source_database               =>  'REMOTE_DEVELMS',
        destination_directory_object  =>  'DATA_PUMP_DIR',
        destination_file_name         =>  'DBPLATAFORMA_PROD.dmp');
        
  dbms_output.put_line('Fim : '||SYSDATE);
    
  exception when others then
    dbms_output.put_line('Erro! '||'The error code is ' || SQLCODE || '- ' || SQLERRM);
        
END;
/

---- LISTA OS ARQUIVOS NO DIRETÓRIO REMOTO DO BANCO DE DADOSS.
select * from table(RDSADMIN.RDS_FILE_UTIL.LISTDIR('DATA_PUMP_DIR')) order by mtime;
---- APAGA ARQUIVOS DO DESTINO (SERVIDOR REMOTO).
exec utl_file.fremove('DATA_PUMP_DIR','DBSCPA.dmp');
