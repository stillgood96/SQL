-- 연습문제 B5 2020-12-10
-- 사원 테이블에서 사원 이름을 소문자로 출력하세요
-- 수업ver에서는 first_name 으로만 출려했다
select lower(first_name),lower(last_name) from employees;
    -- 수업ver
    select first_name,lower(first_name) from employees;


-- 사원 테이블에서 사원 이름의 첫글자만 대문자로 출력하세요. steve/STEVE => Steve
select concat(UPPER(left(first_name,1)),substring(first_name,2)),
       concat(UPPER(left(last_name,1)),substring(last_name,2)) from employees;
        -- 수업ver
        select 'STEVE', -- 원본
               left('STEVE',1), -- 첫글자(대문자)
               lower(substr('STEVE',2)); -- 나머지글자(소문자)\
        select 'steve',
               upper(left('steve',1)),
               substr('steve',2);


-- 사원 테이블에서 사원 이름의 길이를 출력하세요.
select length(first_name)+
       length(last_name)
       from employees;
    -- 수업 ver
    select first_name, char_length(first_name) from employees;

-- 사원 테이블에서 사원이름과 이름에 A가 몇번째 있는지 출력하세요.
select first_name,last_name,
       instr(first_name,'a'),
       instr(last_name,'a')
       from employees;
    -- 수업ver
    select first_name, instr(first_name,'a') A의위치 from employees;

-- 사원 테이블에서 사원이름의 세번째 자리가 R인 사원의 정보를
-- 출력하세요.
select *
from employees
where first_name like instr(first_name,'r')=3 or
      last_name like instr(last_name,'r')=3; -- 이방법은 안나옴
select *
from employees
where substring(first_name,3,1)='r' or substring(last_name,3,1)='r';
    -- 수업VER
    select first_name,
           substr(first_name,3,1)
           from employees;
    -- 방법1)
    select * from employees
    where substr(first_name,3,1)='R';
    -- 방법2)
    select * from employees
    where instr(first_name,'R')=3;



-- 사원 테이블에서 이름의 끝자리가
-- N으로 끝나는 사원의 정보를 출력하세요.
select *
from employees
where right(first_name,1)='n' or right(last_name,1);

    -- 수업ver
    select first_name,
           right(first_name,1)
    from employees;

    select * from employees
    where right(first_name,1)='n';

    select * from employees
    where instr(first_name,'N')=char_length(first_name);


-- 사원들의 급여가 평균보다 큰 경우
-- '평균급여이상'이라 출력하고
-- 아닌 경우 '평균급여이하' 라고 출력하세요
select employee_id,
       if(salary>(select avg(salary) from employees),'평균이상','평균이하')
from employees;

    -- 수업ver
    select avg(salary) from employees;

    select salary,
           if(salary > (select round(avg(salary)) from employees),'평균이상','평균이하')
    from employees;



-- 사원의 급여에 대해 평균을 계산하고
-- 정수로 변환해서 출력하세요
select  cast(avg(salary)as integer) from employees;

    -- 수업ver
    select cast(avg(salary) as decimal(5,0))
    from employees;

    select cast(avg(salary) as unsigned )
    from employees;

    select cast(avg(salary) as integer)
    from employees;

-- 사원들을 입사일자가 빠른 순으로
-- 정렬한 뒤 본인보다 입사일자가 빠른
-- 사원의 급여를 본인의 급여와 함께
-- 출력하세요
select employee_id, salary,hire_date,
       lag(employee_id) over (order by hire_date),
       lag(salary) over (order by hire_date),
       lag(hire_date) over (order by hire_date)
from employees;

    -- 수업ver
    select first_name, salary,hire_date,
           lag(salary) over (order by hire_date) 선배월급
    from employees;

-- AND나 BETWEEN을 사용하지 않고
-- 2002 년도에 입사한 직원의 이름과
-- 월급을 출력하세요.
select first_name,last_name,salary
from employees
where hire_date like '2002%';

    -- 수업ver

    select  '2020-12-10',left('2020-12-10',4); -- 왼쪽부터 4자리뽑아서 2002냐 아니냐
    select  '2020-12-10',substr('2020-12-10',1,4);
    select  '2020-12-19',year('2020-12-10');

    select first_name,salary,hire_date from employees
    where year(hire_date)=2002;

