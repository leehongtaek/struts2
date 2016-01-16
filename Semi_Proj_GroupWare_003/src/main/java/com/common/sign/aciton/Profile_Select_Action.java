/**
* 작업 날짜 : 2015. 10. 22.
* 구현 내용 : 회원가입한 사용자의 정보를 가져옴  
*  
* @author By Byeong Gi Kim 
*/
package com.common.sign.aciton;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.common.sign.dao.Sign_Dao;
import com.common.sign.vo.Member_Vo;
import com.opensymphony.xwork2.Action;

public class Profile_Select_Action implements Action,SessionAware{
	private Map<String, Object> session;
	private Member_Vo vo;
	

	@Override
	public String execute() throws Exception {
		// 세션으로부터 사원코드를 가져와서 사용자의 정보를 가져옴
		vo=Sign_Dao.getDao().profile_info((String) session.get("mem_code"));
		return SUCCESS;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public Member_Vo getVo() {
		return vo;
	}
}
