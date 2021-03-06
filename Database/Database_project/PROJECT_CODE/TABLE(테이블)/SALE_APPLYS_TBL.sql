CREATE TABLE SALE_APPLYS_TBL
(
    A_ID            CHAR(4)                    PRIMARY KEY      NOT NULL,   -- 신청 ID
    G_ID            CHAR(4)                                     NOT NULL,   -- 예약게임 ID
    CT_ID           CHAR(5)                                     NOT NULL,   -- 고객 ID
    S_DATE          DATE                                        NOT NULL,   -- 신청 날짜
    PY_ID           CHAR(5)                                     NOT NULL,   -- 예약게임의 결제방식 ID
    G_GET_POINT     NUMBER(5,2)  DEFAULT 5                      NOT NULL,   -- 예약게임의 포인트 적립률
    A_PROFIT        NUMBER(7)                                   NOT NULL,   -- 예약게임의 총매출(할인률포함)
    A_USE_POINT     NUMBER(7)    DEFAULT 0                      NULL,       -- 예약게임에 사용한 포인트 
    A_SHOW          CHAR(1)      DEFAULT 'Y'                    NOT NULL,   -- 신청테이블의삭제여부
    A_W_PURCHASE    VARCHAR2(3)  DEFAULT 'R'                    NULL        -- 일반구매인지 예약구매인지 확인하기위한 속성
);

INSERT INTO SALE_APPLYS_TBL(A_ID, G_ID, CT_ID, S_DATE, PY_ID, G_GET_POINT, A_PROFIT, A_USE_POINT, A_SHOW, A_W_PURCHASE)
VALUES('A005', 'G018', 'CT007', '21/05/07', 'PY011', 5, 37400, 0, 'Y', 'R');
INSERT INTO SALE_APPLYS_TBL(A_ID, G_ID, CT_ID, S_DATE, PY_ID, G_GET_POINT, A_PROFIT, A_USE_POINT, A_SHOW, A_W_PURCHASE)
VALUES('A007', 'G019', 'CT005', '21/05/07', 'PY012', 5, 13640, 0, 'Y', 'R');
INSERT INTO SALE_APPLYS_TBL(A_ID, G_ID, CT_ID, S_DATE, PY_ID, G_GET_POINT, A_PROFIT, A_USE_POINT, A_SHOW, A_W_PURCHASE)
VALUES('A015', 'G019', 'CT001', '21/05/07', 'PY012', 5, 8640, 5000, 'Y', 'R');
INSERT INTO SALE_APPLYS_TBL(A_ID, G_ID, CT_ID, S_DATE, PY_ID, G_GET_POINT, A_PROFIT, A_USE_POINT, A_SHOW, A_W_PURCHASE)
VALUES('A006', 'G020', 'CT001', '21/05/07', 'PY019', 5, 57420, 0, 'Y', 'R');
INSERT INTO SALE_APPLYS_TBL(A_ID, G_ID, CT_ID, S_DATE, PY_ID, G_GET_POINT, A_PROFIT, A_USE_POINT, A_SHOW, A_W_PURCHASE)
VALUES('A017', 'G020', 'CT001', '21/05/07', 'PY016', 5, 50440, 5000, 'Y', 'R');
INSERT INTO SALE_APPLYS_TBL(A_ID, G_ID, CT_ID, S_DATE, PY_ID, G_GET_POINT, A_PROFIT, A_USE_POINT, A_SHOW, A_W_PURCHASE)
VALUES('A019', 'G014', 'CT009', '21/05/07', 'PY009', 5, 54516, 0, 'Y', 'R');
INSERT INTO SALE_APPLYS_TBL(A_ID, G_ID, CT_ID, S_DATE, PY_ID, G_GET_POINT, A_PROFIT, A_USE_POINT, A_SHOW, A_W_PURCHASE)
VALUES('A020', 'G015', 'CT009', '21/05/07', 'PY007', 5, 32560, 0, 'Y', 'R');
INSERT INTO SALE_APPLYS_TBL(A_ID, G_ID, CT_ID, S_DATE, PY_ID, G_GET_POINT, A_PROFIT, A_USE_POINT, A_SHOW, A_W_PURCHASE)
VALUES('A002', 'G014', 'CT005', '21/05/07', 'PY013', 5, 56463, 0, 'Y', 'R');
INSERT INTO SALE_APPLYS_TBL(A_ID, G_ID, CT_ID, S_DATE, PY_ID, G_GET_POINT, A_PROFIT, A_USE_POINT, A_SHOW, A_W_PURCHASE)
VALUES('A018', 'G012', 'CT012', '21/05/07', 'PY007', 5, 78320, 0, 'Y', 'R');
INSERT INTO SALE_APPLYS_TBL(A_ID, G_ID, CT_ID, S_DATE, PY_ID, G_GET_POINT, A_PROFIT, A_USE_POINT, A_SHOW, A_W_PURCHASE)
VALUES('A021', 'G015', 'CT009', '21/05/07', 'PY018', 5, 32190, 0, 'Y', 'R');


SELECT * FROM SALE_APPLYS_TBL
--COMMIT;