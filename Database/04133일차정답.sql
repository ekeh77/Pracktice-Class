CREATE TABLE GAMES
(
    GID CHAR(4) NOT NULL PRIMARY KEY,
    GNAME VARCHAR2(120) NOT NULL,
    GEID CHAR(5) NOT NULL,
    GPRICE NUMBER(6) NOT NULL
);

DROP TABLE GAMES;

INSERT INTO GAMES VALUES('G001','오버워치®','GE009',22500);
INSERT INTO GAMES VALUES('G002','오버워치®:레전더리 에디션','GE009',45000);
INSERT INTO GAMES VALUES('G003','스타크래프트®:리마스터','GE007',16500);
INSERT INTO GAMES VALUES('G004','스타크래프트®:리마스터+카툰','GE007',29700);
INSERT INTO GAMES VALUES('G005','스타크래프트®:카툰','GE007',13200);
INSERT INTO GAMES VALUES('G006','스타크래프트Ⅱ®:캠페인 컬렉션','GE007',36000);
INSERT INTO GAMES VALUES('G007','워크래프트Ⅲ®:리포지드','GE007',36000);
INSERT INTO GAMES VALUES('G008','디아블로Ⅱ®:레저렉션','GE003',48000);
INSERT INTO GAMES VALUES('G009','디아블로Ⅲ®:이터널 컬렉션','GE003',45000);
INSERT INTO GAMES VALUES('G010','디아블로Ⅲ®:대악마판','GE003',30000);
INSERT INTO GAMES VALUES('G011','디아블로Ⅲ®','GE003',16000);
INSERT INTO GAMES VALUES('G012','디아블로Ⅲ®:대악마 컬렉션','GE003',72000);
INSERT INTO GAMES VALUES('G013','콜 오브 듀티®:블랙 옵스 콜드 워 - 얼티밋 에디션','GE009',85000);
INSERT INTO GAMES VALUES('G014','콜 오브 듀티®:블랙 옵스 콜드 워','GE009',49000);
INSERT INTO GAMES VALUES('G015','콜 오브 듀티®:모던 워페어','GE009',45000);
INSERT INTO GAMES VALUES('G016','콜 오브 듀티®:블랙 옵스4 - 디지털 디럭스 에디션','GE009',49000);
INSERT INTO GAMES VALUES('G017','콜 오브 듀티®:블랙 옵스4','GE009',45000);
INSERT INTO GAMES VALUES('G018','콜 오브 듀티®:블랙 옵스4 - 배틀 에디션','GE009',30000);
INSERT INTO GAMES VALUES('G019','콜 오브 듀티®:모던워페어2 캠페인 리마스터','GE009',28400);
INSERT INTO GAMES VALUES('G020','The Witcher 3: Wild Hunt','GE003',34800);
INSERT INTO GAMES VALUES('G021','The Witcher 3: Wild Hunt - Game of the Year Edition','GE003',34800);
INSERT INTO GAMES VALUES('G022','배틀그라운드','GE009',32000);
INSERT INTO GAMES VALUES('G023','Fall Guys: Ultimate Knockout','GE002',20500);
INSERT INTO GAMES VALUES('G024','Grand Theft Auto V: Premium Edition','GE001',33000);
INSERT INTO GAMES VALUES('G025','Monster Hunter: World','GE001',34900);
INSERT INTO GAMES VALUES('G026','Monster Hunter World: Iceborne Digital Deluxe','GE001',58100);
INSERT INTO GAMES VALUES('G027','Dead by Daylight','GE001',21000);
INSERT INTO GAMES VALUES('G028','The Sims™ 4','GE002',38500);
INSERT INTO GAMES VALUES('G029','Among Us','GE002',38500);
INSERT INTO GAMES VALUES('G030','DJMAX RESPECT V','GE002',49800);

SELECT * FROM GAMES;

CREATE TABLE G_GENRE
(
    GEID CHAR(5) NOT NULL,
    GENAME VARCHAR2(30) NOT NULL
);

INSERT INTO G_GENRE VALUES('GE001', '액션');
INSERT INTO G_GENRE VALUES('GE002', '캐주얼');
INSERT INTO G_GENRE VALUES('GE003', '롤플레잉');
INSERT INTO G_GENRE VALUES('GE004', '스포츠');
INSERT INTO G_GENRE VALUES('GE005', '퍼즐');
INSERT INTO G_GENRE VALUES('GE006', '어드벤처');
INSERT INTO G_GENRE VALUES('GE007', '시물레이션');
INSERT INTO G_GENRE VALUES('GE008', '아케이드');
INSERT INTO G_GENRE VALUES('GE009', 'FPS');

SELECT * FROM G_GENRE;

