CREATE TABLE SALE_APPLYS_TBL
(
    A_ID            CHAR(4)                    PRIMARY KEY      NOT NULL,   -- ��û ID
    G_ID            CHAR(4)                                     NOT NULL,   -- ������� ID
    CT_ID           CHAR(5)                                     NOT NULL,   -- �� ID
    S_DATE          DATE                                        NOT NULL,   -- ��û ��¥
    PY_ID           CHAR(5)                                     NOT NULL,   -- ��������� ������� ID
    G_GET_POINT     NUMBER(5,2)  DEFAULT 5                      NOT NULL,   -- ��������� ����Ʈ ������
    A_PROFIT        NUMBER(7)                                   NOT NULL,   -- ��������� �Ѹ���(���η�����)
    A_USE_POINT     NUMBER(7)    DEFAULT 0                      NULL,       -- ������ӿ� ����� ����Ʈ 
    A_SHOW          CHAR(1)      DEFAULT 'Y'                    NOT NULL,   -- ��û���̺��ǻ�������
    A_W_PURCHASE    VARCHAR2(3)  DEFAULT 'R'                    NULL        -- �Ϲݱ������� ���౸������ Ȯ���ϱ����� �Ӽ�
);

INSERT INTO SALE_APPLYS_TBL(A_ID, G_ID, CT_ID, S_DATE, PY_ID, G_GET_POINT, A_PROFIT, A_USE_POINT, A_SHOW, A_W_PURCHASE)
VALUES('A001', 'G018', 'CT007', '21/05/07', 'PY011', 5, 37400, 0, 'Y', 'R');
INSERT INTO SALE_APPLYS_TBL(A_ID, G_ID, CT_ID, S_DATE, PY_ID, G_GET_POINT, A_PROFIT, A_USE_POINT, A_SHOW, A_W_PURCHASE)
VALUES('A002', 'G019', 'CT005', '21/05/07', 'PY012', 5, 13640, 0, 'Y', 'R');
INSERT INTO SALE_APPLYS_TBL(A_ID, G_ID, CT_ID, S_DATE, PY_ID, G_GET_POINT, A_PROFIT, A_USE_POINT, A_SHOW, A_W_PURCHASE)
VALUES('A003', 'G019', 'CT001', '21/05/07', 'PY012', 5, 8640, 5000, 'Y', 'R');
INSERT INTO SALE_APPLYS_TBL(A_ID, G_ID, CT_ID, S_DATE, PY_ID, G_GET_POINT, A_PROFIT, A_USE_POINT, A_SHOW, A_W_PURCHASE)
VALUES('A004', 'G020', 'CT001', '21/05/07', 'PY019', 5, 57420, 0, 'Y', 'R');
INSERT INTO SALE_APPLYS_TBL(A_ID, G_ID, CT_ID, S_DATE, PY_ID, G_GET_POINT, A_PROFIT, A_USE_POINT, A_SHOW, A_W_PURCHASE)
VALUES('A005', 'G020', 'CT001', '21/05/07', 'PY016', 5, 50440, 5000, 'Y', 'R');
INSERT INTO SALE_APPLYS_TBL(A_ID, G_ID, CT_ID, S_DATE, PY_ID, G_GET_POINT, A_PROFIT, A_USE_POINT, A_SHOW, A_W_PURCHASE)
VALUES('A006', 'G014', 'CT009', '21/05/07', 'PY009', 5, 54516, 0, 'Y', 'R');
INSERT INTO SALE_APPLYS_TBL(A_ID, G_ID, CT_ID, S_DATE, PY_ID, G_GET_POINT, A_PROFIT, A_USE_POINT, A_SHOW, A_W_PURCHASE)
VALUES('A007', 'G015', 'CT009', '21/05/07', 'PY007', 5, 32560, 0, 'Y', 'R');
INSERT INTO SALE_APPLYS_TBL(A_ID, G_ID, CT_ID, S_DATE, PY_ID, G_GET_POINT, A_PROFIT, A_USE_POINT, A_SHOW, A_W_PURCHASE)
VALUES('A008', 'G014', 'CT005', '21/05/07', 'PY013', 5, 56463, 0, 'Y', 'R');
INSERT INTO SALE_APPLYS_TBL(A_ID, G_ID, CT_ID, S_DATE, PY_ID, G_GET_POINT, A_PROFIT, A_USE_POINT, A_SHOW, A_W_PURCHASE)
VALUES('A009', 'G012', 'CT012', '21/05/07', 'PY007', 5, 78320, 0, 'Y', 'R');
INSERT INTO SALE_APPLYS_TBL(A_ID, G_ID, CT_ID, S_DATE, PY_ID, G_GET_POINT, A_PROFIT, A_USE_POINT, A_SHOW, A_W_PURCHASE)
VALUES('A010', 'G015', 'CT009', '21/05/07', 'PY018', 5, 32190, 0, 'Y', 'R');


SELECT * FROM SALE_APPLYS_TBL
--COMMIT;