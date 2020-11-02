package com.pcria.access.model;

public class AccessVO {
	private int u_no;
	private String u_id;
	private String u_name;
	private String u_password;
	private String u_birth;
	private int u_wallet;
	private String u_time;
	private String salt;
	
	//seat에서 사용하는 것들 
	private int myUpdInsChk;
	private int s_no;
	private int s_occupied;
	
	//mypage에서 사용하는 것들
	private String u_profile;
	private String r_dt;
	private String m_dt;
	private String u_repassword;
	private String u_totalTime;
	private int u_totalPayment;
	
	
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public int getU_no() {
		return u_no;
	}
	public void setU_no(int u_no) {
		this.u_no = u_no;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_password() {
		return u_password;
	}
	public void setU_password(String u_password) {
		this.u_password = u_password;
	}
	public String getU_birth() {
		return u_birth;
	}
	public void setU_birth(String u_birth) {
		this.u_birth = u_birth;
	}
	public int getU_wallet() {
		return u_wallet;
	}
	public void setU_wallet(int u_wallet) {
		this.u_wallet = u_wallet;
	}
	public String getU_time() {
		return u_time;
	}
	public void setU_time(String u_time) {
		this.u_time = u_time;
	}
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
	public String getU_profile() {
		return u_profile;
	}
	public void setU_profile(String u_profile) {
		this.u_profile = u_profile;
	}
	public String getR_dt() {
		return r_dt;
	}
	public void setR_dt(String r_dt) {
		this.r_dt = r_dt;
	}
	public String getM_dt() {
		return m_dt;
	}
	public void setM_dt(String m_dt) {
		this.m_dt = m_dt;
	}
	public String getU_repassword() {
		return u_repassword;
	}
	public void setU_repassword(String u_repassword) {
		this.u_repassword = u_repassword;
	}
	public String getU_totalTime() {
		return u_totalTime;
	}
	public void setU_totalTime(String u_totalTime) {
		this.u_totalTime = u_totalTime;
	}
	public int getU_totalPayment() {
		return u_totalPayment;
	}
	public void setU_totalPayment(int u_totalPayment) {
		this.u_totalPayment = u_totalPayment;
	}
}
