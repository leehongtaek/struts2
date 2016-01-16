/**
* 작업 날짜 : 2015. 10. 20.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.user.board_P.action;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.user.board_P.dao.board_Dao;
import com.user.board_P.vo.Board_Vo;
import com.user.board_P.vo.PagingVO_P;

public class BoardListAction_P extends ActionSupport {
	private List<Board_Vo> list;
	private String pagingCode;
	private int nowPage;

	public BoardListAction_P() {
		nowPage = 1;
	}

	// 리스트 게터 나우페이지 세터
	public String execute() throws Exception {
		int numPerPage = 5;
		int numPerBlock = 5;
		
		/*int total = board_Dao.getDao().getTotalCount();
		System.out.println("total :" + total);
		String url = "boardList";*/
		//paging_P_service page = new paging_P_service(total, nowPage, numPerPage, numPerBlock, url);

		//pagingCode = page.getPagingCode();
		System.out.println(pagingCode);
		System.out.println("=================================");
		int start = (nowPage - 1) * numPerPage + 1;
		int end = start + numPerPage - 1;
		System.out.println("start :" + start);
		System.out.println("end : " + end);
		// 페이지 영역값을 Dao에게 전달 후 list를 반환
		/*list = board_Dao.getDao().getList(new PagingVO_P(start, end));*/
		return SUCCESS;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public List<Board_Vo> getList() {
		return list;
	}

	public String getPagingCode() {
		return pagingCode;
	}

}
