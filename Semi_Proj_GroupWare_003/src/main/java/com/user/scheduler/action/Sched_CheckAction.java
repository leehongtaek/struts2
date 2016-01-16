/**
* 작업 날짜 : 2015. 10. 22.
* 구현 내용 :   
*  
* @author By kosta 
*/
package com.user.scheduler.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.Action;
import com.user.scheduler.dao.ScheduleDAO;

public class Sched_CheckAction implements Action,SessionAware{
	private Map<String, Object> session;
	private String sched_num;
	
	
	public void setSched_num(String sched_num) {
		this.sched_num = sched_num;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}

	@Override
	public String execute() throws Exception {
		ScheduleDAO.getDao().update_sched(Integer.parseInt(sched_num));
		return null;
	}

}
