/**
* 작업 날짜 : 2015. 10. 20.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.user.board_P.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.user.board_P.vo.Board_Vo;
import com.user.board_P.vo.PagingVO_P;
import com.util.object.factory.MybatisSqlSessionfactory;

public class board_Dao {

	private static board_Dao dao;

	public static synchronized board_Dao getDao() {
		if (dao == null)
			dao = new board_Dao();
		return dao;
	}

	public void insert(Board_Vo vo) {
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession(true);
		ss.insert("board_P.insert", vo);
		ss.close();

	}
	//db에서 list
	public List<Board_Vo> getList() {
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession();
		List<Board_Vo> list = ss.selectList("board_P.list");
		ss.close();
		return list;
	}

	/*public int getTotalCount() {
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession();
		int cnt = ss.selectOne("");
		ss.close();
		return cnt;

	}*/

	public void hitCnt(int no) {
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession(true);
		ss.update("", no);
		ss.close();
	}

	public Board_Vo getDetail(int no) {
		SqlSession ss = MybatisSqlSessionfactory.getsqlSession().openSession();
		Board_Vo v = ss.selectOne("", no);
		ss.close();
		return v;
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
}

