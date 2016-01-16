/* Company */
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


select * from Company;

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

select * from ExtDept;

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

insert into Contact values(Contact_seq.nextVal,1,1,1,sysdate,'김선우','010-1234-1234','redcamel1@gmail.com','서울시','관악구','신림1동 440-111','상세주소','친구 동생 아들');
insert into Contact values(Contact_seq.nextVal,1,1,1,sysdate,'이하늘','010-1234-1234','redcamel1@gmail.com','서울시','관악구','신림1동 440-111','상세주소','친구 동생 아들');
insert into Contact values(Contact_seq.nextVal,1,1,1,sysdate,'이홍택','010-1234-1234','redcamel1@gmail.com','서울시','관악구','신림1동 440-111','상세주소','친구 동생 아들');
insert into Contact values(Contact_seq.nextVal,1,1,1,sysdate,'박성민','010-1234-1234','redcamel1@gmail.com','서울시','관악구','신림1동 440-111','상세주소','친구 동생 아들');
insert into Contact values(Contact_seq.nextVal,1,1,1,sysdate,'박종문','010-1234-1234','redcamel1@gmail.com','서울시','관악구','신림1동 440-111','상세주소','친구 동생 아들');
insert into Contact values(Contact_seq.nextVal,1,1,1,sysdate,'김병기','010-1234-1234','redcamel1@gmail.com','서울시','관악구','신림1동 440-111','상세주소','친구 동생 아들');
insert into Contact values(Contact_seq.nextVal,1,1,1,sysdate,'유현주','010-1234-1234','redcamel1@gmail.com','서울시','관악구','신림1동 440-111','상세주소','친구 동생 아들');
insert into Contact values(Contact_seq.nextVal,1,1,1,sysdate,'김선우','010-1234-1234','redcamel1@gmail.com','서울시','관악구','신림1동 440-111','상세주소','친구 동생 아들');
insert into Contact values(Contact_seq.nextVal,1,1,1,sysdate,'김선우','010-1234-1234','redcamel1@gmail.com','서울시','관악구','신림1동 440-111','상세주소','친구 동생 아들');


select * from Contact;
-- all_List
select cont_num, comp_num, dept_num, cont_name, cont_tel, cont_email, cont_regdate, cont_etc, position_num from Contact;

delete from contact where cont_num in(4,5,6,7,8,9,10);
commit;
