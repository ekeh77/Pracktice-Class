CREATE TABLE SALES_TBL
(
        S_ID                               	CHAR(4)	            NOT NULL	            PRIMARY KEY,	
        G_ID	                             CHAR(4)	            NOT NULL,		
        CT_ID	                           CHAR(5)	                NOT NULL	,	
        S_DATE	                        DATE	    	            NOT NULL,
        PY_ID	                               CHAR(5)	            NOT NULL,
        S_GET_POINT             	NUMBER(2)	    	DEFAULT 5	           NOT NULL,
        S_SHOW	                        CHAR(1)                DEFAULT 'Y'	           NOT NULL,
        S_PROFIT	                     NUMBER(7)	        NOT NULL,
        S_USE_POINT	              NUMBER(6)
);

INSERT INTO SALES_TBL VALUES('S001', 'G001', 'CT003', '2021-05-04', 'PY006', 5, 0, 30000, 'Y');
INSERT INTO SALES_TBL VALUES('S002', 'G002', 'CT004', '2021-05-04', 'PY007', 5, 3000, 45000, 'Y');
INSERT INTO SALES_TBL VALUES('S003', 'G001', 'CT001', '2021-05-04', 'PY009', 5, 1500, 35000, 'Y');
INSERT INTO SALES_TBL VALUES('S004', 'G003', 'CT010', '2021-05-04', 'PY006', 5, 500, 13000, 'Y');
INSERT INTO SALES_TBL VALUES('S005', 'G004', 'CT025', '2021-05-04', 'PY008', 5, 0, 15000, 'Y');
INSERT INTO SALES_TBL VALUES('S006', 'G002', 'CT004', '2021-05-04', 'PY007', 5, 1000, 78000, 'Y');
INSERT INTO SALES_TBL VALUES('S007', 'G001', 'CT011', '2021-05-04', 'PY006', 5, 0, 13000, 'Y');
INSERT INTO SALES_TBL VALUES('S008', 'G009', 'CT008', '2021-05-04', 'PY010', 5, 0, 26000, 'Y');
INSERT INTO SALES_TBL VALUES('S009', 'G010', 'CT010', '2021-05-04', 'PY006', 5, 2000, 29000, 'Y');
INSERT INTO SALES_TBL VALUES('S010', 'G004', 'CT002', '2021-05-04', 'PY007', 5, 0, 30000, 'Y');