-- 사원 테이블에서 사원의 이름이
-- 5글자인 사원의 이름을
-- 첫글자만 대문자로 출력하세요.
select concat(substring(upper(first_name),1,1),substring(first_name,2))
from employees
where first_name like '_____';

    -- 수업ver
    select first_name, upper(left(first_name,1)) from employees
    where char_length(first_name)=5;



-- 사원 테이블에서 이름과 입사일자
-- 그리고 현재날까지의 경과일을 산출하세요
-- (소숫점을 빼버리고 해딩이름을
-- 경과일로 바꾸세요)
select first_name,timestampdiff(day,hire_date,now())
from employees;

    -- 수업 ver
    select left(hire_date,10),curdate(),
           datediff(now(),hire_date)
    from employees;

    select hire_date, datediff(now(),hire_date)
    from employees;


-- 이전문제에서 경과일을 개월수로 바꿔서
-- 산출하세요. 소숫점을 빼버리고
-- 해당이름을 경과개월수로 바꾸세요
select first_name,timestampdiff(month ,hire_date,now())
from employees;

    -- 수업ver
    select left(hire_date,10), curdate(),
           timestampdiff(month,hire_date,now()) 경과개월수
    from employees;

못품
-- 사원 테이블에서 입사후 6개월이
-- 지난날짜 바로 다음 일요일을 구하세요.
select hire_date from employees

    -- 수업ver
    select dayofweek(curdate()) 오늘요일,
           date_add(curdate(), interval 3 day) 다음주일요일,
           date_add(curdate(),interval 8 - dayofweek(curdate()) day);

    select date_add(curdate(),
           interval 7 - dayofweek(curdate()) + 1 day);

    select left(hire_date,10),
           left(date_add(date_add(hire_date,interval 6 month),
                    interval 7 - dayofweek(
                        date_add(hire_date, interval 6 month)) + 1 day ),10)
            입사후6개월경과다음주일요일
    from employees;

-- 수업예제
-- 교육시작일이 2020-11-02인 경우,
-- 5개월(89일)이 지난 후 돌아오는 첫번째 금요일이
-- 언제인지 조회하세요 (5개월(18주) :  2021-03-08)

    select '2020-11-02',date_add('2020-11-02',interval 18 week),
           date_add('2020-11-02', interval 7 -dayofweek(date_add('2020-11-02',interval 18 week))+6 day);

    select '2020-11-02',
           date_add('2020-11-02',interval 18 week),
           date_add(date_add('2020-11-02', interval 18 week),
               interval 7 - dayofweek(
                   date_add('2020-11-02',interval 18 week))+6 day
                   );

-- 수업예제
-- 사원테이블에서 입사후
-- 첫 휴일(일요일)은 언제일지 구하세요

    -- 수업ver
    select first_name, hire_date
    from employees;

    -- steven 사원의 입사일 기준 다음 첫 휴일
    -- steven 사원의 입사일이 같은 사원들 역시 동일시 식 적용
    -- 그외 다른 사원들은 동일식 적용시 잘못된 결과가 나온다 -> 입사일이 제각각이기 때문에
    --
    select 'Steven','2020-06-17',
           dayofweek('2020-06-17') 입사일의요일명,
           7 - dayofweek('2020-06-17') 나머지요일수,
           date_add('2020-06-17',interval 3+1 day) 입사후첫휴일
    from employees;

    select 'steven','2020-06-17,',
            date_add('2020-06-17',interval
            7-dayofweek('2020-06-17') + 1 day)
    from employees;

-- 오늘날짜를 "xx년 xx월 xx일"
-- 형식으로 출력하세요
    select date_format(now(),'%Y년%m월%d일');

    -- 수업ver
    select now(), date(now()),
           date_format(date(now()),'%Y년%m월%d일');

