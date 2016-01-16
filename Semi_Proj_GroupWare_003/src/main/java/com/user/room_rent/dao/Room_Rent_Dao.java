/**
* 작업 날짜 : 2015. 10. 20.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.user.room_rent.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.user.room_rent.vo.Rent_Vo;
import com.user.room_rent.vo.Room_Vo;
import com.util.object.factory.MybatisSqlSessionfactory;

public class Room_Rent_Dao {
	private static Room_Rent_Dao rrDao;
	public static synchronized Room_Rent_Dao getDao(){
		if(rrDao == null) rrDao = new Room_Rent_Dao();
		return rrDao;
	}
	public void roomAdd(Room_Vo v) {
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession(true); // auto commit - true
		ss.insert("room_Rent.room_Insert",v);
		ss.close();
	}
	
	public void rentAdd(Rent_Vo v){
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession(true);
		ss.insert("room_Rent.rent_Insert",v);
		ss.close();
	}
	
	public List<Room_Vo> getRoomList(){
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession();
		List<Room_Vo> list = ss.selectList("room_Rent.room_List");
		ss.close();
		return list;
	}
	
	public List<Rent_Vo> getRentList(){
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession();
		List<Rent_Vo> list = ss.selectList("room_Rent.rent_List");
		ss.close();
		return list;
	}
	
	public Room_Vo getRoomDetail(int num){
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession();
		Room_Vo vo = ss.selectOne("room_Rent.room_Detail",num);
		ss.close();
		return vo;
	}
	
	public List<Rent_Vo> getRentDetail(String date){
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession();
		List<Rent_Vo> de_list = ss.selectList("room_Rent.rent_Detail",date);
		ss.close();
		return de_list;
	}

}
