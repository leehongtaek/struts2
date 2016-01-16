/*제약조건 무시 테이블 삭제  */
drop table MemDept cascade constraints;
drop table Member cascade constraints;
drop table BoardInfo cascade constraints;
drop table Board cascade constraints;
drop table CommBoard cascade constraints;
drop table Company cascade constraints;
drop table ExtDept cascade constraints;
drop table Contact cascade constraints;
drop table Schedule cascade constraints;
drop table Room cascade constraints;
drop table Rent cascade constraints;
drop table Timecard cascade constraints;
drop table Report cascade constraints;
drop table ApprReport cascade constraints;

/* 시퀀스 삭제  */
drop SEQUENCE MemDept_seq;
drop SEQUENCE mem_code_generator_seq;
drop SEQUENCE BoardInfo_seq;
drop SEQUENCE Board_seq;
drop SEQUENCE CommBoard_seq;
drop SEQUENCE Company_seq;
drop SEQUENCE ExtDept_seq;
drop SEQUENCE Contact_seq;
drop SEQUENCE Schedule_seq;
drop SEQUENCE Room_seq;
drop SEQUENCE Rent_seq;
drop SEQUENCE Timecard_seq;
drop SEQUENCE Report_seq;
drop SEQUENCE ApprReport_seq;



/* MemDept */
CREATE TABLE MemDept (
	dept_num NUMBER CONSTRAINT MemDept_num_pk PRIMARY KEY, /* 부서번호 */
	dept_name VARCHAR2(30) NOT NULL /* 부서이름 */
);

create SEQUENCE MemDept_seq
increment by 1
start with 1;

Insert into KOSTA.MEMDEPT (DEPT_NUM,DEPT_NAME) values (0,'1번부서');
Insert into KOSTA.MEMDEPT (DEPT_NUM,DEPT_NAME) values (1,'2번부서');
Insert into KOSTA.MEMDEPT (DEPT_NUM,DEPT_NAME) values (2,'3번부서');
Insert into KOSTA.MEMDEPT (DEPT_NUM,DEPT_NAME) values (3,'4번부서');
Insert into KOSTA.MEMDEPT (DEPT_NUM,DEPT_NAME) values (4,'5번부서');


/* Member 생년월일과 상세주소 추가 10월20일*/
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



Insert into KOSTA.MEMBER (MEM_CODE,MEM_ROLE,MEM_ID,MEM_PWD,MEM_NAME,
MEM_BIRTHDATE,MEM_TEL,MEM_EMAIL,MEM_HIREDATE,DEPT_NUM,POSITION_NUM,
MEM_POST,MEM_ROADADDR,MEM_JIBUNADDR,MEM_DETAILADDR) values 
('151008100853',0,'red','123','김선우',to_date('15/10/08','RR/MM/DD'),
'010-4723-3426','wwww3426@naver.com',to_date('15/10/08','RR/MM/DD'),0,0,'13481',
'경기 성남시 분당구 판교동 585','경기 성남시 분당구 서판교로 29 (판교동, 판교원마을한림풀에버아파트)','ㄹㅇㄹㅇㄴㄹㄴㅇ');

Insert into KOSTA.MEMBER (MEM_CODE,MEM_ROLE,MEM_ID,MEM_PWD,MEM_NAME,
MEM_BIRTHDATE,MEM_TEL,MEM_EMAIL,MEM_HIREDATE,DEPT_NUM,POSITION_NUM,
MEM_POST,MEM_ROADADDR,MEM_JIBUNADDR,MEM_DETAILADDR) values 
('151008100852',0,'wwww3426','1234','김병기',to_date('15/10/08','RR/MM/DD'),
'010-4723-3426','red@naver.com',to_date('15/10/08','RR/MM/DD'),0,0,'13481',
'경기 성남시 분당구 판교동 585','경기 성남시 분당구 서판교로 29 (판교동, 판교원마을한림풀에버아파트)','ㄹㅇㄹㅇㄴㄹㄴㅇ');


