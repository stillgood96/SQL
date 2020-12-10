-- mariaDB 내장함수
-- 사용자의 편의를 위해 미리 작성해둔 함수            + 사용자가 필요에 따라 직접 만드는 사용자 정의함수
-- 숫자/문자/날짜/시간/변환/집계/분석 함수등이 제공

-- 숫자함수
-- 절대값 계산 :abs(값)
select abs(-4.5), abs(4.5);

-- 반올림 : round(값,자리수)
select round(4.1), round(4.5);
select round(123.456,1), round(123.456,2);

-- 무조건 내림 : floor(값)
select floor(4.1), floor(4.5); -- 4,4
select floor(-4.1), floor(-4.5);  -- -5,-5

-- 무조건 올림 : ceil(값)
select ceil(4.1), ceil(4.5); -- 5,5
select ceil(-4.1), ceil(-4.5); -- 4,4

-- abs함수 : 절댓값을 구하는 함수
-- -78과 +78의 절댓값을 구하시오.
select abs(-78),abs(78);

-- round함수 : 반올림한 값을 구하는 함수
-- 4.875를 소수 첫째 자리까지 반올림한 값을 구하시오.
select round(4.875,1);

-- 숫자 함수의 연산
-- 고객별 평균 주문 금액을 백 원 단위로 반올림한 값을 구하시오.
select  from productTest pt join orderTest oT  using(pdNum);

select csid,pdNum,ot.quantity,price*ot.quantity
from orderTest ot
    join productTest pt using(pdNum);ㅡ

-- 수업ver -- books 테이블 기반으로 했네 나는 orderTest로 하고 있었음
select  avg(saleprice),round(avg(saleprice),-2) -- 양수는 소수점 기준으로 몇자리 음수로 쓰면 양수 기준으로 반올림
from bookOrders
group by custid;


-- 나머지 연산 : mod(분자,분모)
select mod(10,5),mod(10,3); -- 0 / 1 출력확인

-- 난수 생성 : random (0~1사이 실수값이 출력이 된다)
select rand(), rand()*10, rand()*100;

-- 0~9사이 임의의 정수 생성
select round(rand()*10,0), ceil(rand()*10),
       floor(rand()*10);

-- n ~ m 사이 임의의 정수 생성
-- n + rand()*(m-n+1)

-- 1~2사이 임의의 정수 생성
select floor(1+rand()*(2-1+1));
select floor (1+rand()*2);
select floor(4+rand()*(14-4+1));



-- ex) 1~45 사이 임의의 정수 생성
select round(1+rand()*(45-1));

-- 수업ver)
select floor(1+rand()*(45-1)),floor(1+rand()*(45-1)),
    floor(1+rand()*(45-1)),floor(1+rand()*(45-1)),
       floor(1+rand()*(45-1)),floor(1+rand()*(45-1));


-- 문자함수
-- 문자의 ASCII 코드 출력 : ascii(문자)
select ascii('a'), ascii('A'),ascii('0'); -- 97,65,48

-- ASCII 코드의 문자 출력 : char(숫자)
select char(97),char(65),char(48);

-- 문자열 길이 : length(문자열)
-- 영문자 : 1byte
-- 윈도우코드 (완성형,조합형,euc-kr,win949) : 2byte (특정국가내에서만 사용 할 수 이쓴 그래서 바이트를 더쓰더라도 유니코드가 낫다)
-- 유니코드 : 3byte
select length('Hello, World!!');  -- 14 출력확인
select length('가나다라마바');      -- 18 출력확인


-- 문자열 연결 : concat(문자열1,문자열2,....);
select concat('Hello',',World','!!'); -- Hello,World!! 출력확인

-- bookMembers 테이블의 이름과 주소, 전화번호등을
-- 다음과 같은 형식으로 출력되도록 질의문을 작성하세요
-- 홍길동 고객의 주소는 ????이고, 전화번호는 !!!!입니다.
select concat(name,'의 주소는 ',address,'이고 전화번호는',phone,'입니다.') 핫핫 from bookMembers

-- 수업ver
select
       concat(name,'고객의 주소는', address,'이고, 전화번호는 ',phone,'입니다') 회원정보
from bookMembers;

