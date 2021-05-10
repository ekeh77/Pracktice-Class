create or replace NONEDITIONABLE PACKAGE PKG_SALE_APPLYS_TBL AS 

  /* 예약판매(SALE_APPLYS_TBL)테이블 프로시저 시작 */
  
   --예약판매테이블 SELECT 프로시저 시작
   PROCEDURE PROC_SELECT_SALE_APPLYS_TBL
   (
    IN_A_ID             IN      VARCHAR2,
    IN_G_ID             IN      VARCHAR2,
    IN_CT_ID            IN      VARCHAR2,
    IN_S_DATE           IN      VARCHAR2,
    IN_PY_ID            IN      VARCHAR2,
    IN_A_PROFIT         IN      VARCHAR2,
    IN_A_USE_POINT      IN      VARCHAR2,
    IN_A_SHOW           IN      VARCHAR2,
    O_CUR               OUT     SYS_REFCURSOR
   );  
   --예약판매테이블 SELECT 프로시저 끝
  
  
  --예약판매테이블 INSERT 프로시저 시작
  PROCEDURE PROC_INSERT_SALE_APPLYS_TBL
  (
    IN_G_ID             IN      VARCHAR2,
    IN_CT_ID            IN      VARCHAR2,
    IN_PY_ID            IN      VARCHAR2,
    IN_A_USE_POINT      IN      VARCHAR2,
    O_MSG               OUT     VARCHAR2
  );
  --예약판매테이블 INSERT 프로시저 끝
  
  --예약판매테이블 UPDATE 프로시저 시작 > 예약판매기간이 넘어가면 SALES_TBL로 보낸다
  PROCEDURE PROC_UPDATE_APPLYS_TBL;
  --예약판매테이블 UPDATE 프로시저 끝
  
  --예약판매테이블 DELETE 프로시저 시작
  PROCEDURE PROC_DELETE_SALE_APPLYS_TBL
  (
    IN_A_ID       IN      VARCHAR2,
    IN_G_ID       IN      VARCHAR2,
    IN_CT_ID      IN      VARCHAR2
  );
  --예약판매테이블 DELETE 프로시저 끝
 
  
  /* 예약판매(SALE_APPLYS_TBL)테이블 프로시저 끝 */
END PKG_SALE_APPLYS_TBL;