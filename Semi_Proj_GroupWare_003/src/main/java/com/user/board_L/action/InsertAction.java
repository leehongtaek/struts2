/**
* 작업 날짜 : 2015. 10. 20.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.user.board_L.action;



import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.user.board_L.dao.Board_Dao;
import com.user.board_L.vo.Board_Vo;

public class InsertAction implements Preparable, ModelDriven<Board_Vo> {
	private Board_Vo vo;

	public String execute() throws Exception {
		Board_Dao.getDao().insertDB(vo);
		return "success";

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
