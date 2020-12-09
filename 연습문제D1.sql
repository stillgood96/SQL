-- northwind 데이터셋 이용

-- 1. 고객 테이블을 조회하세요
select * from Customers;

-- 2. 고객테이블에서 고객이름과 도시를 조회하세요
select CustomerID,city from Customers;

-- 수업 ver
select ContactName,City from Customers;

-- 3. 고객 테이블에서 도시를 조회하세요
-- (중복은 제외한다)
select  city from Customers
group by city;
-- 수업 ver
select distinct City from Customers;



-- 4. 고객 테이블에서 국가 수를 조회하세요
select distinct count(Region) from Customers; -- 31 선우 ㅂㅅ
-- 수업 ver
select  count(distinct country) 국가수 from Customers; -- 21

-- 5. 고객 테이블에서 국가가 'Mexico'인 고객을
-- 조회하세요
select CustomerID from Customers
where Region='Mexico';
-- 멕시코인사람이 없네

-- 수업 ver
select ContactName from Customers
where country ='Mexico';

-- 6. 사원 테이블에서 ID가 5인 사원을 조회하세요
select *
from Employees
where EmployeeID=5;
-- 수업 ver
select * from Employees where EmployeeID=5; -- 정다ㅃ쓰~




-- 7. 고객 테이블에서 국가가 'Germany'이고
-- 도시가 'Berlin'인 고객을 조회하세요
select *
from Customers
where Region='Germany' and city='Berlin';
-- 마찬가지로 없다고 나옴

-- 수업 ver
select * from Customers
where Country='Germany' and city='Berlin';

-- 8. 고객 테이블에서 도시가 'Berlin' 이거나
-- 'München'인 고객을 조회하세요
select * from Customers where City='Berlin' or 'München';

-- 수업 ver
select * from Customers where City='Berlin' or 'M?chen'; -- M?chen
select * FROM Customers where city in('Berlin','München');

-- 9. 고객 테이블에서 국가가 'Germany' 또는
-- 'Spain' 인 고객을 조회하세요
select *
from Customers
where Country='Germany' or Country = 'Spain';

-- 수업 ver
select * from Customers
where Country in ('Germany','Spain');


-- 10. 고객 테이블에서 국가가 'Germany' 이 아닌
-- 고객을 조회하세요
select * from Customers
where Region <> 'Germany';
-- 수업 ver
select * from Customers
where Country not in('Germany');
select * from Customers
where Country !=('Germany');
select * from Customers
where Country <>('Germany');s


-- 11. 고객 테이블에서 국가가 'Germany' 이고 도시가
-- 'Berlin' 이거나 'München'인 고객을 조회하세요
select * from Customers
where Region='Germany' and city ='Berlin' or city='München';

-- 수업 ver
select * from Customers
where Country='Germany' and city in('Berlin','München');



-- 12. 고객 테이블에서 국가가 'Germany' 아니고
-- 'USA'도 아닌 고객을 조회하세요
select * from Customers
where Region <> 'Germany' and Region <> 'USA';

-- 수업 ver
select * from Customers
where Country NOT in('Germany','USA');

-- 13. 고객 테이블에서 국가순으로 A-Z로
-- 정렬해서 조회하세요
select *
from Customers
order by Region asc;

-- 수업 ver
select * from Customers
order by Country;


-- 14. 고객 테이블에서 국가순으로 Z-A로
-- 정렬해서 조회하세요
select *
from Customers
order by Region desc;

-- 수업 ver
select * from Customers
order by Country desc;

-- 15. 고객 테이블에서 국가순으로 A-Z로 정렬하되,
-- 같은 경우 고객이름으로 A-Z로 정렬해서 조회하세요
select *
from Customers
order by Region asc , CustomerID asc;

-- 수업 ver
select * from Customers
order by Country,ContactName;

-- 16. 고객 테이블에서 국가순으로 A-Z로 정렬하되,
-- 같은 경우 고객이름으로 Z-A로 정렬해서 조회하세요
select *
from Customers
order by Region asc , CustomerID desc;

-- 수업 ver
select * from Customers
order by Country asc, ContactName desc;

-- 17. 다음의 고객정보를 고객 테이블에 입력하세요
-- 회사이름, 연락처이름, 주소, 도시, 우편번호, 국가 =>
-- 'Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway'
insert into Customers (CompanyName,ContactName,Address,City,PostalCode,Region)
values ('Cardinal','Tom B. Erichsen','Skagen 21','Stavanger','4006','Norway');


-- 수업 ver
insert into Customers (CompanyName,ContactName,Address,ContactName,PostalCode,Country)
values('Cardinal','Tom B. Erichsen','Skagen 21','Stavanager','4006','Norway');
-- 고객 테이블에서 primary key 인 customerID가 빈값이 들어가면 안되기때문에
-- 오류가 날텐데 문법적인 부분만 알고 넘어가도록 하자 보통은
-- 기본 값을 설정해두면 그 기본값이 들어 가면서 설정이 가능한데 이테이블에서는
-- 기본 값을 설정안해놓았다. ~~~~ 룰륄랄라