/* BoardInfo */
CREATE TABLE BoardInfo (
	board_code NUMBER CONSTRAINT BoardInfo_code_pk PRIMARY KEY, /* 게시판코드 */
	board_kindof VARCHAR2(20), /* 게시판종류 */
	board_name VARCHAR2(30), /* 게시판이름 */
	board_comment VARCHAR2(200) /* 게시판코멘트 */
);

create SEQUENCE BoardInfo_seq
increment by 1
start with 1;


insert into BOARDINFO  values(boardinfo_seq.nextVal,'카테고리1','자유게시판','자유 게시판 입니다.');
insert into BOARDINFO  values(boardinfo_seq.nextVal,'카테고리2','칭찬합시다','칭찬합시다 게시판 입니다.');
insert into BOARDINFO  values(boardinfo_seq.nextVal,'카테고리3','건의사항','건의사항 게시판 입니다.');

/* Board     10월20일 mem_code삭제 -> 10월21일 다시 추가*/
CREATE TABLE Board (
	board_num NUMBER CONSTRAINT Board_num_pk PRIMARY KEY, /* 글번호 */
	board_code NUMBER, /* 게시판코드 */
	board_title VARCHAR2(100) NOT NULL, /* 제목 */
	board_content CLOB, /* 내용 */
	board_hit NUMBER(10), /* 조회수 */
	board_regdate DATE NOT NULL,  /* 작성일 */
  mem_code  VARCHAR2(50), /* 멤버코드 */
  CONSTRAINT FK_Member_TO_Board FOREIGN KEY (mem_code) REFERENCES Member (mem_code),
  CONSTRAINT FK_BoardInfo_TO_Board FOREIGN KEY (board_code) REFERENCES BoardInfo (board_code)
);

create SEQUENCE Board_seq
increment by 1
start with 1;

/* Comment 10월21일 comm_pwd컬럼 삭제  */
CREATE TABLE Commboard (
	comm_num NUMBER CONSTRAINT Comment_num_pk PRIMARY KEY, /* 댓글번호 */
	board_num NUMBER, /* 글번호 */
	comm_content CLOB, /* 내용 */
	comm_lvl NUMBER(5), /* 글lvl */
	comm_ref NUMBER(5), /* 글ref */
	comm_seq NUMBER(5), /* 글seq */
  CONSTRAINT FK_Board_TO_Comment FOREIGN KEY (board_num) REFERENCES Board (board_num)
);

create SEQUENCE CommBoard_seq
increment by 1
start with 1;

/* Company 상세주소 추가 10월20일*/
CREATE TABLE Company (
	comp_num NUMBER CONSTRAINT Company_num_pk PRIMARY KEY, /* 회사번호 */
	comp_name VARCHAR2(100) NOT NULL, /* 이름 */
	comp_post CHAR(6), /* 우편번호 */
	comp_roadaddr VARCHAR2(300), /* 도로명 */
	comp_jibunaddr VARCHAR2(300), /* 지번 */
	comp_detailaddr VARCHAR2(300), /* 상세주소 */
	comp_tel VARCHAR2(20), /* 전화번호 */
	comp_home VARCHAR2(30) /* 홈페이지 */
);

create SEQUENCE Company_seq
increment by 1
start with 1;

insert into Company values(Company_seq.nextVal,'네이버',123456,'경기도 성남시 분당구 ','불정동 그린팩토리','상세주소입니다.','1588-1588','www.naver.com');
insert into Company values(Company_seq.nextVal,'넥슨',123456,'경기도 성남시 분당구 ','불정동 그린팩토리','상세주소입니다.','1588-1588','www.naver.com');
insert into Company values(Company_seq.nextVal,'엔씨소프트',123456,'경기도 성남시 분당구 ','불정동 그린팩토리','상세주소입니다.','1588-1588','www.naver.com');
insert into Company values(Company_seq.nextVal,'제니퍼',123456,'경기도 성남시 분당구 ','불정동 그린팩토리','상세주소입니다.','1588-1588','www.naver.com');
insert into Company values(Company_seq.nextVal,'토마토시스템',123456,'경기도 성남시 분당구 ','불정동 그린팩토리','상세주소입니다.','1588-1588','www.naver.com');
insert into Company values(Company_seq.nextVal,'Oracle',123456,'경기도 성남시 분당구 ','불정동 그린팩토리','상세주소입니다.','1588-1588','www.naver.com');
insert into Company values(Company_seq.nextVal,'Kosta',123456,'경기도 성남시 분당구 ','불정동 그린팩토리','상세주소입니다.','1588-1588','www.naver.com');

