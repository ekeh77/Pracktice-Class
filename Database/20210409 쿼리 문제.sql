
--�Ʒ��� �����͸� �м��ϰ�
--�л����� �ݵ�� 6���� ������ �ľ� �Ѵ�.
--����� ������ �ΰ��� ������ 1���� ���踸 ��� ġ��ȴ�.
--������ ġ�� ���� ������ 0�� ó���Ѵ�.

CREATE TABLE STUDENTS
(
    SID     CHAR(4)         NOT NULL  PRIMARY KEY,
    SNAME   VARCHAR2(30)    NOT NULL,
    STEL    VARCHAR2(20)    NOT NULL,
    SADDR   VARCHAR2(10)    NOT NULL,
    SGENDER CHAR(1)         NOT NULL, 
    SAGE     NUMBER(3)       NOT NULL
);

    INSERT INTO STUDENTS VALUES('S001', '�赹��', '01077778888', '�λ�', 'M', 24);
    INSERT INTO STUDENTS VALUES('S002', '�ڿ���', '01055556666', '���', 'M', 27);
    INSERT INTO STUDENTS VALUES('S003', '���ҿ�', '01088887777', '�λ�', 'M', 28);
    INSERT INTO STUDENTS VALUES('S004', '������', '01055554444', '�λ�', 'F', 22);
    INSERT INTO STUDENTS VALUES('S005', '�����', '01077775555', 'â��', 'M', 21);
    INSERT INTO STUDENTS VALUES('S006', '��ȿ��', '01066669999', 'â��', 'F', 25);
    INSERT INTO STUDENTS VALUES('S007', '���ſ�', '01044447777', '�λ�', 'M', 23);
    INSERT INTO STUDENTS VALUES('S008', '�ڹ���', '01099998888', '���', 'M', 27);
    INSERT INTO STUDENTS VALUES('S009', '���μ�', '01051477787', '�λ�', 'F', 31);
    INSERT INTO STUDENTS VALUES('S010', '�ּ���', '01078974444', '����', 'F', 32);
    
    
CREATE TABLE PROFESSORS
(
    PID     CHAR(4)         NOT NULL  PRIMARY KEY,
    PNAME   VARCHAR2(30)    NOT NULL,
    PTEL    VARCHAR2(20)    NOT NULL,
    PADDR   VARCHAR2(10)    NOT NULL,
    PGENDER CHAR(1)         NOT NULL,
    BIRTH   VARCHAR2(8)     NOT NULL
);
    
    INSERT INTO PROFESSORS VALUES('P001','�ֱ���','01099996566','�λ�','M','19730804');
    INSERT INTO PROFESSORS VALUES('P002','��¼�','01077148888','�λ�','M','19710109');
    INSERT INTO PROFESSORS VALUES('P003','�ڼ���','01055414444','�λ�','F','19780214');
    INSERT INTO PROFESSORS VALUES('P004','����','01024147784','���','F','19801222');
    INSERT INTO PROFESSORS VALUES('P005','�ڼ���','01074145887','���','M','19770505');
    INSERT INTO PROFESSORS VALUES('P006','������','01021444444','â��','M','19781128');
    INSERT INTO PROFESSORS VALUES('P007','�̼���','01057414414','����','F','19800107');
    INSERT INTO PROFESSORS VALUES('P008','�̱���','01092417984','â��','M','19730309');
    INSERT INTO PROFESSORS VALUES('P009','�ڵ���','01092417984','����','M','19801009');
    INSERT INTO PROFESSORS VALUES('P010','�̿���','01092417984','�λ�','F','19820509');
    
CREATE TABLE SUBJECTS
(
    SUBID     CHAR(4)         NOT NULL PRIMARY KEY,
    SNAME   VARCHAR2(30)    NOT NULL,
    GRADE   NUMBER(3)       NOT NULL               --����
);

    INSERT INTO SUBJECTS VALUES('S001','����',3);
    INSERT INTO SUBJECTS VALUES('S002','����',3);
    INSERT INTO SUBJECTS VALUES('S003','����',3);
    INSERT INTO SUBJECTS VALUES('S004','����',2);
    INSERT INTO SUBJECTS VALUES('S005','��ȸ',2);
    INSERT INTO SUBJECTS VALUES('S006','����',1);
    
    
