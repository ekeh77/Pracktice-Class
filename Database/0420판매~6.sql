--고객별 판매리스트
--고객 아이디 입력하면 고객이름과 판매리스트

CREATE OR REPLACE PROCEDURE PROC_SEL_CUSTOMERS
(
    IN_C_ID     IN      VARCHAR2,
    O_CUR       OUT     SYS_REFCURSOR
)
AS
BEGIN
    
    OPEN O_CUR FOR
    SELECT T2.C_ID, T2.C_NAME, T3.PRO_NAME, T1.S_PRICE, T1.S_QTY, T1.S_OUTDATE
    FROM SALES_TBL T1, CUSTOMER_TBL T2, PRODUCTS_TBL T3
    WHERE T1.C_ID = T2.C_ID
    AND T1.PRO_ID = T3.PRO_ID
    AND T2.C_ID = IN_C_ID
    ORDER BY T1.S_OUTDATE ASC
    ;

END PROC_SEL_CUSTOMERS
;

--날짜별 판매리스트
--날짜 입력하면 해당 날짜 판매리스트 - 판매날짜, 상품명, 상품가격, 상품개수

CREATE OR REPLACE PROCEDURE PROC_SEL_PERDATE
(
    IN_DATE     IN      VARCHAR2,
    O_CUR       OUT     SYS_REFCURSOR
)
AS

BEGIN
    
    OPEN O_CUR FOR
    SELECT T1.S_OUTDATE, T2.PRO_NAME, AVG(T1.S_PRICE), SUM(T1.S_QTY) 
    FROM SALES_TBL T1, PRODUCTS_TBL T2
    WHERE T1.PRO_ID = T2.PRO_ID
    AND TO_CHAR(T1.S_OUTDATE, 'YYYYMMDD') = '20210207'
    GROUP BY T1.S_OUTDATE, T2.PRO_NAME
    ;
    
END PROC_SEL_PERDATE
;

--지역별 판매리스트
--지역 아이디 입력하면 해당 지역 판매리스트

CREATE OR REPLACE PROCEDURE PROC_SEL_PERRIGON
(
    IN_R_ID     IN      VARCHAR2,
    O_CUR       OUT     SYS_REFCURSOR
)
AS
BEGIN

    OPEN O_CUR FOR
    SELECT T3.R_ID, T3.R_NAME, T4.PRO_ID, T4.PRO_NAME, ROUND(AVG(T1.S_PRICE),2), SUM(T1.S_QTY)
    FROM SALES_TBL T1, CUSTOMER_TBL T2, REGION_TBL T3, PRODUCTS_TBL T4
    WHERE T1.C_ID = T2.C_ID
    AND T2.C_REGION = T3.R_ID
    AND T1.PRO_ID = T4.PRO_ID
    AND T3.R_ID = IN_R_ID
    GROUP BY T3.R_ID, T3.R_NAME, T4.PRO_ID, T4.PRO_NAME
    ORDER BY T3.R_NAME
    ;

END PROC_SEL_PERRIGON
;

--SELECT * FROM SALES_TBL;
--SELECT * FROM PRODUCTS_TBL;
--이벤트 - 새롭게 회원으로 가입하면 농심라면을 5개 무료로 준다


CREATE OR REPLACE PROCEDURE PROC_INS_NEWCUSTOMER
(
    IN_C_NAME       IN      VARCHAR2,  
    IN_C_BIRTH      IN      VARCHAR2,
    IN_C_REGION     IN      VARCHAR2,
    IN_C_GENDER     IN      VARCHAR2,
    IN_C_PWD        IN      VARCHAR2
)
AS
    
    V_NEW_C_ID      CHAR(6);

BEGIN

    SELECT  'C' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(C_ID), 'C00000'),2))+1,'FM00000')
    INTO V_NEW_C_ID
    FROM CUSTOMER_TBL
    ;
    
    INSERT INTO CUSTOMER_TBL
    (C_ID, C_NAME, C_BIRTH, C_REGION, C_GENDER, C_PWD)
    VALUES
    (V_NEW_C_ID, IN_C_NAME, TO_DATE(IN_C_BIRTH, 'YYYYMMDD'), IN_C_REGION, IN_C_GENDER, IN_C_PWD)
    ;
    
    --0원에 5개의 농심라면을 판매 --> SALES_TBL
    
    INSERT INTO SALES_TBL
    (C_ID, PRO_ID, S_IDX, S_PRICE, S_QTY, S_OUTDATE)
    VALUES
    (V_NEW_C_ID, 'P00001', 1, 0, 5, SYSDATE)
    ;
    
END PROC_INS_NEWCUSTOMER
;