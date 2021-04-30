CREATE TABLE G_GAMES
(
    GID CHAR(4) NOT NULL PRIMARY KEY,
    GNAME VARCHAR2(120) NOT NULL,
    GEID CHAR(5) NOT NULL,
    GPRICE NUMBER(6) NOT NULL
);

INSERT INTO G_GAMES VALUES('G001','오버워치®','GE009',22500);
INSERT INTO G_GAMES VALUES('G002','오버워치®:레전더리 에디션','GE009',45000);
INSERT INTO G_GAMES VALUES('G003','스타크래프트®:리마스터','GE007',16500);
INSERT INTO G_GAMES VALUES('G004','스타크래프트®:리마스터+카툰','GE007',29700);
INSERT INTO G_GAMES VALUES('G005','스타크래프트®:카툰','GE007',13200);
INSERT INTO G_GAMES VALUES('G006','스타크래프트Ⅱ®:캠페인 컬렉션','GE007',36000);
INSERT INTO G_GAMES VALUES('G007','워크래프트Ⅲ®:리포지드','GE007',36000);
INSERT INTO G_GAMES VALUES('G008','디아블로Ⅱ®:레저렉션','GE003',48000);
INSERT INTO G_GAMES VALUES('G009','디아블로Ⅲ®:이터널 컬렉션','GE003',45000);
INSERT INTO G_GAMES VALUES('G010','디아블로Ⅲ®:대악마판','GE003',30000);
INSERT INTO G_GAMES VALUES('G011','디아블로Ⅲ®','GE003',16000);
INSERT INTO G_GAMES VALUES('G012','디아블로Ⅲ®:대악마 컬렉션','GE003',72000);
INSERT INTO G_GAMES VALUES('G013','콜 오브 듀티®:블랙 옵스 콜드 워 - 얼티밋 에디션','GE009',85000);
INSERT INTO G_GAMES VALUES('G014','콜 오브 듀티®:블랙 옵스 콜드 워','GE009',49000);
INSERT INTO G_GAMES VALUES('G015','콜 오브 듀티®:모던 워페어','GE009',45000);
INSERT INTO G_GAMES VALUES('G016','콜 오브 듀티®:블랙 옵스4 - 디지털 디럭스 에디션','GE009',49000);
INSERT INTO G_GAMES VALUES('G017','콜 오브 듀티®:블랙 옵스4','GE009',45000);
INSERT INTO G_GAMES VALUES('G018','콜 오브 듀티®:블랙 옵스4 - 배틀 에디션','GE009',30000);
INSERT INTO G_GAMES VALUES('G019','콜 오브 듀티®:모던워페어2 캠페인 리마스터','GE009',28400);
INSERT INTO G_GAMES VALUES('G020','The Witcher 3: Wild Hunt','GE003',34800);
INSERT INTO G_GAMES VALUES('G021','The Witcher 3: Wild Hunt - Game of the Year Edition','GE003',34800);
INSERT INTO G_GAMES VALUES('G022','배틀그라운드','GE009',32000);
INSERT INTO G_GAMES VALUES('G023','Fall Guys: Ultimate Knockout','GE002',20500);
INSERT INTO G_GAMES VALUES('G024','Grand Theft Auto V: Premium Edition','GE001',33000);
INSERT INTO G_GAMES VALUES('G025','Monster Hunter: World','GE001',34900);
INSERT INTO G_GAMES VALUES('G026','Monster Hunter World: Iceborne Digital Deluxe','GE001',58100);
INSERT INTO G_GAMES VALUES('G027','Dead by Daylight','GE001',21000);
INSERT INTO G_GAMES VALUES('G028','The Sims™ 4','GE002',38500);
INSERT INTO G_GAMES VALUES('G029','Among Us','GE002',38500);
INSERT INTO G_GAMES VALUES('G030','DJMAX RESPECT V','GE002',49800);
INSERT INTO G_GAMES VALUES('G031','RESIDENT EVIL 2 / BIOHAZARD RE:2 Standard Edition','GE010',45600);
INSERT INTO G_GAMES VALUES('G032','RESIDENT EVIL 2 / BIOHAZARD RE:2 Deluxe Edition','GE010',56700);
INSERT INTO G_GAMES VALUES('G033','RESIDENT EVIL 3','GE010',68400);
INSERT INTO G_GAMES VALUES('G034','Football Manager 2021','GE004',54000);
INSERT INTO G_GAMES VALUES('G035','A Dance of Fire and Ice','GE008',6500);
INSERT INTO G_GAMES VALUES('G036','Rhythm Doctor','GE008',16500);
INSERT INTO G_GAMES VALUES('G037','SUPERHOT','GE001',27000);
INSERT INTO G_GAMES VALUES('G038','Half-Life: Alyx','GE009',61000);
INSERT INTO G_GAMES VALUES('G039','THE BINDING OF ISAAC: REBIRTH COMPLETE BUNDLE','GE008',53000);
INSERT INTO G_GAMES VALUES('G040','It Takes Two','GE005',44000);
INSERT INTO G_GAMES VALUES('G041','Ghostrunner','GE001',35000);
INSERT INTO G_GAMES VALUES('G042','OUTRIDERS','GE006',70920);
INSERT INTO G_GAMES VALUES('G043','NieR Replicant™ ver.1.22474487139...','GE006',35000);
INSERT INTO G_GAMES VALUES('G044','Devil May Cry 5','GE001',27000);
INSERT INTO G_GAMES VALUES('G045','Red Dead Redemption 2','GE006',66000);
INSERT INTO G_GAMES VALUES('G046','Red Dead Redemption 2: Ultimate Edition','GE006',110000);

