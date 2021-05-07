----------------------------------------------PKG_COMMONS_TBL ������
create or replace NONEDITIONABLE PACKAGE PKG_COMMONS AS 
----------------------------------------------------------
   /*COMMONS_TBL �������� ����*/
   --CRUD CREATE, RETRIVE, UPDATE, DELETE

----- COMMONS_TBL INSERT, UPDATE
  PROCEDURE PROC_INS_UP_COMMONS
  (
         IN_CMS_ID                IN     VARCHAR2,
           IN_CMS_NAME              IN     VARCHAR2,
           IN_CMS_LVL               IN       NUMBER,
           IN_CMS_SEQ               IN        NUMBER,
         IN_PARENT_CMS_ID        IN       VARCHAR2,
           IN_GROUP_NUM               IN       NUMBER  
  );

----- COMMONS_TBL DELETE

  PROCEDURE PROC_DEL_COMMONS
  (
   IN_CMS_ID          IN      VARCHAR2,
   IN_CMS_LVL        IN     NUMBER,
   IN_CMS_SEQ        IN     NUMBER
  );

----- COMMONS_TBL SELECT

  PROCEDURE PROC_SEL_COMMONS
  (
   IN_CMS_ID           IN     VARCHAR2,
   IN_CMS_NAME        IN     VARCHAR2,
   IN_CMS_LVL        IN     NUMBER,
   IN_CMS_SEQ        IN     NUMBER,
   IN_PARENT_CMS_ID     IN       VARCHAR2,
   IN_GROUP_NUM        IN       NUMBER,
   O_CUR            OUT     SYS_REFCURSOR
  );

   /*COMMONS_TBL �������� ��*/
END PKG_COMMONS;
----------------------------------------------PKG_COMMONS_TBL ��峡
----------------------------------------------PKG_COMMONS_TBL �ٵ����

create or replace NONEDITIONABLE PACKAGE BODY PKG_COMMONS AS
----------------------------------------------------------
   /*COMMONS_TBL �������� ����*/
   --CRUD CREATE, RETRIVE, UPDATE, DELETE

