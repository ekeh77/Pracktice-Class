CREATE TABLE PROPIT_TBL
(
    PR_ID       NUMBER(5)   NOT NULL    PRIMARY KEY,
    PR_YYYYMM   CHAR(6)     NOT NULL,
    TLT_PRICE   NUMBER(10)  NOT NULL
);

SELECT * FROM SALES_TBL;
--202101
--202102
--202103
--202104

CREATE OR REPLACE PROCEDURE PROC_INSERT_PROFIT
(
    IN_GET_MONTH        IN      VARCHAR2,
    O_MSG               OUT     VARCHAR2
)
AS
    
    V_PRICE     NUMBER(10);
    V_PR_ID_CHK NUMBER(3);
    V_PR_ID_MAX NUMBER(3);

BEGIN

    --1.달 전체 판매값을 구한다
    SELECT NVL(T2.SUMMONTHPRICE,0)
    INTO V_PRICE
    FROM
    (
        SELECT TO_CHAR(MONTHDATE, 'YYYYMM') AS FMONTHDATE
        FROM
        (
            SELECT TO_DATE('2021-01-01') + LEVEL AS MONTHDATE
            FROM
            DUAL
            CONNECT BY LEVEL < 365
        )
        GROUP BY TO_CHAR(MONTHDATE, 'YYYYMM')
    ) T1,
    (
        SELECT TO_CHAR(S_OUTDATE,'YYYYMM') PRICEMONTH , SUM(S_PRICE * S_QTY) AS SUMMONTHPRICE
        FROM SALES_TBL
        GROUP BY TO_CHAR(S_OUTDATE,'YYYYMM')
    ) T2
    WHERE T1.FMONTHDATE = T2.PRICEMONTH(+)
    AND T1.FMONTHDATE = IN_GET_MONTH
    ORDER BY T1.FMONTHDATE
    ;
    --2.PR_ID를 0에서 부터 만들기위한 변수생성
    
    SELECT COUNT(*)
    INTO V_PR_ID_CHK
    FROM PROFIT_TBL
    WHERE PR_ID = 1
    ;
    
    SELECT MAX(PR_ID) +1
    INTO V_PR_ID_MAX
    FROM PROFIT_TBL
    ;
    
    IF LENGTH(IN_GET_MONTH) = 6 AND SUBSTR(IN_GET_MONTH,1,4) = 2021 AND (SUBSTR(IN_GET_MONTH,5,2) >= 1 OR SUBSTR(IN_GET_MONTH,5,2) <= 12) THEN
    
        IF V_PR_ID_CHK = 0 THEN
        
            INSERT INTO PROFIT_TBL
            (PR_ID, PR_YYYYMM, TLT_PRICE)
            VALUES
            (1,IN_GET_MONTH,V_PRICE)
            ;
            
        ELSE
        
            INSERT INTO PROFIT_TBL
            (PR_ID, PR_YYYYMM, TLT_PRICE)
            VALUES
            (V_PR_ID_MAX,IN_GET_MONTH,V_PRICE)
            ;
            
        END IF
        ;
    ELSE
    
        O_MSG := '올바른 날짜값을 입력해주세요 예)202101';
        
    END IF
    ;
END PROC_INSERT_PROPIT
;