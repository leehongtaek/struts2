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
import com.user.room_rent.vo.Rent_Vo;

public class Rent_Detail_Action implements Action{
	private String rent_start;
	private List<Rent_Vo> de_list;
	@Override
	public String execute() throws Exception {
		de_list = Room_Rent_Dao.getDao().getRentDetail(rent_start);
		return SUCCESS;
	}
	public List<Rent_Vo> getDe_list() {
		return de_list;
	}
	public void setRent_start(String rent_start) {
		this.rent_start = rent_start;
	}
}
