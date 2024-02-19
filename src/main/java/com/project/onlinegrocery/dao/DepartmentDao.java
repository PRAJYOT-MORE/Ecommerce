package com.project.onlinegrocery.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.project.onlinegrocery.pojo.DepartmentPojo;
	
import jakarta.transaction.Transactional;

public interface DepartmentDao extends CrudRepository<DepartmentPojo, Integer> {

	@Transactional
	@Modifying
	@Query(value = "insert into department(department) values(:department)", nativeQuery = true)
	public int insertDepartment(@Param("department") String department);
	
	@Transactional
	@Modifying
	@Query(value = "delete from department where department = :department", nativeQuery = true)
	public int deleteDepartment(@Param("department") String department);
	
	@Query(value = "select * from department", nativeQuery = true)
	public List<DepartmentPojo> readDepartment();
	
	@Query(value = "select * from department order by department", nativeQuery = true)
	public List<DepartmentPojo> readDepartmentAscending();
	
}
