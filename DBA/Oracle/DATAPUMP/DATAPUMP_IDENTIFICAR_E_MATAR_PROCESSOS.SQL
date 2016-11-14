select * from dba_datapump_jobs;

----MATAR PROCESSO 
impdp master/a123456@MASTER-AMAZON-RIO attach="NOME_DO_PROCESSO_DATAPUMP"
kill_job