-- 동의어(SYNONYM) : 다른 DB가 가진 객체에 대한 별명 혹은 줄임말
-- 동의어를 사용하여 간단하게 접근할 수 있도록 함

-- 비공개 동의어 : 객체에 대한 접근 권한을 부여 받은 사용자가 정의한 동의어로 해당 사용자만 사용 가능
CREATE SYNONYM EMP FOR EMPLOYEE;
-- insufficient privileges 권한 없음


GRANT CREATE SYNONYM TO KH;     -- SYSTEM 계정

SELECT * FROM EMPLOYEE;
SELECT * FROM EMP;
--EMP로 접근해도 동일하게 나옴

-- 공개 동의어 : 모든 권한을 주는 사용자(DBA)가 정의한 동의어
--              모든 사용자가 사용할 수 있음
SELECT * FROM KH.EMPLOYEE;
SELECT * FROM KH.EMP;
SELECT * FROM KH.DEPARTMENT;

CREATE PUBLIC SYNONYM DEPT FOR KH.DEPARTMENT;

SELECT * FROM DEPT;

-- 동의어 삭제
DROP SYNONYM EMP;
SELECT * FROM EMP;

DROP PUBLIC SYNONYM DEPT;
-- private synonym to be dropped does not exist  PUBLIC 빼고 실행했을 때 에러남
-- insufficient privileges  권한 부족 SYSTEM에서 삭제 가능
SELECT * FROM DEPT;















