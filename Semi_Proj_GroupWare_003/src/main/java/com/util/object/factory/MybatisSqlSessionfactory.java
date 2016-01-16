/**
* 작업 날짜 : 2015. 10. 17.
* 구현 내용 :   
*  
* @author By Byeong Gi Kim 
*/
package com.util.object.factory;

import java.io.IOException;
import java.io.Reader;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisSqlSessionfactory {
	// SingleTon 구현부 
	private static SqlSessionFactory factory;
	private static Reader reader; // Mybatis 설정값을 읽는다.
	private MybatisSqlSessionfactory(){}; // 외부에서 생성자 접근을 막는다.
	static{
		try {
			reader = Resources.getResourceAsReader("config/mybatis/config-mybatis.xml");	
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	
	// 쓰레드의 동시 접근 문제를 해결하기 위해서 생성자에 접근시에  synchronized 키워드로 처리
	public synchronized static SqlSessionFactory getsqlSession(){
		if (factory==null) factory = new SqlSessionFactoryBuilder().build(reader);
		return factory;
	}
}
