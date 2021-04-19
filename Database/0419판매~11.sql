--�ش��ü�� ���Ż�(�Ű�����)���� ��� ��ǰ�� �ϳ��� �����ϴ� ���ν���
--������ ������� ������ ���� �� ����, ���������� ���ٸ� 1000�� ó��

CREATE OR REPLACE PROCEDURE PROC_BUY_ALL_PRODUCT
(
    IN_W_ID     IN      VARCHAR2
)
AS

BEGIN
    
    INSERT INTO BUY_TBL
    SELECT PRO_ID, IN_W_ID, COUNT(*) + 1 ,MIN(B_PRICE), 1, SYSDATE, NULL 
    FROM BUY_TBL
    WHERE W_ID = IN_W_ID
    GROUP BY PRO_ID
    ;
    
END PROC_BUY_ALL_PRODUCT
;

