--FOOD

DROP TABLE tbl_foods;
CREATE TABLE tbl_foods
(   
    f_fcode CHAR(7) PRIMARY KEY,
    f_name nVARCHAR2(50) NOT NULL,
    f_since	CHAR(4) NOT NULL,
    f_ccode	CHAR(6)	NOT NULL,
    f_dcode	CHAR(4)	NOT NULL,	
    f_one	NUMBER	NOT NULL,	
    f_total	NUMBER,		
    f_kcal	NUMBER,		
    f_dan	NUMBER,		
    f_ji	NUMBER,		
    f_tan	NUMBER,		
    f_dang	NUMBER
);

DROP TABLE tbl_company;
CREATE TABLE tbl_company
(
    c_ccode CHAR(6) PRIMARY KEY,
    c_cname VARCHAR2(125) NOT NULL
);

DROP TABLE tbl_items;
CREATE TABLE tbl_items
(
    i_dcode CHAR(4) PRIMARY KEY,
    i_dname nVARCHAR2(10) NOT NULL
);
---------외래키삭제
ALTER TABLE tbl_foods
DROP CONSTRAINT fk_foodcompany;

ALTER TABLE tbl_foods
DROP CONSTRAINT fk_fooditem;

----------외래키 등록

ALTER TABLE tbl_foods
ADD CONSTRAINT fk_foodcompany
FOREIGN KEY (f_ccode)
REFERENCES tbl_company(c_ccode);

ALTER TABLE tbl_foods
ADD CONSTRAINT fk_fooditem
FOREIGN KEY (f_dcode)
REFERENCES tbl_items(i_dcode);

------------조인 뷰
SELECT *
FROM tbl_foods FD
    LEFT JOIN tbl_company CP
        ON FD.f_ccode = CP.c_ccode
    LEFT JOIN tbl_items IT
        ON FD.f_dcode = IT.i_dcode;


CREATE VIEW view_식품정보
AS
(
SELECT *
FROM tbl_foods FD
    LEFT JOIN tbl_company CP
        ON FD.f_ccode = CP.c_ccode
    LEFT JOIN tbl_items IT
        ON FD.f_dcode = IT.i_dcode
);

DROP TABLE tbl_myfoods;
CREATE TABLE tbl_myfoods
(
    m_seq NUMBER PRIMARY KEY,
    m_date VARCHAR2(15) NOT NULL,
    m_fcode CHAR(7) NOT NULL,
    m_qty CHAR(1) NOT NULL
);