SET SERVEROUTPUT ON;
--Ȯ���� ���ִ°�
DECLARE --���ν����� �������ʰ� �����ϴ� �׽�Ʈ ���
    -- ���� �����
BEGIN
    -- ������
    FOR N IN 1..100000
    LOOP
    
        DBMS_OUTPUT.PUT_LINE(N);--Ȯ��
        
    END LOOP
    ;
    
END;

CREATE TABLE INDEX_TEST
(
    TID     CHAR(8)         NOT NULL,
    TNAME   VARCHAR2(50)    NOT NULL
);


DECLARE 

BEGIN

    FOR N IN 1..1000000
    LOOP
    
       INSERT INTO INDEX_TEST
       VALUES('I'|| TO_CHAR(N,'FM0000000'), 'ȫ�浿' || TO_CHAR(N))
        ;
        
    END LOOP
    ;
    
END;

SELECT COUNT(*) FROM INDEX_TEST;

DELETE FROM INDEX_TEST;

SELECT * FROM INDEX_TEST
WHERE TID = 'I0074142'
;
SELECT * FROM INDEX_TEST
WHERE TNAME = 'ȫ�浿1'
;

--COMMIT;

--�����ȹ
--OBJECT_NAME > ���̺��̸�
--OPTIONS > SCAN�� ��� �ϴ���
--CARDINALITY > �ߺ��� ���ڰ� ���� ���� �ߺ��� ���� - �INDEX�� ���� ���ϴ°�
--COST > CPU�� ���ϴ� �� ���ڰ� ũ��Ŭ���� SQL���(SELECT)�ð��� �����ɸ