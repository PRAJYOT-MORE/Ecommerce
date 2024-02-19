package com.project.onlinegrocery.pojo;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="product")
public class ProductPojo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int sn;
	
	@Column(length = 150)
	private String title;
	@Column(length = 5000)
	private String description;
	@Column(length = 30)
	private String crossprice;
	@Column(length = 30)
	private String mainprice;
	@Column(length = 50)
	private String availability;
	@Column(length = 30)
	private String department;
	@Column(length = 30)
	private String category;
	@Column(length = 500)
	private String productimage;
	@Column(length = 50)
	private String datetime;
	
	
		
	public ProductPojo() {
		super();
	}
	
	public ProductPojo(String title, String description, String crossprice, String mainprice, String availability, String department, String category, String productimage, String datetime) {
		super();
		this.title = title;
		this.description = description;
		this.crossprice = crossprice;
		this.mainprice = mainprice;
		this.availability = availability;
		this.department = department;
		this.category = category;
		this.productimage = productimage;
		this.datetime = datetime;
	}
	
	
	public int getSn() {
		return sn;
	}
	public void setSn(int sn) {
		this.sn = sn;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCrossprice() {
		return crossprice;
	}
	public void setCrossprice(String crossprice) {
		this.crossprice = crossprice;
	}
	public String getMainprice() {
		return mainprice;
	}
	public void setMainprice(String mainprice) {
		this.mainprice = mainprice;
	}
	public String getAvailability() {
		return availability;
	}
	public void setAvailability(String availability) {
		this.availability = availability;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getProductimage() {
		return productimage;
	}
	public void setProductimage(String productimage) {
		this.productimage = productimage;
	}
	public String getDatetime() {
		return datetime;
	}
	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}	
}
