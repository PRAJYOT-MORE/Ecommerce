<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="./home.jsp"><img src="img/onlinegrocery.jpeg" alt="" height="50" width="270"></a>
        </div>
        
        <div class="humberger__menu__widget">
            <div class="header__top__right__language">
                <div>Order History</div>
                <span class="arrow_carrot-down"></span>
                <ul>
                	<li><a href="userorderhistory.jsp?status=No">Arriving</a></li>
                    <li><a href="userorderhistory.jsp?status=Yes">Delivered</a></li>
                </ul>
            </div>
            <div class="header__top__right__auth">
                <a href="logout.jsp"><i class="fa fa-user"></i>Logout</a>
            </div>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li><a href="./home.jsp">Home</a></li>
                <li><a href="./product-grid.jsp">Shop</a></li>
                <li><a href="./contact.jsp">Contact</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i>online@grocery.com</li>
                <li>Free shipping for all order above &#x20b9;300</li>
            </ul>
        </div>
    </div>
<!-- Humberger End -->

