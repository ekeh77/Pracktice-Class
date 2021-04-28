    
    --DROP TABLE GROUP_TBL
    CREATE TABLE GROUP_TBL
    (
        GROUP_ID    CHAR(4)     NOT NULL,   --�׷��ڵ�
        GROUP_NAME    VARCHAR2(50)     NOT NULL,  --�׷��̸�   
        GROUP_SEQ       NUMBER(7)       NOT NULL
    );
    
    INSERT INTO GROUP_TBL VALUES('G001', '�μ��� �� ����', 1);
    INSERT INTO GROUP_TBL VALUES('G002', '��å', 2);
    INSERT INTO GROUP_TBL VALUES('G003', '����', 3);
    
    SELECT * FROM GROUP_TBL;
    
    --DROP TABLE COMMONS_TBL
    /*�����ڵ� ���̺�*/
    CREATE TABLE COMMONS_TBL
    (
        COM_ID  CHAR(4)         NOT NULL,  --�����ڵ�
        COM_VAL VARCHAR2(100)   NOT NULL,  --�����ڵ� ��
        COM_LVL NUMBER(8)       NOT NULL,  --�����ڵ� ����
        COM_SEQ NUMBER(8)       NOT NULL,  --�����ڵ� ����
        PARENT_ID   CHAR(4)     NULL,      --�θ��ڵ�
        GROUP_ID    CHAR(4)     NOT NULL   --�׷��ڵ�
        /*
        EXCEPT1     VARCHAR2(20)  NULL,      --����1
        EXCEPT2     VARCHAR2(20)  NULL,      --����2
        EXCEPT3     VARCHAR2(20)  NULL,      --����3
        EXCEPT4     VARCHAR2(20)  NULL       --����4
        */
    );
    
    --�����ڵ�
    --�������� -- ������ ���� �ڵ尪 - �μ�,��    ��å,  ����,   �ּ�ü��,  �ŷ�ó, �ڵ���ȸ��, �޴�, 
    --                           - �������� ��찡 ����.
    
    INSERT INTO COMMONS_TBL VALUES('C001', '�μ���', 1, 1, 'C000', 'G001');
    INSERT INTO COMMONS_TBL VALUES('C002', '�����', 2, 1, 'C001', 'G001');
    INSERT INTO COMMONS_TBL VALUES('C003', '���ź�', 2, 2, 'C001', 'G001');
    INSERT INTO COMMONS_TBL VALUES('C004', '����1��', 3, 1, 'C002', 'G001');
    INSERT INTO COMMONS_TBL VALUES('C005', '����2��', 3, 2, 'C002', 'G001');
    INSERT INTO COMMONS_TBL VALUES('C006', '����3��', 3, 3, 'C002', 'G001');
    INSERT INTO COMMONS_TBL VALUES('C007', '����1��', 3, 1, 'C003', 'G001');
    INSERT INTO COMMONS_TBL VALUES('C008', '����2��', 3, 2, 'C003', 'G001');
    INSERT INTO COMMONS_TBL VALUES('C009', '����1-1��', 4, 1, 'C007', 'G001');
    INSERT INTO COMMONS_TBL VALUES('C010', '����1-2��', 4, 2, 'C007', 'G001');
    
    INSERT INTO COMMONS_TBL VALUES('C011', '��å', 1, 1, 'C000', 'G002');
    INSERT INTO COMMONS_TBL VALUES('C012', '�μ���', 2, 1, 'C011', 'G002');
    INSERT INTO COMMONS_TBL VALUES('C013', '����', 2, 2, 'C011', 'G002');
    INSERT INTO COMMONS_TBL VALUES('C014', '���', 2, 3, 'C011', 'G002');
    
    INSERT INTO COMMONS_TBL VALUES('C015', '����', 1, 1, 'C000', 'G003');
    INSERT INTO COMMONS_TBL VALUES('C016', '����', 2, 1, 'C015', 'G003');
    INSERT INTO COMMONS_TBL VALUES('C017', '����', 2, 2, 'C015', 'G003');
    INSERT INTO COMMONS_TBL VALUES('C018', '����', 2, 3, 'C015', 'G003');
    INSERT INTO COMMONS_TBL VALUES('C019', '�븮', 2, 4, 'C015', 'G003');
    INSERT INTO COMMONS_TBL VALUES('C020', '���', 2, 5, 'C015', 'G003');
    
    SELECT  LPAD(' ', T1.COM_LVL * 2) || T1.COM_VAL
    FROM COMMONS_TBL T1, GROUP_TBL T2
    WHERE T1.GROUP_ID = T2.GROUP_ID
    START WITH T1.PARENT_ID IS NULL
    CONNECT BY PRIOR T1.COM_ID = T1.PARENT_ID
    ORDER SIBLINGS BY T1.COM_SEQ
    ;
    
    SELECT  *
    FROM COMMONS_TBL T1, GROUP_TBL T2
    WHERE T1.GROUP_ID = T2.GROUP_ID
    START WITH T1.PARENT_ID IS NULL
    CONNECT BY PRIOR T1.COM_ID = T1.PARENT_ID
    ORDER SIBLINGS BY T1.COM_SEQ
    ;
    
    
    SELECT * FROM GROUP_TBL;
    SELECT * FROM COMMONS_TBL;
    
    CREATE OR REPLACE
