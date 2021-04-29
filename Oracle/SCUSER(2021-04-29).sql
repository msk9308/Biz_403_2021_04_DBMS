DROP TABLE tbl_books;

CREATE TABLE tbl_books
(
bk_isbn CHAR(13) PRIMARY KEY,
bk_title nVARCHAR2(125) NOT NULL,
bk_ccode CHAR(5) NOT NULL,
bk_acode CHAR(5) NOT NULL,
bk_date CHAR(10),
bk_pages NUMBER,
bk_price NUMBER
);




DROP TABLE tbl_company;


CREATE TABLE tbl_company
(
cp_code CHAR(5) PRIMARY KEY,
cp_title nVARCHAR2(125) NOT NULL,
cp_ceo nVARCHAR2(20),
cp_tel VARCHAR(20),
cp_addr nVARCHAR2(125),
cp_genre nVARCHAR2(30)
);

INSERT INTO tbl_company(cp_code,cp_title,cp_ceo,cp_tel,cp_addr,cp_genre)
VALUES('00003','세번째출판사','고길동','062-588-5444','오치동','수필');

INSERT INTO tbl_company(cp_code,cp_title,cp_ceo,cp_tel,cp_addr,cp_genre)
VALUES('00004','네번째출판사','김몽룡','062-877-8852','삼각동','소설');

SELECT * FROM tbl_company;

CREATE TABLE tbl_author
(
au_code CHAR(5) PRIMARY KEY,
au_name nVARCHAR2(50) NOT NULL,
au_tel VARCHAR(20),
au_addr nVARCHAR2(125),
au_genre nVARCHAR2(30)
);

INSERT INTO tbl_author(au_code,au_name,au_tel,au_addr,au_genre)
VALUES('00001','김길동','062-888-7788','중흥동','동화');

INSERT INTO tbl_author(au_code,au_name,au_tel,au_addr,au_genre)
VALUES('00002','김길동','062-511-8457','매곡동','개발서');

SELECT * FROM tbl_author;

SELECT *
FROM tbl_books,tbl_company,tbl_author
WHERE 


