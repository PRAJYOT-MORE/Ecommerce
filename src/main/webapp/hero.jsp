<%@page import="com.project.onlinegrocery.GetApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="com.project.onlinegrocery.pojo.DepartmentPojo"%>
<%@page import="java.util.List"%>
<%@page import="com.project.onlinegrocery.dao.DepartmentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>


<!-- Hero Section Begin -->
	
	
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>All departments</span>
                        </div>
                        <ul>
                        	<li><a href="product-grid.jsp?department=all">All</a></li>
                        
                        <%
             				DepartmentDao departmentDao = ac.getBean(DepartmentDao.class);
             				List <DepartmentPojo> deptList = departmentDao.readDepartment();
             				for(DepartmentPojo dp : deptList)
             				{
			            %>
			            	<li><a href="product-grid.jsp?department=<%= dp.getDepartment() %>"><%= dp.getDepartment() %></a></li>                
			            <%
			             	}
			            %>
                        
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form"> 
                            <form action="product-grid.jsp" method="post">
                                <div class="hero__search__categories">
                                    Search Categories
                                </div>
                                <input type="text" name="search" placeholder="What do yo u need?" required="required">
                                <button type="submit" class="site-btn">SEARCH</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>+91 9876543210</h5>
                                <span>support 24/7 time</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
<!-- Hero Section End -->