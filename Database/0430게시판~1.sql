--VIEW : 메모리상에 존재하는 테이블
--메모리를 많이 먹어서 사용안하는편이 좋다

SELECT * FROM TESTVIEW;

DELETE FROM TESTVIEW; -- 한줄은 지워짐

INSERT INTO TESTVIEW VALUES(5,'123',1, 1, 1, 1); --한줄은 삽입됨

--조인된 VIEW는 안먹음


--예외처리