-- 18. 다음의 고객정보를 고객 테이블에 입력하세요
-- 회사이름, 도시, 국가 => 'Cardinal', 'Stavanger', 'Norway'
-- 패스

-- 수업ver
insert into Customers (CompanyName,city,Country)
    values ('Cardinal', 'Stavanger', 'Norway');
-- 위와 동일한 이유로 안들어간다 ~` 루루리리릐라ㅏㄹ



-- 19. 고객 테이블에서 주소가 입력되지 않은
-- 고객이름, 연락처이름, 주소를 조회하세요
select CustomerID,ContactName,Address
from Customers
where Address is null;

-- 수업ver
select CompanyName,ContactName,Address from Customers
where Address is null; -- 왜 CompanyName 으로 하는지는 몰겠씀 ㅎㅎ


-- 20. 고객 테이블에서 주소가 입력된 고객이름,
-- 연락처이름, 주소를 조회하세요
select CustomerID,ContactName,Address
from Customers
where Address is not null;

-- 수업ver
select CompanyName,ContactName,Address from Customers
where Address is not null;


-- 21. 고객 테이블에서 1번 고객의 연락처 이름을
-- 'Alfred Schmidt'로, 도시를 'Frankfurt'로
-- 수정하세요
UPDATE Customers set ContactName='Alfred Schmidt',City='Frankfurt'
where ROW ( 1 );
-- 고객테이블에서 번호 컬럼이 없는데 어떻게 1번고객의 연락처를바꾸남.?


-- 수업 ver
update Customers set ContactName='ALfred Schmidt', City='Frankfurt'
where CustomerID='ALFKI';
-- 1번곡객 -> (ALFKI) 로 수정해서 풀라고 합니다 하하 내 예상이 맞았따 !
-- LIMIT으로 풀면 안되는건감?




-- 22. 고객 테이블에서 국가가 Mexico인
-- 고객들의 연락처 이름을 'Juan'으로 변경하세요
update Customers
set ContactName ='Juan'
where Region='Mexico';

-- 수업ver
update Customers
set ContactName ='Juan'
where Country ='Mexico';

-- 근데 멕시코인사람ㅇ ㅣ없음 ㅋㅋㅋㅋㅋ --2020-12-09 ㅋㅋ region아니라 country야 어제의 멍청아.

-- 23. 고객 테이블에서 연락처 이름이 -> 회사이름 수정 2020-12-09.
-- 'Alfreds Futterkiste'인 고객들을 삭제하세요
select * from Customers where ContactName='Alfreds Futterkiste';
-- Alfreds Futterkiste 인 고객이 없소~ ㅋㅋ

-- 수업ver
delete from Customers
where ContactName='Alfreds Futterkiste' or
      CompanyName='Alfreds Futterkiste';


-- 24. 고객 테이블에서 3번째부터 7번째 고객을 조회하세요
-- 단, 고객이름은 A-Z로 정렬한다
CREATE view 3번7번고객 as
    select * from Customers limit 2,5;
select * from 3번7번고객 order by CustomerID asc;

-- 수업ver
-- 선생님왈: 우리가 아직 배우지 않은것 이런 것을 '페이징' 이라고 한다.
-- mariadb 에서 페이징은 'limit x,y' 절을 이용한다.
-- 하하 구글링으로 나는 이미 찾아내었지 ~~ 룰루리랄라
-- x : 시작위치 y : 가져올 데이터의 행수 (첫행은 0부터 시작한다.)
-- limit 0,5 : 0번째 위치에서 5개의 행을 읽어온다.(1~5)
-- limit 5,5 : 0번째 위치에서 5개의 행을 읽어온다. (6~10)
select * from Customers limit 2,5;



-- 25. 고객 테이블에서 국가가 'Germany' 인 고객들 중
-- 3번째부터 7번째 고객을 조회하세요
select * from Customers where Country='Germany' limit 2,5;

-- 수업ver
select * from Customers
where Country ='Germany'
order by CustomerID
limit 2,5;


-- 26. 제품테이블에서 최대, 최소 가격을 조회하세요
select min(UnitPrice) 최대가격,max(UnitPrice) 최소가격 from Products;

-- 수업ver
select min(UnitPrice),MAX(UnitPrice) from Products;

-- 27. 제품테이블에서 제품수, 평균가격을 조회하세요
select count(ProductID),avg(UnitPrice) from Products;

-- 28. 제품테이블에서 가격이 20이상인
-- 제품수를 조회하세요
select count(ProductID) from Products where UnitPrice>=20;


-- 29. 제품상세테이블에서 주문수, 총 주문수량을
-- 조회하세요
select count(OrderID), sum(Quantity) from Order_Details;


-- 30. 고객 테이블에서 고객이름이
-- 'A'로 시작하는 고객을 조회하세요
select * from Customers where CustomerID like 'A%';

-- 31. 고객 테이블에서 고객이름이
-- 'a'로 끝나는 고객을 조회하세요
select * from Customers where CustomerID like '%A';

-- 32. 고객 테이블에서 고객이름에 'or'을
-- 포함하는 고객을 조회하세요
select * from Customers where CustomerID like '%or%';

-- 32. 고객 테이블에서 고객이름의 2번째
-- 글자가 'r'로 시작하는 고객을 조회하세요
select * from Customers where CustomerID like '_r%';

-- 32. 고객 테이블에서 고객이름이 'A'로
-- 시작하고 최소 3자 이상인 고객을 조회하세요
select * from Customers where CustomerID like 'A_%';

-- 33. 고객 테이블에서 연락처이름이 'a'로 시작하고
-- 'o'로 끝나는 고객을 조회하세요
select * from Customers where ContactName like 'a%o';

-- 34. 고객 테이블에서 고객이름이 'A'로 시작하지
-- 않는 고객을 조회하세요
select * from Customers where CustomerID not like 'A%';

-- 35. 고객 테이블에서 도시이름이 'ber'로
-- 시작하는 도시를 조회하세요
select * from Customers where city like 'ber%';


-- 36. 고객 테이블에서 도시이름에 'es'를
-- 포함하는 도시를 조회하세요
select * from Customers where city like '%es%';

-- 37. 고객 테이블에서 도시이름이 6자이며
-- 'erlin'로 끝나는 도시를 조회하세요
select * from Customers where city like '%erlin';

-- 38. 고객 테이블에서 도시이름이 6자이며
-- 'L'로 시작하고 on으로 끝나며,
-- 3번째 글자가 n인 도시를 조회하세요


39. 고객 테이블에서 도시이름이 b, s, p등으로
시작하는 도시를 조회하세요


40. 고객 테이블에서 도시이름이 a에서 c사이로
시작하는 도시를 조회하세요


41. 고객 테이블에서 도시이름이 b, s, p등으로
시작하지 않는 도시를 조회하세요


42. 고객 테이블에서 국가이름이 'Germany',
'France', 'UK'인 고객을 조회하세요



43. 고객 테이블에서 도시이름이
'Germany', 'France', 'UK'가 아닌
고객을 조회하세요



44. 상품 테이블에서 가격이
10 ~ 20사이인 제품을 조회하세요


45. 상품 테이블에서 가격이 10 ~ 20사이인
제품을 조회하세요 단, 제품분류코드가
1,2,3인 제품은 제외한다



46. 상품 테이블에서 제품이름이
'Carnarvon Tigers' 에서
'Mozzarella di Giovanni' 사이인
제품을 조회하세요


47. 상품 테이블에서 제품이름이
'Carnarvon Tigers' 에서
'Mozzarella di Giovanni' 이외의
제품을 조회하세요


48. 주문 테이블에서 주문날짜가
'01-July-1996' 에서 '31-July-1996'사이인
주문을 조회하세요


49. 고객 테이블에서 고객번호, 고객이름을
조회하세요 단, 고객번호는 ID로,
고객이름은 Customer라는 별칭을 사용한다



50. 고객 테이블에서 고객번호, 주소, 우편번호,
도시, 국가등을 조회하세요 단, 주소, 우편번호,
도시, 국가등은 쉼표로 연결해서
Address라는 별칭을 사용한다



51. 고객 테이블을 이용해서
국가별 고객수를 조회하세요


52. 고객 테이블을 이용해서
국가별 고객수가 5명 이상인 국가를 조회하세요


53. 고객/주문 테이블을 이용해서
주문번호, 고객이름, 주문일자를 조회하세요


54. 고객/주문/배송자 테이블을 이용해서
주문번호, 고객이름, 배송업체명을 조회하세요


55. 주문/배송자 테이블을 이용해서
배송업체별 주문건수를 조회하세요


56. 주문/배송자 테이블을 이용해서 배송업체별
주문건수가 300건 이상인
배송업체를 조회하세요



57. 주문/사원 테이블을 이용해서
사원 'Davolio' 또는 'Fuller' 가
맡은 총 주문건수 중
100건 이상인 사원은 누구인가?



58. 고객/주문 테이블을 이용해서
주문번호가 없는 고객을 조회하세요



59. 사원/주문 테이블을 이용해서
주문번호가 없는 사원을 조회하세요



60. 고객 테이블을 이용해서 같은 도시에서
온 고객들을 조회하세요



61. 제품/상세주문 테이블을 이용해서
주문수량이 99 이상인 제품이름을 조회하세요



62. 제품 테이블을 이용해서
제품분류코드가 2인 제품의 가격보다
높은 제품의 이름과 가격을 조회하세요




64. 제품 테이블을 이용해서 제품이름,
1개당가격 * 재고량, 1개당가격 * 주문량을
조회하세요
