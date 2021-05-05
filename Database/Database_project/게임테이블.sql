--------------------------------------------------------
--  파일이 생성됨 - 화요일-5월-04-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table RESERVATION_GAMES_TBL
--------------------------------------------------------

  CREATE TABLE "RESERVATION_GAMES_TBL" 
  (
  "G_ID" CHAR(4), 
  "G_NAME" VARCHAR2(200), 
  "G_MAKER" CHAR(6), 
  "G_GENRE" VARCHAR2(20),
  "G_R_BEGINDATE" DATE, 
  "G_R_RELEASE" DATE, 
  "G_R_DISCOUNT_PER" NUMBER(2,0) DEFAULT 10,
  "G_R_SUPPLY_PRICE" NUMBER(7,0), 
  "G_R_SALES_PRICE" NUMBER(7,0), 
  "G_R_SHOW" CHAR(1) DEFAULT 'Y'
  );

  ALTER TABLE "RESERVATION_GAMES_TBL" MODIFY ("G_MAKER" NOT NULL ENABLE);
  ALTER TABLE "RESERVATION_GAMES_TBL" ADD CONSTRAINT "RESERVATION_TBL_PK" PRIMARY KEY ("G_ID") USING INDEX  ENABLE;
  ALTER TABLE "RESERVATION_GAMES_TBL" MODIFY ("G_R_SHOW" NOT NULL ENABLE);
  ALTER TABLE "RESERVATION_GAMES_TBL" MODIFY ("G_GENRE" NOT NULL ENABLE);
  ALTER TABLE "RESERVATION_GAMES_TBL" MODIFY ("G_R_BEGINDATE" NOT NULL ENABLE);
  ALTER TABLE "RESERVATION_GAMES_TBL" MODIFY ("G_R_RELEASE" NOT NULL ENABLE);
  ALTER TABLE "RESERVATION_GAMES_TBL" MODIFY ("G_R_DISCOUNT_PER" NOT NULL ENABLE);
  ALTER TABLE "RESERVATION_GAMES_TBL" MODIFY ("G_R_SUPPLY_PRICE" NOT NULL ENABLE);
  ALTER TABLE "RESERVATION_GAMES_TBL" MODIFY ("G_R_SALES_PRICE" NOT NULL ENABLE);
  ALTER TABLE "RESERVATION_GAMES_TBL" MODIFY ("G_ID" NOT NULL ENABLE);
  ALTER TABLE "RESERVATION_GAMES_TBL" MODIFY ("G_NAME" NOT NULL ENABLE);
  
  INSERT INTO RESERVATION_GAMES_TBL VALUES ('G001', '마리오카트', 'CMS001', 'CMS101', '2021-03-15', '2021-05-09', 10, 13000, 30000, 'Y');
  INSERT INTO RESERVATION_GAMES_TBL VALUES ('G002', '스타크래프트', 'CMS002', 'CMS102', '2021-01-20', '2021-05-08',10, 8000, 24000, 'Y');
  INSERT INTO RESERVATION_GAMES_TBL VALUES ('G003', 'LEAGUE OF LEGEND', 'CMS103', 'CMS001', '2021-02-03', '2021-05-22', 10, 11000, 32000, 'Y');
  INSERT INTO RESERVATION_GAMES_TBL VALUES ('G004', '스타크래프트2', 'CMS002', 'CMS102', '2021-05-03', '2021-05-11', 10, 16000, 23000, 'Y');
  INSERT INTO RESERVATION_GAMES_TBL VALUES ('G005', '마인크래프트', 'CMS004', 'CMS101', '2021-04-20', '2021-05-09', 10, 17000, 32000, 'Y');
  INSERT INTO RESERVATION_GAMES_TBL VALUES ('G006', '워크래프트', 'CMS002', 'CMS102', '2021-03-11', '2021-05-15', 10, 6700, 12000, 'Y');
  INSERT INTO RESERVATION_GAMES_TBL VALUES ('G007', '포켓몬 온라인', 'CMS005', 'CMS103', '2021-02-22', '2021-05-20', 10, 17000, 35000, 'Y');
  INSERT INTO RESERVATION_GAMES_TBL VALUES ('G008', '하스스톤', 'CMS002', 'CMS104', '2021-03-30', '2021-05-11', 10, 10000, 22000, 'Y');
  INSERT INTO RESERVATION_GAMES_TBL VALUES ('G009', '크레이지 아케이드', 'CMS103', 'CMS001', '2021-04-09', '2021-05-13', 10, 20000, 45000, 'Y');
  INSERT INTO RESERVATION_GAMES_TBL VALUES ('G010', '서든어택', 'CMS007', 'CMS103', '2021-03-15', '2021-05-01', 10, 10000, 15000, 'Y');
  
