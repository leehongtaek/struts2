
/* Member */
CREATE TABLE Member (
	mem_code VARCHAR2(50) CONSTRAINT Member_code_pk PRIMARY KEY, /* 사번 */
	mem_role NUMBER NOT NULL, /* 권한 */
	mem_id VARCHAR2(30) NOT NULL, /* 아이디 */
	mem_pwd VARCHAR2(30) NOT NULL, /* 패스워드 */
	mem_name VARCHAR2(30) NOT NULL, /* 이름 */
	mem_birthdate DATE NOT NULL, /* 생년월일 */
	mem_tel VARCHAR2(20), /* 전화번호 */
	mem_email VARCHAR2(30), /* 이메일 */
	mem_hiredate DATE NOT NULL, /* 입사일 */
	dept_num NUMBER, /* 부서번호 */
	position_num NUMBER NOT NULL, /* 직급번호 */
	mem_post CHAR(7), /* 우편번호 */
	mem_roadaddr VARCHAR2(300), /* 도로명 */
	mem_jibunaddr VARCHAR2(300), /* 지번 */
	mem_detailaddr VARCHAR2(300),/* 상세주소 */
  CONSTRAINT FK_MemDept_TO_Member FOREIGN KEY(dept_num) references MemDept(dept_num)  
);

-- 사원 코드 제너레이터 함수 
CREATE OR REPLACE FUNCTION  member_code_generator(mem_hiredate IN DATE,mem_birthdate IN DATE)
RETURN VARCHAR2 IS 
 temp VARCHAR2(50);
 res_code VARCHAR2(50); 
BEGIN -- 함수 : 사원 입사일+ 생일날짜+ 시퀀서 
  temp:= concat(TO_CHAR(mem_hiredate,'YYMMDD'),TO_CHAR(mem_birthdate,'MMDD'));
  res_code := concat(temp,TO_CHAR(mem_code_generator_seq.nextVal));
  RETURN res_code;
END;
/

-- 함수 시퀀스 
CREATE SEQUENCE mem_code_generator_seq
increment by 1
start with 1;



------더미 데이터


Insert into KOSTA.MEMDEPT (DEPT_NUM,DEPT_NAME) values (0,'1번부서');
Insert into KOSTA.MEMDEPT (DEPT_NUM,DEPT_NAME) values (1,'2번부서');
Insert into KOSTA.MEMDEPT (DEPT_NUM,DEPT_NAME) values (2,'3번부서');
Insert into KOSTA.MEMDEPT (DEPT_NUM,DEPT_NAME) values (3,'4번부서');
Insert into KOSTA.MEMDEPT (DEPT_NUM,DEPT_NAME) values (4,'5번부서');
Insert into KOSTA.MEMBER (MEM_CODE,MEM_ROLE,MEM_ID,MEM_PWD,MEM_NAME,MEM_BIRTHDATE,MEM_TEL,MEM_EMAIL,MEM_HIREDATE,DEPT_NUM,POSITION_NUM,MEM_POST,MEM_ROADADDR,MEM_JIBUNADDR,MEM_DETAILADDR) values ('2015-10-082015-10-0849',0,'ㅇㅁㄴㅇㅁㄴ','ss','ㄹㅇㄴㄹㅇㄴㄹ',to_date('15/10/08','RR/MM/DD'),'010-4723-3426','wwww3426@naver.com',to_date('15/10/08','RR/MM/DD'),0,0,'13481  ','경기 성남시 분당구 판교동 585','경기 성남시 분당구 서판교로 29 (판교동, 판교원마을한림풀에버아파트)','ㄹㅇㄹㅇㄴㄹㄴㅇ');
Insert into KOSTA.MEMBER (MEM_CODE,MEM_ROLE,MEM_ID,MEM_PWD,MEM_NAME,MEM_BIRTHDATE,MEM_TEL,MEM_EMAIL,MEM_HIREDATE,DEPT_NUM,POSITION_NUM,MEM_POST,MEM_ROADADDR,MEM_JIBUNADDR,MEM_DETAILADDR) values ('151008100852',0,'wwww3426','1234','김병기',to_date('15/10/08','RR/MM/DD'),'010-4723-3426','wwww3426@naver.com',to_date('15/10/08','RR/MM/DD'),0,0,'13481  ','경기 성남시 분당구 판교동 585','경기 성남시 분당구 서판교로 29 (판교동, 판교원마을한림풀에버아파트)','ㄹㅇㄹㅇㄴㄹㄴㅇ');

