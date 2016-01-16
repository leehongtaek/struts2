/**
* 작업 날짜 : 2015. 10. 20.
* 구현 내용 :   
*  
* @author By kosta 
*/
package com.user.scheduler.vo;

public class ScheduleVO {
private int sched_num; /* 스케줄번호 */
private String mem_code,sched_someday,sched_somedayend,sched_evnet;
private char sched_check;

public String getSched_somedayend() {
	return sched_somedayend;
}
public void setSched_somedayend(String sched_somedayend) {
	this.sched_somedayend = sched_somedayend;
}
public int getSched_num() {
	return sched_num;
}
public void setSched_num(int sched_num) {
	this.sched_num = sched_num;
}
public String getMem_code() {
	return mem_code;
}
public void setMem_code(String mem_code) {
	this.mem_code = mem_code;
}
public String getSched_someday() {
	return sched_someday;
}
public void setSched_someday(String sched_someday) {
	this.sched_someday = sched_someday;
}
public String getSched_evnet() {
	return sched_evnet;
}
public void setSched_evnet(String sched_evnet) {
	this.sched_evnet = sched_evnet;
}
public char getSched_check() {
	return sched_check;
}
public void setSched_check(char sched_check) {
	this.sched_check = sched_check;
}


}
