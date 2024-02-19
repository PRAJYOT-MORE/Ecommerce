<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="com.project.onlinegrocery.dao.CartDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__left">
                            <ul>
                                <li><i class="fa fa-envelope"></i> online@grocery.com</li>
                                <li>Free shipping for all order above &#x20b9;300</span></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">
                            <div class="header__top__right__language">
                                <div>Order History</div>
                                <span class="arrow_carrot-down"></span>
                                <ul>
                                    <li><a href="userorderhistory.jsp?status=No">Arriving</a></li>
                                    <li><a href="userorderhistory.jsp?status=Yes">Delivered</a></li>
                                </ul>
                            </div>
                            <div class="header__top__right__auth">
                                <a href="logout.jsp"><i class="fa fa-user"></i> Logout</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="./home.jsp"><img src="img/onlinegrocery.jpeg" alt="" height="50" width="270"></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul class="text-center">
                            <li><a href="./home.jsp">Home</a></li>
                            <li><a href="./product-grid.jsp">Shop</a></li>
                            <li><a href="./contact.jsp">Contact</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                            <%!
                            	CartDao cartDao = ac.getBean(CartDao.class);
                            %>
                            
                            
                            <li><a href="cart.jsp"><i class="fa fa-shopping-bag"></i> <span><%= cartDao.cartCount(logindata.get(0), logindata.get(1)) %></span></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
<!-- Header Section End -->