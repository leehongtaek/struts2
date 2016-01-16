/**
* 작업 날짜 : 2015. 10. 23.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.user.board_L.action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.user.board_L.dao.Board_Dao;
import com.user.board_L.vo.Board_Vo;

public class BoardModify_Action implements Action,ModelDriven<Board_Vo>,Preparable{
	private String cmd;
	private Board_Vo vo;
	@Override
	public String execute() throws Exception {
		System.out.println("LOG :::");
		String result="";
		if ("list".equals(cmd)) {
			System.out.println("LOG ::: UPDATE LIST");
			
			vo = Board_Dao.getDao().view(vo.getBoard_num());
			result= "updateform";
		}else if ("update".equals(cmd)){
			System.out.println("LOG ::: UPDATE UPDATE");
			
			System.out.println(vo.getBoard_title());
			System.out.println(vo.getBoard_content());
			System.out.println(vo.getBoard_num());
			Board_Dao.getDao().update(vo);
			
			result = "success";
		} else if ("delete".equals(cmd)){
			System.out.println("LOG ::: UPDATE delete");
		
			System.out.println(vo.getBoard_num());
			// 삭제
			Board_Dao.getDao().delete(vo.getBoard_num());
			
			result = "success";
		}
		return result;
	}
	public Board_Vo getVo() {
		return vo;
	}
	public void setCmd(String cmd) {
		this.cmd = cmd;
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