CREATE TABLE SALES_TBL
  (
          S_ID                                       CHAR(4)                        PRIMARY KEY, 
          G_ID                                       CHAR(4)                        NOT NULL,
          CT_ID                                     CHAR(5)                        NOT NULL,
          S_DATE                                  DATE                              NOT NULL,
          PY_ID                                      CHAR(5)                        NOT NULL,
          S_GET_POINT                       NUMBER(2,0)                 DEFAULT 5               NOT NULL,
          S_USE_POINT                       NUMBER(6,0),
          S_PROFIT                               NUMBER(7,0)                NOT NULL,
          S_SHOW                                CHAR(1)                         DEFAULT 'Y'                NOT NULL
);

Insert into SALES_TBL (S_ID,G_ID,CT_ID,S_DATE,PY_ID,S_GET_POINT,S_USE_POINT,S_PROFIT,S_SHOW) values ('S001','G001','CT003',to_date('21/05/04','RR/MM/DD'),'PY006',5,0,30000,'Y');
Insert into SALES_TBL (S_ID,G_ID,CT_ID,S_DATE,PY_ID,S_GET_POINT,S_USE_POINT,S_PROFIT,S_SHOW) values ('S002','G002','CT004',to_date('21/05/04','RR/MM/DD'),'PY007',5,3000,45000,'Y');
Insert into SALES_TBL (S_ID,G_ID,CT_ID,S_DATE,PY_ID,S_GET_POINT,S_USE_POINT,S_PROFIT,S_SHOW) values ('S003','G001','CT001',to_date('21/05/04','RR/MM/DD'),'PY009',5,1500,35000,'Y');
Insert into SALES_TBL (S_ID,G_ID,CT_ID,S_DATE,PY_ID,S_GET_POINT,S_USE_POINT,S_PROFIT,S_SHOW) values ('S004','G003','CT010',to_date('21/05/04','RR/MM/DD'),'PY006',5,500,13000,'Y');
Insert into SALES_TBL (S_ID,G_ID,CT_ID,S_DATE,PY_ID,S_GET_POINT,S_USE_POINT,S_PROFIT,S_SHOW) values ('S005','G004','CT025',to_date('21/05/04','RR/MM/DD'),'PY008',5,0,15000,'Y');
Insert into SALES_TBL (S_ID,G_ID,CT_ID,S_DATE,PY_ID,S_GET_POINT,S_USE_POINT,S_PROFIT,S_SHOW) values ('S006','G002','CT004',to_date('21/05/04','RR/MM/DD'),'PY007',5,1000,78000,'Y');
Insert into SALES_TBL (S_ID,G_ID,CT_ID,S_DATE,PY_ID,S_GET_POINT,S_USE_POINT,S_PROFIT,S_SHOW) values ('S007','G001','CT011',to_date('21/05/04','RR/MM/DD'),'PY006',5,0,13000,'Y');
Insert into SALES_TBL (S_ID,G_ID,CT_ID,S_DATE,PY_ID,S_GET_POINT,S_USE_POINT,S_PROFIT,S_SHOW) values ('S008','G009','CT008',to_date('21/05/04','RR/MM/DD'),'PY010',5,0,26000,'Y');
Insert into SALES_TBL (S_ID,G_ID,CT_ID,S_DATE,PY_ID,S_GET_POINT,S_USE_POINT,S_PROFIT,S_SHOW) values ('S009','G010','CT010',to_date('21/05/04','RR/MM/DD'),'PY006',5,2000,29000,'Y');
Insert into SALES_TBL (S_ID,G_ID,CT_ID,S_DATE,PY_ID,S_GET_POINT,S_USE_POINT,S_PROFIT,S_SHOW) values ('S010','G004','CT002',to_date('21/05/04','RR/MM/DD'),'PY007',5,0,30000,'Y');



  CREATE TABLE PAYMENT_TBL 
  (
  PY_ID CHAR(5), 
  PY_NAME VARCHAR2(30), 
  GROUP_NUM NUMBER(2,0), 
  PY_LVL NUMBER(2,0),
  PY_SEQ NUMBER(2,0), 
  PY_DC_PER NUMBER(3,0) DEFAULT NULL, 
  PARENT_PY_ID CHAR(5)
  );
  

