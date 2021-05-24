--todo 

CREATE TABLE tbl_todo
(
    td_num NUMBER PRIMARY KEY,
    td_work nVARCHAR2(125) NOT NULL,
    td_date VARCHAR2(10) NOT NULL,
    td_place nVARCHAR2(30)
);

INSERT INTO tbl_todo
VALUES(1,'할일1','2021-05-01','장소1');
INSERT INTO tbl_todo
VALUES(2,'할일2','2021-05-01','장소2');

SELECT * FROM tbl_todo;

COMMIT;