/**
* 작업 날짜 : 2015. 10. 18.
* 구현 내용 : Sign_Dao에서는 회원가입 정보 저장과 수정을 구현함
*  
* @author By kira 
*/
package com.common.sign.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionException;
import com.common.sign.vo.Member_Vo;
import com.util.object.factory.MybatisSqlSessionfactory;

public class Sign_Dao {
	private static Sign_Dao dao;
	private Sign_Dao(){}
	public static Sign_Dao getDao(){
		if(dao == null) dao= new Sign_Dao();
		return dao;
	}
	/**
	 * 회원 정보를 DB로 저장
	 * @param vo:(Member_Vo)
	 */
	public void sign_insert(Member_Vo vo){
		SqlSession ss=MybatisSqlSessionfactory.getsqlSession().openSession();
		try {
			ss.insert("sign.insert", vo);
		} catch (SqlSessionException e) {
			e.printStackTrace();
			
		} finally {		
			ss.commit();
			ss.close();
		}
	}
	
	/**
	 * 회원 아이디 중복 체크 
	 * @param mem_id
	 * @return
	 */
	public int idcheck (String mem_id){
		int res=0;
		SqlSession ss=MybatisSqlSessionfactory.getsqlSession().openSession();
		try {
			res=ss.selectOne("sign.idcheck", mem_id);
		} catch (SqlSessionException e) {
			e.printStackTrace();
			
		} finally {		
			ss.commit();
			ss.close();
		}
		return res;
	}
	
	
	
	/**
	 * 회원정보를 수정하기 위해서 사원의 정보를 가져옴
	 * @param mem_code :사원코드
	 * @return Member_Vo
	 */
	public Member_Vo profile_info(String mem_code){
		int res=0;
		SqlSession ss=MybatisSqlSessionfactory.getsqlSession().openSession();
		Member_Vo vo =null;
		try {
			vo=ss.selectOne("sign.profile_info", mem_code);
		} catch (SqlSessionException e) {
			e.printStackTrace();
			
		} finally {		
			ss.commit();
			ss.close();
		}
		return vo;
	}
	
	/**
	 * 회원정보를 수정함
	 * @param vo
	 * @return int:(1:정보수정성공 0:정보수정실패)
	 */
	public int profile_Update(Member_Vo vo){
		int res=0;
		SqlSession ss=MybatisSqlSessionfactory.getsqlSession().openSession();
		try {
			ss.update("sign.profile_update", vo);
		} catch (SqlSessionException e) {
			e.printStackTrace();
			
		} finally {		
			ss.commit();
			ss.close();
		}
		return res;
	}
	
	
}
