create or replace NONEDITIONABLE PACKAGE PKG_SALES_INFO AS 

/* ���� ���űݾ� Ȯ�� ���ν��� ���� */

    --���� �����ѱݾ�(�ǸŰ�)�� ���Ѵ� 
  PROCEDURE PROC_SALES_CUSTOMER
  (
    IN_CT_ID            IN      VARCHAR2,--�ƹ��͵� ���������� ��簪�� �����ش�
    IN_W_SHOW           IN      VARCHAR2,--S(SALES)�� ��� �Ϲݰ����Ǹ� A(APPLY)�ϰ�� ��������Ǹ� �ƹ��͵� ���������� ��簪�� �����ش� 
    O_CUR               OUT     SYS_REFCURSOR
  );

/* ���� ���űݾ� Ȯ�� ���ν��� �� */

/* ������ �Ǹűݾ� Ȯ�� ���ν��� ���� */

    --������ �Ǹ��� �ݾ��� ���Ѵ�
   PROCEDURE PROC_SALES_COUNTRY
    (
        IN_CMS_ID       IN      VARCHAR2,
        IN_W_SHOW       IN      VARCHAR2,
        O_CUR           OUT     SYS_REFCURSOR
    );

/* ������ �Ǹűݾ� Ȯ�� ���ν��� �� */

/* �帣�� �Ǹűݾ� Ȯ�� ���ν��� ���� */

       PROCEDURE PROC_SALES_GENRE
    (
        IN_CMS_ID       IN      VARCHAR2,
        IN_W_SHOW       IN      VARCHAR2,
        O_CUR           OUT     SYS_REFCURSOR
    );

/* �帣�� �Ǹűݾ� Ȯ�� ���ν��� �� */

END PKG_SALES_INFO;