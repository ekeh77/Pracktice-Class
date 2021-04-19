--프로시저
--프로시저를 알기위해선 2가지를 알 필요가있다
--1.BUSINESSLOGIC
--2.TRANSACTION

SELECT * FROM CUSTOMER_TBL
WHERE C_ID = 'C00001'
;
SELECT * FROM CUSTOMER_TBL
WHERE C_ID LIKE '%홍%'
;

--프로시저
--사용법은 마치 함수와 전혀 다르지 않아요
--매개변수값을 받아서 처리
--1. 리턴값은 없다
--2. TRANSACTION 개념 -- 한번에 처리해야할 최소단위 ALL OR NOTING
--3. 프로시져는 업무처리 최소단위
-- 프로시져는 하나의 명령문에 오류가 나면 나머지는 다 ROLLBACK한다
SELECT *
FROM CUSTOMER_TBL
;