Insert into PAYMENT_TBL (PY_ID,PY_NAME,GROUP_NUM,PY_LVL,PY_SEQ,PY_DC_PER,PARENT_PY_ID) values ('PY001','지불방식',1,1,1,0,null);
Insert into PAYMENT_TBL (PY_ID,PY_NAME,GROUP_NUM,PY_LVL,PY_SEQ,PY_DC_PER,PARENT_PY_ID) values ('PY002','카드',2,2,1,0,'PY001');
Insert into PAYMENT_TBL (PY_ID,PY_NAME,GROUP_NUM,PY_LVL,PY_SEQ,PY_DC_PER,PARENT_PY_ID) values ('PY003','현금',3,2,1,5,'PY001');
Insert into PAYMENT_TBL (PY_ID,PY_NAME,GROUP_NUM,PY_LVL,PY_SEQ,PY_DC_PER,PARENT_PY_ID) values ('PY004','모바일',4,2,1,0,'PY001');
Insert into PAYMENT_TBL (PY_ID,PY_NAME,GROUP_NUM,PY_LVL,PY_SEQ,PY_DC_PER,PARENT_PY_ID) values ('PY006','A카드',2,3,1,3,'PY002');
Insert into PAYMENT_TBL (PY_ID,PY_NAME,GROUP_NUM,PY_LVL,PY_SEQ,PY_DC_PER,PARENT_PY_ID) values ('PY007','B카드',2,3,2,2,'PY002');
Insert into PAYMENT_TBL (PY_ID,PY_NAME,GROUP_NUM,PY_LVL,PY_SEQ,PY_DC_PER,PARENT_PY_ID) values ('PY008','알파모바일',4,3,1,3,'PY004');
Insert into PAYMENT_TBL (PY_ID,PY_NAME,GROUP_NUM,PY_LVL,PY_SEQ,PY_DC_PER,PARENT_PY_ID) values ('PY009','C카드',2,3,3,6,'PY002');
Insert into PAYMENT_TBL (PY_ID,PY_NAME,GROUP_NUM,PY_LVL,PY_SEQ,PY_DC_PER,PARENT_PY_ID) values ('PY010','베타모바일',4,3,2,5,'PY004');

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
VALUES('CT002', '김민영', '19900527', 'CMS004', 'M', '01025784952', 0, '브론즈', 'Y');

INSERT INTO CUSTOMERS_TBL (CT_ID, CT_NAME, CT_BIRTH, CT_REGION, CT_GENDER, CT_C_NUM, CT_POINT, CT_GRADE, CT_SHOW)
VALUES('CT003', '이주은', '19970811', 'CMS004', 'F', '01078334587', 0, '브론즈', 'Y');

INSERT INTO CUSTOMERS_TBL (CT_ID, CT_NAME, CT_BIRTH, CT_REGION, CT_GENDER, CT_C_NUM, CT_POINT, CT_GRADE, CT_SHOW)
VALUES('CT004', '민지환', '19960401', 'CMS004', 'M', '01017966985', 0, '브론즈', 'Y');

