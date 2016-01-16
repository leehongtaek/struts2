/**
* 작업 날짜 : 2015. 10. 20.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.user.board_L.vo;

public class CommBoard_Vo {
	private int comm_num;
	private int board_num;
	private String comm_content;
	private int board_lvl;
	private int board_ref;
	private int board_seq;
	private int tcode;
	private String reip;
	
	public int getTcode() {
		return tcode;
	}

	public String getReip() {
		return reip;
	}

	public void setReip(String reip) {
		this.reip = reip;
	}

	public void setTcode(int tcode) {
		this.tcode = tcode;
	}

	public int getComm_num() {
		return comm_num;
	}

	public void setComm_num(int comm_num) {
		this.comm_num = comm_num;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public String getComm_content() {
		return comm_content;
	}

	public void setComm_content(String comm_content) {
		this.comm_content = comm_content;
	}

	public int getBoard_lvl() {
		return board_lvl;
	}

	public void setBoard_lvl(int board_lvl) {
		this.board_lvl = board_lvl;
	}

	public int getBoard_ref() {
		return board_ref;
	}

	public void setBoard_ref(int board_ref) {
		this.board_ref = board_ref;
	}

	public int getBoard_seq() {
		return board_seq;
	}

	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}

}
