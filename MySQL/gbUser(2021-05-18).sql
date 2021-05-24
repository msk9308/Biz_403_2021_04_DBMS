-- 여기는 gbUser 접속화면
SHOW DATABASES;
USE GuestBook;
DROP TABLE tbl_guest_book;
CREATE TABLE tbl_guest_book(
	gb_seq	BIGINT	AUTO_INCREMENT	PRIMARY KEY,
	gb_date	VARCHAR(10)	NOT NULL,
	gb_time	VARCHAR(10)	NOT NULL,	
	gb_writer	VARCHAR(30)	NOT NULL,
	gb_email	VARCHAR(30)	NOT NULL,	
	gb_password	VARCHAR(125)	NOT NULL,	
	gb_content	VARCHAR(2000)	NOT NULL
);

INSERT INTO tbl_guest_book(gb_date, gb_time, gb_writer, gb_email, gb_password, gb_content)
VALUES('2021-05-18', '10:2:00','callor', 'callor@callor.com' ,'12345','오늘은 화요일');

INSERT INTO tbl_guest_book(gb_date, gb_time, gb_writer, gb_email, gb_password, gb_content)
VALUES('2021-05-18', '10:2:00','callor', 'callor@callor.com' ,'12345','내일은 석가탄신일');

SELECT * FROM tbl_guest_book;
SELECT COUNT(*) FROM tbl_guest_book;
SELECT * FROM tbl_guest_book
WHERE gb_date = '2021-05-18';

SELECT * FROM tbl_guest_book
ORDER BY gb_seq DESC;

-- 날짜와 시간기준으로 최신글이 제일 먼저 보이도록
SELECT * FROM tbl_guest_book
ORDER BY gb_date DESC, gb_time DESC;

-- UPDATE와 DELETE 를 수행 할 때는 
-- 2개이상의 레코드에 영향이 미치는 명령은 매우신중하게 실행해야한다
-- 가장 좋은 방법은 변경,삭제하고자 하는 데이터가 
-- 여러개 있더라도 가급적 PK를 기준으로 1개씩 처리하는것이 좋다 
UPDATE tbl_guest_book
SET gb_time = '10:36:00'
WHERE gb_seq = 2;

DELETE FROM tbl_guest_book
WHERE gb_seq = 1;

ROLLBACK;

SELECT * FROM tbl_guest_book;

SELECT 30 * 40;
-- MySQL 고유함수로 문자열을 연결할 때
SELECT CONCAT('대한','민국','만세');

SELECT * FROM tbl_guest_book
WHERE gb_content LIKE '%오늘%';

SELECT * FROM tbl_guest_book
WHERE gb_content LIKE CONCAT('%','내일','%');

-- Oracle의 DECODE()와 유사한 형태의 조건연산 
-- gb_seq의 값이 짝수이면 짝수로 표시
-- 아니면 홀수로 표시
SELECT IF(MOD(gb_seq, 2) = 0,'짝수','홀수')
FROM tbl_guest_book;

-- 0~99까지 임의의 정수 생성 
SELECT floor(RAND() * 10);
SELECT IF(MOD(FLOOR(RAND() *100) ,2) =0, '짝수','홀수');

SELECT COUNT(*) FROM tbl_guest_book;
SELECT * FROM tbl_guest_book;
SELECT * FROM tbl_guest_book
WHERE gb_writer = '지눌';

SELECT * FROM tbl_guest_book
ORDER BY gb_date DESC, gb_time DESC;

SELECT * FROM tbl_guest_book
WHERE gb_content
LIKE '%국가%'
ORDER BY gb_date DESC, gb_time DESC;

CREATE VIEW view_방명록 AS(
SELECT gb_seq '일련번호',
		gb_date '등록일자',
        gb_time '등록시간',
        gb_writer '등록자이름',
        gb_email '등록Email',
        gb_password '비밀번호',
        gb_content '내용'
FROM tbl_guest_book
);

SELECT * FROM view_방명록;