/**
* 작업 날짜 : 2015. 10. 21.
* 구현 내용 : 기본적인 TIME CARD UPDATE 관련 기능을   
* 		  COMMAND PATTAN 으로 구현 
* @author By Byeong Gi Kim 
*/
package com.user.timecard.action;

import java.io.PrintWriter;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import com.opensymphony.xwork2.Action;
import com.user.timecard.dao.Timecard_Dao;
import com.user.timecard.vo.Timecard_Vo;

public class TimeCardUpdate_Action implements Action, SessionAware, ServletResponseAware {
	private HttpServletResponse response;
	private Map<String, Object> session;
	private String cmd;
	private String tcetc;
	private String selectedDay;

	@Override
	public String execute() throws Exception {

		response.setCharacterEncoding("UTF-8");
		Timecard_Vo vo = new Timecard_Vo();
		if ("etc".equals(cmd)) { 
			// update tcetc
			response.setContentType("text/html");
			vo.setTcetc(tcetc);
			vo.setDay(selectedDay);
			vo.setMem_code((String) session.get("mem_code"));
			int res = Timecard_Dao.getDao().update_etc(vo);
			PrintWriter out = response.getWriter();
			out.println(res);
			out.flush();
			out.close();
		} else if ("etc_data".equals(cmd)) { 
			// select tcetc
			response.setContentType("text/html");
			vo.setDay(selectedDay);
			vo.setMem_code((String) session.get("mem_code"));
			String res = Timecard_Dao.getDao().select_work_etc(vo);
			PrintWriter out = response.getWriter();
			out.println(res);
			out.flush();
			out.close();
		} else if ("tcgoout_start".equals(cmd)) {
			// update tcgoout_start
			vo.setMem_code((String) session.get("mem_code"));
			int res = Timecard_Dao.getDao().update_goout_start(vo);

		} else if ("tcgoout_end".equals(cmd)) {
			// update tcgoout_end
			vo.setMem_code((String) session.get("mem_code"));
			int res = Timecard_Dao.getDao().update_goout_end(vo);
		} else if ("tcwork_end".equals(cmd)) {
			// update tcwork_end
			vo.setMem_code((String) session.get("mem_code"));
			int res = Timecard_Dao.getDao().update_work_end(vo);
			// 만약에 퇴근이 UPDATE 되면 'Y' 로 변화
			if (res > 0) Timecard_Dao.getDao().update_tc_state(vo);
		}
		return null;
	}

	public void setTcetc(String tcetc) {
		this.tcetc = tcetc;
	}

	public void setSelectedDay(String selectedDay) {
		this.selectedDay = selectedDay;
	}

	public void setCmd(String cmd) {
		this.cmd = cmd;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

}
