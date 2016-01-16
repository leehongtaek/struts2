/**
* 작업 날짜 : 2015. 10. 22.
* 구현 내용 :   
*  
* @author By kosta 
*/
package com.user.scheduler.action;

import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.Action;
import com.user.scheduler.dao.ScheduleDAO;

public class Sched_DelAction implements Action,SessionAware {
	private String date;
	private String sched_evnet;
	private String sched_num;
	private Map<String, Object> session;
	
	
	public void setSched_num(String sched_num) {
		this.sched_num = sched_num;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public void setSched_evnet(String sched_evnet) {
		this.sched_evnet = sched_evnet;
	}

	@Override
	public String execute() throws Exception {
		ScheduleDAO.getDao().del_sched(Integer.parseInt(sched_num));
		
		return null;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session= session;
		
	}

}
