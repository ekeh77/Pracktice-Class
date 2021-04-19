--해당업체가 도매상(매개변수)에서 모든 제품을 하나씩 구매하는 프로시져
--가격은 현재까지 구매한 제일 싼 가격, 구매한적이 없다면 1000원 처리

CREATE OR REPLACE PROCEDURE PROC_BUY_ALL_PRODUCT
(
    IN_W_ID     IN      VARCHAR2
)
AS

BEGIN
    
    INSERT INTO BUY_TBL
    SELECT PRO_ID, IN_W_ID, COUNT(*) + 1 ,MIN(B_PRICE), 1, SYSDATE, NULL 
    FROM BUY_TBL
    WHERE W_ID = IN_W_ID
    GROUP BY PRO_ID
    ;
    
END PROC_BUY_ALL_PRODUCT
;

