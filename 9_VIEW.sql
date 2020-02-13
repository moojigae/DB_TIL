-- VIEW (��)
-- SELECT���� ���� ��� ȭ���� ������ ��ü, ������ ���� ���̺�
-- ���� �����͸� �����ϰ� ���� ������ ���̺� ����ϴ� �Ͱ� �����ϰ� ��� ����
-- [ǥ����]
-- CREATE [OR REPLACE] VIEW ���̸� AS ��������
-- OR REPLACE : �� ���� �� ���� �̸��� �䰡 ������ �����Ѵٸ� �ش� �並 ���Ӱ� ����
-- OR REPLACE�� ������� �ʰ� �並 ���� �� ���� �̸��� �並 �� ���� �� �̹� �ٸ� ��ü�� ������� �̸��̶�� ���� �߻�

-- ���, �̸�, �μ���, �ٹ������� ��ȸ�ϰ� �� ����� V_EMPLOYEE��� �並 �����Ͽ� ����
CREATE OR REPLACE VIEW V_EMPLOYEE
AS SELECT EMP_ID, EMP_NAME, DEPT_TITLE, NATIONAL_NAME
    FROM EMPLOYEE
    LEFT JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
    LEFT JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
    LEFT JOIN NATIONAL USING (NATIONAL_CODE);
-- insufficient privileges    

-- SYSTEM �������� ���� �ֱ�
GRANT CREATE VIEW TO KH;

SELECT * FROM V_EMPLOYEE;

COMMIT;

-- EMPLOYEE ��� 205���� ����� �̸��� '���߾�'���� ����
UPDATE EMPLOYEE
SET EMP_NAME = '���߾�'
WHERE EMP_ID = 205;

SELECT * FROM V_EMPLOYEE;
-- ���̽����̺��� ������ ����Ǹ� VIEW�� �����

ROLLBACK;

-- ������ �� �÷��� ��Ī �ο�
-- ���������� SELECT���� �Լ��� ���� ��� �ݵ�� ��Ī ����(�� �������� �ȿ� ���� ����� ���� ����)
CREATE OR REPLACE VIEW V_EMP_JOB(���, �̸�, ����, ����, �ٹ����)
AS SELECT EMP_ID, EMP_NAME, JOB_NAME,
          DECODE(SUBSTR(EMP_NO, 8, 1), 1, '��', 2, '��'),
          EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE)
   FROM EMPLOYEE
        JOIN JOB USING(JOB_CODE);
--  must name this expression with a column alias ��Ī ������� ����

SELECT * FROM V_EMP_JOB;


-- ������ �並 �̿��� DML�� ��� ����
CREATE OR REPLACE VIEW V_JOB
AS SELECT JOB_CODE, JOB_NAME
    FROM JOB;

-- �信 INSERT���
INSERT INTO V_JOB
VALUES ('J8', '����');

SELECT * FROM V_JOB;
SELECT * FROM JOB;
-- �信�� ��û�� DML������ ���̽� ���̺� �Բ� ������

-- �信 UPDATE ���
UPDATE V_JOB
SET JOB_NAME = '�˹�'
WHERE JOB_CODE = 'J8';

SELECT * FROM V_JOB;
SELECT * FROM JOB;

-- �信 DELETE ���
DELETE FROM V_JOB
WHERE JOB_CODE = 'J8';

SELECT * FROM V_JOB;
SELECT * FROM JOB;

COMMIT;