-- 문자열 추출 : left(문자열, 길이), right(문자열, 길이),
--              mid(문자열, 시작, 길이) 시작=1
--              substring, substr = 나중에 찾아보기
select left('Hello,World',5); -- Hello 출력확인
select right('Hello,World',5);-- World 출력확인
select mid('Hello,World',1,5);-- Hello 출력확인
select mid('123456-1234567',8,1);-- 1 출력확인

select right('가나다라마바사',3);
select left('가나다라마바사',3);
select mid('가나다라마바사',3,1);

-- 고급 문자열 추출 : substring(문자열, 시작, 길이);
--                  substring(문자열, 시작)


SELECT SUBSTR('foobarbar' FROM 4); -- 'barbar'
SELECT SUBSTR('Quadratically',5,6); -- 'ratica'
SELECT SUBSTR('Sakila', -3); -- 'ila'
SELECT SUBSTRING('Sakila', -5, 3); -- 'aki'
SELECT SUBSTRING('Sakila' FROM -4 FOR 2); -- 'ki'
SELECT SUBSTRING('Quadratically',5); -- 'ratically'

-- 대소문자 변환 :upper, lower, ucase, lcase
select upper('abc'), lower('ABC'); -- ABC , abc 출력확인
select ucase('abc'), lcase('ABC'); -- ABC , abc 출력확인

-- 공백처리 : trim, ltrim, rtrim
select trim(' abc '),              -- 앞뒤의 공백을 전부 제거
       rtrim('abc           '),    -- 뒤 공백 전부 제거
       ltrim('           abc');    -- 앞 공백 전부 제거

-- 문자열 채움 : pad(문자열, 총길이, 채움문자)
-- 숫자는 lpad, 문자는 rpad 함수를 이용
select lpad('1234567890',10,'_'),  -- '_____12345' 열칸중 남는칸은 _을 왼쪽에
       lpad('12345',10,'_'),
       rpad('12345',10,'_'),
       rpad('가나다',10,'_');

select rpad('가나다라마',10,'_'),
       rpad('가나다',10,'_');        -- 한글도 바이트로 인식하지않고 실제 화면 몇자인지
                                    -- 구분해서 한다.

-- 문자열 바꾸기 : replace(문자열, 찾을문자, 바꿀문자)
select replace('Hello,World','World','mariadb'),
       replace('Hello,World','World',''); -- 공백으로 지울 수도 있다

-- 문자열 뒤집기 : reverse
select reverse('12345'), reverse('가나다라마');

-- 문자열 위치찾기 : instr(문자열, 찾을문자열)
-- 존재하지 않는 경우 : 0으로 출력
select instr('Hello,World','W'),
       instr('Hello,World','H'),
       instr('Hello,World','!');


select instr('Hello,World','!');


-- 'Hello_World_!!' 에서 2번재 _의 위치를 알고 싶음
-- 이에; 적적한 질의문은?
select instr('Hello_World_!!',second('_'));

-- 수업ver
-- (실제값 :12)
-- instr 사용: 첫버째 _의 위치 출력
select instr('Hello_World_!!','_');

-- reverse로 문자열 반전후 instr로 찾은 _ 위치 찾음
select instr(reverse('Hello_World_!!'),'_');

-- 전체문자열 길이에서 반전후 instr로 _위치를 빼고 +1
select length('Hello_World_!!')-instr(reverse('Hello_World_!!'),'_')+1;

select length('가나다_마바사_아자차!')-instr(reverse('가나다_마바사_아자차!'),'_')+1;
-- 한글은 유니코드 세바이트 이므로 length로 문자길이 계산하면 안된다.
-- 그래서 영어 쓸때 만 써라 ~ 이 말이야 ^^
-- 한글의 해결법은 char_length 이걸 사용해야한다 이 ~ 말이야 ~~

select char_length('가나다_마바사_아자차!')-
        instr( reverse('가나다_마바사_아자차!'),'_')+1;

-- 너무 복잡하다 한방에 해결하자
-- 어떻게 ? substring_index함수를 이용하면 편하게 할 수 있다~~ 룰루리
select substring_index('Hello_World_!!','_',1),
-- 첫번째 ' _ '로 분리한 문자열을 출력
       substring_index('Hello_World_!!','_',2);