/* ExtDept */
CREATE TABLE ExtDept (
	dept_num NUMBER CONSTRAINT ExtDept_num_pk PRIMARY KEY, /* 부서번호 */
	dept_name VARCHAR2(30) NOT NULL /* 부서이름 */
);

create SEQUENCE ExtDept_seq
increment by 1
start with 1;

insert into ExtDept values(ExtDept_seq.nextVal,'법무팀');
insert into ExtDept values(ExtDept_seq.nextVal,'인사팀');
insert into ExtDept values(ExtDept_seq.nextVal,'영업팀');
insert into ExtDept values(ExtDept_seq.nextVal,'생산팀');
insert into ExtDept values(ExtDept_seq.nextVal,'홍보팀');

/* Contact 도로명,지번,우편번호,상세주소 추가 10월21일*/
/* Contact 도로명,지번,우편번호,상세주소 추가 10월21일*/
CREATE TABLE Contact (
	cont_num NUMBER CONSTRAINT Contact_num_pk PRIMARY KEY, /* 등록번호 */
	comp_num NUMBER, /* 회사번호 */
	dept_num NUMBER, /* 부서번호 */
  position_num NUMBER, /* 직급번호 */
  cont_regdate DATE, /* 등록일 */
	cont_name VARCHAR2(30), /* 사원이름 */
	cont_tel VARCHAR2(20), /* 전화번호 */
	cont_email VARCHAR2(30), /* 이메일 */
	cont_roadaddr VARCHAR2(300),	/* 도로명 */
	cont_jibunaddr VARCHAR2(300),	/* 지번 */
	cont_post VARCHAR2(300),		/* 우편번호 */
  cont_detailaddr VARCHAR2(300), /* 상세주소 */
	cont_etc VARCHAR2(200), /* etc */
  CONSTRAINT FK_Company_TO_Contact FOREIGN KEY (comp_num) REFERENCES Company (comp_num),
  CONSTRAINT FK_ExtDept_TO_Contact FOREIGN KEY (dept_num) REFERENCES ExtDept (dept_num)
);


create SEQUENCE Contact_seq
increment by 1
start with 1;

