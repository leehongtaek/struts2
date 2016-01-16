/**
* 작업 날짜 : 2015. 10. 20.
* 구현 내용 :   
*  
* @author By Byeong Gi Kim 
*/
package com.common.sign.dao;

import org.apache.ibatis.session.SqlSession;
import com.common.sign.vo.Member_Vo;
import com.util.object.factory.MybatisSqlSessionfactory;

public class LogIn_Dao {
	private static LogIn_Dao dao;
	private LogIn_Dao(){};
	public static LogIn_Dao getDao(){
		if (dao==null) dao = new LogIn_Dao();
		return dao;
	}
	
	/**
	 * 사용자의 정보가 존재하는지 여부를 검사함
	 * @param vo:(Memver_Vo) 
	 * @return int:(사용자의 존재여부 판단 0:사용자존재하지 않음  1:사용자가 존재함)
	 */
	public int logInChk(Member_Vo vo){
		int res;
		SqlSession ss=MybatisSqlSessionfactory.getsqlSession().openSession();
		res=(int)ss.selectOne("sign.logincheck", vo);
		ss.close();
		return res;
	}
	
	/**
	 * 사용자의 정보를 가져옴
	 * @param vo:(Memver_Vo) 
	 * @return Memver_Vo
	 */
	public Member_Vo logIn(Member_Vo vo){
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession();
		vo= ss.selectOne("sign.login", vo);
		ss.close();
		return vo;
	}
}