SELECT * FROM G_GAMES;

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
INSERT INTO G_GENRE VALUES('GE010', '호러');

SELECT * FROM G_GENRE;

CREATE TABLE G_MEMBERS
(
    MID CHAR(4) NOT NULL PRIMARY KEY,
    MNAME VARCHAR2(30) NOT NULL,
    MGENDER VARCHAR2(3) NOT NULL,
    MAGE NUMBER(4) NOT NULL,
    MATEL VARCHAR2(11) NOT NULL,
    MADDR VARCHAR2(30) NOT NULL
);

INSERT INTO G_MEMBERS VALUES('M001','홍길동','M','1999','01011111111','RG002');
INSERT INTO G_MEMBERS VALUES('M002','성춘향','F','2002','01111112222','RG004');
INSERT INTO G_MEMBERS VALUES('M003','이몽룡','M','2001','01611113333','RG001');
INSERT INTO G_MEMBERS VALUES('M004','심청','F','2004','01711114444','RG002');
INSERT INTO G_MEMBERS VALUES('M005','심봉사','M','1968','01671115555','RG003');
INSERT INTO G_MEMBERS VALUES('M006','콩쥐','F','1996','01014116666','RG005');
INSERT INTO G_MEMBERS VALUES('M007','팥쥐','F','1997','01012117777','RG003');
INSERT INTO G_MEMBERS VALUES('M008','흥부','M','1985','01018118888','RG001');
INSERT INTO G_MEMBERS VALUES('M009','놀부','M','1977','01015119999','RG005');
INSERT INTO G_MEMBERS VALUES('M010','방자','M','2006','01012111564','RG002');
INSERT INTO G_MEMBERS VALUES('M011','신데렐라','F','1995','01112311564','RG004');
INSERT INTO G_MEMBERS VALUES('M012','백설공주','F','1985','01712511564','RG004');
INSERT INTO G_MEMBERS VALUES('M013','걸리버','M','1977','01812111564','RG002');
INSERT INTO G_MEMBERS VALUES('M014','시골쥐','M','2003','01012611564','RG002');
INSERT INTO G_MEMBERS VALUES('M015','서울쥐','F','2002','01012811564','RG001');
INSERT INTO G_MEMBERS VALUES('M016','개미','M','1993','01056872154','RG002');
INSERT INTO G_MEMBERS VALUES('M017','베짱이','F','2001','01198516472','RG003');
INSERT INTO G_MEMBERS VALUES('M018','톰소여','M','2005','01032578951','RG001');
INSERT INTO G_MEMBERS VALUES('M019','변사또','M','1974','01923548795','RG001');
INSERT INTO G_MEMBERS VALUES('M020','앨리스','F','2004','01732157892','RG001');

SELECT * FROM G_MEMBERS;

CREATE TABLE G_MEMBERS_POINT
(
    MID CHAR(4)         NOT NULL    PRIMARY KEY,
    G_POINT NUMBER(10)  NOT NULL    
);

CREATE TABLE G_REGION
(
    RGID CHAR(5) NOT NULL,
    RGNAME VARCHAR(30) NOT NULL
);

