create or replace NONEDITIONABLE PACKAGE PKG_CUSTOMER_TBL AS 
/* ��(CUSTOMER_TBL)���̺� ���ν��� ���� */
  
  --�����̺� SELECT ���ν��� ����
  PROCEDURE PROC_SELECT_CUSTOMER_TBL
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
  PROCEDURE PROC_INSERT_CUSTOMER_TBL
  (
    IN_CT_NAME      IN      VARCHAR2,
    IN_CT_BIRTH     IN      VARCHAR2,
    IN_CT_REGION    IN      VARCHAR2,
    IN_CT_GENDER    IN      VARCHAR2,
    IN_CT_C_NUM     IN      VARCHAR2
  );
  --�����̺� INSERT ���ν��� ��
  
  --�����̺� UPDATE ���ν��� ����
  PROCEDURE PROC_UPDATE_CUSTOMER_TBL
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
  PROCEDURE PROC_DELETE_CUSTOMER_TBL
  (
    IN_CT_ID        IN       VARCHAR2
  );
  --�����̺� DELETE ���ν��� ��
  
/* ��(CUSTOMER_TBL)���̺� ���ν��� ���� */

END PKG_CUSTOMER_TBL;

---------------------------------------- ��Ű�� ��� ��

create or replace NONEDITIONABLE PACKAGE BODY PKG_CUSTOMER_TBL AS
/* ��(CUSTOMER_TBL)���̺� ���ν��� ���� */
  
  --�����̺� SELECT ���ν��� ����
   PROCEDURE PROC_SELECT_CUSTOMER_TBL
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
  )
  AS
  BEGIN
    
    --�����̺� ��ü SELECT
    OPEN O_CUR FOR
    SELECT *
    FROM CUSTOMER_TBL
    --���� ������ �����ؼ� �˻��ϱ��� �� ����
    WHERE CT_ID         LIKE '%' || IN_CT_ID || '%'
    AND   CT_NAME       LIKE '%' || IN_CT_NAME || '%'
    AND   CT_BIRTH      LIKE '%' || IN_CT_BIRTH || '%'
    AND   CT_REGION     LIKE '%' || IN_CT_REGION || '%'
    AND   CT_GENDER     LIKE '%' || IN_CT_GENDER || '%'
    AND   CT_C_NUM      LIKE '%' || IN_CT_C_NUM || '%'
    AND   CT_POINT      LIKE '%' || IN_CT_POINT || '%'
    AND   CT_GRADE      LIKE '%' || IN_CT_GRADE || '%'
    AND   CT_SHOW       = CASE WHEN IN_CT_SHOW = 'N' THEN 'N' -- ���䵥���͸� ������� ��� N���� �۵�
                        ELSE 'Y'
                        END
    ;
    
  END PROC_SELECT_CUSTOMER_TBL
  ;
  --�����̺� SELECT ���ν��� ��
  
  --�����̺� INSERT ���ν��� ����
  PROCEDURE PROC_INSERT_CUSTOMER_TBL
  (
    IN_CT_NAME      IN      VARCHAR2,
    IN_CT_BIRTH     IN      VARCHAR2,
    IN_CT_REGION    IN      VARCHAR2,
    IN_CT_GENDER    IN      VARCHAR2,
    IN_CT_C_NUM     IN      VARCHAR2
  ) AS
  
  V_NEW_CT_ID       CHAR(5); -- ID ��������
  
  BEGIN
    
    --ȸ���������� ���� ��� ��� �� ����Ʈ�� NULL
    
    /* ID ���� */
    SELECT 'CT' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(CT_ID),'CT000'),3)) +1, 'FM000')
    INTO V_NEW_CT_ID
    FROM CUSTOMER_TBL
    ;
    
    /* POINT  */
    
    /* ROW ���� */
    INSERT INTO CUSTOMER_TBL(CT_ID, CT_NAME, CT_BIRTH, CT_REGION, CT_GENDER, CT_C_NUM, CT_POINT, CT_GRADE, CT_SHOW)
    VALUES (V_NEW_CT_ID, IN_CT_NAME, IN_CT_BIRTH, IN_CT_REGION, IN_CT_GENDER, IN_CT_C_NUM, 0, '�Ϲ�ȸ��', 'Y')
    ;
    
  END PROC_INSERT_CUSTOMER_TBL
  ;
  --�����̺� INSERT ���ν��� �� 

  
  --�����̺� UPDATE ���ν��� ����
  PROCEDURE PROC_UPDATE_CUSTOMER_TBL
  (
    IN_CT_ID        IN       VARCHAR2,
    IN_CT_NAME      IN       VARCHAR2,
    IN_CT_BIRTH     IN       VARCHAR2,
    IN_CT_REGION    IN       VARCHAR2,
    IN_CT_GENDER    IN       VARCHAR2,
    IN_CT_C_NUM     IN       VARCHAR2,
    IN_CT_POINT     IN       NUMBER,
    IN_CT_GRADE     IN       VARCHAR2
  )
  AS
  
    V_CT_NAME       VARCHAR2(30);
    V_CT_BIRTH      VARCHAR2(30);
    V_CT_REGION     CHAR(6);
    V_CT_GENDER     CHAR(1);
    V_CT_C_NUM      VARCHAR2(33);
    V_CT_POINT      NUMBER(10);
    V_CT_GRADE      VARCHAR2(30);
    
  BEGIN
    
    --IN_CT �Ű��������� NULL�� ��� �������� �ִ´�
    
    SELECT CASE
           WHEN IN_CT_NAME IS NULL THEN CT_NAME
           ELSE IN_CT_NAME
           END
    INTO V_CT_NAME
    FROM CUSTOMER_TBL
    WHERE CT_ID = IN_CT_ID
    ;
    
    SELECT CASE
           WHEN IN_CT_BIRTH IS NULL THEN CT_BIRTH
           ELSE IN_CT_BIRTH
           END
    INTO V_CT_BIRTH
    FROM CUSTOMER_TBL
    WHERE CT_ID = IN_CT_ID
    ;
    
    SELECT CASE
           WHEN IN_CT_REGION IS NULL THEN CT_REGION
           ELSE IN_CT_REGION
           END
    INTO V_CT_REGION
    FROM CUSTOMER_TBL
    WHERE CT_ID = IN_CT_ID
    ;
    
    SELECT CASE
           WHEN IN_CT_GENDER IS NULL THEN CT_GENDER
           ELSE IN_CT_GENDER
           END
    INTO V_CT_GENDER
    FROM CUSTOMER_TBL
    WHERE CT_ID = IN_CT_ID
    ;
    
    SELECT CASE
           WHEN IN_CT_C_NUM IS NULL THEN CT_C_NUM
           ELSE IN_CT_C_NUM
           END
    INTO V_CT_C_NUM
    FROM CUSTOMER_TBL
    WHERE CT_ID = IN_CT_ID
    ;
    
    SELECT CASE
          WHEN IN_CT_POINT IS NULL THEN CT_POINT
          ELSE IN_CT_POINT
          END
    INTO V_CT_POINT
    FROM CUSTOMER_TBL
    WHERE CT_ID = IN_CT_ID
    ;
    
    SELECT CASE
           WHEN IN_CT_GRADE IS NULL THEN CT_GRADE
           ELSE IN_CT_GRADE
           END
    INTO V_CT_GRADE
    FROM CUSTOMER_TBL
    WHERE CT_ID = IN_CT_ID
    ;
    ------------------
    
    --�����̺� UPDATE
    UPDATE CUSTOMER_TBL
    SET CT_NAME = V_CT_NAME,
        CT_BIRTH = V_CT_BIRTH,
        CT_REGION = V_CT_REGION,
        CT_GENDER = V_CT_GENDER,
        CT_C_NUM = V_CT_C_NUM,
        CT_POINT = V_CT_POINT,
        CT_GRADE = V_CT_GRADE
    WHERE CT_ID = IN_CT_ID
    ;
  
  END PROC_UPDATE_CUSTOMER_TBL
  ;
  --�����̺� UPDATE ���ν��� ��
  
  --�����̺� DELETE ���ν��� ����
  PROCEDURE PROC_DELETE_CUSTOMER_TBL
  (
    IN_CT_ID        IN       VARCHAR2
  )
  AS
  BEGIN
    /* ���� �����û�� ���� ����Ʈ���� �� ���̵� ����� ���� �ʿ� */
    
    UPDATE CUSTOMER_TBL
    SET   CT_SHOW = 'N'
    WHERE CT_ID = IN_CT_ID
    ;
    
  END PROC_DELETE_CUSTOMER_TBL
  ;
  --�����̺� DELETE ���ν��� ��
  
/* ��(CUSTOMER_TBL)���̺� ���ν��� ���� */
END PKG_CUSTOMER_TBL;

--------------------------------------��Ű�� �ٵ� ��