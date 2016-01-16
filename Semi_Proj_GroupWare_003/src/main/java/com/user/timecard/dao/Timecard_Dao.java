/**
* 작업 날짜 : 2015. 10. 21.
* 구현 내용 : TIME CARD DAO , TIME CARD UPDATE , SLECECT 구현 
*  
* @author By Byeong Gi Kim 
*/
package com.user.timecard.dao;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import com.user.timecard.vo.Timecard_Vo;
import com.util.object.factory.MybatisSqlSessionfactory;

public class Timecard_Dao {
	// ====================== TIMECARD_DAO SINGLETON PATTAN START ==================
	private static Timecard_Dao dao;
	private Timecard_Dao() {}
	public static Timecard_Dao getDao(){
		if (dao==null) dao = new Timecard_Dao();
		return  dao;
	}
	// ====================== TIMECARD_DAO SINGLETON PATTAN END  ===================
	
	
	
	
	
	
	// ======================== TIMECARD_DAO METHOD START  =========================
	
	/**
	 * TIME CARD DATA의 총 합계를 구한다.
	 * @return int: (TOTAL COUNT)
	 */
	public int cnt(){
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession();
		int res= ss.selectOne("timecard.total");
		ss.close();
		return res;
	}
	
	/**
	 * pagindata를 받아서 TIMECARD DATA들을 LIST<Timecard_Vo>
	 * @param pagingdata : 페이지에 필요한  DATA START_ROW  & END ROW (pagingdata)
	 * @return List<Timecard_Vo> : Timecard vo 를 담은 List
	 */
	public List<Timecard_Vo> pagingList(HashMap<String, Object> pagingdata){
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession();
		List<Timecard_Vo> list = ss.selectList("timecard.paging",pagingdata);
		ss.close();
		return list;
	}
	
	@Deprecated // list() pagingList() 메소드로 대체함
	public List<Timecard_Vo> list(Timecard_Vo vo){
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession();
		List<Timecard_Vo> list =ss.selectList("timecard.list", vo);
		ss.close();
		return list;
	}

	/**
	 * 사원 번호를 통해서 출근시간을 출근 INSERT 여부를 확인함
	 * @param mem_code:String (사원번호)
	 * @return int:(Query success check)
	 */
	public int work_start_chk(String mem_code){
		int res=0;
		SqlSession  ss = MybatisSqlSessionfactory.getsqlSession().openSession();
		res = ss.selectOne("timecard.work_start_check", mem_code);
		ss.close();
		return res; 
	}
	
	/**
	 * 출근 시간을 체크한다.
	 * @param vo
	 * @return int:(Query success check)
	 */
	public int insert_work_start(Timecard_Vo vo){
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession(true);
		int res= ss.insert("timecard.insert_work_start", vo);
		ss.close();
		return res;
	}
	/**
	 * TIMECARD의 비고 정보를 반환한다.
	 * @param vo
	 * @return String: TIMECARD 비고 정보 반환
	 */
	public String select_work_etc(Timecard_Vo vo){
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession();
		String etc =ss.selectOne("timecard.select_work_etc", vo);
		ss.close();
		return etc;
	}
	
	// ▼ 아래 메소드는 모두 UPDATE 문 구현 
	public int update_work_start(Timecard_Vo vo){
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession(true);
		int res = ss.update("timecard.update_work_start", vo);
		ss.close();
		return res;
	}
	
	public int update_work_end(Timecard_Vo vo){
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession(true);
		int res = ss.update("timecard.update_work_end", vo);
		ss.close();
		return res;
	}
	public int update_goout_start(Timecard_Vo vo){
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession(true);
		int res=ss.update("timecard.update_goout_start", vo);
		ss.close();
		return res;
	}
	public int update_goout_end(Timecard_Vo vo){
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession(true);
		int res = ss.update("timecard.update_goout_end", vo);
		ss.close();
		return res;

	}
	public int update_etc(Timecard_Vo vo){
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession(true);
		int res= ss.update("timecard.update_etc", vo);
		ss.commit();
		ss.close();
		return res;
	}
	
	public int update_tc_state(Timecard_Vo vo){
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession(true);
		int res= ss.update("timecard.update_tc_state", vo);
		ss.commit();
		ss.close();
		return res;
	}
	// ====================== TIMECARD_DAO METHOD END ===================
}
