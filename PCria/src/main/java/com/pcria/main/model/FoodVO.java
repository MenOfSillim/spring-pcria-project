package com.pcria.main.model;

public class FoodVO {
	private int seq;
	private int i_f;
	private int f_price;
	private String f_pic;
	private String f_name;
	private int chk;
	
	//프로필 정보 관련 조회 
	private int total_quantity;
	
	public int getChk() {
		return chk;
	}
	public void setChk(int chk) {
		this.chk = chk;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getI_f() {
		return i_f;
	}
	public void setI_f(int i_f) {
		this.i_f = i_f;
	}
	public int getF_price() {
		return f_price;
	}
	public void setF_price(int f_price) {
		this.f_price = f_price;
	}
	public String getF_pic() {
		return f_pic;
	}
	public void setF_pic(String f_pic) {
		this.f_pic = f_pic;
	}
	public String getF_name() {
		return f_name;
	}
	public void setF_name(String f_name) {
		this.f_name = f_name;
	}
	public int getTotal_quantity() {
		return total_quantity;
	}
	public void setTotal_quantity(int total_quantity) {
		this.total_quantity = total_quantity;
	}
}
