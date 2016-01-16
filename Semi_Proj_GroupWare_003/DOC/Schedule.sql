/* Schedule */
CREATE TABLE Schedule (
	sched_num NUMBER CONSTRAINT Schedule_num_pk PRIMARY KEY, /* 스케줄번호 */
	mem_code VARCHAR2(50), /* 사번 */
	sched_someday VARCHAR2(50), /* 언제가  DATE==>VARCHAR2(50) Oracle과FULLCALENDAR 날짜  연동문제로 수정*/
	sched_somedayend VARCHAR2(50),/*다중 선택을 위해서 추가함*/
	sched_evnet VARCHAR2(30), /* 이벤트 */
	sched_check CHAR(1), /* 확인 */
  CONSTRAINT FK_Member_TO_Schedule FOREIGN KEY (mem_code) REFERENCES Member (mem_code)
);
