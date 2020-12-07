-- 1) 모든 도서의 이름과 가격을 조회하세요
select bookname,price
from books;
-- 1b) 모든 도서의 가격, 이름을 조회하세요
select price,bookname
from books;

-- 2) 모든 도서의 번호,이름, 출판사,가격을 조회하세요
select bookid,bookname,publisher ,price
from books;

select * from books;

-- 2b) 모든 도서의 정보를 조회하세요
select bookid,bookname,publisher ,price
from books;

-- 3) 모든 도서의 출판사를 조회하세요
select publisher
from books;

-- 3b) 모든 도서의 출판사를 조회하세요 (중복제거)
select distinct publisher
from books;

-- 4) 고객의 이름, 전화번호를 조회하세요
-- 단, 출력결과의 필드명을 '이름,전화번호'로 바꿔 출력
select name as 이름 , phone as 번호
from bookMembers;

-- 5) 고객의 이름과 주소를 조회하세요
select name, address
from bookMembers;

-- 6) 가격이 20000미만인 도서를 조회하세요
select bookid,bookname,price
from books
where price<20000;

-- 7) 가격이 15000이상 ~ 25000이하인 도서의 제목을 조회하세요
select bookname,price
from books
where price between 15000 and 25000;

-- 8) 책이름이 '축구의 역사' 또는 '피겨 교본'인 도서의 출판사를 조회하세요
select bookname,publisher
from books
where bookname = '축구의 역사' or bookname = '피겨 교본';

select bookname, publisher from books
where bookname in ('축구의 역사','피겨 교본');

-- 9) '축구'로 시작하는 도서 이름을 조회하세요
select bookname
from books
where bookname like '축구%';

-- 9b) '축구'로 끝나는 도서 이름을 조회하세요
select bookname
from books
where bookname like '%축구';

-- 9c) '축구'를 포함하는 도서 이름을 조회하세요
select bookname
from books
where bookname like '%축구%';

-- 9d) 도서이름 중에 '의'를 포함하는 책은?
select bookname
from books
where bookname like '%의%';

-- 10) '골프'를 포함하고 가격이 30000이상인 도서 이름을 조회하세요
select bookname,price
from books
where bookname like '%골프%' and price>=30000;

-- 11) 고객이름을 가나다순으로 오름차순 정렬하고
-- 이름이 같으면 주소로 내림차순 정렬해서 조회하세요
select name, address
from bookMembers
order by name,address desc;

-- 11b) 도서의 가격을 내림차순으로,
-- 가격이 같으면 출판사이름으로 오름차순 정렬해서 조회하세요
select price ,publisher
from books
where price = price
order by price desc,publisher asc;

select price, publisher from books
order by price desc, publisher desc;

-- 12) 고객이 주문한 도서의 총, 평균, 최고,
-- 최저 판매액을 조회하세요
select sum(saleprice) as 총주문금액,
       avg(saleprice) as 평균금액,max(saleprice) 최고금액
from bookOrders;

-- 13b) 출판사별 도서의 총 수량 조회하세요
select DISTINCT publisher, count(bookid)
from books
group by publisher;

--  14) 출판사별 도서의 총 수량이 2권이상인 출판사 조회하세요
select DISTINCT publisher, count(bookid) 도서수량
from books
group by publisher
having 도서수량 >=2;

-- 14b) 가격이 8000이상인 도서를 구매한 고객별
-- 주문 도서의 총 수량을 구하세요
select custid, count(bookid)
from bookOrders
where saleprice>=8000
group by custid;


-- 14b) 가격이 8000이상인 도서를 구매한 고객별
-- 주문 도서의 총 수량을 구하세요
-- 단, 고객별 2권이상 주문한 고객을 대상으로 한다
select custid,count(orderid) 주문권수
from bookOrders
where saleprice>=8000
group by custid
having 주문권수>=2;

--  15) 주문한 고객번호,고객이름과 주문금액,주소를 조회하세요
-- 고객테이블과 주문테이블을 결합해야 조회가능
-- 즉, 외래키 관계에 있는 컬럼을 대상으로 결합
select bo.custid,bm.name,bo.saleprice ,bm.address
from bookOrders bo
         inner join bookMembers bm on(bo.custid = bm.custid)
order by bo.custid asc,bo.saleprice desc;


--  15b) 박지성 고객의 주문금액,주소,주문일자를 조회하세요
-- 고객테이블과 주문테이블을 결합해야 조회가능
-- 즉, 외래키 관계에 있는 컬럼을 대상으로 결합
select bo.custid ,bm.name,bm.address ,bo.saleprice ,bo.orderdate
from bookOrders bo
         inner join bookMembers bm on(bo.custid=bm.custid)
where bo.custid =1;


--  16) 주문한 도서이름,주문금액,주문일자를 조회하세요
select bookid ,saleprice ,orderdate
from bookOrders;



-- 19) 가격이 20000인 도서를 주문한 고객 이름 조회하세요
-- 고객테이블과 주문테이블을 결합해야 조회가능
-- 즉, 외래키 관계에 있는 컬럼을 대상으로 결합
select bm.name
from bookOrders bo
         inner join bookMembers bm on(bo.custid=bm.custid)
where saleprice =20000;
--  20) 주문한 고객이름, 도서이름, 주문일자 출력하세요
-- 도서/고객테이블과 주문테이블을 결합해야 조회가능
-- 즉, 외래키 관계에 있는 컬럼을 대상으로 결합
-- join에 대해 알아보기
SELECT bo.custid ,bm.name,b2.bookname ,bo.orderdate
FROM bookOrders bo
         inner join bookMembers bm on (bo.custid=bm.custid)
         inner join books b2 on (b2.bookid=bo.bookid)
order by bo.custid asc;





-- 21) 도서를 구매하지 않은 고객을 포함하여
--    고객이름과 주문한 도서의 판매금액을 조회하세요
-- 도서/고객테이블과 주문테이블을 결합해야 조회가능
-- 즉, 외래키 관계에 있는 컬럼을 대상으로 결합
-- 결합후 특정 방향에 있는 테이블의 컬럼값을 조회
SELECT bm.name ,bo.saleprice
from bookMembers bm
         left outer join bookOrders bo on(bm.custid=bo.custid);


-- ------------------A3 문제----------------------

-- 15) 주문한 고객번호,고객이름과 주문금액,주소를 조회하세요
SELECT bookOrders.custid,name,saleprice,address
FROM bookOrders
INNER JOIN bookMembers ON bookOrders.custid = bookMembers.custid
order by custid asc, saleprice desc;

-- 15b) 박지성 고객의 주문금액,주소,주문일자를 조회하세요
SELECT bookOrders.custid,name,saleprice,address,orderdate
FROM bookOrders
         INNER JOIN bookMembers ON bookOrders.custid = bookMembers.custid
where name='박지성'
order by custid asc, saleprice desc;

-- 16) 주문한 도서이름,주문금액,주문일자를 조회하세요
select orderid,bookname,saleprice,orderdate
from bookOrders
inner join books on books.bookid=bookOrders.bookid
order by orderid asc;




-- 19) 가격이 20000인 도서를 주문한 고객 이름 조회하세요
select name
from bookOrders
inner join bookMembers on bookOrders.custid=bookMembers.custid
where saleprice =20000;

-- 21) 도서를 구매하지 않은 고객을 포함하여
--    고객이름과 주문한 도서의 판매금액을 조회하세요
select name,saleprice
from bookMembers
left outer join bookOrders bO on bookMembers.custid = bO.custid;