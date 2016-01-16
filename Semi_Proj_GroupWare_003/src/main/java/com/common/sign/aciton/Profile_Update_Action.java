/**
* 작업 날짜 : 2015. 10. 22.
* 구현 내용 : 회원가입한 사용자의 정보를 수정함  
*  
* @author By Byeong Gi Kim 
*/
package com.common.sign.aciton;

import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;
import com.common.sign.dao.Sign_Dao;
import com.common.sign.vo.Member_Vo;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

public class Profile_Update_Action implements Action, Preparable,ModelDriven<Member_Vo>,SessionAware{
	private Member_Vo vo;
	private Map<String, Object> session;
	
	@Override
	public String execute() throws Exception {	
		// 사원코드를 기준으로 UPDATE를 함
		vo.setMem_code((String) session.get("mem_code"));
		Sign_Dao.getDao().profile_Update(vo);
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

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
		
	}

}
