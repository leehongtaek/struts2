Dummy_Board_Sql

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

CREATE TABLE Board (
	board_num NUMBER CONSTRAINT Board_num_pk PRIMARY KEY, /* 글번호 */
	board_code NUMBER, /* 게시판코드 */
	board_title VARCHAR2(100) NOT NULL, /* 제목 */
	board_content CLOB, /* 내용 */
	board_hit NUMBER(10), /* 조회수 */
	board_regdate DATE NOT NULL,  /* 작성일 */
  	mem_code  VARCHAR2(50),
  CONSTRAINT FK_Member_TO_Board FOREIGN KEY (mem_code) REFERENCES Member (mem_code),
  CONSTRAINT FK_BoardInfo_TO_Board FOREIGN KEY (board_code) REFERENCES BoardInfo (board_code)
);

create SEQUENCE Board_seq
increment by 1
start with 1;
commit;

drop table board;
desc board;
insert into board values(board_seq.nextVal,1,'뉴스',   '뉴스내용 페이지 테스트 ',1, sysdate,'151008100853');
insert into board values(board_seq.nextVal,1,'기사',   '페이지 테스트',1, sysdate,'151008100853');
insert into board values(board_seq.nextVal,1,'테스트',   '테스트입니다',1, sysdate,'151008100853');
insert into board values(board_seq.nextVal,1,'게시판테스트','테스트 중',1, sysdate,'151008100853');
insert into board values(board_seq.nextVal,1, '테스트 입니다','내용란에 잘 뿌려지는지 확인',1,sysdate,'151008100852');

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

create SEQUENCE commboard_seq
increment by 1
start with 1;

insert into commboard values(commboard.nextVal,1,'테스트',1,1,1);
insert into commboard values(commboard.nextVal,1,'테스트',1,1,2);


select * from board;