/**
* 작업 날짜 : 2015. 10. 24.
* 구현 내용 :   
*  
* @author By kira 
*/
package com.common.sign.aciton;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.interceptor.ServletResponseAware;
import com.common.sign.dao.Sign_Dao;
import com.opensymphony.xwork2.Action;

public class Id_chk_Action implements Action,ServletResponseAware{
	private String mem_id;
	private HttpServletResponse response;
	
	@Override
	public String execute() throws Exception {
		System.out.println("LOG ::: mem_ID"+mem_id);
		int res =Sign_Dao.getDao().idcheck(this.mem_id);
		PrintWriter out =response.getWriter();
		out.println(res);
		out.flush();
		out.close();
		return null;
	}
	
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}
}
