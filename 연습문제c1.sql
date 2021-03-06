-- classicmodels 데이터베이스 SQL 예제

-- 1. 직원employees의 모든 정보를 조회하세요
SELECT *
from employees;

-- 1.2 고객customers의 모든 정보를 조회하세요
select *
from customers;
-- 1.3 상품products의 모든 정보를 조회하세요
SELECT *
from products;

-- 2. 직원의 성과 이름, 직책을 조회하세요
SELECT lastName ,firstName ,jobTitle 
FROM employees 

-- 3. 직원의 성을 조회하세요. 단, 중복 제외
select DISTINCT lastName 
from employees ;

-- 4. 고객 테이블에서 null이 아닌 주와 도시를 조회하세요. 단, 중복 제외
SELECT DISTINCT city,state 
from customers
where city is not null and state is not null;


-- 5. 고객 테이블에서 USA의 주가 
-- 몇 개인지 조회하세요
SELECT count(state) 
from customers
where country ='USA';

-- 국적이 호주인 고객은 모두 몇명인가?
SELECT count(customerNumber)
from customers
where country ='australia';


-- 6. 고객 중 현금한도가 높은 순으로 
-- 5명을 조회하세요
SELECT customerName,creditlimit 
from customers 
order by creditlimit desc limit 0,5;


-- 고객 중 현금한도가 높은 순으로 
-- 6번째 ~ 10번째 고객을 조회하세요
SELECT customerName,creditlimit 
from customers 
order by creditlimit desc limit 5,5;


-- 7. 직책이 Sales Rep이고 
-- 오피스코드가 1인 직원을 조회하세요
SELECT employeeNumber ,firstName ,jobTitle ,officeCode 
from employees
where jobTitle = 'Sales Rep' and officeCode =1;

-- 8. 직책이 Sales Rep이 아니고, 
-- 오피스코드가 5이상인 직원을 조회하세요
SELECT employeeNumber ,firstName ,jobTitle ,officeCode 
from employees
where jobTitle <> 'Sales Rep' and officeCode >=5;



-- 9. 고객의 성과 이름을 알파벳 순으로 조회하세요  
SELECT customerName 
from customers 
order by customerName asc;

-- 10. 주문상세orderdetails에서 주문번호, 주문수량, 개별가격, 주문수량*개별가격으로 조회하세요
SELECT orderNumber ,productCode ,quantityOrdered ,priceEach ,priceEach*quantityOrdered 총가격
from orderdetails;


-- 주문금액이 큰 순서대로 출력한다면?
SELECT orderNumber ,priceEach*quantityOrdered 총가격
from orderdetails
order by 총가격 desc;

-- 11. 고객 테이블에서 국가가 USA, 
-- 주는 CA, 현금한도가 100000 이상인 
-- 고객의 성과 이름, 국가, 주, 현금한도를 
-- 조회하세요
SELECT contactLastName ,customerName ,country ,state ,creditLimit 
from customers
where country = 'USA' and state = 'CA' and creditLimit >= 10000
order by creditLimit desc;


 
-- 12. 고객 테이블에서 국가가 USA 또는 
-- France 인 고객의 성과 이름, 
-- 국가를 조회하세요
SELECT contactLastName ,customerName,country 
from customers
where country ='France';

-- 13. 주문 테이블에서 주문 번호가 10165,
-- 10287, 10310인 주문의 주문번호 고객번호,
-- 상태, 선적일자를 조회하세요
SELECT orderNumber ,customerNumber ,status ,shippedDate 
from orders 
where orderNumber =10287 or orderNumber = 10310;


-- 14. 상품 테이블에서 구매가격이 90이상 100이하인 상품의 상품코드, 상품명, 가격을 조회하세요
select 
from products p 



-- 15. 주문 테이블에서 요구일자가 
-- 2003년 1월인 주문의 주문번호와 
-- 요구일자, 상태를 조회하세요

   
-- 16. 직원의 성이나 이름이 a로 시작하는 
-- 직원의 성과 이름을 조회하세요


-- 17. 직원의 성이나 이름이 on로 끝나는 직원의 성과 이름을 조회하세요


 
-- 18. 직원의 이름이 3자이며, 
--  T로 시작하고 m으로 끝나는 직원의 성과 이름을 조회하세요


-- 18.2 직원의 이름이 5자이며, j로 시작하고 e으로 끝나는 직원의 성과 이름을 조회하세요


-- 19. 고객 테이블에서 담당직원번호가 
-- 없는 고객의 이름과, 국가, 
-- 담당직원번호를 조회하세요


-- 20. 고객customer 이름별 주문orders 건수를 조회하세요
 

--  21. 상품코드, 상품이름, 상품설명을 조회하세요
 

--  22. 주문번호와 주문상태, 주문수량*개별가격을 조회하세요
 

--  23. 상품코드 S10_1678에 대한 주문번호와 
 상품이름, 딜러가msrp, 개별가격을 조회하세요
 

--  25. 고객customer 중 주문번호와 주문상태를 조회하세요.
--  단, 주문번호가 없는 고객도 포함한다
  

--  26. 고객customer 중 주문번호와 주문상태가 
--  없는 고객을 조회하세요
 

 -- 27. 주문중 주문번호와 고객번호, 상품코드를 조회하세요
--  단, 상품코드가 없는 주문도 포함한다
 

 -- 28. 영업 사원 중 담당 고객이 없는 사원의 성과 이름, 
--  직책, 고객이름을 조회하세요
--  단, 직책은 'Sales Rep'인 사원을 대상으로 한다
 
     
 -- 28-2. 고객 중 영업사원이 없는 고객의 이름, 
 -- 직책, 사원의 성과 이름을 조회하세요    
 

--  29. 주문상태별로 주문상태, 
--  주문금액(주문수량x개별금액)의 총합을 조회하세요  
 
 
 
--  30. 주문번호별로 주문번호, 
--  주문금액(주문수량x개별금액)의 총합을 조회하세요
 

--  31. 주문년도별로  주문년도, 주문금액(주문수량x개별금액)의 총합을 조회하세요
--  단, 주문일자에서 년도만을 구하는 함수는 year() 이다
 

--  31-2. 주문년도별 주문건수를 조회하세요
 

--  32. 주문상태별 주문상태 수를 조회하세요
 

--  33. 주문번호별로 주문번호, 주문수량 총합, 
--  주문금액(주문수량x개별금액)의 총합을 조회하세요
--  단, 주문금액이 1000이상, 주문수량이 600 이상을 
--  대상으로 한다
 

 -- 34. 주문번호와 주문상태별로 그룹화한 후
 -- 주문번호와 주문상태, 주문금액(주문수량x개별금액)의 총합을 조회하라
 -- 단, 주문상태가 배송shipped, 주문금액이 1500이상을 대상으로 한다
 
      
 -- 35. USA에 있는 사무실에서 근무하는 
 -- 사원의 성과 이름을 조회하세요
  

 -- 36. 지불금액이 가장 많은 고객의 고객번호, 
 -- 체크번호, 지불금액을 조회하세요
 

 -- 37. 평균 지불금액보다 많은 금액을 지불한 고객의 
--  고객번호, 체크번호, 지불금액을 조회하세요
 

 -- 38. 주문을 한번도 하지 않은 고객의 이름을 조회하세요