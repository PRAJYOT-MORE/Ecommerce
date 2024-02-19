package com.project.onlinegrocery.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.project.onlinegrocery.pojo.PlaceOrderDetailsPojo;

import jakarta.transaction.Transactional;

public interface PlaceOrderDetailsDao extends CrudRepository<PlaceOrderDetailsPojo, Integer>{

	@Override
	public <S extends PlaceOrderDetailsPojo> S save(S entity);

	@Query(value = "select * from placeorderdetails where orderid = :orderid", nativeQuery = true)
	public List<PlaceOrderDetailsPojo> readOrderIdWise(@Param("orderid") String orderid);
	
	
	@Transactional
	@Modifying
	@Query(value = "delete from placeorderdetails where sn = :sn", nativeQuery = true)
	public int deleteOrder(@Param("sn") int sn);
	
	@Query(value = "select count(*) as count from placeorderdetails where orderid = :orderid", nativeQuery = true)
	public int checkIfOrderIdExist(@Param("orderid") String orderid);
	
}
