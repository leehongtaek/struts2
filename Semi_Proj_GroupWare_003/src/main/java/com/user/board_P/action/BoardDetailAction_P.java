/**
* 작업 날짜 : 2015. 10. 20.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.user.board_P.action;

	import com.opensymphony.xwork2.Action;
import com.user.board_P.dao.board_Dao;
import com.user.board_P.vo.Board_Vo;


	
	// list에서 제목을 클릭했을 때 no 값을 파라미터로 받아 오면서 실행되는 Detail객체
	public class BoardDetailAction_P implements Action{

		private int no;
		private Board_Vo vo;
		@Override
		public String execute() throws Exception {
			board_Dao dao = board_Dao.getDao();
			dao.hitCnt(no);
			vo=dao.getDetail(no);
			return SUCCESS;
		}
		public int getNo() {
			return no;
		}
		public void setNo(int no) {
			this.no = no;
		}
		public Board_Vo getVo() {
			return vo;
		}

		
}
