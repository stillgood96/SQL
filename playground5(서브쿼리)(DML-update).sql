-- 서브쿼리 subquery
-- 메인쿼리안에 또 다른 쿼리문으로 구성

-- 스칼라 서브쿼리 : 결과값으로 하나의 값이 조회
-- 인라인 뷰 : 결과값으로 여러개의 값이 조회

-- 질의문을 여러 단계로 구조화하기 때문에
-- 쿼리의 각부분이 의도하는 의미를 쉽게 파악

-- where, from , select 에 사용이 가능하다.




-- 26) 달콤 비스킷을 생산한 제조업체가 만든
-- 제품의 이름과 단가를 검색

-- a) 달콤비스킷을 생산한 제조업체
select pdname,company
from productTest
where pdName='달콤비스킷';
-- b) 한빛제과가 만든 제품의 이름과 단가를 검색
select pdname,price
from productTest
where company ='한빛제과';
-- c) 두개의 질의문을 하나로 합침
select pdname,price
from productTest
where company =(select company
from productTest
where pdName='달콤비스킷');




-- 27) 적립금이 가장 많은 고객의 이름과 적립금 조회


-- a) 가장 많은 적립금은?
select max(point) from customerTest;

-- b) 적립금이 5000인 고객의 이름과 적립금?
select csname,point from customerTest
where point =5000;

select csname, point from customerTest
where point =(select max(point) from customerTest);





-- 28) banana(2번) 고객이 주문한 제품의
-- 제품명과 제조업체를 조회


-- 내가 푼 ver
select pdNum,pdName,company
from orderTest join productTest using(pdNum)
where csid=(select csid from customerTest where csid='banana');

-- 선생님 ver
-- a) banana(2) 고객이 주문한 제품
select pdNum from orderTest
where csid = 'banana';
-- b) 주문 제품의 제품명과 제조업체를 조회
select pdName,company from productTest
where pdNum in('p06','p01','p04');
-- c) 두개의 질의문을 하나로 합침
select pdName,company from productTest
where pdNum in (select pdNum from orderTest
where csid = 'banana');
-- 제품 테이블에서 바나나가 산 제품을 뽑아내고싶어 할 때 쿼리문을 쓰네








-- 29) banana(2번) 고객이 주문하지 않은 제품의
-- 제품명과 제조업체를 조회

-- 내가 푼 ver
select pdName,company from productTest
where pdNum not in (select pdNum from orderTest
                    where csid = 'banana');

-- 선생님이 푼 ver
-- a) banana 고객이 주문한 제품
select pdNum from orderTest
where csid = 'banana';
-- b) 주문하지 않은 제품의  제품명과 제조업체를 조회
select pdName,company from productTest
where pdNum not in('p06','p01','p04');
-- c) 두개의 질의문을 하나로 합침
select pdName,company from productTest
where pdNum not in(select pdNum from orderTest
                   where csid = 'banana');








-- 30) 대한식품이 제조한 모든 제품의 단가보다
-- 비싼 제품의 제품명, 단가,제조업체 조회

-- 내가 푼 ver
select pdname,price,company from productTest
where price >(select max(price) from productTest where company='대한식품');


-- 선생님 ver
-- a) 대한식품이 제조한 모든 제품의 단가
select pdName,price from productTest where company='대한식품'; -- 4500, 1200
-- b) 4500,1200 보다 비싼 제품의 제품명, 단가, 제조업체 조회
select pdName,price,company from productTest where price > (4500,1200);-- 부등호는 단일값에만 사용한다.

-- c) 두개의 질의문을 합침
select pdName,price,company
from productTest
where price>all(select price from productTest where company='대한식품');
-- max와 min을 사용하면 쉽게 뽑을수있지만 세세하게 모든 제품 단가를 비교해서 하려면
-- 'all'을 사용해서 4500원 1200원의 가격을 뽑아내서 all로 4500,1200원 가격을 비교하게
-- 설정해준다.

-- 제조한 '모든'제품이라서 최소 최대로 정의해서 비교하는 것보다 모든 경우를 비교하는 듯.






