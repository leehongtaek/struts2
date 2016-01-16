/**
* 작업 날짜 : 2015. 10. 20.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.user.room_rent.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.user.room_rent.dao.Room_Rent_Dao;
import com.user.room_rent.vo.Rent_Vo;

public class Rent_Add_Action implements Action, Preparable, ModelDriven<Rent_Vo>, SessionAware{
	private Map<String, Object> session;
	private Rent_Vo v;
	@Override
	public String execute() throws Exception {
		v.setMem_code((String) session.get("mem_code"));
		Room_Rent_Dao.getDao().rentAdd(v);
		return SUCCESS;
	}
	@Override
	public Rent_Vo getModel() {
		return v;
	}
	@Override
	public void prepare() throws Exception {
		v = new Rent_Vo();
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
}