INSERT INTO G_REGION VALUES('RG001','서울');
INSERT INTO G_REGION VALUES('RG002','부산');
INSERT INTO G_REGION VALUES('RG003','창원');
INSERT INTO G_REGION VALUES('RG004','울산');
INSERT INTO G_REGION VALUES('RG005','김해');

SELECT * FROM G_REGION;

CREATE TABLE G_STORE
(
    GID CHAR(4) NOT NULL,
    MID CHAR(4) NOT NULL,
    BUY_NUM NUMBER(2) NOT NULL,
    BUY_DATE DATE NOT NULL
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
INSERT INTO G_STORE VALUES('G040','M020',2,'2021-10-23');
INSERT INTO G_STORE VALUES('G029','M014',1,'2021-12-12');
INSERT INTO G_STORE VALUES('G027','M013',3,'2021-09-22');
INSERT INTO G_STORE VALUES('G029','M015',4,'2021-10-27');
INSERT INTO G_STORE VALUES('G043','M006',1,'2021-01-08');
INSERT INTO G_STORE VALUES('G005','M006',5,'2021-12-19');
INSERT INTO G_STORE VALUES('G006','M008',2,'2021-01-17');
INSERT INTO G_STORE VALUES('G030','M017',1,'2021-07-18');
INSERT INTO G_STORE VALUES('G009','M011',4,'2021-05-29');
INSERT INTO G_STORE VALUES('G001','M010',1,'2021-03-28');
INSERT INTO G_STORE VALUES('G034','M005',2,'2021-02-14');
INSERT INTO G_STORE VALUES('G017','M020',1,'2021-10-08');
INSERT INTO G_STORE VALUES('G014','M017',3,'2021-10-20');
INSERT INTO G_STORE VALUES('G007','M019',3,'2021-02-16');
INSERT INTO G_STORE VALUES('G016','M011',4,'2021-11-20');
INSERT INTO G_STORE VALUES('G038','M006',2,'2021-07-21');
INSERT INTO G_STORE VALUES('G008','M009',3,'2021-05-18');
INSERT INTO G_STORE VALUES('G020','M019',4,'2021-06-18');
INSERT INTO G_STORE VALUES('G043','M016',4,'2021-07-03');
INSERT INTO G_STORE VALUES('G043','M005',2,'2021-04-16');
INSERT INTO G_STORE VALUES('G044','M007',1,'2021-09-27');
INSERT INTO G_STORE VALUES('G035','M012',1,'2021-05-23');
INSERT INTO G_STORE VALUES('G013','M006',2,'2021-11-02');
INSERT INTO G_STORE VALUES('G003','M011',4,'2021-01-16');
INSERT INTO G_STORE VALUES('G024','M014',3,'2021-09-22');
INSERT INTO G_STORE VALUES('G019','M007',5,'2021-05-20');
INSERT INTO G_STORE VALUES('G010','M005',3,'2021-07-09');
INSERT INTO G_STORE VALUES('G014','M020',3,'2021-03-26');
INSERT INTO G_STORE VALUES('G003','M013',2,'2021-12-03');
INSERT INTO G_STORE VALUES('G011','M003',3,'2021-07-23');
INSERT INTO G_STORE VALUES('G017','M014',2,'2021-06-26');
INSERT INTO G_STORE VALUES('G031','M015',4,'2021-05-05');
INSERT INTO G_STORE VALUES('G027','M015',2,'2021-01-28');
INSERT INTO G_STORE VALUES('G044','M015',1,'2021-08-09');
INSERT INTO G_STORE VALUES('G007','M010',2,'2021-10-09');
INSERT INTO G_STORE VALUES('G020','M003',2,'2021-11-06');
INSERT INTO G_STORE VALUES('G040','M019',3,'2021-06-17');
INSERT INTO G_STORE VALUES('G034','M018',3,'2021-11-11');
INSERT INTO G_STORE VALUES('G032','M003',1,'2021-11-05');
INSERT INTO G_STORE VALUES('G031','M008',2,'2021-05-21');
INSERT INTO G_STORE VALUES('G033','M010',5,'2021-02-09');
INSERT INTO G_STORE VALUES('G006','M017',3,'2021-05-01');
INSERT INTO G_STORE VALUES('G004','M001',3,'2021-02-10');
INSERT INTO G_STORE VALUES('G004','M012',4,'2021-11-08');
INSERT INTO G_STORE VALUES('G017','M004',1,'2021-09-29');
INSERT INTO G_STORE VALUES('G044','M013',5,'2021-04-23');
INSERT INTO G_STORE VALUES('G045','M005',4,'2021-10-18');
INSERT INTO G_STORE VALUES('G031','M004',2,'2021-12-02');
INSERT INTO G_STORE VALUES('G024','M012',1,'2021-01-24');
INSERT INTO G_STORE VALUES('G005','M017',2,'2021-10-18');
INSERT INTO G_STORE VALUES('G001','M001',4,'2021-05-02');
INSERT INTO G_STORE VALUES('G006','M011',3,'2021-07-02');
INSERT INTO G_STORE VALUES('G025','M006',5,'2021-03-02');
INSERT INTO G_STORE VALUES('G041','M001',5,'2021-04-29');
INSERT INTO G_STORE VALUES('G014','M008',1,'2021-01-08');
INSERT INTO G_STORE VALUES('G035','M012',1,'2021-03-27');
INSERT INTO G_STORE VALUES('G034','M004',2,'2021-04-19');
INSERT INTO G_STORE VALUES('G003','M003',1,'2021-02-15');
INSERT INTO G_STORE VALUES('G037','M020',1,'2021-07-28');
INSERT INTO G_STORE VALUES('G025','M016',1,'2021-02-04');
INSERT INTO G_STORE VALUES('G034','M018',3,'2021-04-04');
INSERT INTO G_STORE VALUES('G006','M012',3,'2021-04-01');
INSERT INTO G_STORE VALUES('G040','M012',2,'2021-08-19');
INSERT INTO G_STORE VALUES('G019','M016',4,'2021-08-24');
INSERT INTO G_STORE VALUES('G035','M006',5,'2021-03-19');
INSERT INTO G_STORE VALUES('G013','M002',2,'2021-01-24');
INSERT INTO G_STORE VALUES('G030','M008',4,'2021-01-13');
INSERT INTO G_STORE VALUES('G012','M009',5,'2021-12-20');
INSERT INTO G_STORE VALUES('G009','M004',2,'2021-02-14');
INSERT INTO G_STORE VALUES('G003','M014',3,'2021-12-28');
INSERT INTO G_STORE VALUES('G015','M018',2,'2021-08-10');
INSERT INTO G_STORE VALUES('G006','M019',5,'2021-09-11');
INSERT INTO G_STORE VALUES('G007','M001',3,'2021-10-09');
INSERT INTO G_STORE VALUES('G014','M004',5,'2021-11-10');
INSERT INTO G_STORE VALUES('G016','M016',4,'2021-09-28');
INSERT INTO G_STORE VALUES('G039','M012',4,'2021-06-29');
INSERT INTO G_STORE VALUES('G012','M007',1,'2021-09-03');
INSERT INTO G_STORE VALUES('G014','M009',1,'2021-12-10');
INSERT INTO G_STORE VALUES('G021','M005',5,'2021-07-28');
INSERT INTO G_STORE VALUES('G002','M002',5,'2021-08-06');
INSERT INTO G_STORE VALUES('G024','M016',2,'2021-09-26');
INSERT INTO G_STORE VALUES('G029','M005',4,'2021-05-22');
INSERT INTO G_STORE VALUES('G023','M002',4,'2021-11-27');
INSERT INTO G_STORE VALUES('G008','M013',4,'2021-06-02');
INSERT INTO G_STORE VALUES('G012','M013',3,'2021-06-03');
INSERT INTO G_STORE VALUES('G018','M006',5,'2021-02-21');
INSERT INTO G_STORE VALUES('G045','M011',3,'2021-10-28');
INSERT INTO G_STORE VALUES('G031','M009',4,'2021-04-23');
INSERT INTO G_STORE VALUES('G010','M019',4,'2021-03-09');
INSERT INTO G_STORE VALUES('G021','M003',1,'2021-06-01');
INSERT INTO G_STORE VALUES('G015','M018',5,'2021-09-05');
INSERT INTO G_STORE VALUES('G037','M006',4,'2021-04-02');
INSERT INTO G_STORE VALUES('G036','M014',5,'2021-01-18');
INSERT INTO G_STORE VALUES('G029','M003',5,'2021-12-02');
INSERT INTO G_STORE VALUES('G005','M010',2,'2021-01-03');
INSERT INTO G_STORE VALUES('G032','M013',1,'2021-06-17');
INSERT INTO G_STORE VALUES('G035','M005',5,'2021-03-04');
INSERT INTO G_STORE VALUES('G008','M009',4,'2021-11-17');
INSERT INTO G_STORE VALUES('G022','M013',3,'2021-11-06');
INSERT INTO G_STORE VALUES('G030','M011',3,'2021-01-18');

SELECT * FROM G_STORE ;
--ROLLBACK;
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

--9.모든 디아블로를 구매한 사람중 가장 구매비용이 높은 사람은?
    
--10.롤플레잉 장르의 총 매출평균보다  총 매출평균이 높은 장르는?

--11.4월 한달간 몇월 몇일에 게임구매가 이루어졌는지 나타내시오
--예) 4월 1일 0개
    
