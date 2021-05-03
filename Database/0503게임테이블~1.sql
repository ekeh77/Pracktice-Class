CREATE TABLE CUSTOMERS_TBL
(
    CT_ID       CHAR(5)                             PRIMARY KEY, -- CUSTOMER의 ID
    CT_NAME     VARCHAR2(30)                        NOT NULL,    -- CUSTOMER의 이름
    CT_BIRTH    VARCHAR2(24)                        NOT NULL,    -- CUSTOMER의 생년월일
    CT_REGION   CHAR(6)                             NOT NULL,    -- CUSTOMER의 국가
    CT_GENDER   CHAR(1)                             NOT NULL,    -- CUSTOMER의 성별
    CT_C_NUM    VARCHAR2(33)                        NOT NULL,    -- CUSTOMER의 전화번호
    CT_POINT    NUMBER(10)      DEFAULT 0           NULL,        -- CUSTOMER의 포인트
    CT_GRADE    VARCHAR2(30)    DEFAULT '브론즈'     NULL,        -- CUSTOMER의 등급(처음 가입하는 사람의 등급은 브론즈로 통일)
    CT_SHOW     CHAR(1)         DEFAULT 'Y'         NOT NULL     -- CUSTOMER의 삭제여부
);

INSERT INTO CUSTOMERS_TBL (CT_ID, CT_NAME, CT_BIRTH, CT_REGION, CT_GENDER, CT_C_NUM, CT_POINT, CT_GRADE, CT_SHOW)
VALUES('CT001', '박영훈', '19940214', 'CMS004', 'M', '01084762204', 0, '브론즈', 'Y');

INSERT INTO CUSTOMERS_TBL (CT_ID, CT_NAME, CT_BIRTH, CT_REGION, CT_GENDER, CT_C_NUM, CT_POINT, CT_GRADE, CT_SHOW)
VALUES('CT001', '김민영', '19900527', 'CMS004', 'M', '01025784952', 0, '브론즈', 'Y');

INSERT INTO CUSTOMERS_TBL (CT_ID, CT_NAME, CT_BIRTH, CT_REGION, CT_GENDER, CT_C_NUM, CT_POINT, CT_GRADE, CT_SHOW)
VALUES('CT001', '이주은', '19970811', 'CMS004', 'F', '01078334587', 0, '브론즈', 'Y');

INSERT INTO CUSTOMERS_TBL (CT_ID, CT_NAME, CT_BIRTH, CT_REGION, CT_GENDER, CT_C_NUM, CT_POINT, CT_GRADE, CT_SHOW)
VALUES('CT001', '민지환', '19960401', 'CMS004', 'M', '01017966985', 0, '브론즈', 'Y');

INSERT INTO CUSTOMERS_TBL (CT_ID, CT_NAME, CT_BIRTH, CT_REGION, CT_GENDER, CT_C_NUM, CT_POINT, CT_GRADE, CT_SHOW)
VALUES('CT001', '여희은', '19931205', 'CMS004', 'F', '01060513687', 0, '브론즈', 'Y');

INSERT INTO CUSTOMERS_TBL (CT_ID, CT_NAME, CT_BIRTH, CT_REGION, CT_GENDER, CT_C_NUM, CT_POINT, CT_GRADE, CT_SHOW)
VALUES('CT001', '류현영', '20000121', 'CMS004', 'F', '01076542291', 0, '브론즈', 'Y');

INSERT INTO CUSTOMERS_TBL (CT_ID, CT_NAME, CT_BIRTH, CT_REGION, CT_GENDER, CT_C_NUM, CT_POINT, CT_GRADE, CT_SHOW)
VALUES('CT001', '김민철', '20030302', 'CMS004', 'M', '01052410309', 0, '브론즈', 'Y');

INSERT INTO CUSTOMERS_TBL (CT_ID, CT_NAME, CT_BIRTH, CT_REGION, CT_GENDER, CT_C_NUM, CT_POINT, CT_GRADE, CT_SHOW)
VALUES('CT001', '전수현', '19990624', 'CMS004', 'M', '01080531698', 0, '브론즈', 'Y');

INSERT INTO CUSTOMERS_TBL (CT_ID, CT_NAME, CT_BIRTH, CT_REGION, CT_GENDER, CT_C_NUM, CT_POINT, CT_GRADE, CT_SHOW)
VALUES('CT001', '윤가혜', '19951006', 'CMS004', 'F', '01042789852', 0, '브론즈', 'Y');

INSERT INTO CUSTOMERS_TBL (CT_ID, CT_NAME, CT_BIRTH, CT_REGION, CT_GENDER, CT_C_NUM, CT_POINT, CT_GRADE, CT_SHOW)
VALUES('CT001', '이현', '20020909', 'CMS004', 'F', '01015947810', 0, '브론즈', 'Y');

CREATE TABLE SALE_APPLYS_TBL
(
    A_ID            CHAR(4)                    PRIMARY KEY      NOT NULL,   -- 신청 ID
    G_ID            CHAR(4)                                     NOT NULL,   -- 예약게임 ID
    CT_ID           CHAR(5)                                     NOT NULL,   -- 고객 ID
    S_DATE          DATE                                        NOT NULL,   -- 신청 날짜
    PY_ID           CHAR(5)                                     NOT NULL,   -- 예약게임의 결제방식 ID
    G_GET_POINT     NUMBER(4,2)  DEFAULT 5                      NOT NULL,   -- 예약게임의 포인트 적립률
    A_PROFIT        NUMBER(7)                                   NOT NULL,   -- 예약게임의 총매출(할인률포함)
    A_USE_POINT     NUMBER(7)    DEFAULT 0                      NULL,       -- 예약게임에 사용한 포인트 
    A_SHOW          CHAR(1)      DEFAULT 'Y'                    NOT NULL    -- 신청테이블의삭제여부
);