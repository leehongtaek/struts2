CREATE TABLE Rent (
	rent_num NUMBER CONSTRAINT Rent_num_pk PRIMARY KEY, /* 예약번호 */
	rent_reason VARCHAR2(300), /* 예약사유 */
	rent_start VARCHAR2(50) NOT NULL, /* 사용시작시간 */
	rent_end VARCHAR2(50) NOT NULL, /* 사용종료시간 */
	room_num NUMBER, /* 시설번호 */
	mem_code VARCHAR2(50), /* 사번 */
  CONSTRAINT FK_Room_TO_Rent FOREIGN KEY (room_num ) REFERENCES Room (room_num),
  CONSTRAINT FK_Member_TO_Rent FOREIGN KEY (mem_code) REFERENCES Member (mem_code)
);

create SEQUENCE Rent_seq
increment by 1
start with 1;

insert into rent values(rent_seq.nextVal,'환경보호 프로젝트','2015-10-23T13:00'
,'2015-10-30T13:00',1,'151008100853');

select * from rent;
