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