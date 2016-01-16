/**
* 작업 날짜 : 2015. 10. 20.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.user.room_rent.action;

import com.opensymphony.xwork2.Action;
import com.user.room_rent.dao.Room_Rent_Dao;
import com.user.room_rent.vo.Room_Vo;

public class Room_Detail_Action implements Action{
	private int num;
	private Room_Vo v;
	@Override
	public String execute() throws Exception {
		v = Room_Rent_Dao.getDao().getRoomDetail(num);
		return SUCCESS;
	}
	public Room_Vo getV() {
		return v;
	}
	public void setNum(int num) {
		this.num = num;
	}
	

}
