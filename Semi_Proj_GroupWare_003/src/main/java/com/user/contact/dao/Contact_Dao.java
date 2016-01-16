/**
* 작업 날짜 : 2015. 10. 20.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.user.contact.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.user.contact.vo.Company_Vo;
import com.user.contact.vo.Contact_Vo;
import com.util.object.factory.MybatisSqlSessionfactory;

public class Contact_Dao {

	private static Contact_Dao dao;
	
	private Contact_Dao() {
	}
	
	public static synchronized Contact_Dao getDao(){
		
		if(dao == null) dao = new Contact_Dao();
		return dao;
	}
	
	//페이징 전 리스트!!
	public List<Contact_Vo> getList() {
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession();
		List<Contact_Vo> list = ss.selectList("contact.all_List");
		ss.close();
		return list;
	}
	
	//pagin 리스트
	public List<Contact_Vo> pagingList(HashMap<String, Object> data) {
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession();
		List<Contact_Vo> list = ss.selectList("contact.paging",data);
		ss.close();
		return list;
	}

	public List<Company_Vo> getSearchCompany_List(Company_Vo companyvo) {
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession();
		List<Company_Vo> list = ss.selectList("contact.companySearch_List", companyvo);
		ss.close();
		return list;
	}

	public void insertContact(Contact_Vo contactvo) {
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession(true);
		ss.insert("contact.contact_Insert", contactvo);
		ss.close();
	}

	public void insertCompany(Company_Vo companyvo) {
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession(true);
		ss.insert("contact.company_Insert", companyvo);
		ss.close();
	}

	public int cnt() {
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession();
		int res = ss.selectOne("contact.total");
		ss.close();
		return res;
	}

	public Contact_Vo getDetailList(int cont_num) {
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession();
		Contact_Vo contactvo = ss.selectOne("contact.detail_List",cont_num);
		ss.close();
		return contactvo;
	}

	public void updateCompany(Company_Vo companyvo) {
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession(true);
		ss.update("contact.contact_Update", companyvo);
		ss.close();
	}
	
	
	
}
