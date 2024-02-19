package com.project.onlinegrocery.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.project.onlinegrocery.pojo.ProductPojo;

import jakarta.transaction.Transactional;

public interface ProductDao extends CrudRepository<ProductPojo, Integer>{

	@Override
	public <S extends ProductPojo> S save(S entity);
	
	@Query(value = "select * from product limit 8", nativeQuery = true)
	public List<ProductPojo> readEightProducts();
	
	@Override
	public Iterable<ProductPojo> findAll();
	
	@Query(value = "select * from product where category like concat('%', :category, '%')", nativeQuery = true)
	public Iterable<ProductPojo> readProductCategoryWise(@Param("category") String category);
	
	@Query(value = "select * from product where department=:department", nativeQuery = true)
	public Iterable<ProductPojo> readProductDepartmentWise(@Param("department") String department);
	
	
	@Override
	public Optional<ProductPojo> findById(Integer id);
	
	@Override
	public void deleteById(Integer id);
	
	@Transactional
	@Modifying
	@Query(value = "update product set title = :title, description = :description, crossprice = :crossprice, mainprice = :mainprice, availability = :availability, department = :department , category = :category where sn = :sn", nativeQuery = true)
	public int updateProductDetails(@Param("title") String title, @Param("description") String description, @Param("crossprice") String crossprice, @Param("mainprice") String mainprice, @Param("availability") String availability, @Param("department") String department, @Param("category") String category, @Param("sn") int sn);
	
	@Transactional
	@Modifying
	@Query(value = "delete from product where category = :category", nativeQuery = true)
	public int deleteProductUsingCategory(@Param("category") String category);
	
	@Transactional
	@Modifying
	@Query(value = "delete from product where department = :department", nativeQuery = true)
	public int deleteProductUsingDepartment(@Param("department") String department);
		
	@Query(value = "select * from product LIMIT :start, 8", nativeQuery = true)
	public List<ProductPojo> readAllProducts(@Param("start") int start);
	
	@Query(value = "select sn from product", nativeQuery = true)
    public List<Integer> readSnOnly();
	
	@Query(value = "select * from product where department=:department LIMIT :start, 8", nativeQuery = true)
	public List<ProductPojo> readProductDepartmentWisePagination(@Param("department") String department, @Param("start") int start);
	
	@Query(value = "select * from product where category like concat('%', :category, '%') LIMIT :start, 8", nativeQuery = true)
	public List<ProductPojo> readProductCategoryWisePagination(@Param("category") String category, @Param("start") int start);
	
}
