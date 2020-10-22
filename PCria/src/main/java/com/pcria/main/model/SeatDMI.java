package com.pcria.main.model;

import java.util.List;

public class SeatDMI extends SeatVO{
	private int myS_no;
	private int myS_occupied;
	private int myUpdInsChk;
	private String myS_val;
	
	private List<SeatVO> ajaxSelSeat;
	
	public int getMyS_no() {
		return myS_no;
	}
	public void setMyS_no(int myS_no) {
		this.myS_no = myS_no;
	}
	public int getMyS_occupied() {
		return myS_occupied;
	}
	public void setMyS_occupied(int myS_occupied) {
		this.myS_occupied = myS_occupied;
	}
	public String getMyS_val() {
		return myS_val;
	}
	public void setMyS_val(String myS_val) {
		this.myS_val = myS_val;
	}
	public List<SeatVO> getAjaxSelSeat() {
		return ajaxSelSeat;
	}
	public void setAjaxSelSeat(List<SeatVO> ajaxSelSeat) {
		this.ajaxSelSeat = ajaxSelSeat;
	}
	public int getMyUpdInsChk() {
		return myUpdInsChk;
	}
	public void setMyUpdInsChk(int myUpdInsChk) {
		this.myUpdInsChk = myUpdInsChk;
	}
}
