CREATE TABLE CUSTOMERS
(
    CID     CHAR(6)         PRIMARY KEY,
    CNAME   VARCHAR2(30)    NOT NULL,
    POINT   NUMBER(6)       NOT NULL
);

INSERT INTO CUSTOMERS VALUES('C00001', '홍길동', 0);
INSERT INTO CUSTOMERS VALUES('C00002', '전우치', 0);

--COMMIT;

CREATE TABLE BUY
(
    CID     CHAR(6)         NOT NULL,
    PNAME   VARCHAR2(40)    NOT NULL,
    PRICE   NUMBER(6)       NOT NULL,
    QTY     NUMBER(4)       NOT NULL
);

--POINT 10%
INSERT INTO BUY VALUES('C00001', '아이스크림', 3000, 3);
INSERT INTO BUY VALUES('C00002', '새우깡', 900, 3);

SELECT * FROM  BUY;
SELECT * FROM CUSTOMERS;

/*
DELETE FROM BUY
WHERE CID = 'C00002';
*/

UPDATE BUY
SET PRICE = 1000
WHERE CID = 'C00002'
;

--ROLLBACK;
--COMMIT;

--TRIGGER 트리거
--특정 TABLE에 이벤트>사건(INSERT, DELETE, UPDATE)가 발생하면 자동으로 실행되는 PROCEDURE
--트리거는 리소스를 먹기 때문에 특별한 경우에만 사용해야한다
--INSERT를 하면 데이터가 만들어지고 해당 트리거가 실행되는 -- AFTER
--INSERT를 하면 데이터가 만들어지기 전에 먼저 트리거가 실행되고 데이터가 만들어진다 -- BEFORE
--트리거는 매개변수가 없음

/* 
INSERT 트리거 

CREATE OR REPLACE TRIGGER TRG_INS_BUY_ADDPOINT 
AFTER INSERT ON BUY 
REFERENCING OLD AS OLD NEW AS NEW 
FOR EACH ROW
BEGIN
  --BUY 데이터가 INSERT 하면
  --CUSTOMERS 테이블에 POINT를 업데이트를 한다
  UPDATE CUSTOMERS
  SET POINT = POINT + (:NEW.PRICE * :NEW.QTY * 0.1)
  WHERE CID = :NEW.CID
  ;
END;

*/
/*
DELETE 트리거

CREATE OR REPLACE TRIGGER TRG_DEL_BUY_DELPOINT 
BEFORE DELETE ON BUY 
REFERENCING OLD AS O NEW AS N 
FOR EACH ROW 
BEGIN

  --반품되면 POINT도 원상복구
  UPDATE CUSTOMERS
  SET POINT = POINT - (:O.PRICE * :O.QTY * 0.1)
  WHERE CID = :O.CID
  ;
  
END;

*/

/*
UPDATE 트리거

CREATE OR REPLACE TRIGGER TRG_UP_BUY_UPPOINT 
BEFORE UPDATE ON BUY 
REFERENCING OLD AS O NEW AS N 
FOR EACH ROW 
BEGIN
  --(새로운값 - 기존값) * 개수
  UPDATE CUSTOMERS
  SET POINT = POINT + (((:N.PRICE - :O.PRICE) * :N.QTY )* 0.1)
  WHERE CID = :N.CID
  ;
  
  DBMS_OUTPUT.PUT_LINE(:N.PRICE);
  
END;

*/