    --17. 평균점수가 가장 높은 시험의 가장높은 점수를 받은 학생을 찾아주세요
    SELECT * FROM EXAMS;
    SELECT * FROM SCORES;
    
    
    
    SELECT PID, SUBID, AVG(SCORE) AS MAXSCORE 
    FROM
    (
        SELECT A.SID, A.SNAME, B.SUBID, B.PID, NVL(B.SCORE,0) AS SCORE 
                
        FROM
        (
            SELECT T1.SID, T1.SNAME, T2.SUBID, T3.PID
            FROM STUDENTS T1,
            (
                SELECT SUBID FROM EXAMS
                GROUP BY SUBID
            ) T2, SCORES T3
            WHERE T2.SUBID = T3.SUBID AND T1.SID = T3.SID
        ) A,
        (
            SELECT T1.SID, T2.SUBID, T2.PID, MAX(T2.SCORE) AS SCORE 
            FROM STUDENTS T1, SCORES T2
            WHERE T1.SID = T2.SID
            GROUP BY T1.SID, T2.SUBID, T2.PID
        ) B
        WHERE A.SID = B.SID(+) AND A.SUBID = B.SUBID(+)
    )
    GROUP BY PID, SUBID
    ORDER BY  AVG(SCORE) DESC
    ;