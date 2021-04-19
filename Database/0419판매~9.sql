CREATE OR REPLACE PROCEDURE PROC_LOGIN
(
    IN_C_ID     IN      VARCHAR2,
    IN_C_PWD    IN      VARCHAR2,
    O_RST       OUT     VARCHAR2
)
AS

    CNT     NUMBER(3);

BEGIN

    SELECT COUNT(*) INTO CNT
    FROM CUSTOMER_TBL
    WHERE C_ID = IN_C_ID AND C_PWD = IN_C_PWD
    ;
    
    IF CNT = 1 THEN
        O_RST := '로그인 성공';
    ELSE
        O_RST := '로그인 실패';
    END IF
    ;

END PROC_LOGIN
;