CREATE TABLE EMAMS
(
    PID        CHAR(4)          NOT NULL,
    SUBID      CHAR(4)          NOT NULL,
    ENAME      VARCHAR2(30)     NOT NULL
);

    INSERT INTO EMAMS VALUES('P001','S001','����1 ����');
    INSERT INTO EMAMS VALUES('P002','S001','����2 ����');
    INSERT INTO EMAMS VALUES('P003','S002','����1 ����');
    INSERT INTO EMAMS VALUES('P004','S002','����2 ����');
    INSERT INTO EMAMS VALUES('P005','S003','���� ����');
    INSERT INTO EMAMS VALUES('P006','S004','���� ����');
    INSERT INTO EMAMS VALUES('P007','S005','��ȸ ����');
    INSERT INTO EMAMS VALUES('P008','S006','���� ����');
    
CREATE TABLE SCORES
(
    SID         CHAR(4)             NOT NULL,
    PID         CHAR(4)             NOT NULL,
    SUBID       CHAR(4)             NOT NULL,
    SCIDX       NUMBER(5)           NOT NULL,
    SCORE       NUMBER(5,2)         NOT NULL
);

    --�赹��
    INSERT INTO EXAMS VALUES('S001', 'P001', 'S001', 1, 91.12);
    INSERT INTO EXAMS VALUES('S001', 'P003', 'S002', 1, 78.67);                             
    INSERT INTO EXAMS VALUES('S001', 'P005', 'S003', 1, 86.45);
    INSERT INTO EXAMS VALUES('S001', 'P006', 'S004', 1, 80.67);
    INSERT INTO EXAMS VALUES('S001', 'P007', 'S005', 1, 90);
    INSERT INTO EXAMS VALUES('S001', 'P008', 'S006', 1, 77);
    
    --�ڿ���
    INSERT INTO EXAMS VALUES('S002', 'P002', 'S001', 1, 69);
    INSERT INTO EXAMS VALUES('S002', 'P003', 'S002', 1, 98);                             
    INSERT INTO EXAMS VALUES('S002', 'P005', 'S003', 1, 56);
    INSERT INTO EXAMS VALUES('S002', 'P006', 'S004', 1, 78);
    INSERT INTO EXAMS VALUES('S002', 'P007', 'S005', 1, 87.90);
    INSERT INTO EXAMS VALUES('S002', 'P008', 'S006', 1, 76.20);
    
    --���ҿ�
    INSERT INTO EXAMS VALUES('S003', 'P002', 'S001', 1, 65.44);
    INSERT INTO EXAMS VALUES('S003', 'P003', 'S002', 1, 78.09);                             
    INSERT INTO EXAMS VALUES('S003', 'P006', 'S004', 1, 88);
    INSERT INTO EXAMS VALUES('S003', 'P007', 'S005', 1, 56);
    INSERT INTO EXAMS VALUES('S003', 'P008', 'S006', 1, 78);

    --������
    INSERT INTO EXAMS VALUES('S004', 'P002', 'S001', 1, 90);
    INSERT INTO EXAMS VALUES('S004', 'P004', 'S002', 1, 77);                             
    INSERT INTO EXAMS VALUES('S004', 'P005', 'S003', 1, 90);
    INSERT INTO EXAMS VALUES('S004', 'P006', 'S004', 1, 94);
    INSERT INTO EXAMS VALUES('S004', 'P007', 'S005', 1, 76.44);
    INSERT INTO EXAMS VALUES('S004', 'P008', 'S006', 1, 87.45);
    
    --�����
    INSERT INTO EXAMS VALUES('S005', 'P001', 'S001', 1, 77.45);
    INSERT INTO EXAMS VALUES('S005', 'P004', 'S002', 1, 99);                             
    INSERT INTO EXAMS VALUES('S005', 'P005', 'S003', 1, 87);
    INSERT INTO EXAMS VALUES('S005', 'P006', 'S004', 1, 78);
    

    --��ȿ��
    INSERT INTO EXAMS VALUES('S006', 'P001', 'S001', 1, 77);
    INSERT INTO EXAMS VALUES('S006', 'P004', 'S002', 1, 65);                             
    INSERT INTO EXAMS VALUES('S006', 'P005', 'S003', 1, 54);
    INSERT INTO EXAMS VALUES('S006', 'P006', 'S004', 1, 77.44);
    INSERT INTO EXAMS VALUES('S006', 'P007', 'S005', 1, 80.87);
    INSERT INTO EXAMS VALUES('S006', 'P008', 'S006', 1, 98);
    
    
    --���ſ�
    INSERT INTO EXAMS VALUES('S008', 'P002', 'S001', 1, 90);
    INSERT INTO EXAMS VALUES('S008', 'P004', 'S002', 1, 88.67);                             
    INSERT INTO EXAMS VALUES('S008', 'P005', 'S003', 1, 67.56);
    INSERT INTO EXAMS VALUES('S008', 'P006', 'S004', 1, 90);
    INSERT INTO EXAMS VALUES('S008', 'P007', 'S005', 1, 71.11);
    INSERT INTO EXAMS VALUES('S008', 'P008', 'S006', 1, 87.45);
    
    --�ڹ���
    INSERT INTO EXAMS VALUES('S009', 'P001', 'S001', 1, 65);
    INSERT INTO EXAMS VALUES('S009', 'P004', 'S002', 1, 56.67);                             
    INSERT INTO EXAMS VALUES('S009', 'P005', 'S003', 1, 77);
    INSERT INTO EXAMS VALUES('S009', 'P006', 'S004', 1, 82);
    INSERT INTO EXAMS VALUES('S009', 'P007', 'S005', 1, 83.09);
    INSERT INTO EXAMS VALUES('S009', 'P008', 'S006', 1, 93);
    
    --���μ�
    INSERT INTO EXAMS VALUES('S001', 'P001', 'S001', 1, 56);
    INSERT INTO EXAMS VALUES('S001', 'P004', 'S002', 1, 97);                             
    INSERT INTO EXAMS VALUES('S001', 'P005', 'S003', 1, 57);
    INSERT INTO EXAMS VALUES('S001', 'P006', 'S004', 1, 90);
    INSERT INTO EXAMS VALUES('S001', 'P007', 'S005', 1, 76);
    INSERT INTO EXAMS VALUES('S001', 'P008', 'S006', 1, 84);
    
    --�ּ���
    INSERT INTO EXAMS VALUES('S001', 'P001', 'S001', 1, 78);
    INSERT INTO EXAMS VALUES('S001', 'P003', 'S002', 1, 89);                             
    INSERT INTO EXAMS VALUES('S001', 'P006', 'S004', 1, 78.56);
    INSERT INTO EXAMS VALUES('S001', 'P007', 'S005', 1, 80.88);
    INSERT INTO EXAMS VALUES('S001', 'P008', 'S006', 1, 98);
    
    
    --1. �� ������ �������� ��Ȳ ����Ʈ�� �����ּ���
    --(�����̸�, �����, �����)
    
    --2. ������ �л��� ����Ʈ�� �����ּ���
    
    --3. ������ �������� ����Ʈ�� �����ּ���
    
    --4  ������� 1�� ����������� ġ�� �л� ����Ʈ�� �����ּ���
    
    --5. �λ꿡 ��� �л����� ������� ��հ� ������ ����Ʈ�� �����ּ���
    
    --6. ���� �����Ե��� ������ ������ ������ ����� �����ּ���
    
    --7. �� �л����� ������ ġ�� ������� ����Ʈ�� �����ּ���
    
    --8. 1980���� �������� ������ ������ ����Ʈ�� �����ּ���
    
    --9. ���������� ���� ���� ������ �����ּ���
    
    --10. ���ڱ����Ե��� ������ ������ ������ ����� �����ּ���
    
    --11. 20�� ���л��� ġ�� ������ ������ ����� �����ּ���
    
    --12. �� �������� �л����� ������ ����� �����ּ���
    
    --13. �� ����(����ƴ�)���� ��������� �����ּ���
    
    --14. ����л����� ������ ��� ������ �����ּ���
    
    --15. �� �������� ������ ������ ��� ������ �����ּ���
    
    --16. ���躰�� ������ ġ���� ���� �л� ����Ʈ�� �����ּ���
    
    --17. ��������� ���� ���� ������ ������� ������ ���� �л��� ã���ּ���
    
    --18. ��������� ���� ���� ������ ���峷�� ������ ���� �л��� ã���ּ���
    
    --19. 60���̸��̸� ������̶�� �ϸ� ������� �ľ� �ϴ� ����� �л����� �����ּ���
    
    --20. ���� ����� ���� ������ ������ ������ ��� ������ ��� �ִ� �л�����Ʈ�� �����ּ���