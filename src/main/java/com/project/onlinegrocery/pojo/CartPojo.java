package com.project.onlinegrocery.pojo;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "cart")
public class CartPojo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int sn;
	
	private int productsn;
	@Column(length = 10)
	private String mobile;
	@Column(length = 16)
	private String password;
	private int count;
	@Column(length = 50)
	private String datetime;
	
	
	public CartPojo() {
		super();
	}	
	public CartPojo(int productsn, String mobile, String password, int count, String datetime) {
		super();
		this.productsn = productsn;
		this.mobile = mobile;
		this.password = password;
		this.count = count;
		this.datetime = datetime;
	}
	public int getSn() {
		return sn;
	}
	public void setSn(int sn) {
		this.sn = sn;
	}
	public int getProductsn() {
		return productsn;
	}
	public void setProductsn(int productsn) {
		this.productsn = productsn;
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getDatetime() {
		return datetime;
	}
	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}
}
