--REGION 테이블에 R_ID를 수정하고 싶어요
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
        
        O_MSG := '지역ID가 업데이트 되었습니다';
    ELSE
        O_MSG := '지역ID가 사용중이여서 변경할 수 없습니다';
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

    --1. 기존아이디 값이 존재하는지 여부
    --2. 기존아이디가 존재하면 새로운 아이디가 중복되지 않는지 확인
    --3. 중복되지않으면 그냥 수정
    --4. 중복이 된다면 새로운 아이디로 수정하고 알려주는 로직
    
    SELECT COUNT(*)
    INTO V_OLD_CNT
    FROM REGION_TBL
    WHERE R_ID = IN_OLD_R_ID
    ;
    
    IF V_OLD_CNT = 0 THEN
    
        O_MSG := '입력하신 ' || IN_OLD_R_ID || ' 아이디가 존재하지 않습니다';
        
    ELSE
        
        --아이디가 존재한다 -> 중복체크
        SELECT COUNT(*)
        INTO V_NEW_CNT
        FROM REGION_TBL
        WHERE R_ID = IN_NEW_R_ID
        ;
        
        IF V_NEW_CNT = 0 THEN
        
            --중복안되요 UPDATE
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
                
            O_MSG := '입력하신 아이디는' || IN_NEW_R_ID || '로 수정되었습니다 ';
                
        ELSE
        
            --중복되었어요
            
            --1. 새로운 아이디를 만든다
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
            
             O_MSG := '입력하신 아이디' || IN_NEW_R_ID || ' 는 중복되어서 '|| V_NEW_ID ||' 로 수정되었습니다 ';
            
        END IF
        ;
        
    END IF;

END PROC_UP_REGION
;