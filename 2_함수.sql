-- 함수(FUNTION) : 컬럼의 값을 읽어서 계산한 결과 리턴
-- 단일 행 함수(SINGLE ROW FUNTION) : N개의 값을 넣어서 N개의 결과 리턴
-- 그룹 함수(GROUP FUNTION) : N개의 값을 넣어서 한 개의 결과 리턴
-- SELECT 절에 단일행 함수와 그룹 함수를 합께 사용 못함 : 결과 행의 계수가 다르기 때문

--SELECT LENGTH(EMP_NAME)         -- 단일 행 함수
--FROM EMPLOYEE;
--
--SELECT COUNT(EMP_NAME)          -- 그룹함수
--FROM EMPLOYEE;

--SELECT LENGTH(EMP_NAME), COUNT(EMP_NAMES)  -- 단일 행 함수(23개)와 그룹함수(1개)의 반환 할 개수가 같아야지만 SELECT 할 수 있음
--FROM EMPLOYEE;


-- 함수를 사용 할 수 있는 위치
-- SELECT절, WHERE절, GROUP BY절, HAVING절, ORDER BY절

-- 단일 행 함수
-- 1. 문자 관련 함수

-- LENGTH / LENGTHB
-- LENGTH(컬럼명 | '문자열') : 글자 수 반환
-- LENGTHB(컬럼명 | '문자열') : 글자의 바이트 사이즈 반환
SELECT LENGTH('오라클'), LENGTHB('오라클')        -- 오라클에서 한글은 3바이트 
FROM DUAL;  -- 가상 테이블

SELECT EMAIL, LENGTH(EMAIL), LENGTHB(EMAIL)
FROM EMPLOYEE;

-- INSTR : 해당 문자열의 첫번 째 위치
-- 오라클은 제로인덱스 기반이 아님
SELECT INSTR('AABAACAABBAA', 'B') FROM DUAL;    
SELECT INSTR('AABAACAABBAA', 'Z') FROM DUAL;

SELECT INSTR('AABAACAABBAA', 'B', 1) FROM DUAL; -- 1번째부터 읽기 시작해서 처음으로 나오는 B의 위치 반환
SELECT INSTR('AABAACAABBAA', 'B', -1) FROM DUAL;    -- -1번째(끝)부터 읽기 시작해서 처음으로 나오는 B의 위치 반환
SELECT INSTR('AABAACAABBAA', 'C', -1) FROM DUAL;    -- 끝부터 읽기 시작해서 C의 위치 반환 
SELECT INSTR('AABAACAABBAA', 'B', 1, 2) FROM DUAL;  -- 1번째부터 읽기 시작해서 두 번째로 나오는 B의 위치 반환
SELECT INSTR('AABAACAABBAA', 'B', -1, 2) FROM DUAL; -- 뒤에서 부터 읽기 시작해서 두번째로 나오는 B의 위치 반환
SELECT INSTR('AABAACAABBAA', 'C', 1, 2) FROM DUAL;  -- 처음부터 읽기 시작해서 두번째 C를 반환하지만 없기 때문에 0 반환

-- EMPLOYEE 테이블에서 이메일의 @ 위치 반환
SELECT EMAIL, INSTR(EMAIL, '@')
FROM EMPLOYEE;

-- LPAD / RPAD : 주어진 컬럼이나 문자열에 임의의 문자열을 왼쪽 / 오른쪽에 덧붙여 같이 N의 문자열 반환

SELECT LPAD(EMAIL, 20)          -- 총 20 공간을 빈칸으로 채워 넣음
FROM EMPLOYEE;

SELECT LPAD(EMAIL, 20, '#')     -- 총 20공간 중에 왼쪽 빈 공간을 #으로 채움
FROM EMPLOYEE;

SELECT RPAD(EMAIL, 20)          -- 총 20공간 중에 오른쪽을 빈칸으로 채움
FROM EMPLOYEE;

SELECT RPAD(EMAIL, 20, '#')     -- 총 20공간 중에 오른쪽 빈 공간을 #으로 채움
FROM EMPLOYEE;

