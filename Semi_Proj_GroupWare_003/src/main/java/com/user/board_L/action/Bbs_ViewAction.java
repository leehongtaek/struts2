/**
* 작업 날짜 : 2015. 10. 20.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.user.board_L.action;

import java.util.List;

import com.opensymphony.xwork2.Action;
import com.user.board_L.dao.Board_Dao;
import com.user.board_L.vo.CommBoard_Vo;

public class Bbs_ViewAction implements Action {

	private int board_num;
	private List<CommBoard_Vo> list;

	@Override
	public String execute() throws Exception {
		Board_Dao.getDao().view(board_num);
		return SUCCESS;
	}

	public List<CommBoard_Vo> getList() {
		return list;
	}

	public void setNo(int board_num) {
		this.board_num = board_num;
	}

	public void setList(List<CommBoard_Vo> list) {
		this.list = list;
	}
}
