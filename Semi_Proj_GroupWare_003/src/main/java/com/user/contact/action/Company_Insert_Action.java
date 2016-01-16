/**
* 작업 날짜 : 2015. 10. 22.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.user.contact.action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.user.contact.dao.Contact_Dao;
import com.user.contact.vo.Company_Vo;

public class Company_Insert_Action implements Action, Preparable, ModelDriven<Company_Vo> {

	private Company_Vo companyvo;
	
	@Override
	public String execute() throws Exception {
	
		System.out.println(companyvo.getComp_name());
		System.out.println(companyvo.getComp_post());
		System.out.println(companyvo.getComp_roadaddr());
		System.out.println(companyvo.getComp_jibunaddr());
		System.out.println(companyvo.getComp_detailaddr());
		System.out.println(companyvo.getComp_tel());
		System.out.println(companyvo.getComp_home());
		
		Contact_Dao.getDao().insertCompany(companyvo);
		
		return SUCCESS;
	}
	@Override
	public Company_Vo getModel() {
		return companyvo;
	}
	@Override
	public void prepare() throws Exception {
		this.companyvo = new Company_Vo();
	}

	
	
}
