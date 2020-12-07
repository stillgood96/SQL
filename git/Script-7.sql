create table abc(
	a int primary key
);

-- 테이블 구조 보기
describe abc; 
desc abc;

-- x 라는 컬럼추가(문자(10))
-- alter table 테이블명 add 컬럼정의;
alter table abc 
add x varchar(10);

-- 기존 컬럼 삭제 , x를 지워보자 
-- alter table 테이블명 drop 컬럼명;
alter table abc
drop x;

-- 기존 컬럼 수정이 하고 싶다아아ㅏ아ㅏㅏ
-- alter table 테이블명 modify column 컬럼정의 


-- 성적데이터를 저장하기 위한 테이블 생성
-- 기본 : 이름,국어,영어,수학 컬럼 (모두 문자로 생성)
-- 추가 : 총점,평균,학점 (모두 숫자로 생성)

create table sungjuk (
	name 		varchar(10),
	kor			varchar(10),
	eng			varchar(10),
	math		varchar(10)
);

alter table sungjuk
add sum int,
add avg int,
add grd char(2);

alter table sungjuk
modify column name varchar(10) primary key;

alter table sungjuk modify column kor int;
alter table sungjuk modify column eng int;
alter table sungjuk modify column math int;
alter table sungjuk modify column avg decimal(5,2); -- 정수부 3자리 소수자리2자리

-- 테이블삭제
-- drop table 테이블명;
drop table abc;
drop table sungjuk;

desc sungjuk;

-- 테이블 이름 변경
-- alter table 테이블명
-- rename 새이름
alter table EMPLOYEES 
rename emp;
-- 외래어키 설정되어있던것도 자동으로 따라감


-- 제약조건 추가하기 
-- 테이블 생성시 제약조건은 컬럼단위 또는 행 단위로 설정가능


-- 데이터베이스에 생성된 제약조건 확인
select * from information_schema.table_constraints;

-- 기본키(primary key) 제약조건 생성
-- alter table 테이블명 add constraint 제약조건명 primary key(컬럼명);
-- 제약조건명 : pk_테이블명 

create table employees (
	employee_id 	int,
	first_name		varchar(25),
	last_name 		varchar(25)
);

alter table employees
add constraint pk_emp  -- 이름을 따로 설정해줌 나중에 찾기 편하게 하려고 써도그만안써도 그만 하지만 오라클에선 써야함
primary key (employee_id);


-- 기본키 제약조건 제거
-- alter table 테이블명
-- drop primary key		ex) mysql/mariadb

-- 다른 데이터베이스는 drop부분을
-- drop constraint 제약조건명; 이렇게 해야함 ex)오라클
alter table employees 
drop primary key;

-- 외래키 제약조건 추가/제거
-- alter table 테이블명 
-- add constraint 제약조건명
-- 제약조건명 : fk_외래키존재테이블_기본키가있는테이블
-- foreign key (컬럼명)
-- references 테이블명(컬럼명);

-- alter table 테이블명
-- drop constraint 제약조건명; 

create table emp2 (
	empid int ,
	fname varchar(25),
	lname varchar(25),
	deptid int
);

create table dept (
	deptid int ,
	dname varchar(30),
	mgrid int
);

alter table emp2
add constraint pk_emp2
primary key (empid);

alter table dept
add constraint pk_dept
primary key (deptid);


select * from information_schema.table_constraints;

alter table emp2 
add constraint fk_emp_dept
foreign key (deptid)
references dept(deptid);


-- not null 제약 조건 추가
-- 컬럼에 null(빈값)을 입력못하게 설정하는 제약 생성
-- 컬럼단위 : 컬럼명  컬럼유형 not null

create table emp3 (
	empid 	int ,
	fname 	varchar(25) not null,
	lname 	varchar(25) not null,
	job_id 	varchar(10),
	comm 	decimal(5,2)
);


-- 초기값 제약조건 추가
-- 컬럼에 값 입력 누락시 자동으로 값을 설정하게 해주는 제약
-- 컬럼단위 : 컬럼명 컬럼유형 default 기본값 

create table member (
	userid			varchar(18),
	password		varchar(18),
	name			varchar(10),
	grade			varchar(10) default 'bronze',
	point 			int			 default 1000,
	regdate			timestamp	default current_timestamp
	);








