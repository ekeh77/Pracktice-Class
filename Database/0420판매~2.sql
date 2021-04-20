--�Ǹ��ϴ� ���ν���
--� ���� ������� �󸶿� ������
--SELECT * FROM SALES_TBL;
CREATE OR REPLACE PROCEDURE PROC_INS_SALES
(
    IN_C_ID     IN      VARCHAR2,
    IN_PRO_ID   IN      VARCHAR2,
    IN_PRICE    IN      NUMBER,
    IN_QTY      IN      NUMBER
)
AS

    V_S_IDX     NUMBER;
    
BEGIN

    --1. ������, �������ǿ� ���� IDX�� ã��
    
    SELECT MAX(S_IDX) + 1
    INTO V_S_IDX
    FROM SALES_TBL
    WHERE C_ID = IN_C_ID AND PRO_ID = IN_PRO_ID
    ;
    
    --2. INSERT
    
    INSERT INTO SALES_TBL
    (C_ID, PRO_ID, S_IDX, S_PRICE, S_QTY, S_OUTDATE)
    VALUES
    (IN_C_ID, IN_PRO_ID,V_S_IDX, IN_PRICE, IN_QTY, SYSDATE)
    ;
    
    

END PROC_INS_SALES
;