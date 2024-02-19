<%@include file="admin/authentication/admin-authentication.jsp" %>


<%@page import="com.project.onlinegrocery.pojo.PlaceOrderDetailsPojo"%>
<%@page import="java.util.List"%>
<%@page import="com.project.onlinegrocery.pojo.PlaceOrderUserDetailsPojo"%>
<%@page import="com.project.onlinegrocery.dao.PlaceOrderDetailsDao"%>
<%@page import="com.project.onlinegrocery.dao.PlaceOrderUserDetailsDao"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="com.project.onlinegrocery.GetApplicationContext"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Check Order</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    header {
      background-color: #333;
      color: #fff;
      padding: 10px;
      text-align: center;
    }

    .container {
      max-width: 800px;
      margin: 20px auto;
      padding: 20px;
      border: 1px solid #ddd;
      border-radius: 5px;
    }
    
    .product-image {
    	width: 20%;
    }

    input[type="text"], select, button {
      width: 100%;
      padding: 10px;
      margin: 8px 0;
      display: inline-block;
      border: 1px solid #ccc;
      box-sizing: border-box;
    }

    img {
      max-width: 100%;
      height: auto;
      margin-top: 10px;
    }

    button {
      background-color: #4CAF50;
      color: white;
      padding: 10px 15px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    button:hover {
      background-color: #45a049;
    }
  </style>
  	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
</head>
<body>

	<header>
    	<h3><a style="color: white;" href="admintasks.jsp">ADMIN HOME</a></h3>
    	<h1>Check Order</h1>
  	</header>

    <h3 style="color: red; text-align: center"><%@include file="messagebox/message.jsp" %><br></h3>
   
   	<%
	   	int startIndex = 0;
	    String start = request.getParameter("start");
	    
	    if(start != null){
	    	startIndex = Integer.parseInt(start);	
	    }
    
       
    	int totalMainPrice=0;
     	ApplicationContext ac= GetApplicationContext.getApplicationContext();
   
	    PlaceOrderUserDetailsDao placeOrderUserDetailsDao= ac.getBean(PlaceOrderUserDetailsDao.class);
	    PlaceOrderDetailsDao placeOrderDetailsDao= ac.getBean(PlaceOrderDetailsDao.class);
	     
	    Iterable<PlaceOrderUserDetailsPojo> itr= placeOrderUserDetailsDao.findAll();
	    
	    int index = 0; // Will be 0 on every page reload
    	int current = 0;
	    for( PlaceOrderUserDetailsPojo poudp:  itr)
	    {
      
        	if(poudp.getIsDelivered().equalsIgnoreCase("No"))
      		{
    %>
   
 
  	<div class="container">

		<div class="table-responsive">
		<table class="table">
			<tr>
				<td class="col-lg-6"><p>Name</p></td>
				<td class="col-lg-6"><%=poudp.getFullname() %></td>
			</tr>
			<tr>
				<td class="col-lg-6"><p>Address</p></td>
				<td class="col-lg-6"><%=poudp.getAddress() %></td>
			</tr>
			<tr>
				<td class="col-lg-6"><p>City</p></td>
				<td class="col-lg-6"><%=poudp.getCity()%></td>
			</tr>
			<tr>
				<td class="col-lg-6"><p>State</p></td>
				<td class="col-lg-6"><%=poudp.getState()%></td>
			</tr>
			<tr>
				<td class="col-lg-6"><p>Pincode</p></td>
				<td class="col-lg-6"><%=poudp.getPincode()%></td>
			</tr>
			<tr>
				<td class="col-lg-6"><p>Order phone</p></td>
				<td class="col-lg-6"><%=poudp.getPhone()%></td>
			</tr>
			<tr>
				<td class="col-lg-6"><p>Signup phone</p></td>
				<td class="col-lg-6"><%=poudp.getMobile() %></td>
			</tr>
			<tr>
				<td class="col-lg-6"><p>Date & Time</p></td>
				<td class="col-lg-6"><%=poudp.getDatetime() %></td>
			</tr>
			<tr>
				<td class="col-lg-6"><p>Order Note</p></td>
				<td class="col-lg-6"><%=poudp.getOrdernotes() %></td>
			</tr>
		</table>
		</div>
		
		
		<div class="table-responsive">
		   	<table class="table">
		   		<thead>
		   			<tr>
		   				<th class="product-image">Product Image</th>
		   				<th>Product title</th>
		   				<th>Product Price</th>
		   				<th>Count</th>
		   			</tr>
		   		</thead>
		   		<tbody>	
   		    <%
				String orderid= poudp.getOrderid();
        		List<PlaceOrderDetailsPojo> list= placeOrderDetailsDao.readOrderIdWise(orderid);
        
		        for(PlaceOrderDetailsPojo podp  :list)
		        {
		        	
		        	 int count = podp.getCount();
		        	 String mainPrice = podp.getMainprice();
		        	 int mainPriceWithCount = Integer.parseInt(mainPrice) * count;
		        	 totalMainPrice += mainPriceWithCount;
		 	%>
		   
		   		
		   			<tr>
						<td class="col-lg-6"><img alt="img" src="admin/products/<%= podp.getProductimage()%>" alt="Product Image" height="30%" width="50%"></td>
						<td><%= podp.getTitle() %></td>
						<td>&#x20b9;<%= mainPrice %></td>
						<td><%= count %></td>
					</tr>
		   		
					 
		    <%
		    	} 
		    
	           	String deliveryCharges = poudp.getDeliverycharges();
	   	       	if(!deliveryCharges.equalsIgnoreCase("Free"))
	   	       	{
	   	    		totalMainPrice += Integer.parseInt(deliveryCharges);
	   	       	}
		    %>	
		    	</tbody>
		   	</table>
		</div>
					  <h2 style="text-align: center;">Total price: &#x20b9;<%= totalMainPrice %></h2>   			  
			<form action="delivered" method="post">
			    <select name="confirm" required="required">
			        <option value="" disabled selected>Select</option>
			        <option value="confirm delivery">Confirm delivery</option>
			    </select>
			    <input type="hidden" name="sn" value="<%= poudp.getSn() %>">
			    <button>Delivered</button>
			</form>
		<br>
  	</div>
	<%	
				current++;
				startIndex++;
			 	index++;
			}
      		totalMainPrice=0;
      	}  
    %>


						<%
                    		if(startIndex > 8)
                    		{
                    	%>
                    
                        		<a class="text-start" href="orderhistory.jsp?start=<%= startIndex - 8 - current%>"><svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-arrow-left-circle-fill mx-5" viewBox="0 0 16 16">
								  	<path d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0m3.5 7.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5z"/>
								</svg></a>
                        
                        <%
                    		}
                        %>
                        
                        <%
                    		if(current == 8)
                    		{
                    	%>
                        
                        		<a class="text-end" href="orderhistory.jsp?start=<%= startIndex%>"><svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-arrow-right-circle-fill mx-5" viewBox="0 0 16 16">
  									<path d="M8 0a8 8 0 1 1 0 16A8 8 0 0 1 8 0M4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5z"/>
								</svg></a>
                    
                    	<%
                    		}
                    	%>

</body>
</html>