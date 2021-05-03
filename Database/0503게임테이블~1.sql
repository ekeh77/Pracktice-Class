CREATE TABLE CUSTOMERS_TBL
(
    CT_ID       CHAR(5)                             PRIMARY KEY, -- CUSTOMER�� ID
    CT_NAME     VARCHAR2(30)                        NOT NULL,    -- CUSTOMER�� �̸�
    CT_BIRTH    VARCHAR2(24)                        NOT NULL,    -- CUSTOMER�� �������
    CT_REGION   CHAR(6)                             NOT NULL,    -- CUSTOMER�� ����
    CT_GENDER   CHAR(1)                             NOT NULL,    -- CUSTOMER�� ����
    CT_C_NUM    VARCHAR2(33)                        NOT NULL,    -- CUSTOMER�� ��ȭ��ȣ
    CT_POINT    NUMBER(10)      DEFAULT 0           NULL,        -- CUSTOMER�� ����Ʈ
    CT_GRADE    VARCHAR2(30)    DEFAULT '�����'     NULL,        -- CUSTOMER�� ���(ó�� �����ϴ� ����� ����� ������ ����)
    CT_SHOW     CHAR(1)         DEFAULT 'Y'         NOT NULL     -- CUSTOMER�� ��������
);

INSERT INTO CUSTOMERS_TBL (CT_ID, CT_NAME, CT_BIRTH, CT_REGION, CT_GENDER, CT_C_NUM, CT_POINT, CT_GRADE, CT_SHOW)
VALUES('CT001', '�ڿ���', '19940214', 'CMS004', 'M', '01084762204', 0, '�����', 'Y');

INSERT INTO CUSTOMERS_TBL (CT_ID, CT_NAME, CT_BIRTH, CT_REGION, CT_GENDER, CT_C_NUM, CT_POINT, CT_GRADE, CT_SHOW)
VALUES('CT001', '��ο�', '19900527', 'CMS004', 'M', '01025784952', 0, '�����', 'Y');

INSERT INTO CUSTOMERS_TBL (CT_ID, CT_NAME, CT_BIRTH, CT_REGION, CT_GENDER, CT_C_NUM, CT_POINT, CT_GRADE, CT_SHOW)
VALUES('CT001', '������', '19970811', 'CMS004', 'F', '01078334587', 0, '�����', 'Y');

INSERT INTO CUSTOMERS_TBL (CT_ID, CT_NAME, CT_BIRTH, CT_REGION, CT_GENDER, CT_C_NUM, CT_POINT, CT_GRADE, CT_SHOW)
VALUES('CT001', '����ȯ', '19960401', 'CMS004', 'M', '01017966985', 0, '�����', 'Y');

INSERT INTO CUSTOMERS_TBL (CT_ID, CT_NAME, CT_BIRTH, CT_REGION, CT_GENDER, CT_C_NUM, CT_POINT, CT_GRADE, CT_SHOW)
VALUES('CT001', '������', '19931205', 'CMS004', 'F', '01060513687', 0, '�����', 'Y');

INSERT INTO CUSTOMERS_TBL (CT_ID, CT_NAME, CT_BIRTH, CT_REGION, CT_GENDER, CT_C_NUM, CT_POINT, CT_GRADE, CT_SHOW)
VALUES('CT001', '������', '20000121', 'CMS004', 'F', '01076542291', 0, '�����', 'Y');

INSERT INTO CUSTOMERS_TBL (CT_ID, CT_NAME, CT_BIRTH, CT_REGION, CT_GENDER, CT_C_NUM, CT_POINT, CT_GRADE, CT_SHOW)
VALUES('CT001', '���ö', '20030302', 'CMS004', 'M', '01052410309', 0, '�����', 'Y');

INSERT INTO CUSTOMERS_TBL (CT_ID, CT_NAME, CT_BIRTH, CT_REGION, CT_GENDER, CT_C_NUM, CT_POINT, CT_GRADE, CT_SHOW)
VALUES('CT001', '������', '19990624', 'CMS004', 'M', '01080531698', 0, '�����', 'Y');

INSERT INTO CUSTOMERS_TBL (CT_ID, CT_NAME, CT_BIRTH, CT_REGION, CT_GENDER, CT_C_NUM, CT_POINT, CT_GRADE, CT_SHOW)
VALUES('CT001', '������', '19951006', 'CMS004', 'F', '01042789852', 0, '�����', 'Y');

INSERT INTO CUSTOMERS_TBL (CT_ID, CT_NAME, CT_BIRTH, CT_REGION, CT_GENDER, CT_C_NUM, CT_POINT, CT_GRADE, CT_SHOW)
VALUES('CT001', '����', '20020909', 'CMS004', 'F', '01015947810', 0, '�����', 'Y');

CREATE TABLE SALE_APPLYS_TBL
(
    A_ID            CHAR(4)                    PRIMARY KEY      NOT NULL,   -- ��û ID
    G_ID            CHAR(4)                                     NOT NULL,   -- ������� ID
    CT_ID           CHAR(5)                                     NOT NULL,   -- �� ID
    S_DATE          DATE                                        NOT NULL,   -- ��û ��¥
    PY_ID           CHAR(5)                                     NOT NULL,   -- ��������� ������� ID
    G_GET_POINT     NUMBER(4,2)  DEFAULT 5                      NOT NULL,   -- ��������� ����Ʈ ������
    A_PROFIT        NUMBER(7)                                   NOT NULL,   -- ��������� �Ѹ���(���η�����)
    A_USE_POINT     NUMBER(7)    DEFAULT 0                      NULL,       -- ������ӿ� ����� ����Ʈ 
    A_SHOW          CHAR(1)      DEFAULT 'Y'                    NOT NULL    -- ��û���̺��ǻ�������
);