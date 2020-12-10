
-- 2020/12/10
-- 날짜/시간 함수
-- now(), current_timestamp, sysdate()
select now(),current_timestamp, sysdate();

-- 현재 날짜
-- curdate(), current_date
select curdate(),current_date;

-- 현재 시간
-- curtime(),current_time
select curtime(), current_time; -- 미국 기준 시간으로 나온다 ㅋㅋ

-- 날짜계산
-- adddate(날짜,날짜간격)
-- subdate(날짜,날짜간격)
-- date_add(날짜, 날짜간격)
-- date_sub(날자, 날짜간격)
-- 간격 식별문자열 : second, minute,hour,day,month,year

-- 날짜 더하기
select adddate('2020-12-10',interval 15 day),
       adddate('2020-12-10',interval 1 year),
       subdate('2020-12-10',interval 1 year),
       subdate('2020-12-10',interval 1 year);

select adddate('2020-12-10',interval 100 day);
select adddate('2018-03-14',interval 1000 day);

-- 날짜/시간 추출 : year, month, day, week,
--                hour,minute,second


--                dayofmonth,dayofweek(1:일요일) -- 이부분 각 함수의 내용이  정확히 파악안됨 다시알아봐야함
--                dayofyear,dayname,monthname
select year(now()) 년, month(now()) 월,day(now()) 일 ,week(now()) '2020~현재/주',
       hour(curtime()) 시 ,minute(curtime()) 분,second(now()) 초;

select dayofyear('2020-12-10') 올해중몇일째,
       dayofmonth('2020-12-10') 며칠,
       dayofweek('2020-12-10') 요일, -- 1: sunday 2:monday ~~~~
       monthname('2020-12-10') 월이름,
       dayname('2020-12-10') 요일이름;
-- dayofweek를 이용해서 요일을 한글로 출력해보세요
select substring('일월화수목금토',dayofweek('2020-12-10'),1);
     -- 이렇게 작성시 한글이 잘나오면 상관이 없지만 한글이 나오지 않는다면
     -- _utf8

select concat(substr('일월화수목금토',dayofweek('2020-12-10'),1), '요일');




-- 날짜계산 : datediff(날짜1,날짜2)
-- 오늘기준 크리스마스가 몇일 남았는지 계산
select datediff('2020-12-25','2020-12-10');
-- 오늘기준 2021-03-21이 얼마나 남았는지 계산
select datediff('2020-12-10','2021-03-21');

-- 날짜/시간 계산
-- timestampdiff(유형,날짜1,날짜2)

-- 오늘 기준 크리스마스가 몇일, 몇시간, 몇분 남았는지 계산
select timestampdiff(day,'2020-12-10','2020-12-25') '남은 날',
       timestampdiff(hour,'2020-12-10','2020-12-25')'남은 시간',
       timestampdiff(minute,'2020-12-10','2020-12-25')'남은 분';

-- 달의 마지막 일 출력 : last_day(날짜)
select last_day('2020-12-10'); -- 2020-12-31 출력 확인


-- 변환함수
-- 각 나라별로 날짜,시간을 표시하는 방법이 제각각임
-- 이러한 제각각인 날짜/시간 데이터를
-- 적절한 날짜형식 데이터로 인식하기 위해 변환함수 사용
    -- 한국 : 년-월-일
    -- 미국 : 월/일/년

