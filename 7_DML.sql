-- DML : ������ ���� ���
-- INSERT, UPDATE, DELETE

-- INSERT : ���ο� ���� �߰��ϴ� ����(���̺� �� ���� ����)
-- INSERT INTO ���̺��(�÷���, ...)
-- VALUES(������, ...)
INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL,PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, 
                     BONUS, MANAGER_ID, HIRE_DATE, ENT_DATE, ENT_YN)
VALUES(900, '��ä��', '901123-1080503', 'jang_ch@kr.or.kr', '01055569512', 'D1', 'J7', 'S3',
       4300000, 0.2, '200', SYSDATE, NULL, DEFAULT);

SELECT * FROM EMPLOYEE;

ROLLBACK;

INSERT INTO EMPLOYEE
VALUES(900,'��ä��', '901123-1080503', 'jang_ch@kr.or.kr', '01055569512', 'D1', 'J7', 'S3',
       4300000, 0.2, '200', SYSDATE, NULL, DEFAULT);
       
COMMIT;    
























