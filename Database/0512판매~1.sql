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
    
    NUM     NUMBER(5) := 1 ; --�ʱⰪ �ֱ�
    RES     NUMBER(10):=0 ;
BEGIN

    WHILE(NUM <= 100) -- �� �ȿ� ������ ���ϵ��� �ݺ�
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
        EXIT; -- �ݺ��� Ż��
        END IF;
        
        NUM := NUM + 1;
        
    END LOOP
    ;
    
END
;