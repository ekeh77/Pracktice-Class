create or replace NONEDITIONABLE PACKAGE PKG_CUSTOMERS_TBL AS 
/* ��(CUSTOMER_TBL)���̺� ���ν��� ���� */

  --�����̺� SELECT ���ν��� ����
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
  --�����̺� SELECT ���ν��� ��


  --�����̺� INSERT ���ν��� ����
  PROCEDURE PROC_INSERT_CUSTOMERS_TBL
  (
    IN_CT_NAME      IN      VARCHAR2,
    IN_CT_BIRTH     IN      VARCHAR2,
    IN_CT_REGION    IN      VARCHAR2,
    IN_CT_GENDER    IN      VARCHAR2,
    IN_CT_C_NUM     IN      VARCHAR2
  );
  --�����̺� INSERT ���ν��� ��

  --�����̺� UPDATE ���ν��� ����
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
  --�����̺� UPDATE ���ν��� ��

   --�����̺� DELETE ���ν��� ����
  PROCEDURE PROC_DELETE_CUSTOMERS_TBL
  (
    IN_CT_ID        IN       VARCHAR2
  );
  --�����̺� DELETE ���ν��� ��

/* ��(CUSTOMER_TBL)���̺� ���ν��� ���� */

END PKG_CUSTOMERS_TBL;