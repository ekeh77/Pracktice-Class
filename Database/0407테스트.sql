--고객
CREATE TABLE MEMBERS
(
    MID CHAR(4) NOT NULL PRIMARY KEY,
    MNAME VARCHAR2(30) NOT NULL,
    MTEL VARCHAR2(20) NOT NULL,
    POINTS NUMBER(8,2) NULL
    
);

INSERT INTO MEMBERS VALUES('M001', '박경숙', '0101111', NULL);
INSERT INTO MEMBERS VALUES('M002', '홍길동', '0112222', NULL);
INSERT INTO MEMBERS VALUES('M003', '홍길동', '0173333', NULL);

SELECT * FROM MEMBERS;

--COMMIT;

--구매
CREATE TABLE PURCHASES
(
    PID NUMBER(5)   NOT NULL PRIMARY KEY,
    MID CHAR(4) NOT NULL,
    PNAME VARCHAR2(100) NOT NULL,
    PRICE NUMBER(5) NOT NULL,
    QTY NUMBER(3) NOT NULL,
    PDATE DATE NOT NULL
);

--1.박경숙 고객이 키보드를 10000원에 2대를 구매
INSERT INTO PURCHASES VALUES(1, 'M001', '키보드', 10000, 2, '2021-04-07');

--2.박경숙 고객이 마우스를 5000원에 3대를 구매
INSERT INTO PURCHASES VALUES(2, 'M001', '마우스', 5000, 3, '2021-04-07');

--3.홍길동 고객이 키보드를 15000원에 4대 구매
INSERT INTO PURCHASES VALUES(3, 'M002', '키보드', 15000, 4, '2021-04-08');

--4.홍길동 고객이 스피커를 30000원에 2대 구매
INSERT INTO PURCHASES VALUES(4, 'M002', '스피커', 30000, 2, '2021-04-08');

--5.또 다른 홍길동 고객이 마우스를 10000원에 3대 구매
INSERT INTO PURCHASES VALUES(5, 'M003', '마우스', 10000, 3, '2021-04-09');

SELECT * FROM PURCHASES;

--COMMIT;

--구매금액의 5%를 POINT로 적립

--1.구매고객별로 고객이 몇번을 구매했는지 알아보자

SELECT MID, COUNT(*)
FROM PURCHASES
GROUP BY MID
;

--2. 구매고객별로 구매한 금액이 얼마인지 알아보자

SELECT MID, SUM(PRICE * QTY)
FROM PURCHASES
GROUP BY MID
;

--3. 고객중에 제일 많은 금액을 구매한 고객

SELECT MID, SUM(PRICE * QTY)
FROM PURCHASES
GROUP BY MID
;

--날짜 판매 실적

SELECT PDATE, COUNT(*)
FROM PURCHASES
GROUP BY PDATE
;

--고객별 포인트 계산
--PURCHASES에서

SELECT MID, SUM(PRICE*QTY) * 0.05
FROM PURCHASES
GROUP BY MID
;

SELECT T1.MID, T1.MNAME, T2.PID, T2.PNAME, T2.PRICE, T2.QTY, T2.PDATE
FROM MEMBERS T1, PURCHASES T2
WHERE T1.MID = T2.MID
;

-- JOIN - CROSS JOIN, INNER JOIN, OUTER JOIN

--고객별 구매금액, --이름, 구매금

SELECT * FROM MEMBERS;
SELECT * FROM PURCHASES;

SELECT T1.MID, T1.MNAME, SUM(PRICE * QTY)
FROM MEMBERS T1,PURCHASES T2
WHERE T1.MID = T2.MID
GROUP BY T1.MNAME, T1.MID
;

--고객이름, 구매날짜, -- 이름이 홍길동인 고객

SELECT T1.MNAME, T2.PDATE
FROM MEMBERS T1, PURCHASES T2
WHERE T1.MID = T2.MID 
AND T1.MNAME = '홍길동'
ORDER BY PDATE ASC
;
