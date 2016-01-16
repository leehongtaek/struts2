/**
* 작업 날짜 : 2015. 10. 20.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.user.board_P.action;


import java.util.List;

import com.opensymphony.xwork2.Action;
import com.user.board_L.dao.Board_Dao;
import com.user.board_L.vo.CommBoard_Vo;

public class ViewAction implements Action {

	private int no;
	private List<CommBoard_Vo> list;

	@Override
	public String execute() throws Exception {
		Board_Dao.getDao().view(no);
		return SUCCESS;
	}

	public List<CommBoard_Vo> getList() {
		return list;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public void setList(List<CommBoard_Vo> list) {
		this.list = list;
	}
}
