package com.project.onlinegrocery.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.project.onlinegrocery.pojo.PlaceOrderUserDetailsPojo;

import jakarta.transaction.Transactional;

public interface PlaceOrderUserDetailsDao extends CrudRepository<PlaceOrderUserDetailsPojo, Integer>{

	@Override
	public <S extends PlaceOrderUserDetailsPojo> S save(S entity);
	
	@Transactional
	@Modifying
	@Query(value = "update placeorderuserdetails set is_delivered = 'Yes' where sn = :sn", nativeQuery = true)
	public int ensureDelivery(@Param("sn") int sn);

	
	@Query(value = "select * from placeorderuserdetails where mobile = :mobile and password = :password", nativeQuery = true)
	public List<PlaceOrderUserDetailsPojo> readUserSpecific(@Param("mobile") String mobile, @Param("password") String password);
	
	
	@Transactional
	@Modifying
	@Query(value = "delete from placeorderuserdetails where orderid = :orderid", nativeQuery = true)
	public int deleteUserDetails(@Param("orderid") String orderid);

}