CREATE TABLE G_MEMBERS
(
    MID CHAR(4) NOT NULL PRIMARY KEY,
    MNAME VARCHAR2(30) NOT NULL,
    MGENDER VARCHAR2(3) NOT NULL,
    MAGE NUMBER(3) NOT NULL,
    MATEL VARCHAR2(11) NOT NULL,
    MADDR VARCHAR2(30) NOT NULL
);

DROP TABLE G_MEMBERS;

INSERT INTO G_MEMBERS VALUES('M001','홍길동','M','22','01011111111','부산');
INSERT INTO G_MEMBERS VALUES('M002','성춘향','F','19','01111112222','울산');
INSERT INTO G_MEMBERS VALUES('M003','이몽룡','M','20','01611113333','서울');
INSERT INTO G_MEMBERS VALUES('M004','심청','F','17','01711114444','부산');
INSERT INTO G_MEMBERS VALUES('M005','심봉사','M','53','01671115555','창원');
INSERT INTO G_MEMBERS VALUES('M006','콩쥐','F','25','01014116666','김해');
INSERT INTO G_MEMBERS VALUES('M007','팥쥐','F','24','01012117777','창원');
INSERT INTO G_MEMBERS VALUES('M008','흥부','M','36','01018118888','서울');
INSERT INTO G_MEMBERS VALUES('M009','놀부','M','44','01015119999','김해');
INSERT INTO G_MEMBERS VALUES('M010','방자','M','15','01012111564','부산');
INSERT INTO G_MEMBERS VALUES('M011','신데렐라','F','26','01112311564','울산');
INSERT INTO G_MEMBERS VALUES('M012','백설공주','F','23','01712511564','울산');
INSERT INTO G_MEMBERS VALUES('M013','걸리버','M','49','01812111564','부산');
INSERT INTO G_MEMBERS VALUES('M014','시골쥐','M','18','01012611564','부산');
INSERT INTO G_MEMBERS VALUES('M015','서울쥐','F','19','01012811564','서울');

SELECT * FROM G_MEMBERS;

CREATE TABLE G_STORE
(
    GID CHAR(4) NOT NULL,
    MID CHAR(4) NOT NULL,
    BUY_NUM NUMBER(2) NOT NULL,
    BUY_DATE VARCHAR(60) NOT NULL
);

INSERT INTO G_STORE VALUES('G001','M001',1,'2021-04-07');
INSERT INTO G_STORE VALUES('G005','M010',1,'2021-04-07');
INSERT INTO G_STORE VALUES('G007','M005',2,'2021-04-07');
INSERT INTO G_STORE VALUES('G010','M003',1,'2021-04-07');
INSERT INTO G_STORE VALUES('G001','M007',1,'2021-04-07');
INSERT INTO G_STORE VALUES('G012','M008',3,'2021-04-07');
INSERT INTO G_STORE VALUES('G013','M001',1,'2021-04-08');
INSERT INTO G_STORE VALUES('G008','M002',1,'2021-04-08');
INSERT INTO G_STORE VALUES('G004','M003',5,'2021-04-08');
INSERT INTO G_STORE VALUES('G003','M009',1,'2021-04-08');
INSERT INTO G_STORE VALUES('G019','M006',2,'2021-04-08');
INSERT INTO G_STORE VALUES('G018','M007',1,'2021-04-08');
INSERT INTO G_STORE VALUES('G015','M002',2,'2021-04-09');
INSERT INTO G_STORE VALUES('G012','M003',1,'2021-04-09');
INSERT INTO G_STORE VALUES('G011','M001',3,'2021-04-09');
INSERT INTO G_STORE VALUES('G006','M006',1,'2021-04-09');
INSERT INTO G_STORE VALUES('G017','M008',4,'2021-04-09');
INSERT INTO G_STORE VALUES('G002','M009',1,'2021-04-10');
INSERT INTO G_STORE VALUES('G001','M010',2,'2021-04-10');
INSERT INTO G_STORE VALUES('G010','M005',1,'2021-04-10');
INSERT INTO G_STORE VALUES('G014','M004',3,'2021-04-10');
INSERT INTO G_STORE VALUES('G027','M011',1,'2021-04-11');
INSERT INTO G_STORE VALUES('G026','M012',1,'2021-04-11');
INSERT INTO G_STORE VALUES('G021','M013',1,'2021-04-11');
INSERT INTO G_STORE VALUES('G020','M014',1,'2021-04-11');
INSERT INTO G_STORE VALUES('G030','M015',4,'2021-04-11');
INSERT INTO G_STORE VALUES('G023','M006',3,'2021-04-11');
INSERT INTO G_STORE VALUES('G025','M008',1,'2021-04-12');
INSERT INTO G_STORE VALUES('G024','M010',1,'2021-04-12');
INSERT INTO G_STORE VALUES('G027','M012',1,'2021-04-12');
INSERT INTO G_STORE VALUES('G028','M002',2,'2021-04-12');
INSERT INTO G_STORE VALUES('G029','M001',1,'2021-04-12');
INSERT INTO G_STORE VALUES('G026','M014',3,'2021-04-12');
INSERT INTO G_STORE VALUES('G019','M005',1,'2021-04-12');
INSERT INTO G_STORE VALUES('G019','M007',2,'2021-04-12');
INSERT INTO G_STORE VALUES('G020','M009',1,'2021-04-13');
INSERT INTO G_STORE VALUES('G022','M010',1,'2021-04-13');
INSERT INTO G_STORE VALUES('G027','M014',2,'2021-04-13');
INSERT INTO G_STORE VALUES('G023','M013',1,'2021-04-13');
INSERT INTO G_STORE VALUES('G029','M006',2,'2021-04-13');
INSERT INTO G_STORE VALUES('G030','M007',1,'2021-04-14');