-- 날짜변환함수 : str_to_date(문자열, 형식문자열)
-- 형식문자열 : %H/%h(24시간,12시간간,  %i(분) , %s(초)  -시간관련
--            %Y/y(4자리연도,마지막2자리연도), %m(월순서), %d(일), %W(요일), %M(월이름)  -날짜관련
select str_to_date('2020-12-10','%Y-%m-%d'),
       str_to_date('12-10-20','%m-%d-%Y');
    -- 미국식으로 써야 한다면 미국식으로 변환 시켜야한다.

-- 날짜변환함수2 : date_format
-- 시스템의 locale 설정에 따라 변환가능
select date_format('2020-12-10','%Y-%m-%d'),
       date_format('12/10/20','%m/%d/%y');
    -- 사용중인 윈도우의 locale이 korea이기 때문에
    -- 미국식 날짜 표기는 제대로 인식되지 않음
SELECT DATE_FORMAT('2017-06-15', '%M %d %Y'),
       date_format('2020-12-10','%W %M'),
       date_format('2020-12-10','%a %b %j'),
       date_format('2020-12-10 12:14:12','%p %h:%i:%s');

-- 숫자문자변환 : cast(대상 as 자료형)
-- 자료형 : char, date/time, decimal, float
-- 묵시적(자동) 형변환, 명시적(수동) 형변환
select substr(123456789,5,1);
-- 숫자형 데이터가 자동으로 문자형으로 변환

select 1234567890, cast(1234567890 as char); -- 숫자는 오른쪽정렬 문자형은 왼쪽으로 정렬
    -- cast를 char형을 바꿔서 왼쪽정렬해서 출력되는 것을 확인할 수 있다~

select 10/3, 10/'3';
    -- 첫번째 값은 float형으로 소수점자리가 4자리까지나오고
    -- 두번재 값은 문자가 실수(float)로 자동형변환 되어 더블형으로 소수점자리가 많아지네요잉~
select 10/cast( '3' as signed ),10/cast('3' as float),
       10/cast('3' as integer), 10/cast('3' as float );

select cast(124035 as time),
       cast(20201210 as date);
    -- 시간, 날짜도 변환가능 (단, 정수형태로 작성해야 함)


-- 분석함수 (윈도우함수) -OLAP
    -- 윈도우 함수 : 행과 행간의 관계를 정의하기 위해 사용하는 함수
    -- 복잡한 기능을 함수로 구현해서 사용하기 편리하게 만들어 둠
    -- 경우에 따라 over 절을 사용해야 할 필요가 있음
    -- 집계함수 : max, min, avg, sum, count
    -- 순위함수 : rank, dense, row_number
    -- 통계,회귀분석 : stddev, variance, covar, corr
    -- 순서함수 : lag, lead, first_value, last_value

-- 현재 행을 기준으로 이전/이후 값 출력 :  lag, lead
-- mariaDB는 10이상 지원하기 시작
-- 분석함수를 적용하기 위해서는
-- 먼저 대상 컬럼이 정렬되어 있어야 함

-- 상품 테이블에서 현재 상품명을 기준으로
-- 이전 상품명과 이후 상품명을 조회하세요
select pdname 현재상품명,
       lag(pdName) over (order by pdNum) 이전상품명,
       lead(pdName) over (order by pdNum)이후상품명
from productTest;

-- 주문테이블에서 주문일자가 빠른순으로 정렬한 후
-- 자신보다 주문일자가 빠른 고객의 이름과 금액을 조회하세요
select csname,orderdate 주문날짜,
       lag(orderdate) over (order by orderdate) 이전주문,
       lead(orderdate) over (order by orderdate) 이후주문
from orderTest join customerTest using(csid)
where '이후주문'<'주문날짜' and csname='성원용';

-- 수업ver
select csid, orderdate,
       lag(csid) over (order by orderdate) 빠른주문자,
       lag(orderdate) over (order by orderdate) 빠른주문일자,

from orderTest;

-- 정렬된 데이터를 기준으로 맨처음/맨마지막 값 출력 :
-- first_value(컬럼명), last_value(컬럼명)

-- 상품을 주문한 고객중에서
-- 가장 많은/적은 금액으로 주문한 고객을 조회하세요
select csid,quantity from orderTest
order by quantity asc;

select csid,quantity from orderTest
order by quantity desc;

select first_value(quantity) over (order by quantity) 최소주문,
       last_value(quantity) over (order by quantity) 최대주문
from orderTest limit 8,1;

select  distinct first_value(quantity) over (order by quantity) 최소주문,
       first_value(quantity)  over (order by quantity desc) 최대주문
from orderTest;