INSERT INTO CUSTOMERS_TBL (CT_ID, CT_NAME, CT_BIRTH, CT_REGION, CT_GENDER, CT_C_NUM, CT_POINT, CT_GRADE, CT_SHOW)
VALUES('CT005', '여희은', '19931205', 'CMS004', 'F', '01060513687', 0, '브론즈', 'Y');

INSERT INTO CUSTOMERS_TBL (CT_ID, CT_NAME, CT_BIRTH, CT_REGION, CT_GENDER, CT_C_NUM, CT_POINT, CT_GRADE, CT_SHOW)
VALUES('CT006', '류현영', '20000121', 'CMS004', 'F', '01076542291', 0, '브론즈', 'Y');

INSERT INTO CUSTOMERS_TBL (CT_ID, CT_NAME, CT_BIRTH, CT_REGION, CT_GENDER, CT_C_NUM, CT_POINT, CT_GRADE, CT_SHOW)
VALUES('CT007', '김민철', '20030302', 'CMS004', 'M', '01052410309', 0, '브론즈', 'Y');

INSERT INTO CUSTOMERS_TBL (CT_ID, CT_NAME, CT_BIRTH, CT_REGION, CT_GENDER, CT_C_NUM, CT_POINT, CT_GRADE, CT_SHOW)
VALUES('CT008', '전수현', '19990624', 'CMS004', 'M', '01080531698', 0, '브론즈', 'Y');

INSERT INTO CUSTOMERS_TBL (CT_ID, CT_NAME, CT_BIRTH, CT_REGION, CT_GENDER, CT_C_NUM, CT_POINT, CT_GRADE, CT_SHOW)
VALUES('CT009', '윤가혜', '19951006', 'CMS004', 'F', '01042789852', 0, '브론즈', 'Y');

INSERT INTO CUSTOMERS_TBL (CT_ID, CT_NAME, CT_BIRTH, CT_REGION, CT_GENDER, CT_C_NUM, CT_POINT, CT_GRADE, CT_SHOW)
VALUES('CT010', '이현', '20020909', 'CMS004', 'F', '01015947810', 0, '브론즈', 'Y');

--COMMIT;

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
    A_SHOW          CHAR(1)      DEFAULT 'Y'                    NOT NULL    -- 신청테이블의삭제여부
);

INSERT INTO SALE_APPLYS_TBL(A_ID, G_ID, CT_ID, S_DATE, PY_ID, G_GET_POINT, A_PROFIT, A_USE_POINT, A_SHOW)
VALUES('A001', 'G001', 'CT001', '2021-05-06', 'PY001', 5, 20000, 0, 'Y');

INSERT INTO SALE_APPLYS_TBL(A_ID, G_ID, CT_ID, S_DATE, PY_ID, G_GET_POINT, A_PROFIT, A_USE_POINT, A_SHOW)
VALUES('A002', 'G001', 'CT002', '2021-05-06', 'PY001', 5, 19500, 500, 'Y');

INSERT INTO SALE_APPLYS_TBL(A_ID, G_ID, CT_ID, S_DATE, PY_ID, G_GET_POINT, A_PROFIT, A_USE_POINT, A_SHOW)
VALUES('A003', 'G001', 'CT003', '2021-05-06', 'PY001', 5, 19000, 1000, 'Y');

INSERT INTO SALE_APPLYS_TBL(A_ID, G_ID, CT_ID, S_DATE, PY_ID, G_GET_POINT, A_PROFIT, A_USE_POINT, A_SHOW)
VALUES('A004', 'G001', 'CT004', '2021-05-06', 'PY001', 5, 0, 20000, 'Y');

INSERT INTO SALE_APPLYS_TBL(A_ID, G_ID, CT_ID, S_DATE, PY_ID, G_GET_POINT, A_PROFIT, A_USE_POINT, A_SHOW)
VALUES('A005', 'G001', 'CT005', '2021-05-06', 'PY001', 5, 16000, 4000, 'Y');

