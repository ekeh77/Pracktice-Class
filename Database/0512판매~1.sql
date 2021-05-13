SET SERVEROUTPUT ON;
DECLARE
    
BEGIN
    FOR CUR IN
    (
        SELECT * FROM SALES_TBL    
    )
    LOOP
        IF CUR.S_PRICE * CUR.S_QTY > 5000 THEN
        DBMS_OUTPUT.PUT_LINE(CUR.C_ID || '-' || CUR.PRO_ID);
        END IF
        ;
    END LOOP
    ;
END;

DECLARE
    
    NUM     NUMBER(5) := 1 ; --초기값 주기
    RES     NUMBER(10):=0 ;
BEGIN

    WHILE(NUM <= 100) -- 이 안에 조건이 참일동안 반복
    LOOP
        RES := RES + NUM;
        NUM := NUM + 1;
        
        
    END LOOP;
     DBMS_OUTPUT.PUT_LINE(RES);
   
END
;

DECLARE
    NUM     NUMBER(5) := 1 ;
BEGIN

    
    LOOP
    
        DBMS_OUTPUT.PUT_LINE(NUM);
        
        IF NUM = 100 THEN
        EXIT; -- 반복문 탈출
        END IF;
        
        NUM := NUM + 1;
        
    END LOOP
    ;
    
END
;