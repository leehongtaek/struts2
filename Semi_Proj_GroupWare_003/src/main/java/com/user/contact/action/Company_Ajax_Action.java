/**
* 작업 날짜 : 2015. 10. 22.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.user.contact.action;

import java.util.List;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletResponseAware;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.user.contact.dao.Contact_Dao;
import com.user.contact.vo.Company_Vo;

public class Company_Ajax_Action implements Action,Preparable,ModelDriven<Company_Vo> ,ServletResponseAware{

	private Company_Vo companyvo;
	private List<Company_Vo> list;
	private StringBuffer msg; 
	private HttpServletResponse resp;
	
	@Override
	public String execute() throws Exception {
		
		list = Contact_Dao.getDao().getSearchCompany_List(companyvo);
		msg = new StringBuffer();
		
		for(Company_Vo vo : list) {
			System.out.println("회사이름"+vo.getComp_name());
		
			msg.append("<tr>");
			msg.append("<input type='hidden' name='comp_num' id='comp_num" + vo.getComp_num() + "'" + "value='"+vo.getComp_num()+"'/>");
			msg.append("<input type='hidden' name='comp_nameVal' id='comp_nameVal" + vo.getComp_num() + "'" + "value='"+vo.getComp_name()+"'/>");
			msg.append("<td><button type='button' class='btn btn-default' data-dismiss='modal' onclick='test1("+vo.getComp_num()+")'>"+ vo.getComp_name() +"</button></td>");
			msg.append("<td>"+ vo.getComp_jibunaddr() +"</td>");
			msg.append("<td>"+ vo.getComp_tel() +"</td>");
			msg.append("<td>"+ vo.getComp_home() +"</td>");
			msg.append("</tr>");
		}
		//HttpServletResponse 객체를 받아서 결과값을 바로 보낸다.
		System.out.println(msg);
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html");
		resp.getWriter().println(msg);
		
		return null;
	}
	@Override
	public Company_Vo getModel() {
		return companyvo;
	}
	@Override
	public void prepare() throws Exception {
		this.companyvo = new Company_Vo();
	}
	public List<Company_Vo> getList() {
		return list;
	}
	public StringBuffer getMsg() {
		return msg;
	}
	@Override
	public void setServletResponse(HttpServletResponse resp) {
		this.resp = resp;
	}
}
