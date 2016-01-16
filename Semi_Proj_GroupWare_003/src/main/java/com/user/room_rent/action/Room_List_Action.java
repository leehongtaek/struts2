/**
* 작업 날짜 : 2015. 10. 20.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.user.room_rent.action;

import java.util.List;

import com.opensymphony.xwork2.Action;
import com.user.room_rent.dao.Room_Rent_Dao;
import com.user.room_rent.vo.Room_Vo;

public class Room_List_Action implements Action{
	private List<Room_Vo> list;
	@Override
	public String execute() throws Exception {
		list = Room_Rent_Dao.getDao().getRoomList();
		System.out.println("List Log : "+list);
		return SUCCESS;
	}
	public List<Room_Vo> getList() {
		return list;
	}
}
