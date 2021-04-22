--게임구매 프로시저

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

    --보유 포인트
    SELECT G_POINT
    INTO V_G_POINT
    FROM G_MEMBERS_POINT
    WHERE MID = IN_M_ID
    ;

    --게임 가격
    SELECT GPRICE
    INTO V_G_PRICE
    FROM G_GAMES
    WHERE GID = IN_G_ID
    ;


    --사용할 포인트가 보유한 포인트를 비교
    IF IN_G_POINT <= V_G_POINT THEN
        
        --포인트 차감
        UPDATE G_MEMBERS_POINT
        SET G_POINT = G_POINT - IN_G_POINT
        WHERE MID = IN_M_ID
        ;
        
        --(포인트 계산)
        V_G_PRICE := (V_G_PRICE * IN_BUY_NUM) - IN_G_POINT;
        
        --만약 포인트로 게임구매 금액 이상을 결제할 경우
        IF V_G_PRICE < 0 THEN
            
            V_G_PRICE := ABS(V_G_PRICE);
            
            --남은 포인트를 돌려준다
            UPDATE G_MEMBERS_POINT
            SET G_POINT = G_POINT + V_G_PRICE
            WHERE MID = IN_M_ID
            ;
            
            INSERT INTO G_STORE
            (GID, MID, BUY_NUM, BUY_DATE)
            VALUES
            (IN_G_ID, IN_M_ID, IN_BUY_NUM, SYSDATE)
            ;
            
            O_MSG := '게임을 구매하고 남은 포인트' || TO_CHAR(V_G_PRICE,'999,999') || '점을 적립했습니다'; 
            
        ELSE
        
            O_MSG2    := '포인트를 계산하여' || TO_CHAR(V_G_PRICE,'999,999') || '원으로 결제하겠습니다';
             
            --낸 돈과 게임가격을 비교
            IF  IN_G_PRICE >= V_G_PRICE THEN
    
                --남은돈(거스름)
                V_REFT_MONEY := IN_G_PRICE - V_G_PRICE;
                
                O_MSG3    := '게임을 구매하고 남은값은' || TO_CHAR(V_REFT_MONEY,'999,999') || '원입니다';
                
                --게임을 구매했다
                INSERT INTO G_STORE
                (GID, MID, BUY_NUM, BUY_DATE)
                VALUES
                (IN_G_ID, IN_M_ID, IN_BUY_NUM, SYSDATE)
                ;
    
                --구매금액의 5% 포인트 적립
                UPDATE G_MEMBERS_POINT
                SET G_POINT = G_POINT + V_G_PRICE * 0.05
                WHERE MID = IN_M_ID
                ;
                
                O_MSG4    := '포인트를 제외한 게임값을 포인트' || TO_CHAR(V_G_PRICE * 0.05,'999,999') || '점으로 저장합니다';
    
            --돈이 부족할 경우
            ELSE
    
                O_MSG := '게임을 구매하기위한 금액' || TO_CHAR(V_G_PRICE - IN_G_PRICE,'999,999') || '원이 부족합니다';
    
            END IF;
            
        END IF;
        
    ELSE

     O_MSG := '사용하기위한 포인트' || TO_CHAR(IN_G_POINT - V_G_POINT,'999,999') || '점이 부족합니다';  

    END IF;

END PROC_BUY_GAMAS
;