--12.4월 8일에 팔린 게임을 남녀 구분해서 몇개 구매되었는지 나타내시오
--예) 남성 0개
--   여성 0개

--13. 4월 8일 부터 14일중 모든 오버워치의 총매출 보다 총매출이 높은 게임중 총 매출이 가장 낮은 게임과 게임이 팔린 날짜를 나타내시오 
--창목전용 문제 파이팅!

----------------------------------------------------4일차

SELECT * FROM G_GAMES;
SELECT * FROM G_MEMBERS;
SELECT * FROM G_MEMBERS_POINT;
SELECT * FROM G_STORE;
SELECT * FROM G_GENRE;


--14.2021년 4월 11일에 구매된 게임이름과 금액을 구하고 표시하시오 
--표시예) 게임이름 | 금액(금액 세번째 자리마다 , 가 붙도록) | 구매일자(2021년 4월 11일)<-이렇게


--15.2021년중 수요일에 구매된 게임이름과 금액을 표시하시오


--16.달을 기준으로 판매된 게임의 개수를 구하고 그 게임의 이름을 표시하시오
--표시예) 2021-01 | 게임명: 게임이름  | 게임개수(게임명의 판매된횟수(ROW)를 이야기하고있습니다)개 


--17.판매된 게임의 시리즈중 2탄인 게임을(Ⅱ제외) 구매한 사람과 금액을 표시하시오
--SUBSTR 사용금지
--LIKE 금지
--구할 수 있음


