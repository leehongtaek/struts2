/**
* 작업 날짜 : 2015. 10. 20.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.user.board_P.action;

import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.user.board_L.dao.Board_Dao;
import com.user.board_P.vo.Board_Vo;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;

public class InsertAction_P implements Preparable, ModelDriven<Board_Vo>,
ServletRequestAware{



	private Board_Vo vo;
	private HttpServletRequest reip;
	public String execute() throws Exception {
		vo.setReip(reip.getRemoteAddr());
		//Board_Dao.getDao().insertDB(vo);
		return "success";
	}
	public void prepare() throws Exception {
		vo = new Board_Vo();
	}
	public Board_Vo getModel() {
		return vo;
	}
	public void setServletRequest(HttpServletRequest reip) {
		this.reip = reip;
	}
}
