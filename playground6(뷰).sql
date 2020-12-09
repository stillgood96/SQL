-- 뷰view
-- 다른 테이블을 기반으로 만들어진
-- 가상(논리적)의 테이블을 의미함
-- 뷰는 실제로 데이터를 저장하고 있지는 않음
-- 하지만, 사용자가 이 사실을 인지하지 못하고
-- 실제의 테이블처럼 조작 가능
-- order by 정렬 불가능
-- 선생님 왈 : 뷰 사용시 성능도 좋아진다.


-- 뷰의 목적 : 특정필드에만 접근 허용(보안의 측면)
--           데이터조작의 간소화 (조인/검색)

-- create view 뷰이름 as
-- select 문
-- alter view 뷰이름 as    // create or or replace view 뷰이름 as 셀렉문 도됨
-- select 문




-- ----------------------문제------------------------

-- 39) vip 고객의 아이디, 이름, 나이로 구성된 뷰생성
-- 단,이름은 우수고객으로 작성

-- 뷰 생성전 vip 확인
select csid,csname,age from customerTest
where grd ='vip';

-- vip 우수고객 뷰 생성
create view 우수고객 as
select csid,csname,age from customerTest
where grd ='vip';

-- 뷰 출력
select * from 우수고객;


-- 40) 제조업체별 제품수로 구성된 뷰 생성
-- 뷰이름은 업체별제품수로 지정

select company,count(pdNum) 제품수 from productTest
group by company;

create view 제조업체별제품수 as
    select company,count(pdNum) from productTest
    group by company;

select * from 제조업체별제품수;


-- 별칭을 써보기 보안을 신경써서
create view 제조업체별제품수3 (업체,제품수) as
select company,count(pdNum) from productTest
group by company;

select * from 제조업체별제품수3;



-- 41) 우수고객 뷰에서 나이가 25세 이상인 고객에 대한 모든 내용을 검색해보자.
select * from 우수고객
where age>=25;




-- ----------------뷰의 이용한 데이터 삽입, 수정, 삭제------------------
-- 뷰는 원본테이블의 분신이므로
-- 삽입, 수정, 삭제 작업은 원본테이블을 대상으로 진행
-- 단, 수정,삭제는 제한적으로 수행이 될 수 있다.

-- 42) 제품번호가 p08, 재고량이 1000, 제조업체가 신선식품인 새로운 제품의 정보를
-- 제품1 뷰에 삽입해보자. 그런 다음 제품1 뷰에 있는 모든 내용을 검색해보자
create view 제품1 as
    select pdNum ,qunatity,company from productTest;

insert into 제품1 values ('p08',1000,'신선식품');

select * from 제품1;

-- ----------sales_products2 테이블---------
-- 테이블의 컬럼에 특정 제약이 설정되어 있는경우
-- 뷰를 통한 데이터 삽입은 제한될 수 있음
create table sales_product2 (
    prodno int primary key, -- auto_increment = 임의의 값 집어 넣어줌
    prdname varchar(10) not null,  -- not null 필수입력
    stock int,
    price int,
    prdmaker varchar(10)
);
-- ----------sales_products2 테이블에서
-- 제품번호, 재고량, 제조업체를 골라서
-- 제품2라는 뷰를 생성하고
-- 제품번호는 9, 재고량은 5000,
-- 제조업체는 새로운식품이라는 정보를 추가함
create view 제품2 as
    select prodno,stock,prdmaker from sales_product2;

insert into 제품2 values (9,5000,'새로운식품');
-- 테이블에 not null 이들어간 컬럼이 있다면
-- 특정 컬럼을 뽑아온 뷰에
-- 새로운 값을 넣기란 불가능 하다.


-- prductTest 테이블에서
-- 제품명, 재고량, 제조업체를 골라서
-- 제품3이라는 뷰를 생성하고
-- 제품명이 얼큰라면의 정보를 삭제하세요
create view 제품3 as
select pdName,qunatity,company from productTest;

delete from productTest where pdName='얼큰라면';
-- prdname 컬럼이 기본키컬럼이 아니므로
-- 지우면 안되는 데이터까지 지워질수 있음

select * from 제품3;

-- 주문, 상품, 고객테이블을 조인하고
-- 판매데이터라는 뷰를 만드세요
-- 또한, banana 고객이 주문한 상품이름을 조회하세요
create view 판매데이터 as
select * from orderTest ot join productTest pt using(pdNum)
                           join customerTest ct using(csid);

select pdName from 판매데이터 where csid='banana';

-- 선생님ver
create view 판매데이터 as
    select * from orderTest ot
        join productTest pt using(pdNum)
        join customerTest ct using(csid); -- 와우 정답쓰~
        -- 서브쿼리를 써서 사용도 가능하겠지만 폭넓은 조회를 이용 하기 위해서는
        -- 조인을 사용합시다.




-- 사원,부서,위치 테이블을 조인하고
-- empdeptloc라는 뷰를 만드세요
-- 또한, king이라는 사원이 근무하는
-- 사무실의 도시를 조회하세요

create view empdeptloc as
    select * from employees emp
        join departments using(department_id)
        join locations using(location_id);

-- 수업ver
create or replace view departments2
    (department_id, department_name,dmgr_id,location_id)
    as
    select * from departments;
-- manager_id가 중복되어서 departments2로 뷰를 새로 만들었는데 왜만들었는지는 모르겠넹.. 흠

-- manager_id가 중복으로 걸려 manaager_id제외 전부 작성
create or replace view empdeptloc as
    select *
from employees e join departments2 d
using (department_id)
join locations using(location_id);

select first_name,last_name
       department_id,location_id,city
from empdeptloc
where last_name='King' or first_name='King';

