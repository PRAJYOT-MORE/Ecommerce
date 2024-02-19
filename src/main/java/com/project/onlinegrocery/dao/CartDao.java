package com.project.onlinegrocery.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.project.onlinegrocery.pojo.CartPojo;

import jakarta.transaction.Transactional;

public interface CartDao extends CrudRepository<CartPojo, Integer> {

	
	
	@Query(value = "select count(*) as count from cart where productsn = :productsn and mobile = :mobile and password = :password", nativeQuery = true)
	public int checkIfProductExist(@Param("productsn") int productsn, @Param("mobile") String mobile, @Param("password") String password);
	
	
	@Transactional
	@Modifying
	@Query(value = "insert into cart(productsn, count, mobile, password, datetime) values(:productsn, :count, :mobile, :password, :datetime)", nativeQuery = true)
	public int insertIntoCart(@Param("productsn") int productsn, @Param("count") int count, @Param("mobile") String mobile, @Param("password") String password, @Param("datetime") String datetime);
	
	
	@Transactional
	@Modifying
	@Query(value = "update cart set count = count + :count where productsn = :productsn and mobile = :mobile and password = :password", nativeQuery = true)
	public int updateCartItem(@Param("count") int count, @Param("productsn") int productsn, @Param("mobile") String mobile, @Param("password") String password);
	
	@Query(value = "select count(*) as count from cart where mobile = :mobile and password = :password", nativeQuery = true)
	public int cartCount(@Param("mobile") String mobile, @Param("password") String password);
	
	@Query(value = "select * from cart where mobile = :mobile and password = :password", nativeQuery = true)
	public List<CartPojo> readCart(@Param("mobile") String mobile, @Param("password") String password);
	
	@Transactional
	@Modifying
	@Query(value = "delete from cart where productsn NOT IN (select sn from product)", nativeQuery = true)
	public int deleteFromCartUsingProductSn();
	
	@Transactional
	@Modifying
	@Query(value = "delete from cart where mobile = :mobile and password = :password", nativeQuery = true)
	public int deleteFromCart(@Param("mobile") String mobile, @Param("password") String password);
	
	@Transactional
	@Modifying
	@Query(value = "delete from cart where mobile = :mobile and password = :password and productsn = :productsn", nativeQuery = true)
	public int deleteFromCartById(@Param("mobile") String mobile, @Param("password") String password, @Param("productsn") int productsn);
	
	
}
