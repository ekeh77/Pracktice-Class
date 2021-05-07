-----------------------------------------------------PKG_POINT_TBL ������
create or replace NONEDITIONABLE PACKAGE PKG_POINT AS 
----------------------------------------------------------
   /*POINT_TBL �������� ����*/
   --CRUD CREATE, RETRIVE, UPDATE, DELETE

----- POINT_TBL INSERT, UPDATE
  PROCEDURE PROC_INS_UP_POINT
  (
   IN_PT_ID       IN     VARCHAR2,
   IN_S_ID         IN      VARCHAR2,
   IN_CT_ID       IN       VARCHAR2,
   IN_PT_SCORE      IN      NUMBER,
   IN_PT_SAVE_USE    IN      VARCHAR2,
   IN_PT_DATE     IN       DATE,
   IN_PT_SHOW     IN       VARCHAR2
  );

----- POINT_TBL DELETE

  PROCEDURE PROC_DEL_POINT
  (
   IN_PT_ID          IN      VARCHAR2,
   IN_CT_ID         IN     VARCHAR2
  );  
  
----- POINT_TBL SELECT
  PROCEDURE PROC_SEL_POINT
  (
   IN_PT_ID       IN     VARCHAR2,
   IN_S_ID         IN      VARCHAR2,
   IN_CT_ID       IN       VARCHAR2,
   IN_PT_SCORE      IN      NUMBER,
   IN_PT_SAVE_USE    IN      VARCHAR2,
   IN_PT_DATE     IN       DATE,
   IN_PT_SHOW     IN       VARCHAR2,
   O_CUR         OUT    SYS_REFCURSOR
  );
   /*POINT_TBL �������� ��*/
END PKG_POINT;
-----------------------------------------------------PKG_POINT_TBL ��峡

-----------------------------------------------------PKG_POINT_TBL �ٵ����

create or replace NONEDITIONABLE PACKAGE BODY PKG_POINT AS
----------------------------------------------------------
   /*POINT_TBL �������� ����*/
   --CRUD CREATE, RETRIVE, UPDATE, DELETE
/*
   PT_ID        CHAR(5)        PRIMARY KEY,
   S_ID       CHAR(4)       NOT NULL,
   CT_ID        CHAR(5)        NOT NULL,
   PT_SCORE    NUMBER(20)     DEFAULT 0  NOT NULL,
   PT_SAVE_USE VARCHAR2(1)    NOT NULL,
   PT_DATE     DATE           NOT NULL,
   PT_SHOW     VARCHAR2(1)     DEFAULT 'Y' NOT NULL

*/
----- POINT_TBL INSERT, UPDATE
  PROCEDURE PROC_INS_UP_POINT
  (
   IN_PT_ID       IN     VARCHAR2,
   IN_S_ID         IN      VARCHAR2,
   IN_CT_ID       IN       VARCHAR2,
   IN_PT_SCORE      IN      NUMBER,
   IN_PT_SAVE_USE    IN      VARCHAR2,
   IN_PT_DATE     IN       DATE,
   IN_PT_SHOW     IN       VARCHAR2
  ) 
  AS
  
   V_PT_ID        CHAR(5);
   V_PT_ID2         CHAR(5);
   V_USE_POINT    NUMBER(7);
   ---
   V_GET_SAVE_POINT    NUMBER(7);
   V_GET_CT_ID       CHAR(5);
   V_GET_S_DATE       DATE;
  
  BEGIN
   
   SELECT COUNT(*)
   INTO V_PT_ID
   FROM POINT_TBL
   WHERE PT_ID = IN_PT_ID
   ;
   
   SELECT S_USE_POINT
   INTO V_USE_POINT
   FROM SALES_TBL 
   WHERE S_ID = IN_S_ID
   ;   

