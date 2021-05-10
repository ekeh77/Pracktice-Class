create or replace NONEDITIONABLE PACKAGE PKG_SALES_INFO AS 

/* 고객별 구매금액 확인 프로시저 시작 */

    --고객별 구매한금액(판매가)를 구한다 
  PROCEDURE PROC_SALES_CUSTOMER
  (
    IN_CT_ID            IN      VARCHAR2,--아무것도 넣지않으면 모든값을 보여준다
    IN_W_SHOW           IN      VARCHAR2,--S(SALES)일 경우 일반게임판매 A(APPLY)일경우 예약게임판매 아무것도 넣지않으면 모든값을 보여준다 
    O_CUR               OUT     SYS_REFCURSOR
  );

/* 고객별 구매금액 확인 프로시저 끝 */

/* 국가별 판매금액 확인 프로시저 시작 */

    --국가별 판매한 금액을 구한다
   PROCEDURE PROC_SALES_COUNTRY
    (
        IN_CMS_ID       IN      VARCHAR2,
        IN_W_SHOW       IN      VARCHAR2,
        O_CUR           OUT     SYS_REFCURSOR
    );

/* 국가별 판매금액 확인 프로시저 끝 */

/* 장르별 판매금액 확인 프로시저 시작 */

       PROCEDURE PROC_SALES_GENRE
    (
        IN_CMS_ID       IN      VARCHAR2,
        IN_W_SHOW       IN      VARCHAR2,
        O_CUR           OUT     SYS_REFCURSOR
    );

/* 장르별 판매금액 확인 프로시저 끝 */

END PKG_SALES_INFO;