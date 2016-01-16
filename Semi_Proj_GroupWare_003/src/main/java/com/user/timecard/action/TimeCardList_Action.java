/**
* 작업 날짜 : 2015. 10. 21.
* 구현 내용 :   
*  
* @author By Byeong Gi Kim 
*/
package com.user.timecard.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.Action;
import com.user.board_L.dao.Board_Dao;
import com.user.timecard.dao.Timecard_Dao;
import com.user.timecard.vo.Timecard_Vo;
import com.util.paging.PagingUtill;

public class TimeCardList_Action implements Action, SessionAware {
	private Map<String, Object> session;
	private List<Timecard_Vo> list;
	private HashMap<String, Object> pagingData;
	private int currentpage; // 현재 페이지

	@Override
	public String execute() throws Exception {
		// session으로부터 mem_code를 가져옴
		String id = (String) session.get("mem_code");
		int total_record = Timecard_Dao.getDao().cnt();
		int page_per_record_cnt = 30; // 페이지에서 보여줄 게시물 수
		int group_per_page_cnt = 3; // 페이지의 갯수
		if (currentpage == 0) { // default 값 : page no = 1 
			currentpage = 1; 
		}
		PagingUtill pg = new PagingUtill(total_record, page_per_record_cnt, group_per_page_cnt, currentpage);
		pagingData = (HashMap<String, Object>) pg.page_dataMap();
		pagingData.put("mem_code", id);
		list = Timecard_Dao.getDao().pagingList(pagingData);
		return SUCCESS;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public List<Timecard_Vo> getList() {
		return list;
	}

	public HashMap<String, Object> getPagingData() {
		return pagingData;
	}

	public void setCurrentpage(int currentpage) {
		this.currentpage = currentpage;
	}

}
