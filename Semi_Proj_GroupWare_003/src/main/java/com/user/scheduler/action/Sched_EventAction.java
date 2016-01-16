/**
* 작업 날짜 : 2015. 10. 22.
* 구현 내용 :   
*  
* @author By kosta 
*/
package com.user.scheduler.action;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.google.gson.Gson;
import com.opensymphony.xwork2.Action;
import com.user.scheduler.dao.ScheduleDAO;
import com.user.scheduler.vo.ScheduleVO;


public class Sched_EventAction implements Action,ServletResponseAware,SessionAware{
	private List<ScheduleVO> list;
	private HttpServletResponse resp;
	private Map<String, Object> session;

	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}

	@Override
	public String execute() throws Exception {
		System.out.println("LOG 이벤트 액션 동작 확인");
		System.out.println("LOG MEMCODE"+(String)session.get("mem_code"));
		List<HashMap<String, String>> list =ScheduleDAO.getDao().getlist((String)session.get("mem_code"));
		
		Gson gs=new Gson();
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/json");
		resp.getWriter().write(gs.toJson(list));
		
		
		return null;
	}


	@Override
	public void setServletResponse(HttpServletResponse resp) {
		this.resp=resp;
	}

}
