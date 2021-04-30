CREATE TABLE MEMBERS
(
    MID         CHAR(4)                     PRIMARY KEY,
    MNAME       VARCHAR2(30)                NOT NULL,
    TLTPRICE    NUMBER(20)      DEFAULT 0   NOT NULL
);

INSERT INTO MEMBERS(MID, MNAME, TLTPRICE) VALUES('M001', '홍길동', 10000);
INSERT INTO MEMBERS(MID, MNAME, TLTPRICE) VALUES('M002', '전우치', 20000);

SELECT * FROM MEMBERS;


CREATE TABLE BANK
(
    IDX         NUMBER(7)       PRIMARY KEY,
    GBN         CHAR(1)         NOT NULL, -- I:입금, O:출금
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
    
    --사용자 정의 예외 처리
    
    EXCEPT_OVER_MONEY       EXCEPTION;
    
BEGIN

    SELECT TLTPRICE
    INTO V_PRICE
    FROM MEMBERS
    WHERE MID = IN_MID_IN
    ;
    
  IF V_PRICE >= IN_PRICE THEN

  --전우치가 5000원을 홍길동에서 송금
  INSERT INTO BANK(IDX, GBN, PRICE, MID)
  VALUES(BSEQ.NEXTVAL, 'O', IN_PRICE, IN_MID_OUT);
  
  
  INSERT INTO BANK(IDX, GBN, PRICE, MID)
  VALUES(BSEQ.NEXTVAL, 'I', IN_PRICE, IN_MID_IN);
  
  ELSE
    
    RAISE EXCEPT_OVER_MONEY;

  END IF;
  
  EXCEPTION -- 에외처리를 하는데 에러가 나는게 아니기 때문에 중간에 에러가 뜨면 롤백을 하지않고 그대로 나옴
        WHEN EXCEPT_OVER_MONEY THEN
        
        O_ERRCODE := '250';
        O_ERRMSG  := '잔고가 부족합니다';
        
        ROLLBACK;
        
        WHEN OTHERS THEN
        
        O_ERRCODE := '100';
        O_ERRMSG  := '에러가발생';
        
        ROLLBACK;
  
END PROC_TRANS;