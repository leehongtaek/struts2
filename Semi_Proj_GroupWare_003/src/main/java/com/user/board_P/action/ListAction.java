/**
* 작업 날짜 : 2015. 10. 20.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.user.board_P.action;


	import java.util.List;

	import com.opensymphony.xwork2.ActionSupport;
import com.user.board_P.dao.board_Dao;
import com.user.board_P.vo.Board_Vo;



public class ListAction extends ActionSupport {

		private List<Board_Vo> list;
		
		@Override
		public String execute() throws Exception {
			
			list = board_Dao.getDao().getList();
			return SUCCESS;
		}
		public List<Board_Vo> getList() {
			return list;
		}
		
	}


