create or replace NONEDITIONABLE PACKAGE PKG_COMMONS_TBL AS 
----------------------------------------------------------
   /*COMMONS_TBL 업무로직 시작*/
   --CRUD CREATE, RETRIVE, UPDATE, DELETE

----- COMMONS_TBL INSERT, UPDATE 
  PROCEDURE PROC_INS_UP_COMMONS
  (
         	IN_CMS_ID                	IN     	VARCHAR2,
           	IN_CMS_NAME           	IN     	VARCHAR2,
           	IN_CMS_LVL              	IN       	NUMBER,
           	IN_CMS_SEQ               	IN        	NUMBER,
         	IN_PARENT_CMS_ID        	IN       	VARCHAR2,
           	IN_GROUP_NUM               	IN       	NUMBER  
  );

----- COMMONS_TBL DELETE

  PROCEDURE PROC_DEL_COMMONS
  (
   IN_CMS_ID          	IN      	VARCHAR2,
   IN_CMS_LVL   		IN     	NUMBER,
   IN_CMS_SEQ        	IN     	NUMBER
  );

----- COMMONS_TBL SELECT

  PROCEDURE PROC_SEL_COMMONS
  (
   IN_CMS_ID          	IN     	VARCHAR2,
   IN_CMS_NAME        	IN    	VARCHAR2,
   IN_CMS_LVL        	IN     	NUMBER,
   IN_CMS_SEQ        	IN     	NUMBER,
   IN_PARENT_CMS_ID     	IN       	VARCHAR2,
   IN_GROUP_NUM        	IN       	NUMBER,
   O_CUR            		OUT     	SYS_REFCURSOR
  );

   /*COMMONS_TBL 업무로직 끝*/
END PKG_COMMONS_TBL;