-- 31) 2019년 3월 15일에 제품을 주문한
-- 고객의 이름 조회

-- 내가 푼 ver 이거 32번문제인데 헷갈려서 31번에 풀었네
select csid from orderTest where orderdate <> (select orderdate from orderTest where
    orderdate = '2019-03-15');

-- 선생님 ver
-- a) 2019년 3월 15일에 주문한 제품
select csid from orderTest where orderdate = '2019-03-15';
-- b) 주문한 고객의 이름 조회
select csname from customerTest where csid = 'apple';
-- c) 두개의 질의문을 하나로 합침
select csname from customerTest
where csid = (select csid from orderTest where orderdate = '2019-03-15');

-- d) inner join 으로도 풀 수 있다 ! 실습
select csname from orderTest ot inner join customerTest cT using(csid)
where orderdate='2019-03-15'; -- 내가 푼 ver.

select csid,csname from orderTest o join customerTest c using(csid) -- 조인후 비교값이 같으면 using 이 굿
where orderdate='2019-03-15'; -- 수업 ver

-- 서브 쿼리사용시 시스템 메모리 많이 사용안함  join 사용시 성능저하 야기함
-- 조인 , 서브쿼리로 둘다 작성할 수 있다면 서브쿼리 권장.




-- 32) 2019년 3월 15일에 제품을 주문하지 않은 고객의 이름 조회

-- a) 2019년 3월 15일에 주문한 고객
select csid from orderTest where orderdate='2019-03-15';


-- b) 주문한 고객의 이름 조회
select csname from customerTest where csid='apple';

-- c) 두개의 질의문을 하나로 합침
select csname from customerTest where csid <> (select csid from orderTest
    where orderdate = '2019-03-15');


-- DML : update
-- 데이터베이스의 특정 레코드의 값을 변경할때 사용
-- update 테이블명
-- set 변경할컬럼명 = 새로운값,....
-- where 조건식                                조건식을 무조건 써야한다함.


-- 33) 제품테이블에서 제품번호가 p03인 제품명을
-- 통큰파이로 변경하세요
update productTest
set pdName = '통큰파이'
where pdNum='p03';          -- where절 부재시 모든 컬럼값이 '통큰파이'로 바뀜 주의 !!

-- 34) 제품테이블에 있는 모든 제품의 단가를
-- 10% 인상하세요 그 결과를 조회하세요
update productTest
set price = price *1.1;

select pdName,price from productTest;


-- 35) 정소화 고객이 주문한 제품의 수량을 5개로 수정하세요

-- 방법1)
update customerTest c join orderTest oT
using (csid)
set quantity=5
where csname='정소화';

select * from orderTest;


-- 방법2) 서브쿼리 사용
-- a)정소화 고객의 csid
select csid from customerTest
where csname ='정소화';
-- b) 정소화고객이 주문한 제품의 수량 변경
update orderTest
set quantity=5
where csid='apple';
-- c) 두개의 질의문을 하나로 합침

update orderTest
set quantity=6
where csid = (
    select csname from customerTest where csname='정소화'
);



-- DML : delete
-- 지정한 레코드(행)을 삭제함
-- delete from 테이블명
-- where 조건식;           - 조건식에 맞는 데이터 몽땅 지워짐

-- 36) 주문일자가 2019-05-22인 주문내역을 삭제하세요
delete from orderTest
where orderdate='2019-05-22';

select * from orderTest ;

-- 37) 정소화고객이 주문한 제품의 수량을
-- 5개로 수정하세요
delete from orderTest
where csid = (
    select csname from customerTest where csname='정소화'
    );

-- 38) 주문 내역을 모두 삭제하세요
delete from orderTest;       -- 다지울 때 위에 tx를 수동을 바꿔야한다 그래야 즉각적으로 반응안옴
select * from orderTest;     -- 롤백하려면 무조건 수동!!!!!!!!!!!!!!!!!!!
                            -- 수동은 commit; 을해야 db에 적용하는거임

rollback;

