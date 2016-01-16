/**
* 작업 날짜 : 2015. 10. 20.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.user.board_P.action;

import com.opensymphony.xwork2.Action;

public class ReplyAction_P implements Action {

		private int ref,seq,lvl;
		public String execute() throws Exception{
			System.out.println("ref, seq, lvl "+ref+":"+seq+":"+lvl);
			return SUCCESS;
		}
		public int getRef() {
			return ref;
		}
		public void setRef(int ref) {
			this.ref = ref;
		}
		public int getSeq() {
			return seq;
		}
		public void setSeq(int seq) {
			this.seq = seq;
		}
		public int getLvl() {
			return lvl;
		}
		public void setLvl(int lvl) {
			this.lvl = lvl;
		}
		
	}
