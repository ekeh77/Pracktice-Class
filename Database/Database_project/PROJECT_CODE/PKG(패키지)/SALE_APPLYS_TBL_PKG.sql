---------------------------------------SALE_APPLYS_TBL ��� ����

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

---------------------------------------SALE_APPLYS_TBL ��� ��

---------------------------------------SALE_APPLYS_TBL �ٵ� ����

create or replace NONEDITIONABLE PACKAGE BODY PKG_SALE_APPLYS_TBL AS

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
    SELECT T1.A_ID, T2.G_NAME, T1.S_DATE,T3.CT_NAME, T4.PY_NAME, T1.G_GET_POINT, T1.A_PROFIT, T1.A_USE_POINT, T1.A_SHOW
    FROM SALE_APPLYS_TBL T1, RESERVATION_GAMES_TBL T2, CUSTOMERS_TBL T3, PAYMENT_TBL T4
    --���ǿ� �ش��ϰ��� ������ ã�� �ƴϸ� �׳� ROW�� ã������ ����
    WHERE A_ID             LIKE '%' || IN_A_ID ||        '%'
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
    V_NEW_A_ID          CHAR(4);    -- �����Ǹ� ID����
    V_A_USE_POINT       NUMBER(7);  -- NULL�� INSERT�� ��� 0�� �ش�
    V_A_PROFIT          NUMBER(7);  -- �� ���ε� ����(���� �����ϴ� ����)
    V_G_R_DISCOUNT_PER  NUMBER(3);  -- ��������� ���η�
    V_PY_PER            NUMBER(3);  -- ��������� ���η�
    V_G_PRICE           NUMBER(7);  -- ��������� �ǸŰ���
    V_HAVE_POINT        NUMBER(7);  -- ���� ������ �ִ� ����Ʈ
    V_PT_ID             CHAR(5);    -- ����Ʈ ID����
    V_CAL_APPLYS_NUM    NUMBER(7);  -- ������ӿ� ����� ����Ʈ ��� 
  BEGIN
    
    --���ο� �����Ǹ� ID ����
    SELECT 'A' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(A_ID),'A000'),2)) +1,'FM000')
    INTO V_NEW_A_ID
    FROM SALE_APPLYS_TBL
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
    
    SELECT CT_POINT -- �ش���� ����Ʈ ������ Ȯ��
    INTO V_HAVE_POINT
    FROM CUSTOMERS_TBL
    WHERE CT_ID = IN_CT_ID
    ;
    
    SELECT SUM(A_USE_POINT) -- ������ӿ� ����� ����Ʈ Ȯ��
    INTO V_CAL_APPLYS_NUM
    FROM SALE_APPLYS_TBL
    WHERE CT_ID = IN_CT_ID
    AND A_SHOW = 'Y'
    ;
    
    V_HAVE_POINT := V_HAVE_POINT - V_CAL_APPLYS_NUM;
    V_A_PROFIT := V_G_PRICE - (V_G_PRICE * (V_PY_PER + V_G_R_DISCOUNT_PER )/ 100); --�� ���ݱ��ϱ�
    
   
    ---------����� ����Ʈ���� �������ִ� ����Ʈ�� ������ ������ �� ����
    
    IF V_A_USE_POINT > V_HAVE_POINT THEN
    
        O_MSG  := '����� ����Ʈ ' || TO_CHAR(V_A_USE_POINT - V_HAVE_POINT,'FM999,999,999') || '���� �����մϴ�';
        
    ELSE
    
    --���ο� ���౸�� ����
    
            
        INSERT INTO SALE_APPLYS_TBL(A_ID, G_ID, CT_ID, S_DATE, PY_ID, G_GET_POINT, A_PROFIT, A_USE_POINT, A_SHOW, A_W_PURCHASE)
        VALUES (V_NEW_A_ID, IN_G_ID, IN_CT_ID, SYSDATE, IN_PY_ID, 5, (V_A_PROFIT-V_A_USE_POINT), V_A_USE_POINT, 'Y', 'R')
        ;
    
        SELECT 'PT' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(PT_ID),'PT000'),3)) +1,'FM000')
        INTO V_PT_ID
        FROM POINT_TBL
        ;
    
    END IF;
    
    
  END PROC_INSERT_SALE_APPLYS_TBL;
  --�����Ǹ����̺� INSERT ���ν��� ��
  
  --�����Ǹ����̺� UPDATE ���ν��� ���� > ��������Ͽ� ����Ѱ�� SALES_TBL�� �̵� > ���� ���������ʴ´�
  PROCEDURE PROC_UPDATE_APPLYS_TBL
  AS
  BEGIN

    INSERT INTO SALES_TBL -- �����ǸŰ� ����� ������ SALES_TBL�� �ű��
    SELECT 
            'S' || TO_CHAR((SELECT TO_NUMBER(SUBSTR(NVL(MAX(S_ID), 'S000'), 2)) 
            FROM SALES_TBL) + ROW_NUMBER() OVER(ORDER BY T2.A_ID), 'FM000')
            AS S_ID, 
    T2.G_ID, T2.CT_ID, T2.S_DATE, T2.PY_ID, T2.G_GET_POINT, T2.A_USE_POINT, T2.A_PROFIT, T2.A_SHOW, T2.A_W_PURCHASE 
    FROM RESERVATION_GAMES_TBL T1, SALE_APPLYS_TBL T2
    WHERE T1.G_ID = T2.G_ID
    AND T1.G_R_RELEASE < SYSDATE
    AND T2.A_SHOW = 'Y'
    ;
    
    MERGE INTO SALE_APPLYS_TBL T1--�����ǸŰ� ����� ������ ���������ʴ´�
    USING(
            SELECT *
            FROM RESERVATION_GAMES_TBL
            WHERE G_R_RELEASE < SYSDATE
        ) T2
    ON(T1.G_ID = T2.G_ID)
    WHEN MATCHED THEN
        UPDATE SET T1.A_SHOW = 'N'
    ;
    
  END PROC_UPDATE_APPLYS_TBL
  ;
  --�����Ǹ����̺� UPDATE ���ν��� ��
  
  --�����Ǹ����̺� DELETE ���ν��� ���� > ���� ��ҿ� ���� �ǹ�
  PROCEDURE PROC_DELETE_SALE_APPLYS_TBL
  (
    IN_A_ID       IN      VARCHAR2,
    IN_G_ID       IN      VARCHAR2,
    IN_CT_ID      IN      VARCHAR2
  )
  AS
  BEGIN
    
    DELETE FROM SALE_APPLYS_TBL
    WHERE A_ID = IN_A_ID
    AND   G_ID = IN_G_ID
    AND   CT_ID = IN_CT_ID
    ;
    
  END PROC_DELETE_SALE_APPLYS_TBL;
  --�����Ǹ����̺� DELETE ���ν��� ��
 
  /* �����Ǹ�(APPLY_TBL)���̺� ���ν��� �� */

END PKG_SALE_APPLYS_TBL;

---------------------------------------SALE_APPLYS_TBL �ٵ� ��