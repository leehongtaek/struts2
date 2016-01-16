/**
* 작업 날짜 : 2015. 10. 20.
* 구현 내용 :   
*  
* @author By kosta 
*/
package com.user.scheduler.action;


import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.user.scheduler.dao.ScheduleDAO;
import com.user.scheduler.vo.ScheduleVO;

public class ScheduleInputAction implements Action,Preparable,ModelDriven<ScheduleVO>,SessionAware{
	private ScheduleVO v;
	private String date;
	private String edate;
	private String sched_input;
	private Map<String, Object> session;
	
	public void setEdate(String edate) {
		this.edate = edate;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
		
	}

	public void setSched_input(String sched_input) {
		this.sched_input = sched_input;
	}

	@Override
	public ScheduleVO getModel() {
		return v;
	}

	public void setV(ScheduleVO v) {
		this.v = v;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public void prepare() throws Exception {
		v= new ScheduleVO();
	}

	@Override
	public String execute() throws Exception {
		
		System.out.println("LOG :::::::::: "+date);
		System.out.println("LOG :::::::::: "+v.getSched_evnet());
		System.out.println("LOG :::::::::: "+ sched_input);
		
		v.setMem_code((String)session.get("mem_code"));
		v.setSched_evnet(sched_input);
		v.setSched_someday(date);
		v.setSched_somedayend(edate);
		ScheduleDAO.getDao().addSchedule(v);
		
		return SUCCESS;
	}

}
