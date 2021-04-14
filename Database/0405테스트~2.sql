SELECT *  
FROM SCORES
WHERE SCORE > 77.7 AND SCORE < 80
;

SELECT *
FROM SCORES
WHERE SCORE < 60 OR SCORE > 90;

--������ 60�� �̸�
--1����� 90�� �̻�
--2����� 80�� �̻� 90�� �̸�
--3����� 70���̻� 80���̸�
--4����� 60���̻� 70���̸�

--1��ް� 4����� �����͸� ���� --> ����
SELECT *
FROM SCORES
WHERE SCORE >= 90 OR (SCORE < 80 AND SCORE >= 70 )
ORDER BY SCORE DESC;

--�����ΰ� ã��
--�����ΰ��߿� 2���
SELECT *
FROM SCORES
WHERE SUBJECT_NAME = '����' AND (SCORE >= 80 AND SCORE < 90);

SELECT *
FROM SCORES
WHERE (SUBJECT_NAME = '����' AND (SCORE >= 80 AND SCORE < 90)) OR (SCORE >= 90 AND SUBJECT_NAME = '����'); 

--IN ������
SELECT *
FROM SCORES
WHERE SUBJECT_NAME IN ('����','����', '����');

-- ����, ���� ������ 2���

SELECT *
FROM SCORES
WHERE SUBJECT_NAME IN('����','����') AND (SCORE < 90 AND SCORE >= 80);

SELECT * FROM STUDENTS;

--�л��̸��߿� ���� ȫ���� �����͸� ã��

SELECT * FROM STUDENTS
WHERE AGE LIKE '%%';

--����Ŭ������ ���ڿ�����
SELECT * FROM STUDENTS
WHERE SNAME = :AAA;

SELECT * FROM STUDENTS
WHERE SNAME LIKE '%' || :AAA || '%'
;