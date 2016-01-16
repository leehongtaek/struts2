/**
* 작업 날짜 : 2015. 10. 21.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.user.contact.action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.user.contact.dao.Contact_Dao;
import com.user.contact.vo.Contact_Vo;

public class Contact_Insert_Action implements Action, Preparable, ModelDriven<Contact_Vo>{

	private Contact_Vo contactvo;

	@Override
	public Contact_Vo getModel() {
		return contactvo;
	}
	@Override
	public void prepare() throws Exception {
		this.contactvo = new Contact_Vo();
		
	}
	@Override
	public String execute() throws Exception {
		
		System.out.println("입력폼에서 가져온값!!!!");
		
		System.out.println(contactvo.getCont_name());
		System.out.println(contactvo.getCont_num());
		System.out.println(contactvo.getComp_num());
		System.out.println(contactvo.getCont_tel());
		System.out.println(contactvo.getCont_post());
		System.out.println(contactvo.getCont_detailaddr());
		System.out.println(contactvo.getCont_roadaddr());
		System.out.println(contactvo.getCont_jibunaddr());
		System.out.println(contactvo.getCont_email());
		System.out.println(contactvo.getCont_regdate());
		System.out.println(contactvo.getComp_num());
		System.out.println(contactvo.getCont_etc());
		System.out.println(contactvo.getPosition_num());
		 
		
		Contact_Dao.getDao().insertContact(contactvo);
		return SUCCESS;
	}
	
	
	

}