-- LTRIM/RTRIM/TRIM : 주어진 컬럼이나 문자열의 왼쪽 또는 오른쪽 또는 앞/뒤/양쪽에서 지정한 문자 제거한 나머지 반환
SELECT LTRIM('   KH') FROM DUAL;    -- 삭제할 문자열을 지정하지 않았을 경우 공백이 디폴트가 됨
SELECT LTRIM('   KH', ' ') FROM DUAL;
SELECT LTRIM('000123456', '0') FROM DUAL;
SELECT LTRIM('123123KH','123') FROM DUAL;
SELECT LTRIM('123123KH123', '123') FROM DUAL;   -- KH123 반환
SELECT LTRIM('ACABACCKH' ,'ABC') FROM DUAL;     -- KH 반환
SELECT LTRIM('5781KH', '0123456789') FROM DUAL;

SELECT RTRIM('KH   ') FROM DUAL;
SELECT RTRIM('123456000','000') FROM DUAL;
SELECT RTRIM('KHACABACC', 'ABC') FROM DUAL;

SELECT TRIM('   KH   ') FROM DUAL;
SELECT TRIM('Z' FROM 'ZZZKHZZZ') FROM DUAL;
SELECT TRIM('123' FROM '123132KH123321') FROM DUAL;     -- 한 글자만 제거 가능
SELECT TRIM(LEADING 'Z' FROM 'ZZZ123456') FROM DUAL;     -- 앞
SELECT TRIM(TRAILING 'Z' FROM '123456ZZZ') FROM DUAL;     -- 뒤
SELECT TRIM(BOTH 'Z' FROM 'ZZZ123456ZZZZZZ') FROM DUAL;   -- 양 쪽

-- SUBSTR : 컬럼이나 문자열에서 지정한 위치부터 지정 개수의 문자열을 잘라내 반환
SELECT SUBSTR('SHOWMETHEMONEY', 7) FROM DUAL;       -- 시작지점을 지정
SELECT SUBSTR('SHOWMETHEMONEY', 5, 2) FROM DUAL;    -- 시작지점과 출력할 문자 개수
SELECT SUBSTR('SHOWMETHEMONRY', 5, 0) FROM DUAL;
SELECT SUBSTR('SHOWMETHEMONEY', 1, 6) FROM DUAL;
SELECT SUBSTR('SHOWMETHEMONEY', -8, 3) FROM DUAL;   -- 끝부터 3개
SELECT SUBSTR('SHOWMETHEMONEY', -10, 2) FROM DUAL;

-- EMPLOYEE 테이블에서 이름, 이메일, @이후를 제외한 아이디 조회
-- SELECT EMP_NAME, EMAIL, RTRIM(EMAIL, '@kh.or.kr')
SELECT EMP_NAME, EMAIL, SUBSTR(EMAIL, 1, INSTR(EMAIL, '@') -1) 아이디
FROM EMPLOYEE;

-- 주민등록번호에서 성별을 나타내는 부분만 잘라보기
SELECT SUBSTR(EMP_NO, 8, 1)
FROM EMPLOYEE;
-- EMPLOYEE 테이블에서 직원들의 주민번호를 이용하여 사원명, 생년, 생월, 생일 조회
SELECT EMP_NAME, SUBSTR(EMP_NO, 1, 2)||'년' 생년, SUBSTR(EMP_NO, 3, 2)||'월' 생월, SUBSTR(EMP_NO, 5, 2)||'일' 생일
FROM EMPLOYEE;

-- LOWER/ UPPER / INITCAP
SELECT LOWER('WELCOME TO MY WORLD') FROM DUAL;
SELECT UPPER('welcome to my world') FROM DUAL;
SELECT INITCAP('welcome to my world') FROM DUAL;

-- CONCAT : 문자열을 뒤에 붙임
SELECT CONCAT('가나다라', 'ABCD') FROM DUAL;       -- 가나다라ABCD 반환
SELECT '가나다라' || 'ABCD' FROM DUAL;      -- 가나다라ABCD 반환

-- REPLACE
SELECT REPLACE('서울시 강남구 역삼동', '역삼동', '삼성동') FROM DUAL;     -- 서울시 강남구 삼성동 반환
SELECT REPLACE('서정호 학생의 별명은 군인일까요?', '군인', '에코') FROM DUAL;     -- 서정호 학생의 별명은 에코일까요?

