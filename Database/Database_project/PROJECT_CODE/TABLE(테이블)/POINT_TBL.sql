CREATE TABLE POINT_TBL
(
   PT_ID        CHAR(5)        PRIMARY KEY,
   S_ID       CHAR(4)       NOT NULL,
   CT_ID        CHAR(5)        NOT NULL,
   PT_SCORE    NUMBER(20)     DEFAULT 0  NOT NULL,
   PT_SAVE_USE VARCHAR2(1)    NOT NULL,
   PT_DATE     DATE           NOT NULL,
   PT_SHOW     VARCHAR2(1)     DEFAULT 'Y' NOT NULL
   
);

INSERT INTO POINT_TBL(PT_ID, S_ID, CT_ID, PT_SCORE, PT_SAVE_USE, PT_DATE, PT_SHOW)
VALUES('PT001', 'S001', 'CT001' , 1019, 'S', '21/05/07', 'Y');
INSERT INTO POINT_TBL(PT_ID, S_ID, CT_ID, PT_SCORE, PT_SAVE_USE, PT_DATE, PT_SHOW)
VALUES('PT002', 'S003', 'CT003' , 1011, 'S', '21/05/07', 'Y');
INSERT INTO POINT_TBL(PT_ID, S_ID, CT_ID, PT_SCORE, PT_SAVE_USE, PT_DATE, PT_SHOW)
VALUES('PT003', 'S003', 'CT003' , 5000, 'U', '21/05/07', 'Y');
INSERT INTO POINT_TBL(PT_ID, S_ID, CT_ID, PT_SCORE, PT_SAVE_USE, PT_DATE, PT_SHOW)
VALUES('PT004', 'S004', 'CT011' , 1520, 'S', '21/05/07', 'Y');
INSERT INTO POINT_TBL(PT_ID, S_ID, CT_ID, PT_SCORE, PT_SAVE_USE, PT_DATE, PT_SHOW)
VALUES('PT005', 'S008', 'CT005' , 2162, 'S', '21/05/07', 'Y');
INSERT INTO POINT_TBL(PT_ID, S_ID, CT_ID, PT_SCORE, PT_SAVE_USE, PT_DATE, PT_SHOW)
VALUES('PT006', 'S009', 'CT002' , 6, 'S', '21/05/07', 'Y');
INSERT INTO POINT_TBL(PT_ID, S_ID, CT_ID, PT_SCORE, PT_SAVE_USE, PT_DATE, PT_SHOW)
VALUES('PT007', 'S009', 'CT002' , 5000, 'U', '21/05/07', 'Y');
INSERT INTO POINT_TBL(PT_ID, S_ID, CT_ID, PT_SCORE, PT_SAVE_USE, PT_DATE, PT_SHOW)
VALUES('PT008', 'S010', 'CT006' , 1019, 'S', '21/05/07', 'Y');
INSERT INTO POINT_TBL(PT_ID, S_ID, CT_ID, PT_SCORE, PT_SAVE_USE, PT_DATE, PT_SHOW)
VALUES('PT009', 'S011', 'CT003' , 1000, 'U', '21/05/07', 'Y');
INSERT INTO POINT_TBL(PT_ID, S_ID, CT_ID, PT_SCORE, PT_SAVE_USE, PT_DATE, PT_SHOW)
VALUES('PT010', 'S011', 'CT003' , 1696, 'S', '21/05/07', 'Y');
INSERT INTO POINT_TBL(PT_ID, S_ID, CT_ID, PT_SCORE, PT_SAVE_USE, PT_DATE, PT_SHOW)
VALUES('PT011', 'S012', 'CT010' , 2134, 'S', '21/05/07', 'Y');
INSERT INTO POINT_TBL(PT_ID, S_ID, CT_ID, PT_SCORE, PT_SAVE_USE, PT_DATE, PT_SHOW)
VALUES('PT012', 'S013', 'CT012' , 2186, 'S', '21/05/07', 'Y');
INSERT INTO POINT_TBL(PT_ID, S_ID, CT_ID, PT_SCORE, PT_SAVE_USE, PT_DATE, PT_SHOW)
VALUES('PT013', 'S014', 'CT002' , 3000, 'U', '21/05/07', 'Y');
INSERT INTO POINT_TBL(PT_ID, S_ID, CT_ID, PT_SCORE, PT_SAVE_USE, PT_DATE, PT_SHOW)
VALUES('PT014', 'S014', 'CT002' , 848, 'S', '21/05/07', 'Y');

SELECT * FROM POINT_TBL;
--COMMIT;