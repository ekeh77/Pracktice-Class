create or replace NONEDITIONABLE PACKAGE PKG_CUSTOMERS_TBL AS 
/* 고객(CUSTOMER_TBL)테이블 프로시저 시작 */

  --고객테이블 SELECT 프로시저 시작
  PROCEDURE PROC_SELECT_CUSTOMERS_TBL
  (
    IN_CT_ID        IN       VARCHAR2,
    IN_CT_NAME      IN       VARCHAR2,
    IN_CT_BIRTH     IN       VARCHAR2,
    IN_CT_REGION    IN       VARCHAR2,
    IN_CT_GENDER    IN       VARCHAR2,
    IN_CT_C_NUM     IN       VARCHAR2,
    IN_CT_POINT     IN       NUMBER,
    IN_CT_GRADE     IN       VARCHAR2,
    IN_CT_SHOW      IN       VARCHAR2,
    O_CUR           OUT      SYS_REFCURSOR
  );
  --고객테이블 SELECT 프로시저 끝


  --고객테이블 INSERT 프로시저 시작
  PROCEDURE PROC_INSERT_CUSTOMERS_TBL
  (
    IN_CT_NAME      IN      VARCHAR2,
    IN_CT_BIRTH     IN      VARCHAR2,
    IN_CT_REGION    IN      VARCHAR2,
    IN_CT_GENDER    IN      VARCHAR2,
    IN_CT_C_NUM     IN      VARCHAR2
  );
  --고객테이블 INSERT 프로시저 끝

  --고객테이블 UPDATE 프로시저 시작
  PROCEDURE PROC_UPDATE_CUSTOMERS_TBL
  (
    IN_CT_ID        IN       VARCHAR2,
    IN_CT_NAME      IN       VARCHAR2,
    IN_CT_BIRTH     IN       VARCHAR2,
    IN_CT_REGION    IN       VARCHAR2,
    IN_CT_GENDER    IN       VARCHAR2,
    IN_CT_C_NUM     IN       VARCHAR2,
    IN_CT_POINT     IN       NUMBER,
    IN_CT_GRADE     IN       VARCHAR2
  );
  --고객테이블 UPDATE 프로시저 끝

   --고객테이블 DELETE 프로시저 시작
  PROCEDURE PROC_DELETE_CUSTOMERS_TBL
  (
    IN_CT_ID        IN       VARCHAR2
  );
  --고객테이블 DELETE 프로시저 끝

/* 고객(CUSTOMER_TBL)테이블 프로시저 시작 */

END PKG_CUSTOMERS_TBL;