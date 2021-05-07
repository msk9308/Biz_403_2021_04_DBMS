--관리자 접속

CREATE TABLESPACE nonghyupDB
DATAFILE 'c:/oraclexe/data/nonghyup.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1K;

CREATE USER nhuser IDENTIFIED BY nhuser
DEFAULT TABLESPACE nonghyupDB;

GRANT DBA TO nhuser;