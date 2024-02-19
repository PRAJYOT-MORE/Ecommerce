package com.project.onlinegrocery.pojo;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "category")
public class CategoryPojo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int sn;
	
	@Column(length = 30)
	private String department;
	@Column(length = 50)
	private String category;
	

	public CategoryPojo() {
		super();
	}
	public CategoryPojo(String department, String category) {
		super();
		this.department = department;
		this.category = category;
	}
	
	public int getSn() {
		return sn;
	}
	public void setSn(int sn) {
		this.sn = sn;
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
	
}
