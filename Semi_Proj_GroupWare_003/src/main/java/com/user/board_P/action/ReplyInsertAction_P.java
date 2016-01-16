/**
* 작업 날짜 : 2015. 10. 20.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.user.board_P.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;



import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.user.board_L.dao.Board_Dao;
import com.user.board_P.vo.Board_Vo;





//답변글 작성 후 폼에서 넘어온 값을 DAO로 전달하기 위한 액션
public class ReplyInsertAction_P implements Preparable, ModelDriven<Board_Vo>, ServletRequestAware {

	
	
		private Board_Vo vo;
		private HttpServletRequest reip;
		public String execute() throws Exception{
			vo.setReip(reip.getRemoteAddr());
			//Board_Dao.getDao().insertDB(vo);
			return "success";
		}
		
		@Override
		public void setServletRequest(HttpServletRequest reip) {
		this.reip=reip;
			
		}

		@Override
		public Board_Vo getModel() {
			// TODO Auto-generated method stub
			return vo;
		}

		@Override
		public void prepare() throws Exception {
			vo=new Board_Vo();
			
		}

}