---- COMMONS_TBL INSERT, UPDATE    
   PROCEDURE PROC_INS_UP_COMMONS
   (
           IN_CMS_ID                IN     VARCHAR2,
           IN_CMS_NAME              IN     VARCHAR2,
           IN_CMS_LVL               IN     NUMBER,
           IN_CMS_SEQ               IN     NUMBER,
         IN_PARENT_CMS_ID        IN       VARCHAR2,
           IN_GROUP_NUM               IN     NUMBER  

    )
  AS
   V_CMS_ID       CHAR(6);
  ----------
   V_CMS_LVL                NUMBER(3);
   V_CMS_SEQ               NUMBER(3);
   V_PARENT_CMS_ID         VARCHAR2(20); -- ����
   V_GROUP_NUM            NUMBER(3);
   --V_G_PARENT_CMS_ID       VARCHAR2(20);  -- group ������ ��ƿ�
   
  BEGIN
      
   SELECT COUNT(*)
   INTO V_CMS_ID
   FROM COMMONS_TBL
   WHERE CMS_ID = IN_CMS_ID
   ;
   

   
   IF V_CMS_ID = 0 THEN ----- insert -- CMS_ID�� ���ٸ� ���� �����Ѵ�
      
      if IN_CMS_LVL = 1 and IN_PARENT_CMS_ID is null then  
      
            SELECT 'CMS' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(CMS_ID),'CMS000'),4)) + 1, 'FM000')
            INTO V_CMS_ID
            FROM COMMONS_TBL
            ;
            
             --���� ���� �θ���� �κ� �߰��ɶ�
            UPDATE COMMONS_TBL
            SET CMS_SEQ = CMS_SEQ + 1
            WHERE CMS_SEQ >= IN_CMS_SEQ
            AND CMS_LVL = IN_CMS_LVL
            ;
            
            INSERT INTO COMMONS_TBL
            (CMS_ID, CMS_NAME, CMS_LVL, CMS_SEQ, PARENT_CMS_ID, GROUP_NUM)
            VALUES
            (V_CMS_ID, IN_CMS_NAME, IN_CMS_LVL , IN_CMS_SEQ, IN_PARENT_CMS_ID, IN_GROUP_NUM)
            ;
            
         else
           -- �� �� �ٸ��κ� 
            SELECT 'CMS' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(CMS_ID),'CMS000'),4)) + 1, 'FM000')
            INTO V_CMS_ID
            FROM COMMONS_TBL
            ;
            
            --���� �߰��Ǵ� ���� ���� �и��� SEQ���� �������� 
            UPDATE COMMONS_TBL
            SET CMS_SEQ = CMS_SEQ + 1
            WHERE CMS_SEQ >= IN_CMS_SEQ
            AND CMS_LVL = IN_CMS_LVL
            ;
            
            INSERT INTO COMMONS_TBL
            (CMS_ID, CMS_NAME, CMS_LVL, CMS_SEQ, PARENT_CMS_ID, GROUP_NUM)
            VALUES
            (V_CMS_ID, IN_CMS_NAME, IN_CMS_LVL , IN_CMS_SEQ, IN_PARENT_CMS_ID, IN_GROUP_NUM)
            ;
         end if;
         
  ELSE  -- ������ �����Ѵ� 
  -------------------------------  update 

   -- ���� ���� CMS_ID��  LVL,  SEQ, PARENT_CMS_ID, GROUP_NUM ������ ������ �����Ѵ�
   
      SELECT CMS_LVL  -- ���� LVL ��
      INTO V_CMS_LVL
      FROM COMMONS_TBL
      WHERE CMS_ID = IN_CMS_ID
      ;
      
      SELECT CMS_SEQ  -- ���� SEQ ��
      INTO V_CMS_SEQ
      FROM COMMONS_TBL
      WHERE CMS_ID = IN_CMS_ID
      ;
      
      SELECT PARENT_CMS_ID -- ���� PARENT �� 
      INTO V_PARENT_CMS_ID
      FROM COMMONS_TBL
      WHERE CMS_ID = IN_CMS_ID
      ;
      
      SELECT GROUP_NUM  -- ���� GROUP_NUM �� 
      INTO V_GROUP_NUM
      FROM COMMONS_TBL
      WHERE CMS_ID = IN_CMS_ID
      ;
      
      IF V_CMS_LVL = IN_CMS_LVL AND V_CMS_SEQ < IN_CMS_SEQ AND V_GROUP_NUM = IN_GROUP_NUM THEN 
      -- ���� ���������� SEQ UPDATE
         --3->5
         UPDATE COMMONS_TBL 
         SET CMS_SEQ = CMS_SEQ - 1
         WHERE CMS_SEQ > V_CMS_SEQ AND CMS_SEQ <= IN_CMS_SEQ --������ ���� SEQ
         AND CMS_LVL = IN_CMS_LVL
         AND GROUP_NUM = IN_GROUP_NUM
         ;
         
      ELSE
         
         --5->3
         UPDATE COMMONS_TBL 
         SET CMS_SEQ = CMS_SEQ +1
         WHERE CMS_SEQ >= IN_CMS_SEQ AND CMS_SEQ < V_CMS_SEQ 
         AND CMS_LVL = IN_CMS_LVL
         AND GROUP_NUM = IN_GROUP_NUM
         ;
                           
      END IF;
      
      ------- �ٸ� ���������� SEQ UPDATE -----------
      --------------------------------------------
            
      IF  V_CMS_LVL > IN_CMS_LVL -- AND V_GROUP_NUM = IN_GROUP_NUM 
         AND V_CMS_SEQ < IN_CMS_SEQ OR V_CMS_SEQ > IN_CMS_SEQ
         
         THEN
         
         -- LVL3�� 2�� �̵��ϰ� SEQ�� 3LVL 4SEQ-->2LVL 3SEQ
            -- ���� �� LVL���� ���ų� ū SEQ���� �ϳ��� �÷���
         UPDATE COMMONS_TBL
         SET CMS_SEQ = CMS_SEQ + 1
         WHERE CMS_SEQ >= IN_CMS_SEQ
         AND CMS_LVL = IN_CMS_LVL
         --AND GROUP_NUM = IN_GROUP_NUM  ----?
         ;
            -- �������� LVL�� SEQ���� �ϳ��� �ٿ��� +  GROUP���� ��������
         UPDATE COMMONS_TBL
         SET CMS_SEQ = CMS_SEQ -1
         WHERE CMS_SEQ > V_CMS_SEQ
         AND CMS_LVL = V_CMS_LVL
         AND GROUP_NUM = V_GROUP_NUM
         ;
      
      ELSE 
         
         --LVL2�� 3�� �̵��ϰ� SEQ�� 2LVL 3SEQ-->3LVL 4SEQ
            -- ���� �� LVL���� ���ų� ū SEQ���� �ϳ��� �÷���
         UPDATE COMMONS_TBL
         SET CMS_SEQ = CMS_SEQ + 1
         WHERE CMS_SEQ >= IN_CMS_SEQ
         AND CMS_LVL = IN_CMS_LVL
         --AND GROUP_NUM = IN_GROUP_NUM  ----?
         ;
         
         
      END IF;
      
      
   -- �����͸� �Է�
      UPDATE COMMONS_TBL
      SET CMS_NAME = IN_CMS_NAME,
         CMS_LVL = IN_CMS_LVL,
         CMS_SEQ = IN_CMS_SEQ,
         PARENT_CMS_ID = IN_PARENT_CMS_ID,
         GROUP_NUM = IN_GROUP_NUM      
      WHERE CMS_ID = IN_CMS_ID 
      ;
      
      
     --------------------------------------------------------  
  END IF; 
  
  END PROC_INS_UP_COMMONS;
   
  
