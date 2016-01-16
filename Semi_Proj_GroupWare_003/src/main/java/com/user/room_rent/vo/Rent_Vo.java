/**
* 작업 날짜 : 2015. 10. 20.
* 구현 내용 : Rent_Vo
*  
* @author By 유현주 
*/
package com.user.room_rent.vo;

public class Rent_Vo {
	private int rent_num;
	private String rent_reason;
	private String rent_start;
	private String rent_end;
	private int room_num;
	private String mem_code;
	private String mem_name;
	private String room_name;
	
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public int getRent_num() {
		return rent_num;
	}
	public void setRent_num(int rent_num) {
		this.rent_num = rent_num;
	}
	public String getRent_reason() {
		return rent_reason;
	}
	public void setRent_reason(String rent_reason) {
		this.rent_reason = rent_reason;
	}
	public String getRent_start() {
		return rent_start;
	}
	public void setRent_start(String rent_start) {
		this.rent_start = rent_start;
	}
	public String getRent_end() {
		return rent_end;
	}
	public void setRent_end(String rent_end) {
		this.rent_end = rent_end;
	}
	public int getRoom_num() {
		return room_num;
	}
	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}
	public String getMem_code() {
		return mem_code;
	}
	public void setMem_code(String mem_code) {
		this.mem_code = mem_code;
	}
	

}
