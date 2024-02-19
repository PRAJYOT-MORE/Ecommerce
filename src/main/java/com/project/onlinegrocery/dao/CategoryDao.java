package com.project.onlinegrocery.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.project.onlinegrocery.pojo.CategoryPojo;
import jakarta.transaction.Transactional;

public interface CategoryDao extends CrudRepository<CategoryPojo, Integer>{

	@Transactional
	@Modifying
	@Query(value = "insert into category(department, category) values(:department, :category)", nativeQuery = true)
	public int insertCategory(@Param("department") String department, @Param("category") String category);
	
	
	@Query(value = "select * from category", nativeQuery = true)
	public List<CategoryPojo> readCategory();
	
	@Transactional
	@Modifying
	@Query(value = "delete from category where category = :category", nativeQuery = true)
	public int deleteCategory(@Param("category") String category);
	
	@Transactional
	@Modifying
	@Query(value = "delete from category where department = :department", nativeQuery = true)
	public int deleteCategoryUsingDepartment(@Param("department") String department);
	
	
	/*
	@Transactional
	@Modifying
	@Query(value = "delete from contact where sn = :sn", nativeQuery = true)
	public int deleteContact(@Param("sn") int sn);
	*/
}
