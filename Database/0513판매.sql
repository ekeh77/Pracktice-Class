/* �����ٷ�(JOB) */
-- �ݺ��� �۾��� ������ �� ���
-- �ڱⰡ ���ϴ� �Ⱓ �Ǵ� �ð��� � ����� �����Ű�� ���� ����ϴ� ��
-- SHE (SECURITY, HEALTH, ENVIRONMENT) �����ϰ� �ǰ��� ȯ���� �߱�

--GRANT CREATE ANY JOB TO SALES; < �����ٷ��� ����� �� �ִ� ������ �ִ¸��

BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
            job_name => '"SALES"."SCH_TEST"',
            job_type => 'STORED_PROCEDURE',
            job_action => 'SALES.PROC_DELETE_CUSTOMER',
            number_of_arguments => 1,
            start_date => NULL,
            repeat_interval => 'FREQ=MONTHLY;BYTIME=050000;BYMONTHDAY=1',
            end_date => NULL,
            enabled => FALSE,
            auto_drop => FALSE,
            comments => '���� ��ħ�� � � �����͸� �ڵ����� ������Ų��');

         
     
 
    DBMS_SCHEDULER.SET_ATTRIBUTE( 
             name => '"SALES"."SCH_TEST"', 
             attribute => 'store_output', value => TRUE);
    DBMS_SCHEDULER.SET_ATTRIBUTE( 
             name => '"SALES"."SCH_TEST"', 
             attribute => 'logging_level', value => DBMS_SCHEDULER.LOGGING_OFF);
      
   
  
    
    DBMS_SCHEDULER.enable(
             name => '"SALES"."SCH_TEST"');
END;

BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
            job_name => '"SALES"."SCH_TEST"',
            job_type => 'STORED_PROCEDURE',
            job_action => 'SALES.PROC_SCH_TEST',
            number_of_arguments => 0,
            start_date => TO_TIMESTAMP_TZ('2021-05-13 09:26:04.000000000 ASIA/SEOUL','YYYY-MM-DD HH24:MI:SS.FF TZR'),
            repeat_interval => 'FREQ=SECONDLY;INTERVAL=30',
            end_date => TO_TIMESTAMP_TZ('2021-05-13 09:30:04.000000000 ASIA/SEOUL','YYYY-MM-DD HH24:MI:SS.FF TZR'),
            enabled => FALSE,
            auto_drop => FALSE,
            comments => '�׽�Ʈ');

         
     
 
    DBMS_SCHEDULER.SET_ATTRIBUTE( 
             name => '"SALES"."SCH_TEST"', 
             attribute => 'store_output', value => TRUE);
    DBMS_SCHEDULER.SET_ATTRIBUTE( 
             name => '"SALES"."SCH_TEST"', 
             attribute => 'logging_level', value => DBMS_SCHEDULER.LOGGING_OFF);
      
   
  
    
    DBMS_SCHEDULER.enable(
             name => '"SALES"."SCH_TEST"');
END;
