---------------------------------------SALE_APPLYS_TBL ��� ����

create or replace NONEDITIONABLE PACKAGE PKG_SALE_APPLYS_TBL AS 

  /* �����Ǹ�(SALE_APPLYS_TBL)���̺� ���ν��� ���� */
  
   --�����Ǹ����̺� SELECT ���ν��� ����
   PROCEDURE PROC_SELECT_SALE_APPLYS_TBL
   (
    IN_S_ID             IN      VARCHAR2,
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
    IN_S_ID       IN      VARCHAR2,
    IN_G_ID       IN      VARCHAR2,
    IN_CT_ID      IN      VARCHAR2
  );
  --�����Ǹ����̺� DELETE ���ν��� ��
 
  
  /* �����Ǹ�(SALE_APPLYS_TBL)���̺� ���ν��� �� */
END PKG_SALE_APPLYS_TBL;

---------------------------------------SALE_APPLYS_TBL ��� ��

---------------------------------------SALE_APPLYS_TBL �ٵ� ����

create or replace NONEDITIONABLE PACKAGE BODY PKG_SALE_APPLYS_TBL AS

/* �����Ǹ�(SALE_APPLYS_TBL)���̺� ���ν��� ���� */
  
   --�����Ǹ����̺� SELECT ���ν��� ����
  PROCEDURE PROC_SELECT_SALE_APPLYS_TBL
   (
    IN_S_ID             IN      VARCHAR2,
    IN_G_ID             IN      VARCHAR2,
    IN_CT_ID            IN      VARCHAR2,
    IN_S_DATE           IN      VARCHAR2,
    IN_PY_ID            IN      VARCHAR2,
    IN_A_PROFIT         IN      VARCHAR2,
    IN_A_USE_POINT      IN      VARCHAR2,
    IN_A_SHOW           IN      VARCHAR2,
    O_CUR               OUT     SYS_REFCURSOR
   ) AS
  BEGIN
    /*
    OPEN O_CUR FOR
    SELECT *
    FROM SALE_APPLYS_TBL
    --���ǿ� �ش��ϰ��� ������ ã�� �ƴϸ� �׳� ROW�� ã������ ����
    WHERE S_ID          LIKE '%' || IN_S_ID ||        '%'
    AND   G_ID          LIKE '%' || IN_G_ID ||        '%' 
    AND   CT_ID         LIKE '%' || IN_CT_ID ||       '%' 
    AND   S_DATE        LIKE '%' || IN_S_DATE ||      '%' 
    AND   PY_ID         LIKE '%' || IN_PY_ID ||       '%'
    AND   A_PROFIT      LIKE '%' || IN_A_PROFIT ||    '%'
    AND   A_USE_POINT   LIKE '%' || IN_A_USE_POINT || '%'
    AND   A_SHOW = CASE WHEN IN_A_SHOW = 'N' THEN 'N'
                   ELSE 'Y'
                   END
    ;
    */
    --������ ���� �ڵ尡�ƴ� ������ ǥ���ϱ����� ���
    OPEN O_CUR FOR
    SELECT T1.S_ID, T2.G_NAME, T1.S_DATE,T3.CT_NAME, T4.PY_NAME, T1.G_GET_POINT, T1.A_PROFIT, T1.A_USE_POINT, T1.A_SHOW
    FROM SALE_APPLYS_TBL T1, RESERVATION_GAMES_TBL T2, CUSTOMERS_TBL T3, PAYMENT_TBL T4
    --���ǿ� �ش��ϰ��� ������ ã�� �ƴϸ� �׳� ROW�� ã������ ����
    WHERE S_ID             LIKE '%' || IN_S_ID ||        '%'
    AND   T1.G_ID          LIKE '%' || IN_G_ID ||        '%' 
    AND   T1.CT_ID         LIKE '%' || IN_CT_ID ||       '%' 
    AND   S_DATE           LIKE '%' || IN_S_DATE ||      '%' 
    AND   T1.PY_ID         LIKE '%' || IN_PY_ID ||       '%'
    AND   A_PROFIT         LIKE '%' || IN_A_PROFIT ||    '%'
    AND   A_USE_POINT      LIKE '%' || IN_A_USE_POINT || '%'
    AND   A_SHOW = CASE WHEN IN_A_SHOW = 'N' THEN 'N'
                   ELSE 'Y'
                   END
    AND T1.G_ID = T2.G_ID
    AND T1.CT_ID = T3.CT_ID
    AND T1.PY_ID = T4.PY_ID
    ;
  END PROC_SELECT_SALE_APPLYS_TBL;
  --�����Ǹ����̺� SELECT ���ν��� ��
  
  --�����Ǹ����̺� INSERT ���ν��� ����
  PROCEDURE PROC_INSERT_SALE_APPLYS_TBL
  (
    IN_G_ID             IN      VARCHAR2,
    IN_CT_ID            IN      VARCHAR2,
    IN_PY_ID            IN      VARCHAR2,
    IN_A_USE_POINT      IN      VARCHAR2,
    O_MSG               OUT     VARCHAR2
  )
  AS
    V_NEW_S_ID          CHAR(4);    -- �����Ǹ� ���� ID����
    V_NEW_S_ID2         CHAR(4);    -- �Ǹ� ID����(�񱳸� ���� ����)
    V_NEW_S_ID3         CHAR(4);    -- �����Ǹ� ID����(�񱳸� ���� ����)
    V_A_USE_POINT       NUMBER(7);  -- NULL�� INSERT�� ��� 0�� �ش�
    V_A_PROFIT          NUMBER(7);  -- �� ���ε� ����(���� �����ϴ� ����)
    V_G_R_DISCOUNT_PER  NUMBER(3);  -- ��������� ���η�
    V_PY_PER            NUMBER(3);  -- ��������� ���η�
    V_G_PRICE           NUMBER(7);  -- ��������� �ǸŰ���
    V_HAVE_POINT        NUMBER(7);  -- ���� ������ �ִ� ����Ʈ
    V_PT_ID             CHAR(5);    -- ����Ʈ ID����
  BEGIN
    
    --���ο� �����Ǹ� ID ����
    SELECT 'S' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(S_ID),'A000'),2)) +1,'FM000')
    INTO V_NEW_S_ID2
    FROM SALE_APPLYS_TBL
    ;
    
    SELECT 'S' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(S_ID),'A000'),2)) +1,'FM000')
    INTO V_NEW_S_ID3
    FROM  SALES_TBL
    ;
    
    IF V_NEW_S_ID2 > V_NEW_S_ID3 THEN -- ������ ũ�⸦ ������ ū���� �־��ش�
        V_NEW_S_ID := V_NEW_S_ID2;
    ELSE
        V_NEW_S_ID := V_NEW_S_ID3;
    END IF
    ;
    
    --���� ����Ʈ�� NULL�� �شٸ� 0���� ����� �ƴϸ� �Է��Ѱ��� �ش�
    IF IN_A_USE_POINT IS NULL THEN
    
    V_A_USE_POINT := 0;
    
    ELSE
    
    V_A_USE_POINT := IN_A_USE_POINT;
    
    END IF
    ;
    
    --���η��� ���ؼ� ������ ����ϰ� ������ �־��ش�
    
    SELECT G_R_DISCOUNT_PER --������� ���η� ���ϱ�
    INTO V_G_R_DISCOUNT_PER
    FROM RESERVATION_GAMES_TBL
    WHERE G_ID = IN_G_ID
    ;
    
    SELECT PY_DC_PER --��������� ���η� ���ϱ�
    INTO V_PY_PER
    FROM PAYMENT_TBL
    WHERE PY_ID = IN_PY_ID
    ;
    
    SELECT G_R_SALES_PRICE --��������� �ǸŰ��� ���ϱ�
    INTO V_G_PRICE
    FROM RESERVATION_GAMES_TBL 
    WHERE G_ID = IN_G_ID
    ;
    
    V_A_PROFIT := V_G_PRICE - (V_G_PRICE * (V_PY_PER + V_G_R_DISCOUNT_PER )/ 100); --�� ���ݱ��ϱ�
    
    /*
    ---------����� ����Ʈ���� �������ִ� ����Ʈ�� ������ ������ �� ����
    
    IF V_A_USE_POINT > V_HAVE_POINT THEN
    
        O_MSG  := '����� ����Ʈ' || V_A_USE_POINT - V_HAVE_POINT ||'���� �����մϴ�';
        
    ELSE
    --����� ����Ʈ�� �����ϰ�(CUSTOMER_TBL UPDATE) POINT���̺� INSERT�Ѵ�
    
    UPDATE CUSTOMERS_TBL
    SET CT_POINT = CT_POINT - V_A_USE_POINT
    WHERE CT_ID = IN_CT_ID
    ;
    */
    
    --���ο� ���౸�� ����
    INSERT INTO SALE_APPLYS_TBL(S_ID, G_ID, CT_ID, S_DATE, PY_ID, G_GET_POINT, A_PROFIT, A_USE_POINT, A_SHOW, A_W_PURCHASE)
    VALUES (V_NEW_S_ID, IN_G_ID, IN_CT_ID, SYSDATE, IN_PY_ID, 5, V_A_PROFIT-V_A_USE_POINT, V_A_USE_POINT, 'Y', 'R')
    ;
    
    /*
    SELECT 'PT' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(PT_ID),'PT000'),3)) +1,'FM000')
    INTO V_PT_ID
    FROM POINT_TBL
    ;
    
    INSERT INTO POINT_TBL(PT_ID, S_ID, CT_ID, PT_SCORE, PT_SAVE_USE, PT_DATE, PT_SHOW)
    VALUES(V_PT_ID, V_NEW_S_ID, IN_CT_ID, V_A_USE_POINT, 'U', SYSDATE, 'Y')
    ;
    
    END IF;
    */
    
    
  END PROC_INSERT_SALE_APPLYS_TBL;
  --�����Ǹ����̺� INSERT ���ν��� ��
  
  --�����Ǹ����̺� UPDATE ���ν��� ���� > ��������Ͽ� ����Ѱ�� �����Ѵ� > ���� SALES_TBL�� �̵�
  PROCEDURE PROC_UPDATE_APPLYS_TBL
  AS
    CURRENT_TIME        VARCHAR2(30);
  BEGIN
  
    SELECT S_DATE --�����ǸŰ� ����� ������ ã�´�
    INTO CURRENT_TIME
    FROM SALE_APPLYS_TBL
    WHERE TO_CHAR(S_DATE,'YYYYMMDD') < TO_CHAR(SYSDATE,'YYYYMMDD')
    GROUP BY S_DATE
    ;
    
    INSERT INTO SALES_TBL -- �����ǸŰ� ����� ������ SALES_TBL�� �ű��
    SELECT *
    FROM SALE_APPLYS_TBL
    WHERE TO_DATE(S_DATE,'YYYY-MM-DD') < TO_DATE(SYSDATE,'YYYY-MM-DD')
    ;
    
    UPDATE SALE_APPLYS_TBL --�����ǸŰ� ����� ������ ���������ʴ´�
    SET A_SHOW = 'N'
    WHERE TO_DATE(S_DATE,'YYYY-MM-DD') < TO_DATE(SYSDATE,'YYYY-MM-DD')
    ;   
    
  END PROC_UPDATE_APPLYS_TBL
  ;
  --�����Ǹ����̺� UPDATE ���ν��� ��
  
  --�����Ǹ����̺� DELETE ���ν��� ���� > ���� ��ҿ� ���� �ǹ�
  PROCEDURE PROC_DELETE_SALE_APPLYS_TBL
  (
    IN_S_ID       IN      VARCHAR2,
    IN_G_ID       IN      VARCHAR2,
    IN_CT_ID      IN      VARCHAR2
  )
  AS
  BEGIN
    
    DELETE FROM SALE_APPLYS_TBL
    WHERE S_ID = IN_S_ID
    AND   G_ID = IN_G_ID
    AND   CT_ID = IN_CT_ID
    ;
    
  END PROC_DELETE_SALE_APPLYS_TBL;
  --�����Ǹ����̺� DELETE ���ν��� ��
 
  /* �����Ǹ�(APPLY_TBL)���̺� ���ν��� �� */

END PKG_SALE_APPLYS_TBL;

---------------------------------------SALE_APPLYS_TBL �ٵ� ��