PACKAGE BODY PKG_COMMON_CODE AS

/* GROUP_TBL�� �������� ���� */

  PROCEDURE PROC_MOD_GROUP
  (
        IN_GROUP_ID         VARCHAR2,
        IN_GROUP_NAME       VARCHAR2,
        IN_GROUP_SEQ        NUMBER
  ) AS
  
    V_NEW_GROUP_ID      CHAR(4);
    
  BEGIN
  
    --Ȥ�� INSERT ��� ����ϰ� ������ �𸣴� GROUP_ID
    SELECT 'G' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(GROUP_ID),'G000'),2))+ 1,'FM000') 
    INTO V_NEW_GROUP_ID
    FROM GROUP_TBL;
    
    --��Ϲ׼���
    
    MERGE INTO GROUP_TBL
    USING DUAL
    ON(GROUP_ID = IN_GROUP_ID)
    WHEN MATCHED THEN
    
        UPDATE SET GROUP_NAME = IN_GROUP_NAME,
                    GROUP_SEQ = IN_GROUP_SEQ
                    
    WHEN NOT MATCHED THEN
    
        --INSERT�Ϸ��� ���ο� GROUP_ID�� �ʿ��ϴ�
        INSERT(GROUP_ID, GROUP_NAME, GROUP_SEQ)
        VALUES(V_NEW_GROUP_ID, IN_GROUP_NAME, IN_GROUP_SEQ)
        
        ;
  END PROC_MOD_GROUP;

  PROCEDURE PROC_DEL_GROUP
  (
        IN_GROUP_ID         VARCHAR2,
        IN_GROUP_SEQ        NUMBER
  ) AS
  BEGIN
  
    --1.�����
    DELETE FROM GROUP_TBL
    WHERE GROUP_ID = IN_GROUP_ID
    ;
    
    --2. SEQ���� ������
    UPDATE GROUP_TBL
    SET GROUP_SEQ = GROUP_SEQ - 1
    WHERE GROUP_SEQ > IN_GROUP_SEQ
    ;
    
  END PROC_DEL_GROUP;

  PROCEDURE PROC_SEL_GROUP
  (
        IN_GROUP_ID         VARCHAR2,
        IN_GROUP_NAME       VARCHAR2,
        O_CUR       OUT     SYS_REFCURSOR
        
  ) AS
  BEGIN
    
    OPEN O_CUR FOR
    SELECT * FROM GROUP_TBL
    WHERE GROUP_ID LIKE '%' || IN_GROUP_ID || '%'
    AND GROUP_NAME LIKE '%' || IN_GROUP_NAME || '%'
    ;
    
  END PROC_SEL_GROUP;

/* GROUP_TBL�� �������� �� */

/* COMMONS_TBL �������� ���� */

    --COMMONS_TBL ������ ���

    PROCEDURE PROC_MOD_COMMON
    (
        IN_COM_ID IN VARCHAR2,
        IN_COM_VAL IN VARCHAR2,
        IN_COM_LVL  IN NUMBER,
        IN_COM_SEQ IN NUMBER,
        IN_PARENT_ID IN VARCHAR2,
        IN_GROUP_ID IN VARCHAR2
    )
    AS
    
        V_COM_ID        CHAR(4);
    
    BEGIN
        
        SELECT 'C' || TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(COM_ID),'C000'),2))+1,'FM000')
        INTO V_COM_ID
        FROM COMMONS_TBL
        ;
        
        MERGE INTO COMMONS_TBL
        USING DUAL
        ON(COM_ID = IN_COM_ID)
        WHEN MATCHED THEN
            UPDATE SET COM_LVL = IN_COM_LVL,
                       COM_SEQ = IN_COM_SEQ,
                       COM_VAL = IN_COM_VAL,
                       PARENT_ID = IN_PARENT_ID,
                       GROUP_ID = IN_GROUP_ID
        WHEN NOT MATCHED THEN
            INSERT(COM_ID, COM_VAL, COM_LVL, COM_SEQ, PARENT_ID, GROUP_ID)
            VALUES(V_COM_ID, IN_COM_VAL, IN_COM_LVL, IN_COM_SEQ, IN_PARENT_ID, IN_GROUP_ID)
        ;
        
    END PROC_MOD_COMMON
    ;
    
    PROCEDURE PROC_DEL_COMMON
    (
        IN_COM_ID       IN      VARCHAR2,
        IN_COM_LVL      IN      NUMBER,
        IN_COM_SEQ      IN      NUMBER
    )
    AS
    BEGIN
    
        DELETE FROM COMMONS_TBL
        WHERE COM_ID = IN_COM_ID
        ;
        
        UPDATE COMMONS_TBL
        SET COM_SEQ = IN_COM_SEQ -1
        WHERE COM_LVL = IN_COM_LVL
        AND COM_SEQ > IN_COM_SEQ
        ;
        
    END PROC_DEL_COMMON
    ;
    
/* COMMONS_TBL �������� �� */

END PKG_COMMON_CODE;