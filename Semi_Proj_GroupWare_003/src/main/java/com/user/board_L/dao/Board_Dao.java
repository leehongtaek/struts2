/**
* 작업 날짜 : 2015. 10. 20.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.user.board_L.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionException;

import com.user.board_L.vo.Board_Vo;
import com.user.board_L.vo.CommBoard_Vo;
import com.util.object.factory.MybatisSqlSessionfactory;
import com.util.paging.PagingUtill;

public class Board_Dao {
	private static Board_Dao dao;

	public static synchronized Board_Dao getDao() {
		if (dao == null)
			dao = new Board_Dao();
		return dao;
	}

	public int update(Board_Vo vo) {
		int res = 0;
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession(true);
		res = ss.update("board_L.up_board", vo);
		ss.close();
		return res;
	}

	public int delete(int board_num) {
		int res = 0;
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession(true);
		res = ss.delete("board_L.del_board", board_num);
		ss.close();
		return res;
	}

	// db에서 list 가져오기
	public List<Board_Vo> getList() {
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession();
		List<Board_Vo> list = ss.selectList("board_L.list");
		ss.close();
		return list;
	}

	// db에 컬럼값 넣기
	public void insertDB(Board_Vo v) {
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession(true);
		ss.insert("board_L.in_board", v);
		ss.close();
	}

	// list에서 제목 누르면 해당 제목의 detail.jsp
	public Board_Vo view(int board_num) {
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession();
		Board_Vo v = ss.selectOne("board_L.view_board", board_num);
		ss.close();
		return v;
	}

	// 댓글에 해당되는 메서드들 commin, bbs_view
	public void commin(CommBoard_Vo v) {
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession(true);
		ss.insert("", v);
		ss.close();
	}

	public List<CommBoard_Vo> bbs_view(int no) {
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession();
		List<CommBoard_Vo> list = ss.selectList("", no);
		ss.close();
		return list;
	}

	public void replyInsert(Board_Vo vo) {
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession();
		try {
			ss.update("", vo);
			ss.insert("", vo);
			ss.commit();
		} catch (Exception e) {
			e.printStackTrace();
			ss.rollback();
		}
	}

	public int cnt() {
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession();
		int res = ss.selectOne("board_L.total");
		ss.close();
		return res;

	}
	
	public int searchcnt(Board_Vo vo) {
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession();
		int res = ss.selectOne("board_L.searchcnt",vo);
		ss.close();
		return res;
		
	}

	public List<Board_Vo> pagingList(HashMap<String, Object> data) {
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession();
		List<Board_Vo> list = ss.selectList("board_L.paging", data);
		ss.close();
		return list;
	}
	
	public List<Board_Vo> search_paging_list(HashMap<String, Object> data) {
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession();
		List<Board_Vo> list = null;
		try {
			list = ss.selectList("board_L.search_paging_list", data);			
		} catch (SqlSessionException e) {
			e.printStackTrace();
		} finally{
			ss.close();			
		}
		return list;
	}
}
