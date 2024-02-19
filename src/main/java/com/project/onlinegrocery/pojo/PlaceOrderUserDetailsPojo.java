package com.project.onlinegrocery.pojo;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "placeorderuserdetails")
public class PlaceOrderUserDetailsPojo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int sn;
	
	@Column(length = 50)
	private String fullname;
	@Column(length = 1000)
	private String address;
	@Column(length = 50)
	private String city;
	@Column(length = 50)
	private String state;
	@Column(length = 6)
	private String pincode;
	@Column(length = 50)
	private String phone;
	@Column(length = 1000)
	private String ordernotes;
	@Column(length = 10)
	private String deliverycharges;
	@Column(length = 10)
	private String mobile;
	@Column(length = 16)
	private String password;
	@Column(length = 50)
	private String datetime;
	@Column(length = 100)
	private String orderid;
	@Column(length = 10)
	private String isDelivered;
	
	
	public PlaceOrderUserDetailsPojo() {
		super();
	}
	public PlaceOrderUserDetailsPojo(String fullname, String address, String city, String state, String pincode,
			String phone, String ordernotes, String deliverycharges, String mobile, String password, String datetime,
			String orderid, String isDelivered) {
		super();
		this.fullname = fullname;
		this.address = address;
		this.city = city;
		this.state = state;
		this.pincode = pincode;
		this.phone = phone;
		this.ordernotes = ordernotes;
		this.deliverycharges = deliverycharges;
		this.mobile = mobile;
		this.password = password;
		this.datetime = datetime;
		this.orderid = orderid;
		this.isDelivered = isDelivered;
	}
	
	
	public int getSn() {
		return sn;
	}
	public void setSn(int sn) {
		this.sn = sn;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPincode() {
		return pincode;
	}
	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getOrdernotes() {
		return ordernotes;
	}
	public void setOrdernotes(String ordernotes) {
		this.ordernotes = ordernotes;
	}
	public String getDeliverycharges() {
		return deliverycharges;
	}
	public void setDeliverycharges(String deliverycharges) {
		this.deliverycharges = deliverycharges;
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
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public String getIsDelivered() {
		return isDelivered;
	}
	public void setIsDelivered(String isDelivered) {
		this.isDelivered = isDelivered;
	}
}
