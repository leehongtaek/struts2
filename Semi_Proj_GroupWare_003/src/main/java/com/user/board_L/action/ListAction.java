/**
* 작업 날짜 : 2015. 10. 20.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.user.board_L.action;

import java.util.HashMap;
import java.util.List;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.sun.org.apache.regexp.internal.recompile;
import com.user.board_L.dao.Board_Dao;
import com.user.board_L.vo.Board_Vo;
import com.util.paging.PagingUtill;

public class ListAction implements Action, Preparable, ModelDriven<Board_Vo> {
	private List<Board_Vo> list;
	private HashMap<String, Object> pagingData;
	private int currentpage;
	private Board_Vo vo;

	@Override
	public String execute() throws Exception {
		String result = "";

		if (vo.getSearchValue() == null || vo.getSearchType() == null) {
			
			result=paging_list();
			
			
		} else if (vo.getSearchValue() != null && vo.getSearchType() != null) {
			result=search_paging_list();
		}

		return result;
	}

	public String paging_list() {
		// 1. 페이지 유틸을 생성
		int total_record = Board_Dao.getDao().cnt();
		int page_per_record_cnt = 10; // 페이지에서 보여줄 게시물 수
		int group_per_page_cnt = 5; // 페이지의 갯수
		if (currentpage == 0) {
			currentpage = 1; // 현재 페이지

		}
		PagingUtill pg = new PagingUtill(total_record, page_per_record_cnt, group_per_page_cnt, currentpage);
		pagingData = (HashMap<String, Object>) pg.page_dataMap();
		list = Board_Dao.getDao().pagingList(pagingData);

		return "success";
	}
	
	
	public String search_paging_list(){
		
		int page_per_record_cnt = 10; // 페이지에서 보여줄 게시물 수
		int group_per_page_cnt = 5; // 페이지의 갯수
		if (currentpage == 0) {
			currentpage = 1; // 현재 페이지
		}
		int total_record = Board_Dao.getDao().searchcnt(vo);
		
		if(total_record <=0) return paging_list();		
		
		// paging 처리를 실시함
		PagingUtill pg = new PagingUtill(total_record, page_per_record_cnt, group_per_page_cnt, currentpage);
		pagingData = (HashMap<String, Object>) pg.page_dataMap();
		pagingData.put("searchType", vo.getSearchType());
		pagingData.put("searchValue", vo.getSearchValue());
		list = Board_Dao.getDao().search_paging_list(pagingData); 
		
		return "success";
	}

	public void setCurrentpage(int currentpage) {
		this.currentpage = currentpage;
	}

	public HashMap<String, Object> getPagingData() {
		return pagingData;
	}

	public List<Board_Vo> getList() {
		return list;
	}

	@Override
	public Board_Vo getModel() {
		return vo;
	}

	@Override
	public void prepare() throws Exception {
		vo = new Board_Vo();
	}

}
