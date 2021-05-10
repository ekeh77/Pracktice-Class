create or replace NONEDITIONABLE PACKAGE PKG_GAMES_TBL AS 
----------------------------------------------------------
   /*GAME_TBL �������� ����*/
   --CRUD    CREATE, RETRIVE, UPDATE, DELETE

----- GAME_TBL ������ ���
  PROCEDURE PROC_MOD_GAMES
  (
   IN_G_ID             IN       VARCHAR2,
   IN_G_NAME           IN       VARCHAR2,
   IN_G_MAKER          IN       VARCHAR2,
   IN_G_RELEASE        IN       DATE,
   IN_G_SALES_PRICE    IN       NUMBER, --�Ǹ�
   IN_G_SUPPLY_PRICE   IN       NUMBER, --���� ���� 
   IN_G_GENRE          IN       VARCHAR2, 
   IN_G_SHOW           IN       VARCHAR2
  );

----- GAME_TBL ����
  PROCEDURE PROC_DEL_GAMES
  (
   IN_G_ID    IN  VARCHAR2

  );

----- GAME_TBL ��ȸ
  PROCEDURE PROC_SEL_GAMES
  (
   IN_G_ID             IN       VARCHAR2,
   IN_G_NAME           IN       VARCHAR2,
   IN_G_MAKER          IN       VARCHAR2,
   IN_G_RELEASE        IN       DATE,
   IN_G_SALES_PRICE    IN       NUMBER,
   IN_G_SUPPLY_PRICE   IN       NUMBER,
   IN_G_GENRE          IN       VARCHAR2, 
   IN_G_SHOW           IN       VARCHAR2,
   O_CUR               OUT      SYS_REFCURSOR
  );

  /*GAME_TBL �������� ��*/
END PKG_GAMES_TBL;