package com.pcria.main.model;

public class SeatVO {
	private int s_no;
	private String s_val;
	private int u_no;
	private int s_occupied;
	
	public int getU_no() {
		return u_no;
	}
	public void setU_no(int u_no) {
		this.u_no = u_no;
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
	public String getS_val() {
		return s_val;
	}
	public void setS_val(String s_val) {
		this.s_val = s_val;
	}
}
