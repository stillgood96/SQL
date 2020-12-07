-- 2020-12-03 수업
-- DML
-- 데이터 삽입문 : insert
-- 문법1 : insert into 테이블명 values (컬럼값, ...)
-- 문법2 : insert into 테이블명(대상컬럼, ...)
--                     values (대상컬럼값,...)


create table member (
	userid			varchar(18),
	password		varchar(18),
	name			varchar(10),
	grade			varchar(10) default 'bronze',
	point 			int			 default 1000,
	regdate			timestamp	default current_timestamp
	);

-- member 테이블에 회원정보 입력
-- 회원 아이디가 abc123이고 비밀번호가 zyx987이고
-- 이름은 홍길동, 등급은 'rookie', 적립금은 50000,
-- 가입일은 '2021-12-03 12:12:12'인 회원정보를 삽입

insert into member values
('abc123','zyx987','홍길동','rooke',
50000,'2020-12-03 12:12:12');
-- 테이블에 값 삽입시 값의 갯수는 컬럼의 갯수와 동일해야 함 

insert into member values
('a787574','787574','이선우','gold',200000,'2020-12-03-13:03:42');

select * from member;

-- 회원 아이디가 xyz456이고 비밀번호가 123456이고
-- 이름은 '지현'인 회원정보를 삽입

-- 나머지 정보는 입력하기 싫을때 방법1
insert into member values ('xyz456','123456','지현'
,null,null,null);
-- 나머지 정보에는 null값이 들어가지만 방법2를 썼을때는
-- 테이블 생성시 디폴트 값을 설정해놨다면 디폴트 값이 들어간다. 

-- 나머지 정보는 입력하기 싫을때 방법2
insert into member (userid,password,name)
values ('xyz456','123456','지현2');


-- 테이블에 특정 컬럼에만 값 삽입시
-- values 앞에 대상컬럼을 나열해서
-- 값의 갯수를 일치시켜야함



-- 대량의 데이터를 insert 하기 
-- bulk insert 
insert into 테이블명 values 
(),(),(),(),(),(),(),();


-- 데이터 조회 : select
-- 1. 기본적인 테이블 컬럼 조회 
-- select 컬럼목록 from 테이블명;

-- 1) 고객테이블에서 아이디, 이름, 등급을 조회하세요
select from customerTest;