--18.이 게임가게의 포인트제도는 2021년 6월부터 시작했는데 6월이후 게임을 구매한 사람들의 포인트를 G_MEMBERS_POINT에 INSERT하는 프로시저를 만들어보자
--포인트는 게임구매가격의 5%로 통일한다


--19. 고객 M009는 포인트로만 G037과 G035를 한개씩 구매하려 한다(첫번째는 G037 두번째는 G035)
-- 포인트를 업데이트하고 구매를 인설트하는 프로시저를 만들어보자(18번을 풀지않았다면 먼저 풀자)
-- 포인트가 부족하면 '포인트가 부족하여 구매할 수 없습니다'라는 문구를 띄워보자

---------------------------------------------5일차

CREATE TABLE G_CLASS
(
    CLASS_ID        CHAR(5)         NOT NULL,
    CLASS_NAME      VARCHAR(30)     NOT NULL,
    YEAR_PRICE      NUMBER(10)      NOT NULL
);

INSERT INTO G_CLASS (CLASS_ID, CLASS_NAME, YEAR_PRICE) VALUES ('CL001','사장',10000000);
INSERT INTO G_CLASS (CLASS_ID, CLASS_NAME, YEAR_PRICE) VALUES ('CL002','부장',7000000);
INSERT INTO G_CLASS (CLASS_ID, CLASS_NAME, YEAR_PRICE) VALUES ('CL003','차장',6000000);
INSERT INTO G_CLASS (CLASS_ID, CLASS_NAME, YEAR_PRICE) VALUES ('CL004','과장',5000000);
INSERT INTO G_CLASS (CLASS_ID, CLASS_NAME, YEAR_PRICE) VALUES ('CL005','대리',4000000);
INSERT INTO G_CLASS (CLASS_ID, CLASS_NAME, YEAR_PRICE) VALUES ('CL006','사원',3000000);
INSERT INTO G_CLASS (CLASS_ID, CLASS_NAME, YEAR_PRICE) VALUES ('CL007','인턴',2000000);

CREATE TABLE G_PART
(
    PART_ID         CHAR(5)         NOT NULL,
    PART_NAME       VARCHAR(30)     NOT NULL,
    PART_LVE        NUMBER(3)       NOT NULL,
    PART_SEQ        NUMBER(3)       NOT NULL,
    PARENT_PART_ID  CHAR(5)         NULL
);

