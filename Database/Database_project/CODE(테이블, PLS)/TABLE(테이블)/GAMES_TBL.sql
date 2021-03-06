CREATE TABLE GAMES_TBL
(
   G_ID             CHAR(4)         PRIMARY KEY,
   G_NAME            VARCHAR2(200)     NOT NULL,
   G_MAKER           CHAR(6)        NOT NULL,
   G_RELEASE           DATE            NOT NULL,
   G_SALES_PRICE      NUMBER(7)        NOT NULL,
   G_SUPPLY_PRICE       NUMBER(7)        NOT NULL,
   G_GENRE           CHAR(6)         NOT NULL,
   G_SHOW           VARCHAR2(1)     DEFAULT 'Y' NOT NULL
   
);

INSERT INTO GAMES_TBL VALUES ('G001', 'Dead by Daylight' , 'CMS016' , '20210204' , '21000' , '13000' , 'CMS006', 'Y');
INSERT INTO GAMES_TBL VALUES ('G002', 'Green Hell ' , 'CMS015' , '20200622' , '26000', '14000' , 'CMS010', 'Y');
INSERT INTO GAMES_TBL VALUES ('G003', '배틀그라운드' , 'CMS011' , '20191114' , '32000' , '20000', 'CMS006','Y');
INSERT INTO GAMES_TBL VALUES ('G004', 'EA SPORTS™ FIFA 21' , 'CMS017' , '20191212' , '36000', '66000' , 'CMS013','Y');
INSERT INTO GAMES_TBL VALUES ('G005', 'Among Us' , 'CMS019' , '20200501' , '5500' , '3000' , 'CMS018','Y' );
INSERT INTO GAMES_TBL VALUES ('G006', 'DEATH STRANDING' ,'CMS022', '20210104','64800', '32000','CMS010',   'Y');
INSERT INTO GAMES_TBL VALUES ('G007', 'It Takes Two' , 'CMS023',   '20190808',   '44000','25000','CMS010','Y');
INSERT INTO GAMES_TBL VALUES ('G008', 'Stardew Valley' ,   'CMS024',   '20180062',   '16000','9000','CMS012','Y');
INSERT INTO GAMES_TBL VALUES ('G009', 'Monster Hunter World: Iceborne' ,   'CMS025','20201003','46500','21000','CMS006','Y');
INSERT INTO GAMES_TBL VALUES ('G010', 'Danganronpa: Trigger Happy Havoc' ,'CMS026',   '20170923',   '21000','13000','CMS010','Y');

INSERT INTO GAMES_TBL (G_ID, G_NAME, G_MAKER, G_RELEASE, G_SALES_PRICE, G_SUPPLY_PRICE, G_GENRE, G_SHOW) 
VALUES ('G011', 'HUMANKIND', 'CMS011', to_date('08/18/2021', 'MM/DD/RRRR'), 51460, 20000, 'CMS006', 'N');

INSERT INTO GAMES_TBL (G_ID, G_NAME, G_MAKER, G_RELEASE, G_SALES_PRICE, G_SUPPLY_PRICE, G_GENRE, G_SHOW) 
VALUES ('G012', 'BIOHAZARD', 'CMS015', to_date('05/15/2021', 'MM/DD/RRRR'), 89000, 42000, 'CMS006', 'N');

INSERT INTO GAMES_TBL (G_ID, G_NAME, G_MAKER, G_RELEASE, G_SALES_PRICE, G_SUPPLY_PRICE, G_GENRE, G_SHOW) 
VALUES ('G013', 'PARTY ANIMALS', 'CMS016', to_date('07/09/2021', 'MM/DD/RRRR'), 43000, 24000, 'CMS018', 'N');

INSERT INTO GAMES_TBL (G_ID, G_NAME, G_MAKER, G_RELEASE, G_SALES_PRICE, G_SUPPLY_PRICE, G_GENRE, G_SHOW) 
VALUES ('G014', 'BIOMUTANT', 'CMS017', to_date('05/26/2021', 'MM/DD/RRRR'), 64900, 30000, 'CMS006', 'N');

INSERT INTO GAMES_TBL (G_ID, G_NAME, G_MAKER, G_RELEASE, G_SALES_PRICE, G_SUPPLY_PRICE, G_GENRE, G_SHOW) 
VALUES ('G015', 'SUCCUBUS', 'CMS019', to_date('07/21/2021', 'MM/DD/RRRR'), 37000, 19000, 'CMS006', 'N');

INSERT INTO GAMES_TBL (G_ID, G_NAME, G_MAKER, G_RELEASE, G_SALES_PRICE, G_SUPPLY_PRICE, G_GENRE, G_SHOW) 
VALUES ('G016', 'DUNGEONS, DRAGONS, DARK ALLIANC', 'CMS022', to_date('06/23/2021', 'MM/DD/RRRR'), 50400, 23000, 'CMS010', 'N');

INSERT INTO GAMES_TBL (G_ID, G_NAME, G_MAKER, G_RELEASE, G_SALES_PRICE, G_SUPPLY_PRICE, G_GENRE, G_SHOW) 
VALUES ('G017', 'KING''S BOUNTY 2', 'CMS023', to_date('08/24/2021', 'MM/DD/RRRR'), 47800, 22000, 'CMS014', 'N');

INSERT INTO GAMES_TBL (G_ID, G_NAME, G_MAKER, G_RELEASE, G_SALES_PRICE, G_SUPPLY_PRICE, G_GENRE, G_SHOW) 
VALUES ('G018', 'SIEGE SURVIVAL: GLORIA VICTIS', 'CMS024', to_date('05/18/2021', 'MM/DD/RRRR'), 42500, 27000, 'CMS010', 'N');

INSERT INTO GAMES_TBL (G_ID, G_NAME, G_MAKER, G_RELEASE, G_SALES_PRICE, G_SUPPLY_PRICE, G_GENRE, G_SHOW) 
VALUES ('G019', 'JUST DIE ALREADY', 'CMS025', to_date('05/26/2021', 'MM/DD/RRRR'), 15500, 6700, 'CMS012', 'N');

INSERT INTO GAMES_TBL (G_ID, G_NAME, G_MAKER, G_RELEASE, G_SALES_PRICE, G_SUPPLY_PRICE, G_GENRE, G_SHOW) 
VALUES ('G020', 'F1® 2021', 'CMS026', to_date('07/17/2021', 'MM/DD/RRRR'), 66000, 32000, 'CMS013', 'N');

SELECT * FROM GAMES_TBL;
--COMMIT;