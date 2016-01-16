/**
* 작업 날짜 : 2015. 10. 20.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.user.board_L.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;
import com.user.board_L.dao.Board_Dao;
import com.user.board_L.vo.Board_Vo;
import com.user.board_L.vo.CommBoard_Vo;

public class ViewAction implements Action,SessionAware,Preparable{
	private Map<String, Object> session;
	private Board_Vo vo;
	private List<CommBoard_Vo> list;
	private int board_num;

	@Override
	public String execute() throws Exception {
		System.out.println("LOG NUM"+board_num);
		
		vo = Board_Dao.getDao().view(board_num);
		//list = Board_Dao.getDao().bbs_view(board_num);
		
		return SUCCESS;
	}

	public Board_Vo getVo() {
		return vo;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public List<CommBoard_Vo> getList() {
		return list;
	}

	public void setList(List<CommBoard_Vo> list) {
		this.list = list;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
		
	}

	@Override
	public void prepare() throws Exception {
		vo = new Board_Vo();
		
	}

}
