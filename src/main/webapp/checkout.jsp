<%@include file="userlogindata.jsp" %>


<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Set"%>
<%@page import="com.project.onlinegrocery.pojo.ProductPojo"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.project.onlinegrocery.GetApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>


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
    <title>Checkout</title>

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
                        <h2>Checkout</h2>
                        <div class="breadcrumb__option">
                            <a href="./home.jsp">Home</a>
                            <span>Checkout</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <h4>Billing Details</h4>
                <form action="checkout" method="post">
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Fullname<span>*</span></p>
                                        <input type="text" name="fullname" required="required">
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>Address<span>*</span></p>
                                <input type="text" name="address" placeholder="Street Address" class="checkout__input__add" required="required">
                            </div>
                            <div class="checkout__input">
                                <p>City<span>*</span></p>
                                <input type="text" name="city" required="required">
                            </div>
                            <div class="checkout__input">
                                <p>State<span>*</span></p>
                                <input type="text" name="state" required="required">
                            </div>
                            <div class="checkout__input">
                                <p>Pincode<span>*</span></p>
                                <input type="text" name="pincode" required="required">
                            </div> 
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Phone<span>*</span></p>
                                        <input type="text" name="phone" required="required">
                                    </div>
                                </div>
                                
                            </div>
                            <div class="checkout__input">
                                <p>Order notes<span>*</span></p>
                                <input type="text" name="ordernotes"
                                    placeholder="Notes about your order, e.g. special notes for delivery.">
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="checkout__order table-responsive">
                                <h4>Your Order</h4>
                                <table class="table">
                                	<thead>
                                		<tr>
                                			<th class="checkout__order__products">Products</th>
                                			<th class="checkout__order__products">Quantity</th>
                                			<th class="checkout__order__products">Total</th>
                                		</tr>
                                	</thead>
                                	<tbody>
	                                	<tr>
	                                		
	                            
                                
                                <%
                            		int totalMainPrice = 0;
	                            	HashMap<ProductPojo, Integer> hm = (HashMap<ProductPojo, Integer>) session.getAttribute("checkout");
	                            	if(hm != null)
	                            	{
	                            		Set<Entry<ProductPojo, Integer>> set = hm.entrySet();	                            		
	                            		Iterator<Entry<ProductPojo, Integer>> itr = set.iterator();
	                            		
	                            		while(itr.hasNext())
	                            		{
	                            			Entry<ProductPojo, Integer> entry = itr.next();
	                            			ProductPojo pp = entry.getKey();
	                            			int count = entry.getValue();
	                            			
	                            			int mainPrice = Integer.parseInt(pp.getMainprice());
	                            			int mainPriceWithCount = mainPrice * count;
	                            			totalMainPrice += mainPriceWithCount;
                            	
                            	%>
                                                         
                                    
	                                    <td><b><%= pp.getTitle() %></b></td>
	                                    <td><b><%= count %></b></td>
	                                    <td><b>&#x20b9;<%= mainPriceWithCount %></b></td>
                                    
                                    </tr>
                                    
                                <%
                            		}
	                            		
	                            	String charges = "Free";
	                            	int subTotalPrice = totalMainPrice;
	                                if(totalMainPrice < 300){
	                                	totalMainPrice += 50;
	                                	charges = "50";
	                                }	
                            	%>
                                
                                </tbody>
                                </table>
                                
                                <div class="mt-5"><hr style="width: 20%;"></div>
                                <div class="checkout__order__subtotal mt-5">Subtotal <span>&#x20b9;<%= subTotalPrice %></span></div>
                                <div class="checkout__order__total">Delivery charges <span>&#x20b9;<%= charges %></span></div>
                                <div class="checkout__order__total">Total <span>&#x20b9;<%= totalMainPrice %></span></div>
                                
                                
                                
                                <input type="hidden" name="deliverycharges" value="<%= charges%>">
                                <input type="hidden" name="mobile" value="<%= logindata.get(0)%>">
                                <input type="hidden" name="password" value="<%= logindata.get(1)%>">
                                <button type="submit" class="site-btn">PLACE ORDER</button>
                            
                            	<%
                            		}                            
                            	%>
                             
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->

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