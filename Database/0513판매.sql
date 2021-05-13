/* 스케줄러(JOB) */
-- 반복된 작업을 수행할 때 사용
-- 자기가 원하는 기간 또는 시간에 어떤 명령을 실행시키기 위해 사용하는 것
-- SHE (SECURITY, HEALTH, ENVIRONMENT) 안전하고 건강한 환경을 추구

--GRANT CREATE ANY JOB TO SALES; < 스케줄러를 사용할 수 있는 권한을 주는명령

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
            comments => '매일 아침에 어떤 어떤 데이터를 자동으로 생성시킨다');

         
     
 
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
            comments => '테스트');

         
     
 
    DBMS_SCHEDULER.SET_ATTRIBUTE( 
             name => '"SALES"."SCH_TEST"', 
             attribute => 'store_output', value => TRUE);
    DBMS_SCHEDULER.SET_ATTRIBUTE( 
             name => '"SALES"."SCH_TEST"', 
             attribute => 'logging_level', value => DBMS_SCHEDULER.LOGGING_OFF);
      
   
  
    
    DBMS_SCHEDULER.enable(
             name => '"SALES"."SCH_TEST"');
END;