----- COMMONS_TBL DELETE

  PROCEDURE PROC_DEL_COMMONS
  (
   IN_CMS_ID          IN      VARCHAR2,
   IN_CMS_LVL        IN     NUMBER,
   IN_CMS_SEQ        IN     NUMBER
  )
  AS
  
  BEGIN
   
   DELETE FROM COMMONS_TBL
   WHERE CMS_ID = IN_CMS_ID
   ;
   
   UPDATE COMMONS_TBL
   SET CMS_SEQ = CMS_SEQ - 1
   WHERE CMS_SEQ > IN_CMS_SEQ
   AND CMS_LVL = IN_CMS_LVL
   ;
  
  END PROC_DEL_COMMONS;

----- COMMONS_TBL SELECT

  PROCEDURE PROC_SEL_COMMONS
  (
   IN_CMS_ID           IN     VARCHAR2,
   IN_CMS_NAME        IN     VARCHAR2,
   IN_CMS_LVL           IN     NUMBER,
   IN_CMS_SEQ        IN     NUMBER,
   IN_PARENT_CMS_ID     IN       VARCHAR2,
   IN_GROUP_NUM        IN       NUMBER,
   O_CUR            OUT     SYS_REFCURSOR
  )
  AS
  
  BEGIN
   
   OPEN O_CUR FOR
   SELECT CMS_ID, CMS_NAME, CMS_LVL, CMS_SEQ, NVL(PARENT_CMS_ID, '(NULL)'), GROUP_NUM FROM COMMONS_TBL
   WHERE CMS_ID LIKE '%' || IN_CMS_ID || '%'
   AND CMS_NAME LIKE '%' || IN_CMS_NAME || '%'
   AND CMS_LVL LIKE '%' || IN_CMS_LVL || '%'
   AND CMS_SEQ LIKE '%' || IN_CMS_SEQ || '%'
   AND NVL(PARENT_CMS_ID, 0) LIKE '%' || IN_PARENT_CMS_ID || '%'
   AND GROUP_NUM LIKE '%' || IN_GROUP_NUM || '%'
   ;
   
  END PROC_SEL_COMMONS;
  
   /*COMMONS_TBL �������� ��*/
END PKG_COMMONS;

----------------------------------------------PKG_COMMONS_TBL �ٵ�
