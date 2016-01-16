/**
* 작업 날짜 : 2015. 10. 20.
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
import com.user.room_rent.vo.Rent_Vo;

public class Rent_List_Action implements Action, ServletResponseAware{
	private HttpServletResponse resp;
	private List<Rent_Vo> re_list;
	@Override
	public String execute() throws Exception {
		re_list = Room_Rent_Dao.getDao().getRentList();
		Gson gson = new Gson();
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html");
		resp.getWriter().println(gson.toJson(re_list));
		return null;
	}
	public List<Rent_Vo> getList() {
		return re_list;
	}
	@Override
	public void setServletResponse(HttpServletResponse resp) {
		this.resp=resp;
		
	}
	
}
