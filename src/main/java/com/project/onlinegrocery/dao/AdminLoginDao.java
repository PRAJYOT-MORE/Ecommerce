package com.project.onlinegrocery.dao;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.project.onlinegrocery.pojo.AdminLoginPojo;

import jakarta.transaction.Transactional;

public interface AdminLoginDao extends CrudRepository<AdminLoginPojo, Integer>{

	@Override
	public  long count();
	
	@Transactional
	@Modifying
	@Query(value = "insert into adminlogin(username, password) values(:username, :password)", nativeQuery = true)
	public int createAdminLoginTableWithDefaultValue(@Param("username") String username, @Param("password") String password);
	
	@Query(value = "select count(*) from adminlogin where username = :username and password = :password", nativeQuery = true)
	public int readAdminLoginCredentials(@Param("username") String username, @Param("password") String password);
	
	@Transactional
	@Modifying
	@Query(value = "update adminlogin set username = :username, password = :password where sn = 1", nativeQuery = true)
	public int updateCredentials(@Param("username") String username, @Param("password") String password);
	
}
