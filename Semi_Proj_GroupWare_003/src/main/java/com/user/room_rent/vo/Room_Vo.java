/**
* 작업 날짜 : 2015. 10. 20.
* 구현 내용 :  Room_Vo
*  
* @author By 유현주 
*/
package com.user.room_rent.vo;

public class Room_Vo {
	private int room_num;
	private String room_name;
	private String room_loc;
	private int room_limit;
	public int getRoom_num() {
		return room_num;
	}
	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public String getRoom_loc() {
		return room_loc;
	}
	public void setRoom_loc(String room_loc) {
		this.room_loc = room_loc;
	}
	public int getRoom_limit() {
		return room_limit;
	}
	public void setRoom_limit(int room_limit) {
		this.room_limit = room_limit;
	}
	
	

}
