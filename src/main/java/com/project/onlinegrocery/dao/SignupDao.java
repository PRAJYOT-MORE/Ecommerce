package com.project.onlinegrocery.dao;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.project.onlinegrocery.pojo.SignupPojo;

public interface SignupDao extends CrudRepository<SignupPojo, String>{
	
	@Query(value = "select count(*) as count from usersignup where mobile = :mobile", nativeQuery = true)
	public int checkEntry(@Param("mobile") String mobile);
	
	@Override
	public <S extends SignupPojo> S save(S entity);
	
	@Query(value = "select count(*) as count from usersignup where mobile = :mobile and password = :password", nativeQuery = true)
	public int isUserLoggedIn(@Param("mobile") String mobile, @Param("password") String password);
}