-- ���Ӱ� �߰��Ǵ� ������       
   IF V_PT_ID = 0 THEN
      
            
      SELECT 'PT' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(PT_ID),'PT000'),3)) + 1, 'FM000')
      INTO V_PT_ID
      FROM POINT_TBL
      ;
      --��������
      SELECT 'PT' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(PT_ID),'PT000'),3)) + 2, 'FM000')
      INTO V_PT_ID2
      FROM POINT_TBL
      ;
      
      -- ���Ӱ� �߰��� ���� SALES_TBL �����Ϳ��� ���� ����� ����Ʈ�� ���ٸ�  
      
       IF V_USE_POINT = 0 THEN 
         
         -- POINT_TBL�� SALES_TBL�� ������ �����ͼ� UPDATE �Ѵ� (CT_ID, S_DATE, ����� ����Ʈ���� �ۼ�Ʈ�� ����� ��)
         
         SELECT S_PROFIT * (S_GET_POINT/100) AS SAVE_POINT
         INTO V_GET_SAVE_POINT
         FROM SALES_TBL
         WHERE S_ID = IN_S_ID
         ;
         
         SELECT CT_ID
         INTO V_GET_CT_ID
         FROM SALES_TBL
         WHERE S_ID = IN_S_ID
         ;
         
         SELECT S_DATE
         INTO V_GET_S_DATE
         FROM SALES_TBL
         WHERE S_ID = IN_S_ID
         ;
   
         INSERT INTO POINT_TBL
         (PT_ID, S_ID, CT_ID, PT_SCORE, PT_SAVE_USE, PT_DATE, PT_SHOW)
         VALUES
         (V_PT_ID, IN_S_ID , V_GET_CT_ID , V_GET_SAVE_POINT, 'S',  V_GET_S_DATE, 'Y')
         ;
         
         -- �׸��� INSERT�� POINT�� CUSTOMERS_TBL�� UPDATE �Ѵ� 
         
         UPDATE CUSTOMERS_TBL
         SET CT_POINT = CT_POINT + V_GET_SAVE_POINT
         WHERE CT_ID = V_GET_CT_ID
         ;
         
      ELSE  -- ���Ӱ� �߰��� �����Ϳ��� ���� POINT�� ����ؼ� ������ �ߴٸ� 

      
         -- CUSTOMERS_TBL�� ����� POINT �� UPDATE �ϰ� 
         
         SELECT S_PROFIT * (S_GET_POINT/100) AS SAVE_POINT
         INTO V_GET_SAVE_POINT
         FROM SALES_TBL
         WHERE S_ID = IN_S_ID
         ;
         
         SELECT CT_ID
         INTO V_GET_CT_ID
         FROM SALES_TBL
         WHERE S_ID = IN_S_ID
         ;
         
         SELECT S_DATE
         INTO V_GET_S_DATE
         FROM SALES_TBL
         WHERE S_ID = IN_S_ID
         ;
         
         UPDATE CUSTOMERS_TBL
         SET CT_POINT = CT_POINT - V_USE_POINT
         WHERE CT_ID = V_GET_CT_ID
         ;
         
         
         ------------------------
         --* ���� (������)PRIMARY KEY �� ������ PT_ID�� INSERT 2�� ���̸鼭 ���Ἲ �������� ���� �ߴ°Ͱ���..?(������)  
         
         -- ���� ������ ��鼭 ����� POINT �����͸� POINT_TBL�� ���� 
         INSERT INTO POINT_TBL
         (PT_ID, S_ID, CT_ID, PT_SCORE, PT_SAVE_USE, PT_DATE, PT_SHOW)
         VALUES
         (V_PT_ID, IN_S_ID , V_GET_CT_ID , V_USE_POINT , 'U',  V_GET_S_DATE, 'Y')
         ;
                  
         -- ���� �� ������ POINT�� POINT_TBL�� ���� 
         INSERT INTO POINT_TBL
         (PT_ID, S_ID, CT_ID, PT_SCORE, PT_SAVE_USE, PT_DATE, PT_SHOW)
         VALUES
         (V_PT_ID2, IN_S_ID , V_GET_CT_ID , V_GET_SAVE_POINT, 'S',  V_GET_S_DATE, 'Y')
         ;
         
         -- ���� �� ������ POINT�� CUSTOMERS_TBL�� UPDATE�Ѵ�.
         UPDATE CUSTOMERS_TBL
         SET CT_POINT = CT_POINT + V_GET_SAVE_POINT
         WHERE CT_ID = V_GET_CT_ID
         ;
            
      END IF;
   
   ELSE  -- �̹� �־��� �����͸� �����Ϸ��� �ٵ� ������ �ʿ��Ѱ�
      NULL;
    /*
      UPDATE POINT_TBL
      SET S_ID = IN_S_ID,
         CT_ID = IN_CT_ID,
         PT_SCORE = IN_PT_SCORE,
         PT_SAVE_USE = IN_PT_SAVE_USE,
         PT_DATE = IN_PT_DATE,
         PT_SHOW = PT_SHOW
      WHERE PT_ID = IN_PT_ID
      ;
    */
   END IF;
      
  END PROC_INS_UP_POINT;

----- POINT_TBL DELETE

  PROCEDURE PROC_DEL_POINT
  (
   IN_PT_ID    IN  VARCHAR2,
   IN_CT_ID   IN  VARCHAR2
   )
  AS
  
  BEGIN
   
   -- PT_ID �־ N���� �ϳ��� �ٲٰų�, CUSTOMER_TBL���� �� �������� ������ ������Ű�� 
     
   UPDATE POINT_TBL
   SET PT_SHOW = 'N'
   WHERE PT_ID = IN_PT_ID OR CT_ID = IN_CT_ID 
   ;
  
   DELETE FROM POINT_TBL T1
   WHERE NOT EXISTS
   (
      SELECT 1 
      FROM CUSTOMERS_TBL
      WHERE CT_ID = T1.CT_ID
   )
   AND CT_ID = IN_CT_ID
   ;
  
  END PROC_DEL_POINT;

----- POINT_TBL SELECT
  PROCEDURE PROC_SEL_POINT
  (
   IN_PT_ID       IN     VARCHAR2,
   IN_S_ID         IN      VARCHAR2,
   IN_CT_ID       IN       VARCHAR2,
   IN_PT_SCORE      IN      NUMBER,
   IN_PT_SAVE_USE    IN      VARCHAR2,
   IN_PT_DATE     IN       DATE,
   IN_PT_SHOW     IN       VARCHAR2,
   O_CUR         OUT    SYS_REFCURSOR
  )
  AS
  
  BEGIN
   
   OPEN O_CUR FOR
   SELECT PT_ID, S_ID, CT_ID, PT_SCORE, PT_SAVE_USE ,PT_DATE, PT_SHOW  FROM POINT_TBL
   WHERE PT_ID LIKE '%' || IN_PT_ID || '%'
   AND S_ID LIKE '%' || IN_S_ID || '%'
   AND CT_ID LIKE '%' || IN_CT_ID || '%'
   AND PT_SCORE LIKE '%' || IN_PT_SCORE || '%'
   AND PT_SAVE_USE LIKE '%' || IN_PT_SAVE_USE || '%'
   AND PT_DATE LIKE '%' || IN_PT_DATE || '%'
   AND PT_SHOW = CASE WHEN IN_PT_SHOW = 'N' THEN 'N' 
                     ELSE 'Y'
                     END
               
   ;
   
  END PROC_SEL_POINT; 
  
   /*POINT_TBL �������� ��*/
END PKG_POINT;

-----------------------------------------------------PKG_POINT_TBL �ٵ