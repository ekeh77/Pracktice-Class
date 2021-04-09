SELECT * FROM RESERVATION_TBL
ORDER BY R_PAY DESC
;

--������ ���� ������ �� ���ڿ� 3�� ���ϰ� ������ ��� ���� �� ���ڿ� 2�� ���Ѱ�
SELECT DR_GENDER, COUNT(*) FROM DRIVERS_TBL
GROUP BY DR_GENDER
;

--ALIAS �˸��ƽ� > Ư�� �ʵ尪�� �������� �ܼ�ȭ �ϱ����Ѱ�

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
--�޸𸮻� �����ϴ� ���̺� > VIEW
--��ȣ �ȿ��� ���� �޸𸮻��� ���̺� > INLINE VIEW

-- 2���� �̻��̸� ��, 2���� �̸��̸� �� 1���� �̸� ��

SELECT ROWNUM, R_PAY,
    CASE 
        WHEN R_PAY >= 20000 THEN '��'
        WHEN R_PAY >= 10000 AND R_PAY < 20000 THEN '��'
        ELSE '��'
    END AS PRICE_TXT
FROM RESERVATION_TBL
;