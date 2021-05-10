create or replace NONEDITIONABLE PACKAGE PKG_SALE_APPLYS_TBL AS 

  /* �����Ǹ�(SALE_APPLYS_TBL)���̺� ���ν��� ���� */
  
   --�����Ǹ����̺� SELECT ���ν��� ����
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
   --�����Ǹ����̺� SELECT ���ν��� ��
  
  
  --�����Ǹ����̺� INSERT ���ν��� ����
  PROCEDURE PROC_INSERT_SALE_APPLYS_TBL
  (
    IN_G_ID             IN      VARCHAR2,
    IN_CT_ID            IN      VARCHAR2,
    IN_PY_ID            IN      VARCHAR2,
    IN_A_USE_POINT      IN      VARCHAR2,
    O_MSG               OUT     VARCHAR2
  );
  --�����Ǹ����̺� INSERT ���ν��� ��
  
  --�����Ǹ����̺� UPDATE ���ν��� ���� > �����ǸűⰣ�� �Ѿ�� SALES_TBL�� ������
  PROCEDURE PROC_UPDATE_APPLYS_TBL;
  --�����Ǹ����̺� UPDATE ���ν��� ��
  
  --�����Ǹ����̺� DELETE ���ν��� ����
  PROCEDURE PROC_DELETE_SALE_APPLYS_TBL
  (
    IN_A_ID       IN      VARCHAR2,
    IN_G_ID       IN      VARCHAR2,
    IN_CT_ID      IN      VARCHAR2
  );
  --�����Ǹ����̺� DELETE ���ν��� ��
 
  
  /* �����Ǹ�(SALE_APPLYS_TBL)���̺� ���ν��� �� */
END PKG_SALE_APPLYS_TBL;