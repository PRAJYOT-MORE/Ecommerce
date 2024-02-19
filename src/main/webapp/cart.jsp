<%@include file="userlogindata.jsp" %>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.Optional"%>
<%@page import="com.project.onlinegrocery.dao.ProductDao"%>
<%@page import="com.project.onlinegrocery.pojo.ProductPojo"%>
<%@page import="com.project.onlinegrocery.pojo.CartPojo"%>
<%@page import="java.util.List"%>
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
    <title>Shopping Cart</title>

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
                    	<h3 style="color: white"><%@include file="messagebox/message.jsp" %></h3> 
                        <h2>Shopping Cart</h2>
                        <div class="breadcrumb__option">
                            <a href="./home.jsp">Home</a>
                            <span>Shopping Cart</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shopping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">Products</th>
                                    <th>Title</th>
                                    <th>Price</th>
                                    <th>Offer Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            
                            <% 
                            	ProductDao productDao = ac.getBean(ProductDao.class);
                            
                				// cartDao retrieved in header.jsp
                            	List<CartPojo> cartList = cartDao.readCart(logindata.get(0), logindata.get(1));
                            
                				HashMap<ProductPojo, Integer> hm = new HashMap<>();
                				
                            	int totalCrossPrice = 0;
                            	int totalMainPrice = 0;
                            	
                            	int mainPrice;
                        		int crossPrice;
                        		int count;
                        		
                        		int mainPriceWithCount;
                        		int crossPriceWithCount;
                        		
                            	for(CartPojo cp : cartList)
                            	{
                            		int productsn = cp.getProductsn();
                            		Optional<ProductPojo> op = productDao.findById(productsn);
                            		ProductPojo pp = op.get();
                            	
                            		mainPrice = Integer.parseInt(pp.getMainprice());
                            		crossPrice = Integer.parseInt(pp.getCrossprice());
                            		count = cp.getCount();
                            		
                            		mainPriceWithCount = mainPrice * count;
                            		crossPriceWithCount = crossPrice * count;
                            		
                            		totalMainPrice += mainPriceWithCount;
                            		totalCrossPrice += crossPriceWithCount;
                            %>
                            
                            
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="admin/products/<%= pp.getProductimage()%>" alt="" height="40%" width="60%">
                                    </td>
                                    <td class="shoping__cart__price">
                                    	<%= pp.getTitle()%>
                                    </td>
                                    <td class="shoping__cart__price">
                                        <del>&#x20b9;<%= crossPrice%></del>
                                    </td>
                                    <td class="shoping__cart__price">
                                        &#x20b9;<%= mainPrice%>
                                    </td>
                                    <td class="shoping__cart__price">
                                        <%= count %>
                                    </td>
                                    <td class="shoping__cart__price">
                                        &#x20b9;<%= mainPriceWithCount %>
                                    </td>
                                    <td class="shoping__cart__item__close">
                                    	<form action="deletecartitem" method="post">
                                    		<input type="hidden" name="productsn" value="<%= productsn%>">
                                    		<input type="hidden" name="mobile" value="<%= logindata.get(0)%>">
                                			<input type="hidden" name="password" value="<%= logindata.get(1)%>">
                                    		<button style="border:none;"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
  												<path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z"/>
											</svg></button>
                                    	</form>
                                    </td>
                                </tr>
                                
                            <%
                            		hm.put(pp, cp.getCount());
                            	} 
                            %>    
           
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="home.jsp" class="primary-btn cart-btn">CONTINUE SHOPPING</a>
                    </div>
                </div>
                
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>Cart Total</h5>
                        <ul>
                            <li>Price before discount <span><del>&#x20b9;<%= totalCrossPrice %></del></span></li>
                            <li>Price after discount <span>&#x20b9;<%= totalMainPrice %></span></li>
                            <li>You saved <span>&#x20b9;<%= totalCrossPrice - totalMainPrice %></span></li>
                            
                            <%
                            	String charges = "Free";
                            	if(totalMainPrice < 300 && totalMainPrice != 0){
                            		totalMainPrice += 50;
                            		charges = "50";
                            	}
                            	
                            	session.setAttribute("checkout", hm);
                            	
                            %>
                            
                            <li>Delivery charges <span>&#x20b9;<%= charges %></span></li>
                            <li>Total<span>&#x20b9;<%= totalMainPrice %></span></li>
                        </ul>
                        <a href="checkout.jsp" class="primary-btn">PROCEED TO CHECKOUT</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shopping Cart Section End -->

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