-- 두번째 ' _ '로 분리한 문자열을 출력
select substring_index('Hello_World_!!','_',3);


select length(substring_index('Hello_World_!!','_',2))+1;
select char_length(substring_index('가나다_마바사_아자차!','_',2))+1;

-- 하하하하 이해하지 못했다 2020-12-09 18:10
-- 아니다 이해했다 지금은 껄껄껄껄 2020-12-09 18:13

-- 'World_of_Warcraft_Shadow_Land' 의 세번째 언더바 문자열길이 함 알아봐라 !
select length(substring_index('World_of_Warcraft_Shadow_Land','_',3))+1;

-- 설명 들어갑니다이이잇~
-- 일단 substring_index 함수는 설정한 문자 _ 를 기준으로 문자열을 잘라주는데
-- 위에서 3이라고 해놨으니 _가 등장하는 3번째를 기준으로 문자열을 썰컹~하고 잘라주면
-- World_of_Warcraft 이것만 남을 것이고~~ length로 잘린 문자열길이의 수를 카운트 들어가면~
-- 결과적으로 세번째 _ 위치 바로전의 길이값이 뜨니 거기다 +1을 해주면 깔꼼~해진다
-- 이말입니다 ~ 아시겠습니까~~~?

-- 2020/12/10 문제풀기 및 추가 내장함수 (nullif,ifnull,coalesc
-- 도서제목에 야구가 포함된 도서를 농구로 변경한 뒤
-- 변경결과를 확인하세요
select replace(bookname,'야구','농구') from books where bookname like '%야구%';

-- 수업ver
select bookid,
       bookname 변경전결과,
       replace(bookname,'야구','농구') 변경후제목,
       publisher, price
       from books;


select *from books;

-- 굿스포츠에서 출판한 도서의 제목과
-- 제목의 글자수를 조회하세요
select bookname,length(bookname) 바이트수 ,
      char_length(replace(bookname,' ','')) 문자수 -- 공백도 숫자 카운트가 들어가므로 공백제거해줘야함
from books where publisher='굿스포츠';

-- 수업ver
select bookname, char_length(bookname), length(bookname)
from books where publisher ='굿스포츠';

-- 고객 중 같은 성을 가진 고객의 수룰 조회하세요요
select count(name) from bookMembers where substring(name,0,1) = substring(name,0,1);

-- 수업ver
select name, left(name,1) 성 , right(name,2)
from bookMembers;

select  left(name,1) 성,count(custid) 고객수
from bookMembers
group by 성;

-- 문제가 안풀리면 기초적인 시뮬레이션을 진행하면서 작성해봐라 !
-- 한번에 작성하면 너무 좋겠지만 힘들수있따 내가 그렇다


-- Null 처리함수
-- null 처리 : coalesce(문자열, 널일때 대체 값)
select Null, coalesce(Null,'널임'),
             coalesce('Hello','널임'),
             IFNULL(Null,'널임'),
             IFNULL('Hello','널임');


-- null 처리 2 : ifnull(문자열,널일때대체값)
select Null, IFNULL(Null,'널임'),
       coalesce('Hello','널임');

-- null 처리 : nullif(문자열1, 문자열2)
-- 두 값이 일치하면 null출력
-- 두값이 일치하지 않으면 문자열1 을 출력~
-- oracle : NVL

select nullif(null,'널임'), nullif(null,null),
       nullif('hello','널임'), nullif('hello','hello');

-- 사원테이블에서 수당을 받지않는 사원들의 수당은 0으로 설정
select  commission_pct,replace(commission_pct,Null,0) from employees;
-- replace로도 할 수 있지 않느냐 해서 해보면 안되는거 확인
-- ifnull을 써써 바궈보장
select ifnull(commission_pct,0) from employees;


-- 조건 판단 :if (조건식, 참일때값, 거짓일때 값)
select if(5>3,'겁나커요잉~','겁나작아요잉~');

-- 다중 조건 : case when 조건식 then 처리값 or else 처리값 or 처리값 end
-- 이부분의 예제는 쉬는시간에 한번 찾아보자.
SELECT case when (5>3) then '겁나커요이잉~' else '겁나작아요이잉~' end,
       case when (3>3) then '겁나커요이잉~' else '겁나작아요이잉~' end;
