package com.security.gurume365.vo;

public class Users  {
	
	/**
	 * 
	 */
	
	
	private String id;
	private String pw;
	private String name;
	private String date_of_birth;
	private String phone;
	private String permit;
	private int division;
	private int enabled;	
	
	
	public Users() {
		super();
	}
	public Users(String id, String pw, String name, String date_of_birth, String phone, String permit, int division,
			int enabled) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.date_of_birth = date_of_birth;
		this.phone = phone;
		this.permit = permit;
		this.division = division;
		this.enabled = enabled;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public String getPw() {
		return pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDate_of_birth() {
		return date_of_birth;
	}
	public void setDate_of_birth(String date_of_birth) {
		this.date_of_birth = date_of_birth;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPermit() {
		return permit;
	}
	public void setPermit(String permit) {
		this.permit = permit;
	}
	public int getDivision() {
		return division;
	}
	public void setDivision(int division) {
		this.division = division;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	@Override
	public String toString() {
		return "Users [id=" + id + ", pw=" + pw + ", name=" + name + ", date_of_birth=" + date_of_birth + ", phone="
				+ phone + ", permit=" + permit + ", division=" + division + ", enabled=" + enabled + ", authority="
				 + "]";
	}
}
