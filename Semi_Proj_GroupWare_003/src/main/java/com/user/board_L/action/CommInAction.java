/**
* 작업 날짜 : 2015. 10. 20.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.user.board_L.action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.user.board_L.dao.Board_Dao;
import com.user.board_L.vo.CommBoard_Vo;

public class CommInAction implements Action, Preparable, ModelDriven<CommBoard_Vo> {

	private CommBoard_Vo cvo;
	private int board_num;

	@Override
	public CommBoard_Vo getModel() {
		// TODO Auto-generated method stub
		return cvo;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	@Override
	public void prepare() throws Exception {
		cvo = new CommBoard_Vo();
	}

	@Override
	public String execute() throws Exception {
		cvo.setTcode(board_num);
		Board_Dao.getDao().commin(cvo);
		return SUCCESS;
	}

}
