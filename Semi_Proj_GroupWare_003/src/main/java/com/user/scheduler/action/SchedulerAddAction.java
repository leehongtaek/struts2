/**
* 작업 날짜 : 2015. 10. 21.
* 구현 내용 :   
*  
* @author By kosta 
*/
package com.user.scheduler.action;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.Action;
import com.user.scheduler.dao.ScheduleDAO;
import com.user.scheduler.vo.ScheduleVO;

public class SchedulerAddAction implements Action, SessionAware {

	private String date;
	private String edate;
	private List<ScheduleVO> list;
	private Map<String, Object> session;
	
	public List<ScheduleVO> getList() {
		return list;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}

	@Override
	public String execute() throws Exception {
		System.out.println("addpage");
		
		HashMap<String, String> hmap = new HashMap<>();
		hmap.put("date", date);
		hmap.put("edate", edate);
		hmap.put("mem_code",(String)session.get("mem_code"));//(String) session.get("mem_code"));
		System.out.println("date");
		list = ScheduleDAO.getDao().getModalList(hmap);
	
		return SUCCESS;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	
}
