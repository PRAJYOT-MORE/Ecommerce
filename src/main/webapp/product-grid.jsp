<%@include file="userlogindata.jsp" %>


<%@page import="java.util.List"%>
<%@page import="com.project.onlinegrocery.pojo.ProductPojo"%>
<%@page import="com.project.onlinegrocery.dao.ProductDao"%>
<%@page import="com.project.onlinegrocery.GetApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Grocery Shop</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<body>

	<%!
		ApplicationContext ac = GetApplicationContext.getApplicationContext();
	%>
	
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    	<%@include file="burger.jsp" %>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    	<%@include file="header.jsp" %>
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    	<%@include file="hero.jsp" %>
    <!-- Hero Section End -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Grocery Shop</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Shop</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">      
            <div class="row">
                <div class="col-lg-12">
                    <div class="row">
                		<div class="col-lg-12">
                    		<div class="section-title">
                        		<h2>Search Results</h2>
		                    </div>
		                </div>
		            </div>
                    <div class="row">
                    
                    <%                    	
                    	int startIndex = 0;
                        String start = request.getParameter("start");
                        
                        if(start != null){
                        	startIndex = Integer.parseInt(start);	
                        }
                        	
	                    ProductDao productDao = ac.getBean(ProductDao.class);
                        List<ProductPojo> list = null;
            		
                    	String search = request.getParameter("search");
                    	session.setAttribute("cat", search);
                    	String department = request.getParameter("department");
                    	session.setAttribute("dept", department);
                    	if(search == null){
                    		// Opened webpage without searching
                    		if(department == null || department.equals("all")){
	                    		//itr = productDao.findAll();
	                    		list = productDao.readAllProducts(startIndex);
                    		}
                    		else{
                    			list = productDao.readProductDepartmentWisePagination(department, startIndex);
                    		}
                    	}
                    	else{
                    		// Opened webpage using search
                    		list = productDao.readProductCategoryWisePagination(search, startIndex);
                    	}
                    	
                    	if (search == null && department == null){
                    		session.setAttribute("cat", null);
                    		session.setAttribute("dept", null);
                    	}
                    
                    	session.setAttribute("products", list);
                    	int index = 0; // Will be 0 on every page reload
                    	int current = 0;
	            		for(ProductPojo pp : list)
	            		{
                    %>
                    
                    
	                        <div class="col-lg-3 col-md-4 col-sm-6">
	                            <div class="product__item" style="border:4px solid #7fad39; border-radius: 10px;">
	                                <div class="product__item__pic set-bg rounded-top" style="display: flex; align-items: center;">
	                					<img src="admin/products/<%= pp.getProductimage()%>" style="vertical-align: middle;">
	                				</div>
	                                <div class="product__item__text">
	                                    <h6><%= pp.getTitle() %></h6>
	                            		<h5>&#x20b9;<%= pp.getMainprice() %></h5>
	                            		<h5><del>&#x20b9;<%= pp.getCrossprice() %></del></h5>
	                            		<a href="product-details.jsp?index=<%= index %>" class="primary-btn mb-5">Buy now</a>
	                                </div>
	                            </div>
	                        </div>
                        
                    <%	
                    	current++;
                    	startIndex++;
                      	index++;  
	            		}
                        
                    %>
                    </div>
                    <div class="product__pagination d-flex justify-content-between">
                    
                    	<%
                    	
                    		
                    	
	                    	if(session.getAttribute("cat") != null){
	                    		session.setAttribute("dept", null);
	                    	}
	                    
		                    if(session.getAttribute("dept") != null){
		                		session.setAttribute("cat", null);
		                	}
		                    
		                    if(session.getAttribute("cat") == null && session.getAttribute("dept") == null){
	                    		session.setAttribute("dept", "all");
	                    	}
	                    
                    	
                    	
                    		if(startIndex > 8)
                    		{
                    	%>
                    
                        		<a class="text-start" href="product-grid.jsp?department=<%= session.getAttribute("dept") %>&category=<%= session.getAttribute("cat") %>&start=<%= startIndex - 8 - current%>"><i class="fa fa-long-arrow-left"></i>Previous</a>
                        
                        <%
                    		}
                        %>
                        
                        <%
                    		if(current == 8)
                    		{
                    	%>
                        
                        		<a class="text-end" href="product-grid.jsp?department=<%= session.getAttribute("dept") %>&category=<%= session.getAttribute("cat") %>&start=<%= startIndex%>"><i class="fa fa-long-arrow-right"></i>Next</a>
                    
                    	<%
                    		}
                    	%>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Section End -->

    <!-- Footer Section Begin -->
    	<%@include file="footer.jsp" %>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>



</body>

</html>