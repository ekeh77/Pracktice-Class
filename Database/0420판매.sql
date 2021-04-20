CREATE OR REPLACE PROCEDURE PROC_DEL_REGION
(
    IN_R_ID     IN      VARCHAR2,
    O_MSG       OUT     VARCHAR2
)
AS

    V_CUM_CNT       NUMBER(3);
    V_WHO_CMT       NUMBER(3);

BEGIN
    
    
    /*
        SELECT C_ID
        INTO V_CUM_CNT
        FROM CUSTOMER_TBL
        WHERE C_REGION = IN_R_ID
        ;
        �̷��� �ϸ� ��Ÿ�ӿ���������
    */
    
    --CUSTOMER_TBL
    --WHOLESALE_TBL
    
    SELECT COUNT(*)
    INTO V_CUM_CNT
    FROM CUSTOMER_TBL
    WHERE C_REGION = IN_R_ID
    ;
    
    SELECT COUNT(*)
    INTO V_WHO_CMT
    FROM WHOLESALE_TBL
    WHERE W_REGION = IN_R_ID
    ;
    
    IF V_CUM_CNT = 0 AND V_WHO_CNT = 0 THEN
    
        DELETE FROM REGION_TBL
        WHERE R_ID = IN_R_ID
        ;
        
        O_MSG := '�����Ǿ����ϴ�.';
        
    ELSE
    
        O_MSG := '�̹� ���� ���̵� ������ �� �����ϴ�.';
        
    END IF
    ;

END PROC_DEL_REGION
;