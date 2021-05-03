--여기는 bookuser접속
/*
일련번호 칼럼

보통 일반적인 데이터를 저장하는 테이블은
한개의 칼럼으로 PK 설정하고 데이터를 관리한다
도서정보, 출판사정보, 저자정보, 회원정보

이러한 Table을 Master Table 이라고 한다.
Master Data 라고 부른다.

Master Data는 전체적으로 업무를 수행하는데 중요한 데이터이다
초기에 데이터가 만들어지면 새로 추가, 수정, 삭제가 별로 
발생하지 않는 데이터이다.

그에 비하여 도서대여정보(tbl_book_rent)와 같은 데이터는 
수시로 데이터가 INSERT 되는 table이다
이러한 Table을 Work Table, Work Data라고 한다.
Table(Entity) 설계를 할 때  Work Table은 1개의 칼럼만으로
PK를 설정하기가 매우 어려운 경우가 많다
PK를 2개 이상의 칼럼으로 묶어서 만들기도 하지만 
PK는 유일성과 최소성을 만족하는 것이 좋은 설계이다
따라서 이러한 경우 PK를 위한 별도의 일련번호 칼럼을 만들고
관리를 하는 것이 일반적이다 

일반적인 DBMS에는 그러한 칼럼에 AUTO INCREMENT라는 속성을 부여하여
INSERT 할 때 자동으로 일련번호를 만들어 주는데 
오라클에서는 그러한 기능이 없어서 
SEQUENCE 객체를 별도로 생성하고 SEQUENCE 객체의 NEXTVAL 명령을
호출하여 일련번호를 생성한 후 INSERT에서 활용한다
*/


/*
PK(PRIMARY KEY)
데이터 개체 무결성을 보장하기 위한 제약조건
만약 데이터를 변경(갱신,수정)하거나 삭제할 때 
변경되거나 삭제되지 않아야 할 데이터에는 아무런 영향이 없게
하기 위한 제약조건 
UPDATA... WHERE PK칼럼 = '값'
DELETE... WHERE PK칼럼 = '값'
과 같은 코드를 사용하여 변경이나 삭제는 1개의 레코드(데이터)만
영향을 미치도록 하는 사전 조치
PK = 개체무결성, 유일한(UNIQUE), 빈값이 없이(NOT NULL)

FK(FOREIGN KEY)
2개 이상의 테이블을 연동하는 프로젝트에서 
Master에 없는 데이터가 Work에 존재하는 것을 막는 사전조치
FK = 참조무결성, work에 저장된 데이터는 의미 없는 것이 없다
*/