INSERT INTO G_PART (PART_ID, PART_NAME, PART_LVE, PART_SEQ, PARENT_PART_ID) VALUES('PT001','ROOT', 0, 1, NULL);
INSERT INTO G_PART (PART_ID, PART_NAME, PART_LVE, PART_SEQ, PARENT_PART_ID) VALUES('PT002','전체인사부', 1, 2, 'PT001');
INSERT INTO G_PART (PART_ID, PART_NAME, PART_LVE, PART_SEQ, PARENT_PART_ID) VALUES('PT003','전체기획부', 1, 1, 'PT001');
INSERT INTO G_PART (PART_ID, PART_NAME, PART_LVE, PART_SEQ, PARENT_PART_ID) VALUES('PT004','전체판매부', 1, 3, 'PT001');
INSERT INTO G_PART (PART_ID, PART_NAME, PART_LVE, PART_SEQ, PARENT_PART_ID) VALUES('PT005','액션판매부', 2, 6, 'PT004');
INSERT INTO G_PART (PART_ID, PART_NAME, PART_LVE, PART_SEQ, PARENT_PART_ID) VALUES('PT006','캐주얼판매부', 2, 7, 'PT004');
INSERT INTO G_PART (PART_ID, PART_NAME, PART_LVE, PART_SEQ, PARENT_PART_ID) VALUES('PT007','롤플레잉판매부', 2, 1, 'PT004');
INSERT INTO G_PART (PART_ID, PART_NAME, PART_LVE, PART_SEQ, PARENT_PART_ID) VALUES('PT008','스포츠판매부', 2, 2, 'PT004');
INSERT INTO G_PART (PART_ID, PART_NAME, PART_LVE, PART_SEQ, PARENT_PART_ID) VALUES('PT009','퍼즐판매부', 2, 8, 'PT004');
INSERT INTO G_PART (PART_ID, PART_NAME, PART_LVE, PART_SEQ, PARENT_PART_ID) VALUES('PT010','어드벤처판매부', 2, 5, 'PT004');
INSERT INTO G_PART (PART_ID, PART_NAME, PART_LVE, PART_SEQ, PARENT_PART_ID) VALUES('PT011','시물레이션판매부', 2, 3, 'PT004');
INSERT INTO G_PART (PART_ID, PART_NAME, PART_LVE, PART_SEQ, PARENT_PART_ID) VALUES('PT012','아케이드판매부', 2, 4, 'PT004');
INSERT INTO G_PART (PART_ID, PART_NAME, PART_LVE, PART_SEQ, PARENT_PART_ID) VALUES('PT013','FPS판매부', 2, 10, 'PT004');
INSERT INTO G_PART (PART_ID, PART_NAME, PART_LVE, PART_SEQ, PARENT_PART_ID) VALUES('PT014','호러판매부', 2, 9, 'PT004');
INSERT INTO G_PART (PART_ID, PART_NAME, PART_LVE, PART_SEQ, PARENT_PART_ID) VALUES('PT015','액션판매광고팀', 3, 1, 'PT005');
INSERT INTO G_PART (PART_ID, PART_NAME, PART_LVE, PART_SEQ, PARENT_PART_ID) VALUES('PT016','액션배송팀', 3, 2, 'PT005');
INSERT INTO G_PART (PART_ID, PART_NAME, PART_LVE, PART_SEQ, PARENT_PART_ID) VALUES('PT017','액션재고관리팀', 3, 3, 'PT005');
INSERT INTO G_PART (PART_ID, PART_NAME, PART_LVE, PART_SEQ, PARENT_PART_ID) VALUES('PT018','액션재고구매팀', 3, 4, 'PT005');
INSERT INTO G_PART (PART_ID, PART_NAME, PART_LVE, PART_SEQ, PARENT_PART_ID) VALUES('PT019','FPS판매광고팀', 3, 1, 'PT013');
INSERT INTO G_PART (PART_ID, PART_NAME, PART_LVE, PART_SEQ, PARENT_PART_ID) VALUES('PT020','FPS배송팀', 3, 2, 'PT013');
INSERT INTO G_PART (PART_ID, PART_NAME, PART_LVE, PART_SEQ, PARENT_PART_ID) VALUES('PT021','FPS재고관리팀', 3, 3, 'PT013');
INSERT INTO G_PART (PART_ID, PART_NAME, PART_LVE, PART_SEQ, PARENT_PART_ID) VALUES('PT022','액션재고구매팀-1', 4, 1, 'PT018');
INSERT INTO G_PART (PART_ID, PART_NAME, PART_LVE, PART_SEQ, PARENT_PART_ID) VALUES('PT023','액션재고구매팀-2', 4, 2, 'PT018');

