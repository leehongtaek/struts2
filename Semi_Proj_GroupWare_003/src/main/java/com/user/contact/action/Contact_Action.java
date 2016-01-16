/**
* 작업 날짜 : 2015. 10. 20.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.user.contact.action;

import java.util.HashMap;
import java.util.List;

import com.opensymphony.xwork2.Action;
import com.user.board_L.dao.Board_Dao;
import com.user.contact.dao.Contact_Dao;
import com.user.contact.vo.Contact_Vo;
import com.util.paging.PagingUtill;

public class Contact_Action implements Action {

	List<Contact_Vo> list;
	private HashMap<String, Object> pagingData;
	private int currentpage;

	public List<Contact_Vo> getList() {
		return list;
	}

	public HashMap<String, Object> getPagingData() {
		return pagingData;
	}

	public void setCurrentpage(int currentpage) {
		this.currentpage = currentpage;
	}

	@Override
	public String execute() throws Exception {
		// list = Contact_Dao.getDao().getList();

		// 1. 페이지 유틸을 생성
		int total_record = Contact_Dao.getDao().cnt();
		int page_per_record_cnt = 10; // 페이지에서 보여줄 게시물 수
		int group_per_page_cnt = 5; // 페이지의 갯수
		if (currentpage == 0) {
			currentpage = 1; // 현재 페이지

		}
		PagingUtill pg = new PagingUtill(total_record, page_per_record_cnt, group_per_page_cnt, currentpage);
		pagingData = (HashMap<String, Object>) pg.page_dataMap();

		list = Contact_Dao.getDao().pagingList(pagingData);
		System.out.println("사원이름 : " + list.get(0).getCont_name());
		System.out.println("회사이름 : " + list.get(0).getComp_name());
		

		return SUCCESS;
	}
}
