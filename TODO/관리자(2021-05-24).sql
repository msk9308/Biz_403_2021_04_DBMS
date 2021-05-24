-- 여기는 관리자 접속
CREATE TABLESPACE todolist
DATAFILE 'C:/oraclexe/data/todolist.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1K;

CREATE USER todo IDENTIFIED BY todo
DEFAULT TABLESPACE todolist;

GRANT DBA TO todo;