SELECT * FROM G_STORE;

--COMMIT;



------------------------------------------------1일차

--1.부산에서 게임을 구매한 사람중 남자의 총 매출

--2.스타크래프트를 구매한 사람을 지역별로 표시하시오 결과 지역 : 몇명

--3.서울에서 구매한 게임의 종류를 표시하시오 결과는 서울 : 게임이름

--4.오버워치의 총 매출을 표시하시오 결과는 오버워치 : 얼마

-------------------------------------------------2일차

--5.FPS를 구매한 남자중 총 가격의 합계
 
--6.롤플레잉을 구매한 사람중 1개를 구매한 사람들을 나열하시오
 
--7.서울에서 구매하지않은 장르는?
  
--8.전화번호 앞자리가 010인사람의 지역별 총 가격과 장르를 표시하시오

-------------------------------------------------3일차

SELECT * FROM GAMES;
SELECT * FROM G_MEMBERS;
SELECT * FROM G_STORE;
SELECT * FROM G_GENRE;

--9.모든 디아블로를 구매한 사람중 가장 구매비용이 높은 사람은?

    SELECT MNAME, PRICE || '원' FROM
    (
        SELECT T2.MNAME, GPRICE * BUY_NUM AS PRICE, RANK() OVER(ORDER BY GPRICE * BUY_NUM DESC) AS RNKNUM
        FROM GAMES T1, G_MEMBERS T2, G_STORE T3
        WHERE T1.GID = T3.GID
        AND T2.MID = T3.MID
        AND GNAME LIKE '디아블로%'
    )
    WHERE RNKNUM = 1
    ;
    
--10.롤플레잉 장르의 총 매출평균보다  총 매출평균이 높은 장르는?

    SELECT GENAME, TRIM(TO_CHAR(AVGPRICE,'999999')) || '원' FROM
    (
    SELECT T3.GENAME, AVG(T1.GPRICE * T2.BUY_NUM) AS AVGPRICE
    FROM GAMES T1, G_STORE T2, G_GENRE T3
    WHERE T1.GID = T2.GID
    AND T1.GEID = T3.GEID
    AND T3.GENAME != '롤플레잉'
    GROUP BY T3.GENAME
    )
    WHERE AVGPRICE > 
    (
    SELECT AVG(T1.GPRICE * T2.BUY_NUM)
    FROM GAMES T1, G_STORE T2, G_GENRE T3
    WHERE T1.GID = T2.GID
    AND T1.GEID = T3.GEID
    AND GENAME = '롤플레잉'
    )
    ;

--11.4월 한달간 몇월 몇일에 게임구매가 이루어졌는지 나타내시오
--예) 4월 1일 0개

    SELECT ADATE, NVL(SUMNUM, 0) || '개'AS NUM
    FROM
    (
        SELECT TO_CHAR(TO_DATE('2021-04-01') + (LEVEL-1),'YYYY-MM-DD') AS ADATE
        FROM DUAL
        CONNECT BY LEVEL <= 30
    ) T1,
    (
        SELECT BUY_DATE,SUM(BUY_NUM) AS SUMNUM
        FROM G_STORE
        GROUP BY BUY_DATE
    ) T2
    WHERE  T1.ADATE = T2.BUY_DATE(+)
    ORDER BY T1.ADATE
    ;
    
--12.4월 8일에 팔린 게임을 남녀 구분해서 몇개 구매되었는지 나타내시오
--예) 남성 0개
--   여성 0개

    SELECT DECODE(T1.MGENDER,'M','남성','F','여성')AS GENDER, COUNT(*)  || '개' AS NUM
    FROM G_MEMBERS T1, G_STORE T2
    WHERE T1.MID = T2.MID
    AND T2.BUY_DATE = '2021-04-08'
    GROUP BY T1.MGENDER
    ;

--13. 4월 8일 부터 14일중 모든 오버워치의 총매출 보다 총매출이 높은 게임중 총 매출이 가장 낮은 게임과 게임이 팔린 날짜를 나타내시오 
--창목전용 문제 파이팅!