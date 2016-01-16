/**
* 작업 날짜 : 2015. 10. 20.
* 구현 내용 : Login_Actiond에서 로그인 후 , Session에 사용자의 정보를 저장함
*  
* @author By Byeong Gi Kim 
*/
package com.common.sign.aciton;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import com.common.sign.dao.LogIn_Dao;
import com.common.sign.vo.Member_Vo;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.user.timecard.dao.Timecard_Dao;
import com.user.timecard.vo.Timecard_Vo;

public class LogIn_Action implements Action, Preparable,ModelDriven<Member_Vo>,SessionAware{
	private Map<String, Object> session;
	private Member_Vo vo;

	@Override
	public String execute() throws Exception {
		
		// 로그인한 사용자가 존재하는지 검사 -> 존재한다면 오직 유일한 1명일때 세션에 사용자 정보 저장
		int res=LogIn_Dao.getDao().logInChk(vo);
		if (res == 1) {
			// 사용자의 정보를 가져와서 Session에 사용자 정보를 저장
			vo = LogIn_Dao.getDao().logIn(vo);
			session.put("mem_id", vo.getMem_id());             // 사원ID
			session.put("mem_name", vo.getMem_name());		   // 사원이름
			session.put("mem_role", vo.getMem_role());		   // 사원역할
			session.put("mem_code", vo.getMem_code());		   // 사원코드
			session.put("dept_num", vo.getDept_num());		   // 부서번호
			session.put("position_num", vo.getPosition_num()); // 직위번호
			session.put("mem_email", vo.getMem_email());       // 이메일 
			// 사용자가 로그인 시 출근 체크 
			Timecart_work_start(vo.getMem_code());
			
			return SUCCESS;
		}
			return ERROR;
	}
	/**
	 * 사용자가 로그인시 출근 시간을 자동으로 체크한다.
	 * @param String:mem_code(사원코드)
	 * 
	 */
	public void Timecart_work_start(String mem_code){
		Timecard_Vo tvo = new Timecard_Vo();
		tvo.setMem_code(mem_code);
		// 출근 체크가 되지 않았다면 체크함
		int res = Timecard_Dao.getDao().work_start_chk(mem_code);
		if(res == 0) Timecard_Dao.getDao().insert_work_start(tvo);
	}
	
	public Member_Vo getVo() {
		return vo;
	}

	public void setVo(Member_Vo vo) {
		this.vo = vo;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
	
	@Override
	public Member_Vo getModel() {
		return vo;
	}
	

	@Override
	public void prepare() throws Exception {
		vo = new Member_Vo();
	}
}
