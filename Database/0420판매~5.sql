--고객별 판매리스트
--고객 아이디 입력하면 고객이름과 판매리스트

CREATE OR REPLACE PROCEDURE PROC_SHOW_SALES_CUSTOMER
(
    IN_C_ID     IN      VARCHAR2,
    OUT_CUR     OUT     SYS_REFCURSOR
)
AS
BEGIN

    OPEN OUT_CUR FOR
    SELECT T1.C_ID,T1.C_NAME, NVL(T3.PRO_NAME,'구매없음')
    FROM CUSTOMER_TBL T1, SALES_TBL T2, PRODUCTS_TBL T3
    WHERE T1.C_ID = T2.C_ID(+)
    AND T3.PRO_ID(+) = T2.PRO_ID
    AND T1.C_ID = IN_C_ID
    GROUP BY T1.C_ID, T1.C_NAME, T3.PRO_NAME
    ;

END PROC_SHOW_SALES_CUSTOMER
;


--날짜별 판매리스트
--날짜 입력하면 해당 날짜 판매리스트

--지역별 판매리스트
--지역 아이디 입력하면 해당 지역 판매리스트

CREATE OR REPLACE PROCEDURE PROC_SHOW_SALES_REGION
(
    IN_R_ID     IN      VARCHAR2,
    OUT_CUR     OUT     SYS_REFCURSOR
)
AS
BEGIN
    OPEN OUT_CUR FOR
    SELECT T4.R_ID, T4.R_NAME, T2.PRO_NAME, SUM(T1.S_QTY)
    FROM SALES_TBL T1, PRODUCTS_TBL T2, CUSTOMER_TBL T3, REGION_TBL T4
    WHERE T1.C_ID = T3.C_ID
    AND T1.PRO_ID = T2.PRO_ID
    AND T3.C_REGION = T4.R_ID
    AND T4.R_ID = IN_R_ID
    GROUP BY T4.R_ID, T4.R_NAME, T2.PRO_NAME
    ;

END
;


--SELECT * FROM SALES_TBL;
--SELECT * FROM PRODUCTS_TBL;
--이벤트 - 새롭게 회원으로 가입하면 농심라면을 5개 무료로 준다