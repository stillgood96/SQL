-- 1) 모든 도서의 이름과 가격을 조회하세요
		select bookname,price 
		from books;
-- 1b) 모든 도서의 가격, 이름을 조회하세요
		select price,bookname 
		from books;

-- 2) 모든 도서의 번호,이름, 출판사,가격을 조회하세요
		select bookid,bookname,publisher ,price
		from books;
-- 2b) 모든 도서의 정보를 조회하세요
	select bookid,bookname,publisher ,price 
	from books;

-- 3) 모든 도서의 출판사를 조회하세요
	select publisher
	from books;

-- 3b) 모든 도서의 출판사를 조회하세요 (중복제거)
	select distinct publisher
	from books;

-- 4) 고객의 이름, 번호를 조회하세요
-- 단, 출력결과의 필드명을 '이름,번호'로 바꿔 출력
	select name as 이름 , phone as 번호 
	from bookMembers;

-- 5) 고객의 이름과 핸드폰번호를 조회하세요
	select name, phone 
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

-- 9) '축구'로 시작하는 도서 이름을 조회하세요
	select bookname 
	from books
	where bookname is '축구';
-- 9b) '축구'로 끝나는 도서 이름을 조회하세요


-- 9c) '축구'를 포함하는 도서 이름을 조회하세요


-- 9d) 도서이름 중에 '의'를 포함하는 책은?


-- 10) '골프'를 포함하고 가격이 30000이상인 도서 이름을 조회하세요
     

-- 11) 고객이름을 가나다순으로 오름차순 정렬하고
-- 이름이 같으면 주소로 내림차순 정렬해서 조회하세요