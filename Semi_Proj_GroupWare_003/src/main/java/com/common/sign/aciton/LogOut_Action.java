/**
* 작업 날짜 : 2015. 10. 20.
* 구현 내용 : LOGOUT 구현  
*  
* @author By Byeong Gi Kim 
*/
package com.common.sign.aciton;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.Action;

public class LogOut_Action implements Action,SessionAware{
	private Map<String, Object> session;
	


	@Override
	public String execute() throws Exception {
		// LOG-OUT 시 모든 세션의 정보를 삭제 
		session.clear();
		return SUCCESS;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}

}
