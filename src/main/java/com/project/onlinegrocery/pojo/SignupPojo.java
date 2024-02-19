package com.project.onlinegrocery.pojo;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "usersignup")
public class SignupPojo {

	@Id
	@Column(length = 10)
	private String mobile;
	
	@Column(length = 30)
	private String fullname;
	@Column(length = 16)
	private String password;
	@Column(length = 50)
	private String datetime;
	
	public SignupPojo() {
		super();
	}
	public SignupPojo(String mobile, String fullname, String password, String datetime) {
		super();
		this.mobile = mobile;
		this.fullname = fullname;
		this.password = password;
		this.datetime = datetime;
	}
	
	
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDatetime() {
		return datetime;
	}
	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}
	
}