-- EMPLOYEE 테이블에서 이메일의 도메인을 GMAIL.COM으로 변경하기
SELECT REPLACE(EMAIL, 'kh.or.kr', 'gmail.com') FROM EMPLOYEE;
-- EMPLOYEE 테이블에서 사원명, 주민번호 조회. 단, 주민번호는 생년월일만 보이게 하고 '-' 다음 값은 '*'로 바꾸기
-- 1)
SELECT EMP_NAME, REPLACE(EMP_NO,SUBSTR(EMP_NO,9) ,'******')     -- 621235-1******
FROM EMPLOYEE;
-- 2)
SELECT EMP_NAME, CONCAT(SUBSTR(EMP_NO, 0, 8), '******')
FROM EMPLOYEE;
-- 3)
SELECT EMP_NAME, RPAD(SUBSTR(EMP_NO, 0, 8),14,'*')
FROM EMPLOYEE;

-- 2. 숫자 관련 함수

-- ABS : 절대값 리턴해주는 함수
-- 절대값 : 양수
SELECT ABS(10.9) FROM DUAL;
SELECT ABS(-10.9) FROM DUAL;
SELECT ABS(10) FROM DUAL;
SELECT ABS(-10) FROM DUAL;

-- MOD
SELECT MOD(10, 3) FROM DUAL;        -- 1
SELECT MOD(-10, 3) FROM DUAL;       -- -1
SELECT MOD(10, -3) FROM DUAL;       -- 1
SELECT MOD(10.9, 3) FROM DUAL;      -- 1.9
SELECT MOD(-10.9, 3) FROM DUAL;     -- -1.9

SELECT MOD(-10, -3) FROM DUAL;      -- -1

-- ROUND : 반올림
SELECT ROUND(123.456) FROM DUAL;        -- 123 // 기본값 소수 첫번째 자리 
SELECT ROUND(123.678, 0) FROM DUAL;     -- 124 // 제로인덱스 기반 적용 됨

SELECT ROUND(123.456, 1) FROM DUAL;     -- 123.5
SELECT ROUND(123.456, 2) FROM DUAL;     -- 123.46
SELECT ROUND(123.456, -2) FROM DUAL;    -- 100

-- 번외
SELECT ROUND(-10.61) FROM DUAL;     -- -11

-- FLOOR : 내림(수학적)
SELECT FLOOR(123.456) FROM DUAL;    -- 123 
SELECT FLOOR(123.678) FROM DUAL;    -- 123

-- TRUNC : 버림(절삭)
SELECT TRUNC(123.456) FROM DUAL;        -- 123
SELECT TRUNC(123.678) FROM DUAL;        -- 123
SELECT TRUNC(123.456, 1) FROM DUAL;     --123.4
SELECT TRUNC(123.456, -1) FROM DUAL;    -- 120

-- CEIL : 올림
SELECT CEIL(123.456) FROM DUAL;     -- 124
SELECT CEIL(123.678) FROM DUAL;     -- 124

-- 3. 날짜 관련 함수

-- SYSDATE : 오늘 날짜 반환

-- MONTHS_BETWEEN : 날짜와 날짜 사이의 개월 수 차이를 숫자로 리턴하는 함수
-- EMPLOYEE 테이블에서 사원의 이름, 입사일, 근무 개월 수 조회
SELECT EMP_NAME, HIRE_DATE, MONTHS_BETWEEN(SYSDATE, HIRE_DATE)
FROM EMPLOYEE;

-- ADD_MONTHS : 날짜에 숫자만큼의 개월 수를 더해 날짜 리턴
SELECT ADD_MONTHS(SYSDATE, 5) FROM DUAL;
SELECT ADD_MONTHS(SYSDATE, 15) FROM DUAL;

-- NEXT_DAY : 기준 날짜에서 구하려는 요일에 가장 가까운 날짜를 리턴하는 함수
SELECT SYSDATE, NEXT_DAY(SYSDATE, '목요일') FROM DUAL;     -- 20/02/05	20/02/06
SELECT SYSDATE, NEXT_DAY(SYSDATE, 1) FROM DUAL;
-- 일 월 화 수 목 금 토
-- 1  2  3  4 5  6  7
SELECT SYSDATE, NEXT_DAY(SYSDATE, '목') FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, '화진씨는 지금 무슨 생각을 하고 있을까?') FROM DUAL;  -- 20/02/05	20/02/11
SELECT SYSDATE, NEXT_DAY(SYSDATE, '연화씨는 자기 이름이 되는지 궁금하겠지') FROM DUAL;   -- 첫글자가 연이라 에러
SELECT SYSDATE, NEXT_DAY(SYSDATE, 'THURSDAY') FROM DUAL;

