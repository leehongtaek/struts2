/**
* 작업 날짜 : 2015. 10. 21.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.user.room_rent.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletResponseAware;

import com.google.gson.Gson;
import com.opensymphony.xwork2.Action;
import com.user.room_rent.dao.Room_Rent_Dao;
import com.user.room_rent.vo.Room_Vo;

public class Room_Name_Action implements Action,ServletResponseAware{
	private HttpServletResponse resp;
	private List<Room_Vo> list;
	@Override
	public String execute() throws Exception {
		list = Room_Rent_Dao.getDao().getRoomList();
		Gson gson = new Gson();
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html");
		resp.getWriter().println(gson.toJson(list));
		return null;
	}
	public List<Room_Vo> getList() {
		return list;
	}
	@Override
	public void setServletResponse(HttpServletResponse resp) {
		this.resp=resp;
		
	}
}
