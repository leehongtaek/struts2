/**
* 작업 날짜 : 2015. 10. 20.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.user.room_rent.action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.user.room_rent.dao.Room_Rent_Dao;
import com.user.room_rent.vo.Room_Vo;

public class Room_Add_Action implements Action, Preparable, ModelDriven<Room_Vo>{
	
	private Room_Vo v;
	@Override
	public String execute() throws Exception {
		Room_Rent_Dao.getDao().roomAdd(v);
		return SUCCESS;
	}
	@Override
	public Room_Vo getModel() {
		return v;
	}
	@Override
	public void prepare() throws Exception {
		v = new Room_Vo();
	}
	

}
