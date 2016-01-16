/**
* 작업 날짜 : 2015. 10. 20.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.user.board_L.action;

import java.util.List;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.user.board_L.dao.Board_Dao;
import com.user.board_L.vo.Board_Vo;

public class BoardListAction implements Action, Preparable, ModelDriven<Board_Vo> {
	private List<Board_Vo> list;
	private Board_Vo v;

	@Override
	public Board_Vo getModel() {

		return v;
	}

	@Override
	public void prepare() throws Exception {

		v = new Board_Vo();
	}

	@Override
	public String execute() throws Exception {
		//list = Board_Dao.getDao().getList();
		return SUCCESS;
	}

	public List<Board_Vo> getList() {
		return list;
	}

}
