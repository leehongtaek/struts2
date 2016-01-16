/**
* 작업 날짜 : 2015. 10. 20.
* 구현 내용 :   
*  
* @author By kosta 
*/
package com.user.scheduler.dao;

import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import org.apache.ibatis.session.SqlSession;

import com.user.scheduler.vo.ScheduleVO;
import com.util.object.factory.MybatisSqlSessionfactory;

public class ScheduleDAO {
	private static ScheduleDAO dao;
	
	
	
	private ScheduleDAO() {
	}

	public static ScheduleDAO getDao() {
		if(dao == null) dao = new ScheduleDAO();
		return dao;
	}
	public void addSchedule(ScheduleVO v){
		System.out.println(v.getSched_evnet());
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession(true);
		ss.insert("scheduler.insertsc",v);
		ss.commit();
		ss.close();
	}
	public List<HashMap<String, String>> getlist(String mem_code){
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession();
		List<HashMap<String, String>> list = ss.selectList("scheduler.getAllsc",mem_code);

		ss.close();
		return list;
	}
	public List<ScheduleVO> getModalList(HashMap<String, String> hmap){

		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession(true);
		List<ScheduleVO> list = ss.selectList("scheduler.getDaysc",hmap);
		ss.close();
		return list;
	}
	public void del_sched(int m){
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession(true);
		//map.get("sched_evnet");
		ss.delete("scheduler.deletesc",m);
		ss.close();
	}
	public void update_sched(int m){
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession(true);
		ss.update("updatesc",m);
		ss.close();
	}
}
