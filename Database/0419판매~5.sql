CREATE OR REPLACE PROCEDURE PROC_INSERT_BUY_TBL
(
    IN_PRO_ID       IN      VARCHAR2,
    IN_W_ID         IN      VARCHAR2,
    IN_B_PRICE      IN      NUMBER,
    IN_B_QTY        IN      NUMBER,
    IN_B_CONTENT    IN      VARCHAR2
)
AS

    V_B_IDX         NUMBER(6);
    
BEGIN

    --1. B_IDX���� ��� �Ҳ���
    
    SELECT MAX(B_IDX) + 1
    INTO V_B_IDX
    FROM BUY_TBL
    WHERE PRO_ID = IN_PRO_ID AND W_ID = W_ID
    ;
        
    
    --2.INSERT
    
    INSERT INTO BUY_TBL
    (PRO_ID, W_ID, B_IDX, B_PRICE, B_QTY, B_INDATE, B_CONTENT)
    VALUES
    (IN_PRO_ID, IN_W_ID, V_B_IDX, IN_B_PRICE, IN_B_QTY, SYSDATE, IN_B_CONTENT)
    ;
    
END PROC_INSERT_BUY_TBL
;