INSERT INTO SALE_APPLYS_TBL(A_ID, G_ID, CT_ID, S_DATE, PY_ID, G_GET_POINT, A_PROFIT, A_USE_POINT, A_SHOW)
VALUES('A006', 'G001', 'CT006', '2021-05-06', 'PY001', 5, 20000, 0, 'Y');

INSERT INTO SALE_APPLYS_TBL(A_ID, G_ID, CT_ID, S_DATE, PY_ID, G_GET_POINT, A_PROFIT, A_USE_POINT, A_SHOW)
VALUES('A007', 'G001', 'CT007', '2021-05-06', 'PY001', 5, 10000, 10000, 'Y');

INSERT INTO SALE_APPLYS_TBL(A_ID, G_ID, CT_ID, S_DATE, PY_ID, G_GET_POINT, A_PROFIT, A_USE_POINT, A_SHOW)
VALUES('A008', 'G001', 'CT008', '2021-05-06', 'PY001', 5, 18750, 1250, 'Y');

INSERT INTO SALE_APPLYS_TBL(A_ID, G_ID, CT_ID, S_DATE, PY_ID, G_GET_POINT, A_PROFIT, A_USE_POINT, A_SHOW)
VALUES('A009', 'G001', 'CT009', '2021-05-06', 'PY001', 5, 20000, 0, 'Y');

INSERT INTO SALE_APPLYS_TBL(A_ID, G_ID, CT_ID, S_DATE, PY_ID, G_GET_POINT, A_PROFIT, A_USE_POINT, A_SHOW)
VALUES('A010', 'G001', 'CT010', '2021-05-06', 'PY001', 5, 20000, 0, 'Y');

CREATE TABLE GAME_TBL
(
	G_ID 				CHAR(4)   		PRIMARY KEY,
	G_NAME   			VARCHAR2(200)  	NOT NULL,
	G_MAKER  			CHAR(6)  		NOT NULL,
	G_RELEASE  			DATE   			NOT NULL,
	G_SALES_PRICE   	NUMBER(7)  		NOT NULL,
	G_SUPPLY_PRICE    	NUMBER(7)  		NOT NULL,
	G_GENRE  			CHAR(6)   		NOT NULL,
	G_SHOW  			VARCHAR2(1)  	DEFAULT 'Y' NOT NULL
	
);

INSERT INTO GAME_TBL VALUES ('G001', 'Dead by Daylight' , 'CMS015' , '20210204' , '21000' , '13000' , 'CMS005', 'Y');
INSERT INTO GAME_TBL VALUES ('G002', 'Green Hell ' , 'CMS014' , '20200622' , '26000', '14000' , 'CMS009', 'Y');
INSERT INTO GAME_TBL VALUES ('G003', '배틀그라운드' , 'CMS010' , '20191114' , '32000' , '20000', 'CMS005','Y');
INSERT INTO GAME_TBL VALUES ('G004', 'EA SPORTS™ FIFA 21' , 'CMS016' , '20191212' , '36000', '66000' , 'CMS012','Y');
INSERT INTO GAME_TBL VALUES ('G005', 'Among Us' , 'CMS018' , '20200501' , '5500' , '3000' , 'CMS017','Y' );

--DROP TABLE GAME_TBL
SELECT * FROM GAME_TBL;
--COMMIT;
CREATE TABLE COMMONS_TBL
(
	CMS_ID 			 CHAR(6)  			PRIMARY KEY,
	CMS_NAME  		 VARCHAR2(120)  	NOT NULL,
	CMS_LVL  		 NUMBER(3)  		NOT NULL,
	CMS_SEQ   	 	 NUMBER(5)  		NOT NULL,
	PARENT_CMS_ID 	 CHAR(6)  			NULL,
	GROUP_NUM 		 NUMBER(3) 			NOT NULL
);

