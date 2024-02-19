<%@include file="userlogindata.jsp" %>


<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="com.project.onlinegrocery.pojo.ProductPojo"%>
<%@page import="java.util.List"%>
<%@page import="com.project.onlinegrocery.dao.ProductDao"%>
<%@page import="com.project.onlinegrocery.GetApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Online Grocery</title>

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
                        <h2>Home Page</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->


    <!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Featured Product</h2>
                    </div>
                </div>
            </div>
            <div class="row featured__filter">
                
                
	    <%
			ProductDao productDao = ac.getBean(ProductDao.class);
			List<ProductPojo> list = productDao.readEightProducts();
			session.setAttribute("products", list);
			int index = 0;	
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
        	index++;
			}
        %>    
            
            </div>
        </div>
    </section>
    <!-- Featured Section End -->


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