SELECT * FROM CUSTOMER_TBL;
SELECT * FROM SALES_TBL;

--고객들 중에 한번도 구매를 안한 고객

SELECT * 
FROM CUSTOMER_TBL T1, SALES_TBL T2
WHERE T1.C_ID = T2.C_ID(+)
AND T2.C_ID IS NULL
;

SELECT *
FROM CUSTOMER_TBL T1
WHERE EXISTS
(
    SELECT 1 FROM SALES_TBL
    WHERE C_ID = T1.C_ID
)
; --  T1에  SALES_TBL ROW가 존재하는것
SELECT *
FROM CUSTOMER_TBL T1
WHERE NOT EXISTS
(
    SELECT 1 FROM SALES_TBL
    WHERE C_ID = T1.C_ID
)
; --  T1에  SALES_TBL ROW가 존재하지않는것

--MERGE INTO문 > UPDATE, INSERT, DELETE를 JOIN문으로 구성할 때 사용하라고 만들어 놨음 - 단 PLSQL에서
--TABLE 하나에 MERGE INTO를 사용한다는것은 INSERT, UPDATE를 한번에 하자는 뜻

SELECT * FROM CUSTOMER_TBL;

MERGE INTO CUSTOMER_TBL T1
USING DUAL
ON(T1.C_ID = 'C00012')
WHEN MATCHED THEN
    UPDATE SET C_NAME = '홍길순'
WHEN NOT MATCHED THEN
    INSERT (C_ID, C_NAME, C_BIRTH, C_REGION, C_GENDER, C_PWD, C_POINT) 
    VALUES ('C00012','김갑순', '2021-05-13', 'R00002', 'F', '1234', 0)
;

SELECT * FROM CUSTOMER_TBL T1, SALES_TBL T2
WHERE T1.C_ID = T2.C_ID(+)
AND T1.C_GENDER = 'F'
;

--TSQL 조인문
SELECT * FROM CUSTOMER_TBL T1 JOIN SALES_TBL T2
ON T1.C_ID = T2.C_ID
;
--TSQL LEFT조인문
SELECT * FROM CUSTOMER_TBL T1 LEFT JOIN SALES_TBL T2
ON T1.C_ID = T2.C_ID
;
--TSQL LEFT조인문의 조건
SELECT * FROM CUSTOMER_TBL T1 LEFT JOIN SALES_TBL T2
ON T1.C_ID = T2.C_ID
WHERE T1.C_GENDER = 'F'
;

MERGE INTO CUSTOMER_TBL T1
USING
(
    --포인트 구하기
    SELECT T1.C_ID, T1.C_NAME, SUM(T2.S_QTY * T3.PRO_POINT) AS POINT
    FROM CUSTOMER_TBL T1, SALES_TBL T2, PRODUCTS_TBL T3
    WHERE T1.C_ID = T2.C_ID
    AND T2.PRO_ID = T3.PRO_ID
    GROUP BY T1.C_ID, T1.C_NAME
)
ON (T1.C_ID = T2.C_ID)
WHEN MATCHED THEN
UPDATE SET T1.C_POINT = T2.MYPOINT