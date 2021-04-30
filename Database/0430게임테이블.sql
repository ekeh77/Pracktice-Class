CREATE TABLE CUSTOMER_TBL
(
    CT_ID       CHAR(5)                         PRIMARY KEY,
    CT_NAME     VARCHAR2(30)                    NOT NULL,
    CT_BIRTH    VARCHAR2(24)                    NOT NULL,
    CT_REGION   CHAR(6)                         NOT NULL,
    CT_GENDER   CHAR(1)                         NOT NULL,
    CT_C_NUM    VARCHAR2(33)                    NOT NULL,
    CT_POINT    NUMBER(10)      DEFAULT 0       NULL,
    CT_GRADE    VARCHAR2(30)                    NULL,
    CT_SHOW     CHAR(1)         DEFAULT 'Y'     NOT NULL
);

CREATE TABLE APPLY_TBL
(
    A_ID        CHAR(4)     NOT NULL,
    A_INDEX     NUMBER(7)   NOT NULL,
    G_R_ID      CHAR(5)     NOT NULL,
    CTID        CHAR(5)     NOT NULL,
    S_DATE      DATE        NOT NULL,
    PY_ID       CHAR(5)     NOT NULL
);