-- 지금 현재 '몇시 몇분'인지 출력하세요.
-- AWS RDS의 시간은 미국 기준
-- 한국 기준시로 변경하고 싶다면 서버설정변경(TIME-ZONE) 필요
-- 한국은 utc 기준 9시간 추가 : KST=UTC+9
select date_format(now(),'%H시%i분');

    -- 수업ver
    select @@global.time_zone;    -- utc
    select @@session.time_zone;

    SET GLOBAL time_zone = 'Asia/Korea'; -- 관리자 권한이 필요하다.
    SET time_zone = 'Asia/Seoul';   -- session

    select now(),time(now()),date_add(now(),interval 9 hour) 한국시간;

    SET TIME_ZONE = 'UTC';
    select now(), time(now()),
           date_format(time(now()),'%h시%i분%p');


-- 이번 년도 12월 31일까지 몇일이
-- 남았는지 출력하세요.
select datediff(now(),'2020-12-31');

    -- 수업ver
    select datediff('2020-12-31','2020-12-11');


-- 사원들의 입사일에서
-- 입사 년도와 입사 달을 조회하세요
select employee_id ,date_format(hire_date,'입사년도와 달:%y%m') from employees;

    -- 수업ver
    select hire_date, date_format(hire_date,'%y년%m월')
    from employees;

-- 9월에 입사한 사원을 조회하세요
select * from employees
    where month(hire_date)=9;

    -- 수업ver
    select left(hire_date,10) hire_date,
           substr(hire_date,6,2) 입사월추출1,
           month(hire_date),
           date_format(hire_date,'%m')
    from employees;

    select first_name,
           left(hire_date,10) hire_date
    from employees
    where month(hire_date)='9';

-- 사원들의 입사일을 출력하되,
-- 요일까지 함께 조회하세요
select concat(hire_date,' ',substring('일월화수목금토',dayofweek('2020-12-10'),1))
from employees;

select concat(hire_date,dayname(hire_date))
from employees;

    -- 수업ver
    select first_name, left(hire_date,10) hire_date,
           date_format(hire_date,'%W') 입사일영어요일,
           date_format(hire_date,'%a') 입사일영어요일2,
           substring('일월화수목금토',dayofweek(hire_date),1) 입사일한글요일
    from employees;



-- 사원들의 급여를 통화 기호를 앞에 붙이고
-- 천 단위마다 콤마를 붙여서 조회하세요
select format(concat(salary,'$'),0)
from employees;

    -- 수업ver
    -- format(값,반올림 자릿수) : 숫자에 컴마를 붙여 출력

    select format(123456789.2345,0);
    select format(123456789.2345,1);

    select first_name,salary,
           format(salary,0) 셀서식적용1,
           concat('￦ ',format(salary,0)),
           replace(format(salary,0),',','_')
    from employees;




-- 사원들의 급여를 10자리로 출력하되
-- 자릿수가 남는 경우 빈칸으로
-- 채워서 조회하세요
select rpad(salary,10,' '),
       length(rpad(salary,10,' '))
from employees;

    -- 수업ver
    select first_name,salary,
           lpad(salary,10,'-') 출력조정_급여
    from employees;

-- 각 사원들의 근무한 개월 수를 현재를
-- 기준으로 구하세요
select cast(timestampdiff(day,hire_date,current_date)/30 as integer)
from employees;

    -- 수업ver
    select first_name,left(hire_date,10),
           timestampdiff(month,hire_date,now()) 근무개월수
    from employees;


-- 각 사원들의 입사일에서
-- 4개월을 추가한 날짜를 조회하세요
select hire_date,adddate(hire_date,interval 4 month)
from employees;

    -- 수업ver
    select first_name,left(hire_date,10),
           left(adddate(hire_date,interval 4 month),10) '입사후 4개월 경과'
    from employees;

-- 각 사원들의 입사한 달의 마지막 날을
-- 조회하세요
select last_day(hire_date)
from employees;

    -- 수업ver
    select first_name, left(hire_date,10) hire_date,
           last_day(hire_date) 입사한달_마지막날
    from employees;


