--1. TO_CHAR() : 데이터타입을 문자열형태로 바꾸어 주는 함수
SELECT 'S' || TRIM(TO_CHAR(2,'000')) FROM DUAL;
--2. DECODE() : 값에 따라 특정값을 선택하게 해주는 함수
SELECT DECODE(F_GUBUN, 1, '완료', 2, '취소', 3, '메롱', '몰라') FROM FINISH_DRIVE_TBL;
--3. NVL() : 특정 필드값이 NULL일경우에 해당 NULL값을 대체해주는 값을 줄 수 있다
UPDATE F_MENUS
SET FMETC = '옷'
WHERE FMID = 'FM02'
;
SELECT * FROM F_MENUS;
--COMMIT;
SELECT NVL(FMETC, '나는 나는 나는') FROM F_MENUS;
--4. SYSDATE : 오늘 날짜를 확인
SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') FROM DUAL;
--5. DUAL : 가상 테이블(빈 테이블)