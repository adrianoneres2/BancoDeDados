SELECT * FROM ALL_DB_LINKS;
SELECT * FROM V$INSTANCE;

-- drop DATABASE LINK DBL_AMAZON_RIO;
-- drop public DATABASE LINK DBL_AMAZON_RIO;

SET DEFINE OFF;
--- O DATABASE LINK É USADO PARA CONECTAR OS DOIS SERVIDORES.
CREATE public DATABASE LINK DBL_AMAZON_RIO CONNECT TO master IDENTIFIED BY a123456 USING '(DESCRIPTION =
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
SET SERVEROUTPUT ON;
BEGIN

  dbms_output.put_line('Inicio : '||SYSDATE);

  DBMS_FILE_TRANSFER.put_file(
        source_directory_object       =>  'DATA_PUMP_DIR',
        source_file_name              =>  'DBPLATAFORMA_31.dmp',
        destination_directory_object  =>  'DATA_PUMP_DIR',
        destination_file_name         =>  'DBPLATAFORMA_31.dmp',
        destination_database          =>  'DBL_AMAZON_RIO');
        
    dbms_output.put_line('Fim : '||SYSDATE);
        
    exception when others then
    dbms_output.put_line('Erro! '||'The error code is ' || SQLCODE || '- ' || SQLERRM);

END;
/

--- O DATABASE LINK É USADO PARA CONECTAR OS DOIS SERVIDORES.
CREATE DATABASE LINK REMOTE_FSWDEVEL CONNECT TO system IDENTIFIED BY dbactis USING 'FSWDEVEL';

--------- PEGA O ARQUIVO DO SERVIDOR REMOTO NO DIRETORIO DO DATAPUMP E JOGA NO SERVIDOR LOCAL DADAUMPDIR
SET SERVEROUTPUT ON;
BEGIN
  dbms_output.put_line('Inicio : '||SYSDATE);

  DBMS_FILE_TRANSFER.get_file(
        source_directory_object       =>  'DIR_DUMP',
        source_file_name              =>  'DBPLATAFORMA_PROD.dmp',
        source_database               =>  'REMOTE_FSWDEVEL',
        destination_directory_object  =>  'DATA_PUMP_DIR',
        destination_file_name         =>  'DBPLATAFORMA_PROD.dmp');
        
  dbms_output.put_line('Fim : '||SYSDATE);
    
  exception when others then
    dbms_output.put_line('Erro! '||'The error code is ' || SQLCODE || '- ' || SQLERRM);
        
END;
/

