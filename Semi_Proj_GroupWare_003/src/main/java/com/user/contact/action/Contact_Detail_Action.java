/**
* 작업 날짜 : 2015. 10. 23.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.user.contact.action;

import com.opensymphony.xwork2.Action;
import com.user.contact.dao.Contact_Dao;
import com.user.contact.vo.Contact_Vo;

public class Contact_Detail_Action implements Action {

	private int cont_num;
	private Contact_Vo contactvo;
	
	
	public void setCont_num(int cont_num) {
		this.cont_num = cont_num;
	}
	public Contact_Vo getContactvo() {
		return contactvo;
	}
	@Override
	public String execute() throws Exception {
		
		System.out.println("cont_num 디테일 넘버!!!!!!! : " + cont_num);
		
		contactvo = Contact_Dao.getDao().getDetailList(cont_num);
		System.out.println("회사이름 : " + contactvo.getComp_name());
		System.out.println("회사이름 : " + contactvo.getCont_name());
		return SUCCESS;
	}

	
}
