/**
* 작업 날짜 : 2015. 10. 18.
* 구현 내용 : Member_Vo 생성 
*  
* @author By Byeong Gi kim 
*/
package com.common.sign.vo;
/* Member TABLE 구조 총 13개 컬럼
CREATE TABLE Member (
	mem_code VARCHAR2(50) CONSTRAINT Member_code_pk PRIMARY KEY, /* 사번 
	mem_role NUMBER NOT NULL,  권한 
	mem_id VARCHAR2(30) NOT NULL,  아이디 
	mem_pwd VARCHAR2(30) NOT NULL,  패스워드 
	mem_name VARCHAR2(30) NOT NULL,  이름 
	mem_birthdate DATE NOT NULL,  생년월일 
	mem_tel VARCHAR2(20),  전화번호 
	mem_email VARCHAR2(30),  이메일 
	mem_hiredate DATE NOT NULL,  입사일 
	dept_num NUMBER,  부서번호 
	position_num NUMBER NOT NULL,  직급번호 
	mem_post CHAR(7),  우편번호 
	mem_roadaddr VARCHAR2(300),  도로명 
	mem_jibunaddr VARCHAR2(300),  지번 
	mem_detailaddr VARCHAR2(300), 상세주소 
  CONSTRAINT FK_MemDept_TO_Member FOREIGN KEY(dept_num) references MemDept(dept_num)  
);*/

public class Member_Vo {
	private String mem_code; 		// 1.  사번
	private int mem_role; 			// 2.  권한
	private String mem_id;			// 3.  아이디
	private String mem_pwd;			// 4.  패스워드
	private String mem_roadaddr;	// 5.  도로명 
	private String mem_jibunaddr;	// 6.  지번
	private String mem_post;		// 7.  우편번호
	private String mem_tel;			// 8.  전화번호
	private String mem_email;		// 9.  이메일
	private String mem_name;		// 10. 이름
	private String mem_hiredate;	// 11. 입사일
	private int dept_num;		    // 12. 부서번호
	private int position_num;		// 13. 직급번호
	private String mem_detailaddr;	// 14. 상세주소
	private String mem_birthdate;	// 15. 생년월일 
	
	public String getMem_code() {
		return mem_code;
	}
	public String getMem_detailaddr() {
		return mem_detailaddr;
	}
	public void setMem_detailaddr(String mem_detailaddr) {
		this.mem_detailaddr = mem_detailaddr;
	}
	public String getMem_birthdate() {
		return mem_birthdate;
	}
	public void setMem_birthdate(String mem_birthdate) {
		this.mem_birthdate = mem_birthdate;
	}
	public void setMem_code(String mem_code) {
		this.mem_code = mem_code;
	}
	public int getMem_role() {
		return mem_role;
	}
	public void setMem_role(int mem_role) {
		this.mem_role = mem_role;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pwd() {
		return mem_pwd;
	}
	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}
	public String getMem_roadaddr() {
		return mem_roadaddr;
	}
	public void setMem_roadaddr(String mem_roadaddr) {
		this.mem_roadaddr = mem_roadaddr;
	}
	public String getMem_jibunaddr() {
		return mem_jibunaddr;
	}
	public void setMem_jibunaddr(String mem_jibunaddr) {
		this.mem_jibunaddr = mem_jibunaddr;
	}
	public String getMem_post() {
		return mem_post;
	}
	public void setMem_post(String mem_post) {
		this.mem_post = mem_post;
	}
	public String getMem_tel() {
		return mem_tel;
	}
	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_hiredate() {
		return mem_hiredate;
	}
	public void setMem_hiredate(String mem_hiredate) {
		this.mem_hiredate = mem_hiredate;
	}
	public int getDept_num() {
		return dept_num;
	}
	public void setDept_num(int dept_num) {
		this.dept_num = dept_num;
	}
	public int getPosition_num() {
		return position_num;
	}
	public void setPosition_num(int position_num) {
		this.position_num = position_num;
	}
	

}
