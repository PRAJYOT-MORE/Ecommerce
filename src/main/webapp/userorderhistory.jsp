<%@include file="userlogindata.jsp" %>


<%@page import="com.project.onlinegrocery.pojo.PlaceOrderDetailsPojo"%>
<%@page import="com.project.onlinegrocery.dao.PlaceOrderDetailsDao"%>
<%@page import="com.project.onlinegrocery.pojo.PlaceOrderUserDetailsPojo"%>
<%@page import="java.util.List"%>
<%@page import="com.project.onlinegrocery.dao.PlaceOrderUserDetailsDao"%>
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
    <title>Order History</title>

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
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f4f4f4;
    }

    .container2 {
      max-width: 1200px;
      margin: 0 auto;
      padding: 20px;
      box-sizing: border-box;
    }

    .order-details {
      background-color: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    table, th, td {
      border: 1px solid #ddd;
    }

    th, td {
      padding: 12px;
      text-align: left;
    }

    th {
      background-color: #f2f2f2;
    }

    /* Media Queries */
    @media only screen and (max-width: 768px) {
      th, td {
        font-size: 14px;
      }
    }

    @media only screen and (max-width: 480px) {
      .order-details {
        padding: 10px;
      }

      th, td {
        font-size: 12px;
      }
    }
  </style>
    
</head>

<body>
   
   	<%!
		ApplicationContext ac = GetApplicationContext.getApplicationContext();
	%>
   
    <!-- Humberger Begin -->
    	<%@include file="burger.jsp" %>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    	<%@include file="header.jsp" %>
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    	<%@include file="hero.jsp" %>
    <!-- Hero Section End -->
  
    <%
        
       String status= request.getParameter("status");
    	if(status.equals("No"))
    	{
    %>
    	    <h2 style="color: #7fad39; text-align:center;"><b>Arriving Products</b></h2>
		
	<%
		}
    	else
    	{
	%> 
	        <h2 style="color: #7fad39; text-align:center;"><b>Delivered Products</b></h2>
    <%
    	} 
    %>
    
    
    <h3 class="breadcrumb__text" style="text-align: center; color: green;"> <b><%@include file="messagebox/message.jsp" %></b><br></h3>
    
    
    <%

       PlaceOrderUserDetailsDao placeOrderUserDetailsDao = ac.getBean(PlaceOrderUserDetailsDao.class);
       
       List<PlaceOrderUserDetailsPojo> list = placeOrderUserDetailsDao.readUserSpecific(logindata.get(0), logindata.get(1));
       
       for( PlaceOrderUserDetailsPojo poudp :list)
       {
           int totalPrice=0;
    	    String charges = poudp.getDeliverycharges();
    	    String isDelivered=  poudp.getIsDelivered(); 
    	    if(isDelivered.equals(status))
    	    {
    	    	
    	    	String orderid=poudp.getOrderid();
    
    %>
    

			 <div class="container2">
			    <div class="order-details">
			      <h2>Order Details</h2>
			      <table>
			      	  <tr>
			      		  <td><p><strong>Customer Name</strong></p></td>
			      		  <td><p><%=poudp.getFullname() %></p></td>
			      	  </tr>
			      	  <tr>
			      		  <td><p><strong>Address</strong> </p></td>
			      		  <td><p><%=poudp.getAddress() %> </p></td>
			      	  </tr>
			      	  <tr>
			      		  <td><p><strong>City</strong> </p></td>
			      		  <td><p><%=poudp.getCity() %> </p></td>
			      	  </tr>
			      	  <tr>
			      		  <td><p><strong>State</strong> </p></td>
			      		  <td><p><%=poudp.getState() %> </p></td>
			      	  </tr>
			      	  <tr>
			      		  <td><p><strong>Pincode</strong> </p></td>
			      		  <td><p><%=poudp.getPincode() %> </p></td>
			      	  </tr>
			      	  <tr>
			      		  <td><p><strong>Order Phone 1</strong> </p></td>
			      		  <td><p><%=poudp.getPhone() %> </p></td>
			      	  </tr>
			      	  <tr>
			      		  <td><p><strong>Order Phone 2</strong> </p></td>
			      		  <td><p><%=poudp.getMobile() %> </p></td>
			      	  </tr>
			      	  <tr>
			      		  <td><p><strong>Date & Time</strong> </p></td>
			      		  <td><p><%=poudp.getDatetime() %> </p></td>
			      	  </tr>
			      	  <tr>
			      		  <td><p><strong>Note</strong> </p></td>
			      		  <td><p><%=poudp.getOrdernotes() %> </p></td>
			      	  </tr>
			      </table> 
			    

			
			      <table>
			        <thead>
			          <tr>
			            <th>Product Title</th>
			            <th>Product Price</th>
			            <th>Count</th>
			            <th>Bulk Price</th>
			            <%
			            	if(status.equals("No"))
			             	{
			           	%>
			            	<th>Cancel Items</th>
			            <%
			            	}
			            %>
			            
			            
			          </tr>
			        </thead>
			        <tbody>
			         
			         <%
			              
			         PlaceOrderDetailsDao placeOrderDetailsDao = ac.getBean(PlaceOrderDetailsDao.class);
			         List<PlaceOrderDetailsPojo> l = placeOrderDetailsDao.readOrderIdWise(orderid);
			       
			         
			         for(PlaceOrderDetailsPojo podp :l)
			         {
			        	 
			        	  int mainPriceWithCount= Integer.parseInt( podp.getMainprice())*podp.getCount();
			        	  totalPrice += mainPriceWithCount;
			         %>


			          <tr>
			            <td><%=podp.getTitle() %></td>
			            <td>&#x20b9;<%=podp.getMainprice() %></td>
			            <td><%=podp.getCount() %></td>
			            <td>&#x20b9;<%= mainPriceWithCount %></td>
			           <%
			             if(status.equals("No"))
			             {
			           %>
			            <td><a style="color: red;" href="cancelorder?sn=<%=podp.getSn()%>&orderid=<%=poudp.getOrderid()%>">cancel</a> </td>
			            <%
			            }
			           %>
			             
			            
			          </tr>
			          
			          <%} %>
			      
			          <!-- Add more rows as needed -->
			        </tbody>
			      </table>
			      
			       <p><strong>Delivery Charge: &#x20b9;<%= charges %></strong></p> 
			       
			       <%
			         if(!charges.equalsIgnoreCase("Free"))
			         {
			        	 totalPrice += Integer.parseInt(charges);
			         }
			       %>
			       
			       <p style="font-size: 20px;"><strong>Total Charge: &#x20b9; <%= totalPrice%></strong></p>
			      
			        
			      
			    </div>
			  </div>
			  
			  <%
    	         } 
              }  
			  %>

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