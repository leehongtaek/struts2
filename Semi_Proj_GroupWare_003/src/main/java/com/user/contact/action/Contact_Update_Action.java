/**
* 작업 날짜 : 2015. 10. 26.
* 구현 내용 :   
*  
* @author By ksw 
*/
package com.user.contact.action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.user.contact.dao.Contact_Dao;
import com.user.contact.vo.Company_Vo;
import com.user.contact.vo.Contact_Vo;

public class Contact_Update_Action implements Action, Preparable, ModelDriven<Company_Vo>{
	
	private Company_Vo companyvo;
	private int cont_num;
	
	
	
	public int getCont_num() {
		return cont_num;
	}

	public void setCont_num(int cont_num) {
		this.cont_num = cont_num;
	}

	@Override
	public String execute() throws Exception {
		
		System.out.println("comp_num 업데이트!!!!!!번호!!!!" + companyvo.getComp_num());
		Contact_Dao.getDao().updateCompany(companyvo);
		
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
