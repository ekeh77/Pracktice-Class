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
        이렇게 하면 런타임에러가난다
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
        
        O_MSG := '삭제되었습니다.';
        
    ELSE
    
        O_MSG := '이미 사용된 아이디어서 삭제할 수 없습니다.';
        
    END IF
    ;

END PROC_DEL_REGION
;