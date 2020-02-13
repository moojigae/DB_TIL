-- VIEW (뷰)
-- SELECT쿼리 실행 결과 화면을 저장한 객체, 논리적인 가상 테이블
-- 실제 데이터를 저장하고 있지 않지만 테이블 사용하는 것과 동일하게 사용 가능
-- [표현식]
-- CREATE [OR REPLACE] VIEW 뷰이름 AS 서브쿼리
-- OR REPLACE : 뷰 생성 시 같은 이름의 뷰가 기존에 존재한다면 해당 뷰를 새롭게 변경
-- OR REPLACE를 사용하지 않고 뷰를 생성 후 같은 이름의 뷰를 또 생성 시 이미 다른 객체가 사용중인 이름이라고 에러 발생

-- 사번, 이름, 부서명, 근무지역을 조회하고 그 결과를 V_EMPLOYEE라는 뷰를 생성하여 저장
CREATE OR REPLACE VIEW V_EMPLOYEE
AS SELECT EMP_ID, EMP_NAME, DEPT_TITLE, NATIONAL_NAME
    FROM EMPLOYEE
    LEFT JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
    LEFT JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
    LEFT JOIN NATIONAL USING (NATIONAL_CODE);
-- insufficient privileges    

-- SYSTEM 계정에서 권한 주기
GRANT CREATE VIEW TO KH;

SELECT * FROM V_EMPLOYEE;

COMMIT;

-- EMPLOYEE 사번 205번인 사원의 이름을 '정중앙'으로 변경
UPDATE EMPLOYEE
SET EMP_NAME = '정중앙'
WHERE EMP_ID = 205;

SELECT * FROM V_EMPLOYEE;
-- 베이스테이블의 정보가 변경되면 VIEW도 변경됨

ROLLBACK;

-- 생성된 뷰 컬럼에 별칭 부여
-- 서브쿼리의 SELECT절에 함수가 사용된 경우 반드시 별칭 지정(뷰 서브쿼리 안에 연산 결과도 포함 가능)
CREATE OR REPLACE VIEW V_EMP_JOB(사번, 이름, 직급, 성별, 근무년수)
AS SELECT EMP_ID, EMP_NAME, JOB_NAME,
          DECODE(SUBSTR(EMP_NO, 8, 1), 1, '남', 2, '여'),
          EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE)
   FROM EMPLOYEE
        JOIN JOB USING(JOB_CODE);
--  must name this expression with a column alias 별칭 넣으라는 에러

SELECT * FROM V_EMP_JOB;


-- 생성된 뷰를 이용해 DML문 사용 가능
CREATE OR REPLACE VIEW V_JOB
AS SELECT JOB_CODE, JOB_NAME
    FROM JOB;

-- 뷰에 INSERT사용
INSERT INTO V_JOB
VALUES ('J8', '인턴');

SELECT * FROM V_JOB;
SELECT * FROM JOB;
-- 뷰에서 요청한 DML구문은 베이스 테이블도 함께 변경함

-- 뷰에 UPDATE 사용
UPDATE V_JOB
SET JOB_NAME = '알바'
WHERE JOB_CODE = 'J8';

SELECT * FROM V_JOB;
SELECT * FROM JOB;

-- 뷰에 DELETE 사용
DELETE FROM V_JOB
WHERE JOB_CODE = 'J8';

SELECT * FROM V_JOB;
SELECT * FROM JOB;

COMMIT;










