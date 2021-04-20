--REGION ���̺� R_ID�� �����ϰ� �;��
/*
SELECT * FROM REGION_TBL;

UPDATE REGION_TBL
SET R_ID = 'R' || (SELECT TO_CHAR(TO_NUMBER(SUBSTR(MAX(R_ID),2)) + 1 ,'FM00000')FROM REGION_TBL)
WHERE R_ID = 'R00001'
;

--ROLLBACK;

CREATE OR REPLACE PROCEDURE UPDATE_REGION_TBL
(
    IN_R_ID     IN      VARCHAR2,
    CNG_R_ID    IN      VARCHAR2,
    O_MSG       OUT     VARCHAR2
)
AS

    V_MAKE_R_ID     CHAR(6);
    V_CHK_C         NUMBER(3);
    V_CHK_W         NUMBER(3);
    
    
BEGIN

    SELECT TO_CHAR(TO_NUMBER(SUBSTR(MAX(R_ID),2)) + 1 ,'FM00000')
    INTO V_MAKE_R_ID
    FROM REGION_TBL
    ;
    
    SELECT COUNT(*)
    INTO V_CHK_C
    FROM CUSTOMER_TBL
    WHERE C_REGION = CNG_R_ID
    ;
    SELECT COUNT(*)
    INTO V_CHK_W
    FROM WHOLESALE_TBL
    WHERE W_REGION = CNG_R_ID
    ;
    
    
    IF V_CHK_C = 0 AND V_CHK_W = 0 THEN
        UPDATE CUSTOMER_TBL
        SET C_REGION = V_MAKE_R_ID
        WHERE C_REGION = IN_R_ID
        ;
        
        UPDATE WHOLESALE_TBL
        SET W_REGION = V_MAKE_R_ID
        WHERE W_REGION = IN_R_ID
        ;
        
        UPDATE REGION_TBL
        SET R_ID = V_MAKE_R_ID
        WHERE R_ID = IN_R_ID
        ;
        
        O_MSG := '����ID�� ������Ʈ �Ǿ����ϴ�';
    ELSE
        O_MSG := '����ID�� ������̿��� ������ �� �����ϴ�';
    END IF
    ;
    
END UPDATE_REGION_TBL
;
*/

CREATE OR REPLACE PROCEDURE PROC_UP_REGION
(
    IN_OLD_R_ID     IN      VARCHAR2,
    IN_NEW_R_ID     IN      VARCHAR2,
    O_MSG           OUT     VARCHAR2
)
AS

    V_OLD_CNT       NUMBER(3);
    V_NEW_CNT       NUMBER(3);
    V_NEW_ID        CHAR(6);

BEGIN

    --1. �������̵� ���� �����ϴ��� ����
    --2. �������̵� �����ϸ� ���ο� ���̵� �ߺ����� �ʴ��� Ȯ��
    --3. �ߺ����������� �׳� ����
    --4. �ߺ��� �ȴٸ� ���ο� ���̵�� �����ϰ� �˷��ִ� ����
    
    SELECT COUNT(*)
    INTO V_OLD_CNT
    FROM REGION_TBL
    WHERE R_ID = IN_OLD_R_ID
    ;
    
    IF V_OLD_CNT = 0 THEN
    
        O_MSG := '�Է��Ͻ� ' || IN_OLD_R_ID || ' ���̵� �������� �ʽ��ϴ�';
        
    ELSE
        
        --���̵� �����Ѵ� -> �ߺ�üũ
        SELECT COUNT(*)
        INTO V_NEW_CNT
        FROM REGION_TBL
        WHERE R_ID = IN_NEW_R_ID
        ;
        
        IF V_NEW_CNT = 0 THEN
        
            --�ߺ��ȵǿ� UPDATE
            --1.REGION_TBL
            
                UPDATE REGION_TBL
                SET R_ID = IN_NEW_R_ID
                WHERE R_ID = IN_OLD_R_ID
                ;
                
            --2.CUSTOMER_TBL
            
                UPDATE CUSTOMER_TBL
                SET C_REGION = IN_NEW_R_ID
                WHERE C_REGION = IN_OLD_R_ID
                ;
            
            --3.WHOLESALE_TBL
            
                UPDATE WHOLESALE_TBL
                SET W_REGION = IN_NEW_R_ID
                WHERE W_REGION = IN_OLD_R_ID
                ;
                
            O_MSG := '�Է��Ͻ� ���̵��' || IN_NEW_R_ID || '�� �����Ǿ����ϴ� ';
                
        ELSE
        
            --�ߺ��Ǿ����
            
            --1. ���ο� ���̵� �����
            SELECT 'R' || TO_CHAR(TO_NUMBER(SUBSTR(MAX(R_ID), 2)) + 1, 'FM00000')
            INTO V_NEW_ID
            FROM REGION_TBL
            ;
            
            --2.
            
            --1.REGION_TBL
            
                UPDATE REGION_TBL
                SET R_ID = V_NEW_ID
                WHERE R_ID = IN_OLD_R_ID
                ;
                
            --2.CUSTOMER_TBL
            
                UPDATE CUSTOMER_TBL
                SET C_REGION = V_NEW_ID
                WHERE C_REGION = IN_OLD_R_ID
                ;
            
            --3.WHOLESALE_TBL
            
                UPDATE WHOLESALE_TBL
                SET W_REGION = V_NEW_ID
                WHERE W_REGION = IN_OLD_R_ID
                ;
            
             O_MSG := '�Է��Ͻ� ���̵�' || IN_NEW_R_ID || ' �� �ߺ��Ǿ '|| V_NEW_ID ||' �� �����Ǿ����ϴ� ';
            
        END IF
        ;
        
    END IF;

END PROC_UP_REGION
;