--TYPE

DECLARE

    TBL     TEST_TBL; --COLLECTION
    NNN     NUMBER(5);
    
BEGIN

    TBL := TEST_TBL(3, 4, 5, 6, 7, 8);
    
    NNN := TBL(1) + TBL(2) + TBL(3) + TBL(4) + TBL(5) + TBL(6); 
    
    
END;

CREATE OR REPLACE NONEDITIONABLE TYPE TEST_TBL IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;

TYPE TEST_TBL IS TABLE OF VARCHAR2(30) INDEX BY BINARY_INTEGER;
--�� ���� ������ �����ʾƵ� ��Ű������ �̷��� �����ϸ� ������ ������ ��밡��

--VARCHAR2, NUMBER(INTEGER, DOUBLE, FLOAT)�� ����Ŭ������ �������ִ� �Լ�������
--����Ŭ ����ڰ� ���� �� ���ϰ� �ڵ��� �� �ֵ��� ���

SET SERVEROUTPUT ON
SET TIME ON; --�� �ð�ǥ��
DECLARE
    AA      NUMBER(10);
    BB      NUMBER(10);
    CC      NUMBER(10);
BEGIN
    FOR I IN 1..1000000
    LOOP
        AA := I + 1;
        BB := I + 2;
        CC := AA+BB;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(CC);
END;
---------------�ӵ��� ����

SET SERVEROUTPUT ON
SET TIME ON; --�� �ð�ǥ��
DECLARE
    AA      BINARY_INTEGER;
    BB      BINARY_INTEGER;
    CC      BINARY_INTEGER;
BEGIN
    FOR I IN 1..1000000
    LOOP
        AA := I + 1;
        BB := I + 2;
        CC := AA+BB;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(CC);
END;
-----------------------�ӵ��� ����

SET SERVEROUTPUT ON
SET TIME ON; --�� �ð�ǥ��
DECLARE
    AA      INTEGER;
    BB      INTEGER;
    CC      INTEGER;
BEGIN
    FOR I IN 1..1000000
    LOOP
        AA := I + 1;
        BB := I + 2;
        CC := AA+BB;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(CC);
END;
-----------------------�ӵ��� NUMBER���� ����