package com.project.onlinegrocery.pojo;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "department")
public class DepartmentPojo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int sn;
	
	@Column(length = 30)
	private String department;

	public DepartmentPojo() {
		super();
	}

	public DepartmentPojo(String department) {
		super();
		this.department = department;
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
}
