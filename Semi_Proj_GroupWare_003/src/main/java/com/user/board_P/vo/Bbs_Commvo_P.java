/**
* 작업 날짜 : 2015. 10. 20.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.user.board_P.vo;

public class Bbs_Commvo_P {
	
		private BoardInfo_Vo vo;
		private String writer;
		private int tcode;
		private int num;
		private String comm;
		private String pwd;
		private String reip;
		private String regdate;

		    public String getPwd() {
		        return pwd;
		    }

		    public void setPwd(String pwd) {
		        this.pwd = pwd;
		    }

		    public String getRegdate() {
		        return regdate;
		    }

		    public void setRegdate(String regdate) {
		        this.regdate = regdate;
		    }

		    public String getReip() {
		        return reip;
		    }

		    public void setReip(String reip) {
		        this.reip = reip;
		    }


		    public String getComm() {
		        return comm;
		    }

		    public void setComm(String comm) {
		        this.comm = comm;
		    }

		    public int getNum() {
		        return num;
		    }

		    public void setNum(int num) {
		        this.num = num;
		    }

		   
		    public int getTcode() {
		        return tcode;
		    }

		    public void setTcode(int tcode) {
		        this.tcode = tcode;
		    }

		    public BoardInfo_Vo getVo() {
		        return vo;
		    }

		    public void setVo(BoardInfo_Vo vo) {
		        this.vo = vo;
		    }

		    public String getWriter() {
		        return writer;
		    }

		    public void setWriter(String writer) {
		        this.writer = writer;
		    }
	}
