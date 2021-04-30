CREATE TABLE MEMBERS
(
    MID         CHAR(4)                     PRIMARY KEY,
    MNAME       VARCHAR2(30)                NOT NULL,
    TLTPRICE    NUMBER(20)      DEFAULT 0   NOT NULL
);

INSERT INTO MEMBERS(MID, MNAME, TLTPRICE) VALUES('M001', 'ȫ�浿', 10000);
INSERT INTO MEMBERS(MID, MNAME, TLTPRICE) VALUES('M002', '����ġ', 20000);

SELECT * FROM MEMBERS;


CREATE TABLE BANK
(
    IDX         NUMBER(7)       PRIMARY KEY,
    GBN         CHAR(1)         NOT NULL, -- I:�Ա�, O:���
    PRICE       NUMBER(20)      NOT NULL,
    MID         CHAR(4)         NOT NULL
    
);

INSERT INTO BANK VALUES(BSEQ.NEXTVAL,'I', 10000, 'M001');
INSERT INTO BANK VALUES(BSEQ.NEXTVAL,'I', 20000, 'M002');

--COMMIT;
SELECT * FROM BANK;


CREATE OR REPLACE PROCEDURE PROC_TRANS 
(
      IN_MID_IN IN VARCHAR2 
    , IN_MID_OUT IN VARCHAR2 
    , IN_PRICE IN NUMBER 
    , O_ERRCODE OUT VARCHAR2 
    , O_ERRMSG OUT VARCHAR2 
) 
AS 
    V_PRICE                 NUMBER(10);
    
    --����� ���� ���� ó��
    
    EXCEPT_OVER_MONEY       EXCEPTION;
    
BEGIN

    SELECT TLTPRICE
    INTO V_PRICE
    FROM MEMBERS
    WHERE MID = IN_MID_IN
    ;
    
  IF V_PRICE >= IN_PRICE THEN

  --����ġ�� 5000���� ȫ�浿���� �۱�
  INSERT INTO BANK(IDX, GBN, PRICE, MID)
  VALUES(BSEQ.NEXTVAL, 'O', IN_PRICE, IN_MID_OUT);
  
  
  INSERT INTO BANK(IDX, GBN, PRICE, MID)
  VALUES(BSEQ.NEXTVAL, 'I', IN_PRICE, IN_MID_IN);
  
  ELSE
    
    RAISE EXCEPT_OVER_MONEY;

  END IF;
  
  EXCEPTION -- ����ó���� �ϴµ� ������ ���°� �ƴϱ� ������ �߰��� ������ �߸� �ѹ��� �����ʰ� �״�� ����
        WHEN EXCEPT_OVER_MONEY THEN
        
        O_ERRCODE := '250';
        O_ERRMSG  := '�ܰ� �����մϴ�';
        
        ROLLBACK;
        
        WHEN OTHERS THEN
        
        O_ERRCODE := '100';
        O_ERRMSG  := '�������߻�';
        
        ROLLBACK;
  
END PROC_TRANS;