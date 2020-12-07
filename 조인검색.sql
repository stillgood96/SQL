-- 조인 검색
-- 여러 개의 테이블을 결합해서
-- 원하는 데이터를 검색하는 것
-- 다중 테이블을 대상으로 하는 연산
-- 조인 방법 :
-- cross join : cartesian product
-- inner join : 조건에 맞는 값만 가져옴
-- outer join : 조건에 맞지 않은 값도 가져옴
-- self  join : 자기자신을 대상으로 조인 수행


--     ---------inner join----------
-- 각 테이블간에 존재하는 동일한 컬럼을 대상으로
-- 결합해서 결과 조회

-- 방법1)
-- select A.a, A.b, B.a, B.b from A,B
-- where A.a = B.b and

-- 방법2)
-- select 컬럼들... from A inner join B
-- on A.a = B.b (표준)

-- 방법3)
-- select 컬럼들... from A inner join B
-- using (a) (표준)

-- 23) 주문테이블에서 banana 고객이 주문한
-- 상품의 이름을 조회하세요
-- a. 두 테이블 결합하기 cartesian product
select * from orderTest, productTest
where orderTest.pdNum = productTest.pdNum;
-- 테이블명이 길어서 별칭을 사용해서 간단히 작성
select * from orderTest ot, productTest pt
where ot.pdNum = pt.pdNum;

-- 버전2)
select*
from orderTest ot
inner join productTest pt
on ot.pdNum = pt.pdNum;

-- 버전3)
select*
from orderTest ot inner join productTest pt
using (pdNum);


select ordNum,pdNum,pdName
from orderTest ot inner join productTest pt
using (pdNum)
where csid = 'banana';

-- 24) 주문 테이블에서 나이가 30세 이상인
-- 고객이 주문한 제품의 주문제품과 주문일자를 조회하세요
select ot.csid,cT.age,ot.pdNum,pT.pdName, ot.orderdate
from orderTest ot
inner join customerTest cT on ot.csid=cT.csid
inner join productTest pT on ot.pdNum = pT.pdNum
where age >=30;

-- 25) 주문 테이블에서 고명석 고객이
-- 주문한 제품의 이름을 조회하세요
select cT.csname,pT.pdName
from orderTest ot
inner join customerTest cT on ot.csid = cT.csid
inner join productTest pT on ot.pdNum = pT.pdNum
where cT.csname='고명석';

-- 선생님 ver
select csname,pdName
from orderTest ot
         inner join customerTest cT
         inner join productTest pT
         on ot.csid = cT.csid
         and ot.pdNum = pT.pdNum
where csname = '고명석';

select csname, pdName
from orderTest ot
inner join customerTest ct using(csid)
inner join productTest pt using(pdNum)
where csname = '고명석';






