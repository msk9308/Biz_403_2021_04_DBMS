-- scuser 접속
SELECT * FROM tbl_student;

--projection 
--데이터중에 필요한 칼럼만 나열하여 데이터를 보여라
SELECT st_num, st_name, st_dept
FROM tbl_student;

--projection 
--보여지는 칼럼에 순서도 바꿀 수 있다
SELECT st_name, st_tel, st_dept
FROM tbl_student;

--이름이 '기은성'인 사람의 데이터 조회
--비록 한개의 데이터만 보여지지만 
--이 데이터는 2개이상 보여진다는 것을 항상 전제하자
--여기에서 보여지는 데이터는 모두가 LIST이다
--      LIST<VO> voList에 담아야 한다.
SELECT st_name, st_dept
FROM tbl_student
WHERE st_name = '기은성';

--학번이 'S0090'인 하갯ㅇ의 정보를 조회하라 
--학번은 (st_num)은 PK로 설정(선언) 되어있기 때문에
--1개의 학번만 조회를 하면
--이 데이터는 무조건 1개이거나 없다
--여기에서 출력되는 데이터는 VO다.
--      VO vo = new VO()에 담으면 된다
SELECT st_num, st_name, st_dept
FROM tbl_student
WHERE st_num = 'S0090';

--학번이 S0090이거나 S0091인 학생을 보여라
SELECT *
FROM tbl_student
WHERE st_num = 'S0090' OR st_num = 'S0091';

SELECT *
FROM tbl_student
WHERE st_num = 'S0090' OR st_num = 'S0091'
OR st_num = 'S0092';

SELECT *
FROM tbl_student
WHERE st_num IN('S0090','S0091','S0093','S0040','S0050');

--DBMS에서는 CHAR,VARCHAR 타입의 문자열 데이터도
--범위를 지정하여 조회할 수 있다
--단, 모든 데이터의 길이가 같을 때
SELECT *
FROM tbl_student
WHERE st_num > 'S0090' AND st_num < 'S0099';

SELECT *
FROM tbl_student
WHERE st_name >= '가가가' AND st_name <= '기힣힣';

--st num>= 'S0010' AND st_num <= 'S0019'
SELECT *
FROM tbl_student
WHERE st_num BETWEEN 'S0010' AND 'S0019';

--이름이 '기'로 시작되는 모든 데이터를 조회
--LIKE 조회 연산자는 가장 느리다 
SELECT *
FROM tbl_student
WHERE st_name LIKE '기%'; -- '%기'


--full scan 검색
--INDEX등의 검색 최적화 기능을 모두 사용하지 않는다
SELECT *
FROM tbl_student
WHERE st_name LIKE '%기%';

SELECT *
FROM tbl_student
WHERE st_addr LIKE '%북%'

--주소에 북 문자열이 포함된 모든 데이터를 보여달라
--조회된 데이터에서 주소 칼럼을 기준으로 오름차순 정렬하라
SELECT *
FROM tbl_student
WHERE st_addr LIKE '%북%'
ORDER BY st_addr; --ASC(오름차순)가나다순,ABC순,1234순

SELECT *
FROM tbl_student
WHERE st_addr LIKE '%북%'
ORDER BY st_addr DESC; --DESCENDING(냬림차순) ,다나가,CBA,4321


SELECT * FROM tbl_score;

SELECT * 
FROM tbl_score
WHERE st_eng > 50;

SELECT *
FROM tbl_score
WHERE st_num BETWEEN '00000' AND '00004';

SELECT * 
FROM tbl_score
WHERE st_num BETWEEN '00000' AND '00004'
ORDER BY st_num ASC;

DROP TABLE tbl_score;

--학생의 점수를 저장할 Table 생성하기
--학번,국어,영어,수학 항목을 저장하기
--고정문자열 : CHAR(최대크기)
--가변문자열 : VARCHAR2(최대크기)
--한글가변문자열 : nVARCHAR2(최대크기)
--숫자 : NUMBER(자릿수 , 소수)

