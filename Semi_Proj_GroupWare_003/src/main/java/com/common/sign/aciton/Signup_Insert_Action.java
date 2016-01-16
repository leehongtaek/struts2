/**
* 작업 날짜 : 2015. 10. 18.
* 구현 내용 : 회원 가입 정보를 DB로 INSERT 시킴  
*  
* @author By Byeong Gi Kim
*/
package com.common.sign.aciton;

import com.common.sign.dao.Sign_Dao;
import com.common.sign.vo.Member_Vo;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

public class Signup_Insert_Action implements Action, Preparable,ModelDriven<Member_Vo>{
	private Member_Vo vo;
	@Override
	public String execute() throws Exception {
		// insert 하면 Check 후에 index 페이지로 이동
		Sign_Dao.getDao().sign_insert(vo);
		return SUCCESS;
	}
	
	@Override
	public Member_Vo getModel() {
		return vo;
	}
	
	@Override
	public void prepare() throws Exception {
		vo = new Member_Vo();
	}

}