ALTER SESSION SET NLS_LANGUAGE = AMERICAN;
SELECT SYSDATE, NEXT_DAY(SYSDATE, 'THUR') FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, 'THUROSEMARY') FROM DUAL;

ALTER SESSION SET NLS_LANGUAGE = KOREAN;

-- LAST_DAY : 해당 월에 마지막 날짜 리턴
SELECT SYSDATE, LAST_DAY(SYSDATE) FROM DUAL;    -- 20/02/05	20/02/29

-- EXTRACT : 날짜에서 년, 월, 일 추출하여 리턴
-- EXTRACT(YEAR FROM 날짜)
-- EXTRACT(MONTH FROM 날짜)
-- EXTRACT(DAY FROM 날짜)

-- EMPLOYEE 테이블에서 사원의 이름, 입시 년, 입사 월, 입사일 조회
SELECT EMP_NAME, EXTRACT(YEAR FROM HIRE_DATE) 입사년도,
                 EXTRACT(MONTH FROM HIRE_DATE) 입사월,
                 EXTRACT(DAY FROM HIRE_DATE) 입사일
FROM EMPLOYEE;


-- 4. 형 변환 함수
-- TO_CHAR(날짜(, [포맷]) : 날짜형 데이터를 문자형 데이터로 변환
-- TO_CHAR(숫자(, [포맷]) : 숫자형 데이터를 문자형 데이터로 변환
SELECT TO_CHAR(1234) 엥 FROM DUAL;
SELECT TO_CHAR(1234, '99999') 엥 FROM DUAL;  -- 5칸, 오른쪽 정렬, 빈칸 공백
SELECT TO_CHAR(1234, '00000') 엥 FROM DUAL;  -- 5칸, 오른쪽 정렬, 빈칸 0
SELECT TO_CHAR(1234, 'L99999') 엥 FROM DUAL; -- 원화 설정
SELECT TO_CHAR(1234, 'FML99999') 엥 FROM DUAL;   -- 공백은 아예 없애고 싶을 때는 FM을 붙이면 됨
SELECT TO_CHAR(1234, '$99999') 엥 FROM DUAL;
SELECT TO_CHAR(1234, 'FM$99999') 엥 FROM DUAL;
SELECT TO_CHAR(1234, '99,999') 엥 FROM DUAL;
SELECT TO_CHAR(1234, 'FM99,999') 엥 FROM DUAL;
SELECT TO_CHAR(1234, '00,000') 엥 FROM DUAL;
SELECT TO_CHAR(1234, 'FM00,000') 엥 FROM DUAL;
SELECT TO_CHAR(1234, '9.9EEEE') 엥 FROM DUAL;    -- 지수 출력   1.2E+03
SELECT TO_CHAR(1234, '999') 엥 FROM DUAL;        -- 값이 칸의 길이보다 길면 #으로 처리     ###

SELECT TO_CHAR(SYSDATE, 'PM HH24:MI:SS') FROM DUAL;     -- 오후 20:04:02
SELECT TO_CHAR(SYSDATE, 'AM HH:MI:SS') FROM DUAL;       -- 오후 08:05:11
SELECT TO_CHAR(SYSDATE, 'MON DY, YYYY') FROM DUAL;      -- 2월  수, 2020
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD DAY') FROM DUAL;    -- 2020-02-05 수요일
SELECT TO_CHAR(SYSDATE, 'YYYY-FMMM-DD DAY') FROM DUAL;  -- 2020-2-5 수요일     // FM이 붙으면 뒤에 값까지 영향을 줌
SELECT TO_CHAR(SYSDATE, 'YEAR, Q') || '분기' FROM DUAL;       -- TWENTY TWENTY, 1분기
SELECT TO_CHAR(SYSDATE, 'YYYY"년" MM"월" DD"일" DAY') FROM DUAL;

-- 오늘 날짜에 대해 
-- 연도 출력
SELECT TO_CHAR(SYSDATE, 'YYYY'), TO_CHAR(SYSDATE, 'YY'), TO_CHAR(SYSDATE, 'YEAR')   
FROM DUAL;      -- 2020	20	TWENTY TWENTY

-- 월 출력
SELECT TO_CHAR(SYSDATE, 'MM'), TO_CHAR(SYSDATE, 'MONTH'), TO_CHAR(SYSDATE, 'MON'), TO_CHAR(SYSDATE, 'RM')
FROM DUAL;      -- 02	2월 	2월 	II   // RM : 로마 숫자로 출력

-- 일 출력
SELECT TO_CHAR(SYSDATE, 'DDD'), TO_CHAR(SYSDATE, 'DD'), TO_CHAR(SYSDATE, 'D')
FROM DUAL;      -- 036	05	4   // DDD: 년 기준으로 일자, DD: 달 기준으로 일자, D : 주 기준으로 일자

-- 분기, 요일 출력
SELECT TO_CHAR(SYSDATE, 'Q'), TO_CHAR(SYSDATE, 'DAY'), TO_CHAR(SYSDATE, 'DY')
FROM DUAL;      -- 1	수요일	수

-- TO_DATE : 문자/ 숫자형 데이터 -> 날짜형 데이터
SELECT TO_DATE('20100101', 'YYYYMMDD') FROM DUAL;   -- 10/01/01
SELECT TO_DATE(20100101, 'YYYYMMDD') FROM DUAL;     -- 10/01/01     오라클에서 기본적으로 년도 출력 시 2자리로 출력

--2010.01.01 ==> 2010, 1월
SELECT TO_CHAR(TO_DATE('20100101', 'YYYYMMDD'), 'YYYY, MON')
FROM DUAL;      -- 2010, 1월 

SELECT TO_CHAR(TO_DATE('041030 143000', 'YYMMDD HH24MISS'), 'YY-MON-DD HH:MI:SS PM')
FROM DUAL;      -- 04-10월-30 02:30:00 오후

-- RR과 YY의 차이 (둘 다 년도 나타냄)
-- YY : 현재 세기 기준으로 맞춰서 나옴
-- RR : 50년도 50년 이전이면 이전 세기, 50년 미만이면 현재 세기
SELECT TO_CHAR(TO_DATE('980630', 'YYMMDD'), 'YYYYMMDD'), TO_CHAR(TO_DATE('140918', 'YYMMDD'), 'YYYYMMDD'),
       TO_CHAR(TO_DATE('980630', 'RRMMDD'), 'YYYYMMDD'), TO_CHAR(TO_DATE('140918', 'RRMMDD'), 'YYYYMMDD')
FROM DUAL;      -- 20980630     20140918	19980630    20140918

-- TO_NUMBER : 문자형 데이터 ==> 숫자형 데이터
SELECT TO_NUMBER('123456789') FROM DUAL;
SELECT '123' + '456' FROM DUAL;     -- 579
SELECT '123' + '456A' FROM DUAL;    -- 오라클에서 숫자만 있는 스트링의 경우 자동으로 숫자로 변환해주지만 문자A가 있기 때문에 스트링으로 인식
SELECT '1,000,000' + '550,000' FROM DUAL;   --, 때문에 인식 안됨
SELECT TO_NUMBER('1,000,000', '99,999,999') FROM DUAL;
SELECT TO_NUMBER('1,000,000', '99,999,999') + TO_NUMBER('550,000', '999,999') FROM DUAL;    -- 1550000

-- 5. NULL 처리 함수
-- NVL(컬럼명, 컬럼 값이 NULL일 때 바꿀 값)

SELECT EMP_NAME, NVL(BONUS, 0)
FROM EMPLOYEE;          -- NULL인 사람들 0으로 바꿈

SELECT EMP_NAME, NVL(DEPT_CODE, '없습니다')
FROM EMPLOYEE;

-- NVL2(컬럼명, 바꿀 값1, 바꿀 값2)  : 컬럼 값이 NULL이 아니면 바꿀 값1로 바꾸고 NULL이면 바꿀 값2로 바꿈
-- EMPLOYEE 테이블에서 보너스가 NULL인 직원은 0.5로, NULL이 아닌 직원은 0.7로 변경하여 조회
SELECT EMP_NAME,BONUS,NVL2(BONUS, 0.7, 0.5)
FROM EMPLOYEE;

-- NULLIF(비교대상1, 비교대상2) : 두 개의 값이 동일하면 NULL, 동일하지 않으면 비교대상1 리턴
SELECT NULLIF(123, 123) FROM DUAL;      -- NULL
SELECT NULLIF(123, 124) FROM DUAL;      -- 123


-- 6. 선택함수 : 여러 가지 경우 선택할 수 있는 기능 제공
-- DECODE(계산식|컬럼명, 조건값1, 선택값1, 조건값2, 선택값2...)
-- 비교하고자 하는 값 또는 컬럼이 조건식과 같으면 결과 값 반환
SELECT EMP_ID, EMP_NAME, EMP_NO,
       DECODE(SUBSTR(EMP_NO, 8, 1), 1, '남', 2, '여') 성별
FROM EMPLOYEE;      -- 200	선동일	621235-1985634	남

SELECT EMP_ID, EMP_NAME, EMP_NO,
       DECODE(SUBSTR(EMP_NO, 8, 1), 1, '남', '여') 성별
FROM EMPLOYEE;
-- 마지막 인자로 조건 값 없이 선택 값을 작성하면
-- 아무것도 해당되지 않을 때 마지막에 작성한 선택값을 무조건 선택함

-- CASE WHEN 조건식 THEN 결과 값
--      WHEN 조건식 THEN 결과 값
--      ELSE 결과 값
-- END
-- 비교하고자 하는 값 또는 컬럼이 조건식과 같으면 결과 값 반환(조건은 범위 가능)

SELECT EMP_ID, EMP_NAME, EMP_NO,
       CASE WHEN SUBSTR(EMP_NO, 8, 1) = 1 THEN '남'
            ELSE '여'
       END 성별
FROM EMPLOYEE;  -- 200	선동일	621235-1985634	남

-- 급여가 500만 초과 1등급, 350 초과 2등급, 200만 초과 3등급, 나머지 4등급
SELECT EMP_NAME, SALARY,
        CASE WHEN SALARY > 5000000 THEN '1등급' WHEN SALARY > 3500000 THEN '2등급' 
        WHEN SALARY > 2000000 THEN '3등급' ELSE '4등급' END 등급
FROM EMPLOYEE;


-- 그룹함수 : 여러 행을 넣으면 한 개의 결과만 반환
-- SUM(숫자가 기록된 컬럼) : 합계 리턴
-- EMPLOYEE 테이블에서 전 사원의 급여 총합 조회
SELECT SUM(SALARY)
FROM EMPLOYEE;      -- 70096240

-- EMPLOYEE 테이블에서 남자 사원의 급여 총합 조회
SELECT SUM(SALARY)
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8, 1) = 1;

-- AVG(숫자가 기록된 컬럼) : 평균 리턴
-- EMPLOYEE 테이블에서 전 사원의 급여 평균 조회
SELECT AVG(SALARY)
FROM EMPLOYEE;

-- EMPLOYEE 테이블에서 전 사원의 BONUS 합계 조회
SELECT SUM(BONUS)
FROM EMPLOYEE;

-- EMPLOYEE 테이블에서 전 사원의 BONUS 평균 조회
SELECT AVG(BONUS), AVG(NVL(BONUS, 0))
FROM EMPLOYEE;      -- 0.2166666666666666666666666666666666666667	0.0847826086956521739130434782608695652174
-- NULL 값을 가진 행은 평균 계산에서 제외 되어 계산

-- MIN / MAX : 최소/최대
-- EMPLOYEE 테이블에서 가장 적은 급여, 알파벳 순서가 가장 빠른 이메일, 가장 빠른 입사일
-- MIN의 인자로 숫자, 날짜, 문자 가능
SELECT MIN(SALARY), MIN(EMAIL), MIN(HIRE_DATE)
FROM EMPLOYEE;  -- 1380000	bang_ms@kh.or.kr	90/02/06

SELECT MAX(SALARY), MAX(EMAIL), MAX(HIRE_DATE)
FROM EMPLOYEE;  -- 8000000	youn_eh@kh.or.kr	17/06/19


-- COUNT(* | 컬럼명) : 행의 개수 리턴
-- COUNT(DISTINCT 컬럼명) : 중복을 제거한 행 개수 리턴
-- COUNT(*) : NULL을 포함한 전체 행 개수 리턴
-- COUNT(컬럼명) : NULL을 제외한 전체 행 개수 리턴
SELECT COUNT(*), COUNT(DEPT_CODE), COUNT(DISTINCT DEPT_CODE)
FROM EMPLOYEE;      -- 23	21	6


