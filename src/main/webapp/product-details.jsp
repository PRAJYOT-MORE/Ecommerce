<%@include file="userlogindata.jsp" %>



<%@page import="com.project.onlinegrocery.GetApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="com.project.onlinegrocery.pojo.ProductPojo"%>
<%@page import="java.util.ArrayList"%>
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
    <title>Product Details</title>

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
    <style>
    	.product-image{
    		min-width: 70% !important;    	
    	}
    </style>
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
                        <h2>Product Details</h2>
                        <div class="breadcrumb__option">
                            <a href="./home.jsp">Home</a>
                            <span>Product Details</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->



	<%
	
		String tempindex = request.getParameter("index");
		
		if(tempindex == null){
			response.sendRedirect("product-grid.jsp");
			return;
		}
		
		int index = Integer.parseInt(tempindex);
		
		ArrayList<ProductPojo> al = (ArrayList<ProductPojo>) session.getAttribute("products");
	
		ProductPojo p = al.get(index);
	%>


    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product-image"
                                src="admin/products/<%= p.getProductimage() %>" alt="<%= p.getCategory()%>">
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3><%= p.getTitle() %></h3>
                        <div class="product__details__price">&#x20b9;<%= p.getMainprice() %><span style="color: black; font-size: 0.5em"> <del>&#x20b9;<%= p.getCrossprice() %></del></span></div>
                        <div class="product__details__price" ></div>
                        <pre><%= p.getDescription() %></pre>
                        <form action="cart" method="post">
                        	<input type="hidden" name="productsn" value="<%= p.getSn() %>">
                        	<input type="hidden" name="mobile" value="<%= logindata.get(0)%>">
                        	<input type="hidden" name="password" value="<%= logindata.get(1) %>">
							<div class="product__details__quantity">
	                            <div class="quantity">
	                                <div class="pro-qty">
	                                    <input type="number" max = "10" min = "1" name="count" value="1">
	                                </div>
	                            </div>
                        	</div> 
							<button class="primary-btn">Add to cart</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->


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