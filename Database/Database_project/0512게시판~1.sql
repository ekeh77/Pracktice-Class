SET SERVEROUTPUT ON;
--확인을 켜주는것
DECLARE --프로시저를 만들지않고 실행하는 테스트 명령
    -- 변수 선언부
BEGIN
    -- 로직부
    FOR N IN 1..100000
    LOOP
    
        DBMS_OUTPUT.PUT_LINE(N);--확인
        
    END LOOP
    ;
    
END;

CREATE TABLE INDEX_TEST
(
    TID     CHAR(8)         NOT NULL,
    TNAME   VARCHAR2(50)    NOT NULL
);


DECLARE 

BEGIN

    FOR N IN 1..1000000
    LOOP
    
       INSERT INTO INDEX_TEST
       VALUES('I'|| TO_CHAR(N,'FM0000000'), '홍길동' || TO_CHAR(N))
        ;
        
    END LOOP
    ;
    
END;

SELECT COUNT(*) FROM INDEX_TEST;

DELETE FROM INDEX_TEST;

SELECT * FROM INDEX_TEST
WHERE TID = 'I0074142'
;
SELECT * FROM INDEX_TEST
WHERE TNAME = '홍길동1'
;

--COMMIT;

--실행계획
--OBJECT_NAME > 테이블이름
--OPTIONS > SCAN을 어떻게 하는지
--CARDINALITY > 중복도 숫자가 낮을 수록 중복이 많다 - 어떤INDEX를 쓸지 정하는값
--COST > CPU가 일하는 량 숫자가 크면클수록 SQL명령(SELECT)시간이 오래걸림