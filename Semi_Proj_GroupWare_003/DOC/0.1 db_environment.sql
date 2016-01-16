-- DB 환경 맞추어주기 

-- 1. CMD로 들어가서 DBA(Database Administrator) 계정으로 로그인
sqlplus / as sysdba

   
-- 2. 오라클 DB 에 새로운 계정을 등록한다 
-- (사용자 생성 쿼리) 
CREATE USER kosta IDENTIFIED BY kosta1234
DEFAULT TABLESPACE users;


-- 참고 )사용자 비밀번호 변경
ALTER USER kosta IDENTIFIED BY kosta1234;


--  3. 권한 설정을 해준다 
-- 	   DBA 권한 설정 
GRANT RESOURCE, CONNECT TO kosta;
GRANT DBA TO kosta;