insert into Contact values(Contact_seq.nextVal,1,1,1,sysdate,'김선우','010-1234-1234','redcamel1@gmail.com','서울시 관악구 신림1동','서울 관악구 관천로 25 (신림동)','440-111','2층','친구 동생 아들');
insert into Contact values(Contact_seq.nextVal,2,2,2,sysdate,'이하늘','010-1234-1234','redcamel1@gmail.com','서울시 관악구 신림1동','서울 관악구 관천로 25 (신림동)','440-111','2층','친구 동생 아들');
insert into Contact values(Contact_seq.nextVal,3,3,3,sysdate,'이홍택','010-1234-1234','redcamel1@gmail.com','서울시 관악구 신림1동','서울 관악구 관천로 25 (신림동)','440-111','2층','친구 동생 아들');
insert into Contact values(Contact_seq.nextVal,4,4,4,sysdate,'박성민','010-1234-1234','redcamel1@gmail.com','서울시 관악구 신림1동','서울 관악구 관천로 25 (신림동)','440-111','2층','친구 동생 아들');
insert into Contact values(Contact_seq.nextVal,5,1,5,sysdate,'박종문','010-1234-1234','redcamel1@gmail.com','서울시 관악구 신림1동','서울 관악구 관천로 25 (신림동)','440-111','2층','친구 동생 아들');
insert into Contact values(Contact_seq.nextVal,1,1,5,sysdate,'김병기','010-1234-1234','redcamel1@gmail.com','서울시 관악구 신림1동','서울 관악구 관천로 25 (신림동)','440-111','2층','친구 동생 아들');
insert into Contact values(Contact_seq.nextVal,2,2,5,sysdate,'유현주','010-1234-1234','redcamel1@gmail.com','서울시 관악구 신림1동','서울 관악구 관천로 25 (신림동)','440-111','2층','친구 동생 아들');
insert into Contact values(Contact_seq.nextVal,2,1,4,sysdate,'김선우','010-1234-1234','redcamel1@gmail.com','서울시 관악구 신림1동','서울 관악구 관천로 25 (신림동)','440-111','2층','친구 동생 아들');
insert into Contact values(Contact_seq.nextVal,3,4,6,sysdate,'김선우','010-1234-1234','redcamel1@gmail.com','서울시 관악구 신림1동','서울 관악구 관천로 25 (신림동)','440-111','2층','친구 동생 아들');
insert into Contact values(Contact_seq.nextVal,1,4,6,sysdate,'김선우','010-1234-1234','redcamel1@gmail.com','서울시 관악구 신림1동','서울 관악구 관천로 25 (신림동)','440-111','2층','친구 동생 아들');
insert into Contact values(Contact_seq.nextVal,2,4,5,sysdate,'이하늘','010-1234-1234','redcamel1@gmail.com','서울시 관악구 신림1동','서울 관악구 관천로 25 (신림동)','440-111','2층','친구 동생 아들');
insert into Contact values(Contact_seq.nextVal,3,1,4,sysdate,'이홍택','010-1234-1234','redcamel1@gmail.com','서울시 관악구 신림1동','서울 관악구 관천로 25 (신림동)','440-111','2층','친구 동생 아들');
insert into Contact values(Contact_seq.nextVal,4,2,4,sysdate,'박성민','010-1234-1234','redcamel1@gmail.com','서울시 관악구 신림1동','서울 관악구 관천로 25 (신림동)','440-111','2층','친구 동생 아들');
insert into Contact values(Contact_seq.nextVal,5,3,4,sysdate,'박종문','010-1234-1234','redcamel1@gmail.com','서울시 관악구 신림1동','서울 관악구 관천로 25 (신림동)','440-111','2층','친구 동생 아들');
insert into Contact values(Contact_seq.nextVal,1,4,3,sysdate,'김병기','010-1234-1234','redcamel1@gmail.com','서울시 관악구 신림1동','서울 관악구 관천로 25 (신림동)','440-111','2층','친구 동생 아들');
insert into Contact values(Contact_seq.nextVal,2,1,3,sysdate,'유현주','010-1234-1234','redcamel1@gmail.com','서울시 관악구 신림1동','서울 관악구 관천로 25 (신림동)','440-111','2층','친구 동생 아들');
insert into Contact values(Contact_seq.nextVal,2,2,3,sysdate,'김선우','010-1234-1234','redcamel1@gmail.com','서울시 관악구 신림1동','서울 관악구 관천로 25 (신림동)','440-111','2층','친구 동생 아들');
insert into Contact values(Contact_seq.nextVal,3,1,2,sysdate,'김선우','010-1234-1234','redcamel1@gmail.com','서울시 관악구 신림1동','서울 관악구 관천로 25 (신림동)','440-111','2층','친구 동생 아들');


commit;


/* Schedule 10월22일 sched_someday DATE==>VARCHAR2(50)로 변경 
 *  sched_somedayend 추가   */
CREATE TABLE Schedule (
	sched_num NUMBER CONSTRAINT Schedule_num_pk PRIMARY KEY, /* 스케줄번호 */
	mem_code VARCHAR2(50), /* 사번 */
	sched_someday VARCHAR2(50), /* 언제가  DATE==>VARCHAR2(50) Oracle과FULLCALENDAR 날짜  연동문제로 수정*/
	sched_somedayend VARCHAR2(50),/*다중 선택을 위해서 추가함*/
	sched_evnet VARCHAR2(30), /* 이벤트 */
	sched_check CHAR(1), /* 확인 */
  CONSTRAINT FK_Member_TO_Schedule FOREIGN KEY (mem_code) REFERENCES Member (mem_code)
);

create SEQUENCE Schedule_seq
increment by 1
start with 1;

