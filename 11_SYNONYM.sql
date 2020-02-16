-- ���Ǿ�(SYNONYM) : �ٸ� DB�� ���� ��ü�� ���� ���� Ȥ�� ���Ӹ�
-- ���Ǿ ����Ͽ� �����ϰ� ������ �� �ֵ��� ��

-- ����� ���Ǿ� : ��ü�� ���� ���� ������ �ο� ���� ����ڰ� ������ ���Ǿ�� �ش� ����ڸ� ��� ����
CREATE SYNONYM EMP FOR EMPLOYEE;
-- insufficient privileges ���� ����


GRANT CREATE SYNONYM TO KH;     -- SYSTEM ����

SELECT * FROM EMPLOYEE;
SELECT * FROM EMP;
--EMP�� �����ص� �����ϰ� ����

-- ���� ���Ǿ� : ��� ������ �ִ� �����(DBA)�� ������ ���Ǿ�
--              ��� ����ڰ� ����� �� ����
SELECT * FROM KH.EMPLOYEE;
SELECT * FROM KH.EMP;
SELECT * FROM KH.DEPARTMENT;

CREATE PUBLIC SYNONYM DEPT FOR KH.DEPARTMENT;

SELECT * FROM DEPT;

-- ���Ǿ� ����
DROP SYNONYM EMP;
SELECT * FROM EMP;

DROP PUBLIC SYNONYM DEPT;
-- private synonym to be dropped does not exist  PUBLIC ���� �������� �� ������
-- insufficient privileges  ���� ���� SYSTEM���� ���� ����
SELECT * FROM DEPT;















