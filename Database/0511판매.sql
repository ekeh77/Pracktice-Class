--CURSOR Ŀ��
--�����Ͱ� ���õǾ��ִ� ��

FOR CUR IN
    (
        SELECT N_ID, S_ID, N_DATE, N_MEMO FROM NEWS -- ���� LOOP�ϴ���
    )
LOOP --LOOP�� ���۵ȴ�

    --LOOP�ؼ� �Ұ�
    DBMS_OUTPUT.PUT_LINE(CUR.N_ID); -- �ڹٽ�ũ��Ʈ�� DOCUMENT.WRITE

END LOOP NEWS;--LOOP ��

--FULL SCAN
-- ��� �����͸� ��ĵ�ϴ°��� �ǹ�

--UNION - �ߺ��� �����͵� ���� �������
--UNION ALL - �ߺ��� �����͸� �ϳ��� �������
--�����͸� ROW�� ���̴°�
-- SELECT �ڸ��� �ʵ尡 ���ƾ���

SELECT * FROM CUSTOMER_TBL;

INSERT INTO CUSTOMER_TBL VALUES('C00016', '�ڿ켮', '2011-05-09', 'R00002', 'M', '1234', 0);
--COMMIT;

DELETE FROM CUSTOMER_TBL
WHERE C_ID = 'C00013'
;

UPDATE CUSTOMER_TBL
SET C_NAME = 'ȫ�浿'
WHERE C_ID = 'C00001'
;