CREATE TABLE G_EMPLOYEE
(
    E_ID        CHAR(5)     NOT NULL,
    E_NAME      VARCHAR(30) NOT NULL,
    CLASS_ID    CHAR(5)     NOT NULL,
    PART_ID     CHAR(5)     NOT NULL
);

INSERT INTO G_EMPLOYEE (E_ID, E_NAME, CLASS_ID, PART_ID) VALUES('E0001','스타사장','CL001', 'PT001');
INSERT INTO G_EMPLOYEE (E_ID, E_NAME, CLASS_ID, PART_ID) VALUES('E0002','커맨드센터','CL002', 'PT002');
INSERT INTO G_EMPLOYEE (E_ID, E_NAME, CLASS_ID, PART_ID) VALUES('E0003','넥서스','CL002', 'PT003');
INSERT INTO G_EMPLOYEE (E_ID, E_NAME, CLASS_ID, PART_ID) VALUES('E0004','해처리','CL002', 'PT004');
INSERT INTO G_EMPLOYEE (E_ID, E_NAME, CLASS_ID, PART_ID) VALUES('E0005','드론','CL003', 'PT005');
INSERT INTO G_EMPLOYEE (E_ID, E_NAME, CLASS_ID, PART_ID) VALUES('E0006','저글링','CL003', 'PT006');
INSERT INTO G_EMPLOYEE (E_ID, E_NAME, CLASS_ID, PART_ID) VALUES('E0007','히드라','CL003', 'PT007');
INSERT INTO G_EMPLOYEE (E_ID, E_NAME, CLASS_ID, PART_ID) VALUES('E0008','럴커','CL003', 'PT008');
INSERT INTO G_EMPLOYEE (E_ID, E_NAME, CLASS_ID, PART_ID) VALUES('E0009','라바','CL003', 'PT009');
INSERT INTO G_EMPLOYEE (E_ID, E_NAME, CLASS_ID, PART_ID) VALUES('E0010','뮤탈리스크','CL003', 'PT010');
INSERT INTO G_EMPLOYEE (E_ID, E_NAME, CLASS_ID, PART_ID) VALUES('E0011','디바우러','CL004', 'PT011');
INSERT INTO G_EMPLOYEE (E_ID, E_NAME, CLASS_ID, PART_ID) VALUES('E0012','가디언','CL004', 'PT012');
INSERT INTO G_EMPLOYEE (E_ID, E_NAME, CLASS_ID, PART_ID) VALUES('E0013','울트라리스크','CL004', 'PT013');
INSERT INTO G_EMPLOYEE (E_ID, E_NAME, CLASS_ID, PART_ID) VALUES('E0014','감염된테란','CL004', 'PT014');
INSERT INTO G_EMPLOYEE (E_ID, E_NAME, CLASS_ID, PART_ID) VALUES('E0015','성큰','CL004', 'PT015');
INSERT INTO G_EMPLOYEE (E_ID, E_NAME, CLASS_ID, PART_ID) VALUES('E0016','스포닝풀','CL004', 'PT016');
INSERT INTO G_EMPLOYEE (E_ID, E_NAME, CLASS_ID, PART_ID) VALUES('E0017','뮤탈둥지','CL005', 'PT017');
INSERT INTO G_EMPLOYEE (E_ID, E_NAME, CLASS_ID, PART_ID) VALUES('E0018','퀸','CL005', 'PT018');
INSERT INTO G_EMPLOYEE (E_ID, E_NAME, CLASS_ID, PART_ID) VALUES('E0019','레어','CL005', 'PT019');
INSERT INTO G_EMPLOYEE (E_ID, E_NAME, CLASS_ID, PART_ID) VALUES('E0020','하이브','CL005', 'PT020');
INSERT INTO G_EMPLOYEE (E_ID, E_NAME, CLASS_ID, PART_ID) VALUES('E0021','캐리건','CL005', 'PT021');
INSERT INTO G_EMPLOYEE (E_ID, E_NAME, CLASS_ID, PART_ID) VALUES('E0022','질럿','CL005', 'PT022');
INSERT INTO G_EMPLOYEE (E_ID, E_NAME, CLASS_ID, PART_ID) VALUES('E0023','드라군','CL005', 'PT023');
INSERT INTO G_EMPLOYEE (E_ID, E_NAME, CLASS_ID, PART_ID) VALUES('E0024','캐리어','CL005', 'PT023');
INSERT INTO G_EMPLOYEE (E_ID, E_NAME, CLASS_ID, PART_ID) VALUES('E0025','스카우터','CL006', 'PT022');
INSERT INTO G_EMPLOYEE (E_ID, E_NAME, CLASS_ID, PART_ID) VALUES('E0026','메딕','CL006', 'PT021');
INSERT INTO G_EMPLOYEE (E_ID, E_NAME, CLASS_ID, PART_ID) VALUES('E0027','파이어뱃','CL006', 'PT020');
INSERT INTO G_EMPLOYEE (E_ID, E_NAME, CLASS_ID, PART_ID) VALUES('E0028','벌처','CL006', 'PT019');
INSERT INTO G_EMPLOYEE (E_ID, E_NAME, CLASS_ID, PART_ID) VALUES('E0029','골리앗','CL006', 'PT018');
INSERT INTO G_EMPLOYEE (E_ID, E_NAME, CLASS_ID, PART_ID) VALUES('E0030','시즈탱크','CL006', 'PT017');
INSERT INTO G_EMPLOYEE (E_ID, E_NAME, CLASS_ID, PART_ID) VALUES('E0031','고스트','CL006', 'PT016');
INSERT INTO G_EMPLOYEE (E_ID, E_NAME, CLASS_ID, PART_ID) VALUES('E0032','마린','CL006', 'PT015');
INSERT INTO G_EMPLOYEE (E_ID, E_NAME, CLASS_ID, PART_ID) VALUES('E0033','SCV','CL006', 'PT014');
INSERT INTO G_EMPLOYEE (E_ID, E_NAME, CLASS_ID, PART_ID) VALUES('E0034','프로브','CL007', 'PT013');
INSERT INTO G_EMPLOYEE (E_ID, E_NAME, CLASS_ID, PART_ID) VALUES('E0035','레이스','CL007', 'PT012');

