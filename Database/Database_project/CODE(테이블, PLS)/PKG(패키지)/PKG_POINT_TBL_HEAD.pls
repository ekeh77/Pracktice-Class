create or replace NONEDITIONABLE PACKAGE PKG_POINT_TBL AS 
----------------------------------------------------------
   /*POINT_TBL 업무로직 시작*/
   --CRUD CREATE, RETRIVE, UPDATE, DELETE

----- POINT_TBL INSERT, UPDATE
  PROCEDURE PROC_INS_UP_POINT
  (
   IN_PT_ID         IN       VARCHAR2,
   IN_S_ID          IN       VARCHAR2,
   IN_CT_ID         IN       VARCHAR2,
   IN_PT_SCORE      IN       NUMBER,
   IN_PT_SAVE_USE   IN       VARCHAR2,
   IN_PT_DATE       IN       DATE,
   IN_PT_SHOW       IN       VARCHAR2
  );

----- POINT_TBL DELETE

  PROCEDURE PROC_DEL_POINT
  (
   IN_PT_ID         IN     VARCHAR2,
   IN_CT_ID         IN     VARCHAR2
  );  

----- POINT_TBL SELECT
  PROCEDURE PROC_SEL_POINT
  (
   IN_PT_ID         IN          VARCHAR2,
   IN_S_ID          IN          VARCHAR2,
   IN_CT_ID         IN          VARCHAR2,
   IN_PT_SCORE      IN          NUMBER,
   IN_PT_SAVE_USE   IN          VARCHAR2,
   IN_PT_DATE       IN          DATE,
   IN_PT_SHOW       IN          VARCHAR2,
   O_CUR            OUT         SYS_REFCURSOR
  );
   /*POINT_TBL 업무로직 끝*/
END PKG_POINT_TBL;