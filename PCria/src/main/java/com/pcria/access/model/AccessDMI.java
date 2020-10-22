package com.pcria.access.model;

public class AccessDMI extends AccessVO{
	//seat에서 사용하는 것들 
	private int myUpdInsChk;
	private int s_no;
	private int s_occupied;
	
	public int getMyUpdInsChk() {
		return myUpdInsChk;
	}
	public void setMyUpdInsChk(int myUpdInsChk) {
		this.myUpdInsChk = myUpdInsChk;
	}
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public int getS_occupied() {
		return s_occupied;
	}
	public void setS_occupied(int s_occupied) {
		this.s_occupied = s_occupied;
	}
}