--COMMIT;

SELECT * FROM G_CLASS;
SELECT * FROM G_EMPLOYEE;
SELECT * FROM G_PART;

---------------------------------------------
--20.액션재고관리팀과 액션재고구매팀에 소속된 사원의 이름과 연봉을 구하시오

/*표시예
ROOT	    전체판매부	액션판매부	액션재고관리팀	    뮤탈둥지	대리	4000000
ROOT	    전체판매부	액션판매부	액션재고구매팀	    퀸	    대리	4000000
전체판매부	액션판매부	액션재고구매팀	액션재고구매팀-1	질럿	    대리	4000000
전체판매부	액션판매부	액션재고구매팀	액션재고구매팀-2	드라군	대리	4000000
전체판매부	액션판매부	액션재고구매팀	액션재고구매팀-2	캐리어	대리	4000000
전체판매부	액션판매부	액션재고구매팀	액션재고구매팀-1	스카우터	사원	3000000
ROOT	    전체판매부	액션판매부	액션재고구매팀	    골리앗	사원	3000000
ROOT	    전체판매부	액션판매부	액션재고관리팀	    시즈탱크	사원	3000000
*/

--21. FPS와 관련된 부서의 평균 연봉을 구하고 이렇게 표시하시오

/*표시예
전체판매부	FPS판매부	    2000000
FPS판매부	    FPS배송팀	    3500000
FPS판매부	    FPS판매광고팀	3500000
FPS판매부  	FPS재고관리팀	3500000
*/

--22. 원하는 사원의 이름앞에 우수사원을 붙이는 업데이트 프로시저를 만들어주세요
--이번 문제에 원하는사원 > ★액션배송팀의 계급이 사원★인 사원의 이름앞에 우수사원을 붙이는 프로시저 제작

--23.회사에 몇몇 부서가 새로 생기고 이동하게 되었는데 이에대한 프로시저를 만들어주세요 
--액션재고관리팀이 -> 액션재고구매팀-3 이동 UPDATE
--롤플레잉판매부 아래에 롤플레잉 재고관리팀이 생성 INSERT
--기존 부서의 있는 사원은 새로운곳으로 이동하게됩니다
--하나의 프로시저로 만들어주세요