INSERT INTO COMMONS_TBL VALUES('CMS001', '제조사', 1 , 1, NULL, 1);
INSERT INTO COMMONS_TBL VALUES('CMS002', '국가', 1 , 2, NULL, 2);
INSERT INTO COMMONS_TBL VALUES('CMS003', '장르', 1 , 3, NULL, 3);
INSERT INTO COMMONS_TBL VALUES('CMS004', '한국', 2 , 1, 'CMS002', 2);
INSERT INTO COMMONS_TBL VALUES('CMS005', 'Action', 2 , 1, 'CMS003', 3);
INSERT INTO COMMONS_TBL VALUES('CMS006', '미국', 2 , 2, 'CMS002', 2);
INSERT INTO COMMONS_TBL VALUES('CMS007', '프랑스', 2 , 3, 'CMS002', 2);
INSERT INTO COMMONS_TBL VALUES('CMS008', '중국', 2 , 4, 'CMS002', 2);
INSERT INTO COMMONS_TBL VALUES('CMS009', 'Adventure', 2 , 2, 'CMS003', 3);
INSERT INTO COMMONS_TBL VALUES('CMS010', 'KRAFTON', 2 , 1, 'CMS001', 1);
INSERT INTO COMMONS_TBL VALUES('CMS011', 'RPG', 2 , 3, 'CMS003', 3);
INSERT INTO COMMONS_TBL VALUES('CMS012', 'Sports', 2 , 4, 'CMS003', 3);
INSERT INTO COMMONS_TBL VALUES('CMS013', 'Simulation', 2 , 5, 'CMS003', 3);
INSERT INTO COMMONS_TBL VALUES('CMS014', 'Creepy Jar', 2 , 2, 'CMS001', 1);
INSERT INTO COMMONS_TBL VALUES('CMS015', 'Behaviour Interactive Inc', 2 , 3, 'CMS001', 1);
INSERT INTO COMMONS_TBL VALUES('CMS016', 'Electronic Arts', 2 , 4, 'CMS001', 1);
INSERT INTO COMMONS_TBL VALUES('CMS017', 'Casual', 2 , 6, 'CMS003', 3);
INSERT INTO COMMONS_TBL VALUES('CMS018', 'Innersloth', 2 , 5, 'CMS001', 1);
INSERT INTO COMMONS_TBL VALUES('CMS019', 'UK', 2 , 5, 'CMS002', 2);
INSERT INTO COMMONS_TBL VALUES('CMS020', '일본', 2 , 6, 'CMS002', 2);

--INSERT INTO COMMONS_TBL VALUES('CMS021', '실험1', 3 , 1, 'CMS003', 3);
--INSERT INTO COMMONS_TBL VALUES('CMS022', '실험2', 3 , 2, 'CMS003', 3);
--INSERT INTO COMMONS_TBL VALUES('CMS023', '실험3', 2 , 7, 'CMS002', 2);
--INSERT INTO COMMONS_TBL VALUES('CMS024', '실험4', 3 , 3, 'CMS003', 3);

--DROP TABLE COMMONS_TBL 

SELECT * FROM COMMONS_TBL;
--COMMIT;
CREATE TABLE POINT_TBL
(
	PT_ID  		CHAR(5)  		PRIMARY KEY,
	S_ID 		CHAR(4) 		NOT NULL,
	CT_ID  		CHAR(5)  		NOT NULL,
	PT_SCORE 	NUMBER(20)  	DEFAULT 0  NOT NULL,
	PT_SAVE_USE VARCHAR2(1) 	NOT NULL,
	PT_DATE  	DATE  			NOT NULL,
	PT_SHOW  	VARCHAR2(1)  	DEFAULT 'Y' NOT NULL
	
);

INSERT INTO POINT_TBL VALUES( 'PT001', 'S001', 'CT001', 1050, 'S', '20210404', 'Y');
INSERT INTO POINT_TBL VALUES( 'PT002', 'S002', 'CT005', 1300, 'S' , '20210501', 'Y' ); 
INSERT INTO POINT_TBL VALUES( 'PT003', 'S003', 'CT008', 1600, 'S', '20210501', 'Y'); 

SELECT * FROM POINT_TBL;
SELECT * FROM COMMONS_TBL;
SELECT * FROM GAME_TBL;

--COMMIT;

-------------------------------------------------------------------------
-------------------------------------------------------------------------