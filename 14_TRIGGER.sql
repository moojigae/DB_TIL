-- TRIGGER (Ʈ����) : ���̺��̳� �信 INSERT, UPDATE, DELETE���� �߻��� ��� �ڵ������� ����� ������ ������ ��ü
-- ������ �����ų� ���ÿ� ����� ���� ���� �� ����
/*
    * Ʈ���� ����
    - SQL���� ���� �ñ⿡ ���� �з�
        BRFORE TRIGGER : SQL�� ���� �� Ʈ���� ����
        AFTER TRIGGER : SQL�� ���� �� Ʈ���� ����
    - SQL���� ���� ������ �޴� �� ROW�� ���� �з�
        ROW TRIGGER : SQL�� �� ROW�� ���ؼ� �� ������ ����(FOR EACH ROW �ɼ� �ۼ�)
        STATEMENT TRIGGER : ��ü SQL���� ���� �� ���� ����(DEFAULT)
            EX. UPDATE EMPLOYEE SET SALARY = 0; ���� �࿡ ���� �ڷᰡ ��������� SQL�� ���� �� ���� Ʈ���� ����

    * ǥ����
        CREATE OR REPLACE TRIGGER Ʈ���Ÿ�
        BEFORE | AFTER
        INSERT | UPDATE | DELETE
        ON ���̺��
        [FOR EACH ROW] -- ROW TRIGGER �ɼ�
        [WHEN ����]
        DECLARE
            �����
        BEGIN
            �����
        [EXCEPTION
            ����ó����]
        END;
        /
*/

-- EMPLOYEE ���̺� ����� �߰��Ǹ� '���Ի���� �Ի��߽��ϴ�'��� ������ ��µǴ� TRG_01 Ʈ���� ����
-- INSERT ��     ==> INSERT �Ŀ� �޼��� ���
-- UPDATE �� 
-- DELETE
CREATE OR REPLACE TRIGGER TRG_01
AFTER INSERT ON EMPLOYEE
BEGIN 
    DBMS_OUTPUT.PUT_LINE('���Ի���� �Ի��߽��ϴ�.');
END;
/

COMMIT;

INSERT INTO EMPLOYEE
VALUES(905,'�漺��','690512-1151432', 'gil_sc@kh.or.kr', '01077778888', 'D5', 'J3', 'S5', 3000000, 0.1, 200,
SYSDATE, NULL, DEFAULT);

COMMIT;

-- ��ǰ ������ �ִ� PRODUCT���̺� ����
CREATE TABLE PRODUCT(
    PCODE NUMBER PRIMARY KEY,
    PNAME VARCHAR2(30),
    BRAND VARCHAR2(30),
    PRICE NUMBER,
    STOCK NUMBER DEFAULT 0
);
-- ��ǰ ����� �� �̷� ������ �ִ� PRO_DETAIL ���̺� ����
CREATE TABLE PRO_DETAIL(
    DCODE NUMBER PRIMARY KEY,   -- ���ڵ�
    PCODE NUMBER,
    PDATE DATE,     
    AMOUNT NUMBER,
    STATUS VARCHAR2(10) CHECK(STATUS IN ('�԰�', '���')),
    FOREIGN KEY(PCODE) REFERENCES PRODUCT
);

CREATE SEQUENCE SEQ_PCODE;
CREATE SEQUENCE SEQ_DCODE;

INSERT INTO PRODUCT VALUES(SEQ_PCODE.NEXTVAL, '�����ó�Ʈ8', '�Ｚ', 300000, DEFAULT);
INSERT INTO PRODUCT VALUES(SEQ_PCODE.NEXTVAL, '������8', '����', 800000, DEFAULT);
INSERT INTO PRODUCT VALUES(SEQ_PCODE.NEXTVAL, 'V30', 'LG', 500000, DEFAULT);

SELECT * FROM PRODUCT;
SELECT * FROM PRO_DETAIL;

-- ��ǰ ����� ���̺� �԰� ��� �� ������ PRODUCT�� �ִ� STOCK�� �ٲ��� ��
-- PRO_DETAIL ���̺� INSERT �Ŀ� STATUS�÷� ���� ���� PRODUCT���̺� ����
CREATE OR REPLACE TRIGGER TRG_02
AFTER INSERT ON PRO_DETAIL
FOR EACH ROW
BEGIN
    IF :NEW.STATUS = '�԰�'   -- PRO_DETAIL�� STATUS�� ���� �� ���� '�԰�'��
    THEN
        UPDATE PRODUCT
        SET STOCK = STOCK + :NEW.AMOUNT
        WHERE PCODE = :NEW.PCODE;   
        -- PRO_DETAIL���� �԰�� PCODE�� ���� ���
    END IF;
    
    IF :NEW.STATUS = '���'
    THEN
        UPDATE PRODUCT
        SET STOCK = STOCK - :NEW.AMOUNT
        WHERE PCODE = :NEW.PCODE;
    END IF;
END;
/

SELECT * FROM PRODUCT;
SELECT * FROM PRO_DETAIL;

INSERT INTO PRO_DETAIL VALUES(SEQ_DCODE.NEXTVAL, 1, SYSDATE, 5, '�԰�');
INSERT INTO PRO_DETAIL VALUES(SEQ_DCODE.NEXTVAL, 2, SYSDATE, 10, '�԰�');
INSERT INTO PRO_DETAIL VALUES(SEQ_DCODE.NEXTVAL, 3, SYSDATE, 20, '�԰�');
INSERT INTO PRO_DETAIL VALUES(SEQ_DCODE.NEXTVAL, 2, SYSDATE, 9, '���');
INSERT INTO PRO_DETAIL VALUES(SEQ_DCODE.NEXTVAL, 1, SYSDATE, 2, '���');
INSERT INTO PRO_DETAIL VALUES(SEQ_DCODE.NEXTVAL, 3, SYSDATE, 6, '���');

COMMIT;
