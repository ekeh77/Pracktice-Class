--���ӱ��� ���ν���

create or replace NONEDITIONABLE PROCEDURE PROC_BUY_GAMAS
(
    IN_G_POINT      IN      NUMBER,
    IN_G_PRICE      IN      NUMBER,
    IN_G_ID         IN      VARCHAR2,
    IN_M_ID         IN      VARCHAR2,
    IN_BUY_NUM      IN      NUMBER,
    O_MSG           OUT     VARCHAR2,
    O_MSG2          OUT     VARCHAR2,
    O_MSG3          OUT     VARCHAR2,
    O_MSG4          OUT     VARCHAR2
)
AS

    V_G_PRICE       NUMBER(10);
    V_G_POINT       NUMBER(10);
    V_REFT_MONEY    NUMBER(10);

BEGIN

    --���� ����Ʈ
    SELECT G_POINT
    INTO V_G_POINT
    FROM G_MEMBERS_POINT
    WHERE MID = IN_M_ID
    ;

    --���� ����
    SELECT GPRICE
    INTO V_G_PRICE
    FROM G_GAMES
    WHERE GID = IN_G_ID
    ;


    --����� ����Ʈ�� ������ ����Ʈ�� ��
    IF IN_G_POINT <= V_G_POINT THEN
        
        --����Ʈ ����
        UPDATE G_MEMBERS_POINT
        SET G_POINT = G_POINT - IN_G_POINT
        WHERE MID = IN_M_ID
        ;
        
        --(����Ʈ ���)
        V_G_PRICE := (V_G_PRICE * IN_BUY_NUM) - IN_G_POINT;
        
        --���� ����Ʈ�� ���ӱ��� �ݾ� �̻��� ������ ���
        IF V_G_PRICE < 0 THEN
            
            V_G_PRICE := ABS(V_G_PRICE);
            
            --���� ����Ʈ�� �����ش�
            UPDATE G_MEMBERS_POINT
            SET G_POINT = G_POINT + V_G_PRICE
            WHERE MID = IN_M_ID
            ;
            
            INSERT INTO G_STORE
            (GID, MID, BUY_NUM, BUY_DATE)
            VALUES
            (IN_G_ID, IN_M_ID, IN_BUY_NUM, SYSDATE)
            ;
            
            O_MSG := '������ �����ϰ� ���� ����Ʈ' || TO_CHAR(V_G_PRICE,'999,999') || '���� �����߽��ϴ�'; 
            
        ELSE
        
            O_MSG2    := '����Ʈ�� ����Ͽ�' || TO_CHAR(V_G_PRICE,'999,999') || '������ �����ϰڽ��ϴ�';
             
            --�� ���� ���Ӱ����� ��
            IF  IN_G_PRICE >= V_G_PRICE THEN
    
                --������(�Ž���)
                V_REFT_MONEY := IN_G_PRICE - V_G_PRICE;
                
                O_MSG3    := '������ �����ϰ� ��������' || TO_CHAR(V_REFT_MONEY,'999,999') || '���Դϴ�';
                
                --������ �����ߴ�
                INSERT INTO G_STORE
                (GID, MID, BUY_NUM, BUY_DATE)
                VALUES
                (IN_G_ID, IN_M_ID, IN_BUY_NUM, SYSDATE)
                ;
    
                --���űݾ��� 5% ����Ʈ ����
                UPDATE G_MEMBERS_POINT
                SET G_POINT = G_POINT + V_G_PRICE * 0.05
                WHERE MID = IN_M_ID
                ;
                
                O_MSG4    := '����Ʈ�� ������ ���Ӱ��� ����Ʈ' || TO_CHAR(V_G_PRICE * 0.05,'999,999') || '������ �����մϴ�';
    
            --���� ������ ���
            ELSE
    
                O_MSG := '������ �����ϱ����� �ݾ�' || TO_CHAR(V_G_PRICE - IN_G_PRICE,'999,999') || '���� �����մϴ�';
    
            END IF;
            
        END IF;
        
    ELSE

     O_MSG := '����ϱ����� ����Ʈ' || TO_CHAR(IN_G_POINT - V_G_POINT,'999,999') || '���� �����մϴ�';  

    END IF;

END PROC_BUY_GAMAS
;