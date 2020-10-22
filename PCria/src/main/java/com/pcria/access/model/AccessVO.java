package com.pcria.access.model;

public class AccessVO {
	private int u_no;
	private String u_id;
	private String u_name;
	private String u_password;
	private String u_birth;
	private int u_wallet;
	private String u_time;
	private int hu_no;
	private String salt;
	
	
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
	public int getHu_no() {
		return hu_no;
	}
	public void setHu_no(int hu_no) {
		this.hu_no = hu_no;
	}
}