--한 학생의 점수가 2중 3중으로 INSERT되어 엉뚱한 결과가
--나타 날 수 있다 
--제약조건 부여 
--1.학번은 중복 될 수 없고 절대 NULL이어서는 안된다 
--  NOT NULL UNIQUE : PK 선언하는 것도 좋은 방법
--2.점수가 없는 학생의 데이터는 이후에 연산을 수행 할 때 
--  문제를 일으킬 수 있기 때문에 NULL값이 없도록 하자
CREATE TABLE tbl_score(
    sc_num CHAR(5) PRIMARY KEY,
    sc_kor NUMBER NOT NULL,
    sc_eng NUMBER NOT NULL,
    sc_math NUMBER NOT NULL);
    
    CREATE TABLE tbl_score(
    sc_num CHAR(5),
    sc_kor NUMBER NOT NULL,
    sc_eng NUMBER NOT NULL,
    sc_math NUMBER NOT NULL,
    PRIMARY KEY(sc_num)
    );
    
    
--CREATE로 작성한 칼럼의 순서대로 모든 데이터를 포함하여
--INSERT 수행하기 
--항상 CREATE로 작성한 칼럼의 순서를 기억해야 하고
--      순서가 바뀌면 전혀 엉뚱한 데이터가 INSERT 될 수 있다
--모든 칼럼에 데이터를 포함해야 한다


--INSERT를 수행할때 데이터 칼럼을 나열하면
--순서롤 몰라도 상관없고,필요한 칼럼만 데이터를 포함하여 수행 할 수 있다
INSERT INTO tbl_score(sc_num, sc_kor, sc_eng, sc_math) --순서바껴도 상관없음
VALUES ('00004',90,80,60);   

INSERT INTO tbl_score
VALUES ('00001',90,80,70);

CREATE TABLE tbl_score(
    sc_num	CHAR(5)		PRIMARY KEY,
    sc_kor	NUMBER	NOT NULL,	
    sc_eng	NUMBER	NOT NULL,	
    sc_math	NUMBER	NOT NULL
)

SELECT * FROM tbl_score;

--국어점수가 90점 이상인 리스트
SELECT * FROM tbl_score
WHERE sc_kor >= 90;

SELECT sc_num AS 학번, sc_kor AS 국어,sc_eng AS 영어, sc_math AS 수학,
        sc_kor + sc_eng + sc_math AS 총점
FROM tbl_score;
--데이터를 보여줄 때 머릿글(칼럼제목)을 바꾸어서 보이기 
--AS(Alias,별명)
SELECT sc_num AS 학번, sc_kor AS 국어,sc_eng AS 영어, sc_math AS 수학,
        sc_kor + sc_eng + sc_math AS 총점
FROM tbl_score
WHERE (sc_kor + sc_eng + sc_math) >= 250;

--총점이 150 이상이고 250이하인 학생만 보여라
SELECT sc_num AS 학번, sc_kor AS 국어,sc_eng AS 영어, sc_math AS 수학,
        sc_kor + sc_eng + sc_math AS 총점
FROM tbl_score
WHERE (sc_kor + sc_eng + sc_math) >= 250 AND (sc_kor + sc_eng + sc_math) <= 150;


--SELECT를 사용하여 데이터를 조회하는데
--계산하는 칼럼도 있고
--자꾸 문법이 복잡해 지려고한다
--SELECT된 명령문을 VIEW 객체로 생성을 해둔다
--VIEW는 사용법이 TABLE과 같다
--      단,기본은 SELECT만 된다
CREATE VIEW view_score
AS
(    
    SELECT sc_num AS 학번, sc_kor AS 국어,sc_eng AS 영어, sc_math AS 수학,
            sc_kor + sc_eng + sc_math AS 총점
    FROM tbl_score
);

SELECT * 
FROM view_score
WHERE 총점 >= 150 AND 총점 <= 250;

--영어 선생님에게 전체학생의 정보를 보여줘야 한다
--다른과목의 점수는 감추고 싶다
--보안적인 측면에서 사용자별로
--보여줄 항목, 보이지 않을 항목을 선별하여 VIEW를 작성해두면
--불필요한 정보가 노출되는것을 최소화 할 수 있다
CREATE VIEW view_영어점수
AS(
SELECT sc_num AS 학번, sc_eng AS 영어
FROM tbl_score
WHERE 학번 >= 'SC0030',
);

CREATE VIEW view_1반학생
AS(
SELECT sc_num AS 학번, sc_eng AS 영어, sc_math 수학
FROM tbl_score
WHERE sc_num >= 'S0010' AND sc_num <= 'S0020'
);
DROP VIEW view_1반학생;
SELECT * FROM view_1반학생;