/**
* 작업 날짜 : 2015. 10. 20.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.user.board_L.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.user.board_L.dao.Board_Dao;
import com.user.board_L.vo.Board_Vo;

public class ReplyInsertAction implements Preparable, ModelDriven<Board_Vo>, ServletRequestAware {
	private Board_Vo vo;
	private HttpServletRequest reip;

	public String execute() throws Exception {
		vo.setReip(reip.getRemoteAddr());
		Board_Dao.getDao().replyInsert(vo);
		return "success";
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		this.reip = reip;

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
