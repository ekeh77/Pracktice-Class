SELECT * FROM RESERVATION_TBL
ORDER BY R_PAY DESC
;

--남자인 경우는 남자의 총 숫자에 3을 곱하고 여자인 경우 여자 총 숫자에 2를 곱한값
SELECT DR_GENDER, COUNT(*) FROM DRIVERS_TBL
GROUP BY DR_GENDER
;

--ALIAS 알리아스 > 특정 필드값의 복잡함을 단순화 하기위한것

SELECT T1.* FROM
(
    SELECT R_TEL, SUM
    (
        R_PAY *
        CASE 
            WHEN R_PAY >= 20000 THEN 0.8
            ELSE 0.9
        END
    ) AS TLTPRICE 
    FROM RESERVATION_TBL
    GROUP BY R_TEL
) T1
WHERE TLTPRICE > 50000
ORDER BY TLTPRICE DESC
;
--메모리상에 존재하는 테이블 > VIEW
--괄호 안에서 쓰는 메모리상의 테이블 > INLINE VIEW

-- 2만원 이상이면 고, 2만원 미만이면 중 1만원 미만 하

SELECT ROWNUM, R_PAY,
    CASE 
        WHEN R_PAY >= 20000 THEN '고'
        WHEN R_PAY >= 10000 AND R_PAY < 20000 THEN '중'
        ELSE '하'
    END AS PRICE_TXT
FROM RESERVATION_TBL
;