/* Room */
CREATE TABLE Room (
	room_num NUMBER CONSTRAINT Room_num_pk PRIMARY KEY , /* 시설번호 */
	room_name VARCHAR2(30) NOT NULL, /* 시설이름 */
	room_loc VARCHAR2(300), /* 시설위치 */
	room_limit NUMBER(10) /* 수용인원 */
);

create SEQUENCE Room_seq
increment by 1
start with 1;

/* Rent */
CREATE TABLE Rent (
	rent_num NUMBER CONSTRAINT Rent_num_pk PRIMARY KEY, /* 예약번호 */
	rent_reason VARCHAR2(300), /* 예약사유 */
	rent_start DATE NOT NULL, /* 사용시작시간 */
	rent_end DATE NOT NULL, /* 사용종료시간 */
	room_num NUMBER, /* 시설번호 */
	mem_code VARCHAR2(50), /* 사번 */
  CONSTRAINT FK_Room_TO_Rent FOREIGN KEY (room_num ) REFERENCES Room (room_num),
  CONSTRAINT FK_Member_TO_Rent FOREIGN KEY (mem_code) REFERENCES Member (mem_code)
);

create SEQUENCE Rent_seq
increment by 1
start with 1;

/* Timecard */
CREATE TABLE Timecard (
	tc_num NUMBER CONSTRAINT Timecard_num_pk PRIMARY KEY, /* 카드번호 */
	tcwork_start DATE, /* 출근시간 */
	tcwork_end DATE, /* 퇴근시간 */
	tcgoout_start DATE, /* 외출시작 */
	tcgoout_end DATE, /* 외출종료 */
	tc_state CHAR(1), /* 상태 */
	tcetc VARCHAR2(200), /* etc */
	mem_code VARCHAR2(50), /* 사번 */
  CONSTRAINT FK_Member_TO_Timecard FOREIGN KEY (mem_code) REFERENCES Member (mem_code)
);

create SEQUENCE Timecard_seq
increment by 1
start with 1;

/* Report */
CREATE TABLE Report (
	report_num NUMBER CONSTRAINT Report_num_pk PRIMARY KEY, /* 보고서번호 */
	report_title VARCHAR2(100) NOT NULL, /* 제목 */
	report_content CLOB, /* 내용 */
	report_form CLOB, /* 양식 */
	report_regdate DATE, /* 제출일 */
	report_apprday DATE, /* 결재날짜 */
	report_state CHAR(1), /* 결재상태 */
	report_dday DATE /* 결재기한 */
);

create SEQUENCE Report_seq
increment by 1
start with 1;

/* ApprReport */
CREATE TABLE ApprReport (
	appr_num NUMBER CONSTRAINT ApprReport_num_pk PRIMARY KEY, /* 결재번호 */
	report_num NUMBER, /* 보고서번호 */
	appr_boss VARCHAR2(50), /* 결재자 */
	appr_writer VARCHAR2(50), /* 작성자 */
  CONSTRAINT FK_Report_TO_ApprReport FOREIGN KEY (report_num) REFERENCES Report (report_num),
  CONSTRAINT FK_Member_TO_ApprReport2 FOREIGN KEY (appr_boss ) REFERENCES Member (mem_code),
  CONSTRAINT FK_Member_TO_ApprReport FOREIGN KEY (appr_writer) REFERENCES Member (mem_code)
);

create SEQUENCE ApprReport_seq
increment by 1
start with 1;

-- 함수 시퀀스 
CREATE SEQUENCE mem_code_generator_seq
increment by 1
start with 1;

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

insert into board values(board_seq.nextVal,1,'뉴스',   '뉴스내용 페이지 테스트 ',1, sysdate,'151008100853');
insert into board values(board_seq.nextVal,1,'기사',   '페이지 테스트',1, sysdate,'151008100853');
insert into board values(board_seq.nextVal,1,'테스트',   '테스트입니다',1, sysdate,'151008100853');
insert into board values(board_seq.nextVal,1,'게시판테스트','테스트 중',1, sysdate,'151008100853');
insert into board values(board_seq.nextVal,1, '테스트 입니다','내용란에 잘 뿌려지는지 확인',1,sysdate,'151008100852');

commit;

