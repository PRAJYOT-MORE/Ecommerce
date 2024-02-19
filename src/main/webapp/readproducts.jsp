<%@page import="com.project.onlinegrocery.pojo.DepartmentPojo"%>
<%@page import="java.util.List"%>
<%@page import="com.project.onlinegrocery.dao.DepartmentDao"%>
<%@include file="admin/authentication/admin-authentication.jsp" %>


<%@page import="java.util.ArrayList"%>
<%@page import="com.project.onlinegrocery.pojo.ProductPojo"%>
<%@page import="com.project.onlinegrocery.dao.ProductDao"%>
<%@page import="com.project.onlinegrocery.GetApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Product Details</title>
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
	
	<%!
		ApplicationContext ac = GetApplicationContext.getApplicationContext();
	%>
	
  <header>
     <h3><a style="color: white;" href="admintasks.jsp">ADMIN HOME</a></h3>
     <h1>Product Details</h1>
  </header>

  <div class="container">
   <h3 style="color: red; text-align: center"><%@include file="messagebox/message.jsp" %><br></h3>
   
   
   <form action="readproducts.jsp" method="post" class="mb-5">
    <label for="search">Search:</label>
    <input type="text" id="search" name="search" placeholder="What do yo u need?">
    <button type="submit" class="site-btn rounded">SEARCH</button>
   </form>
   
   
    <label for="department">Select Department:</label>
    <b>
    <ul>
         <li class="mx-3" style="display: inline;"><a style="text-decoration: none;" href="readproducts.jsp?department=all">All</a></li>
         <%
             DepartmentDao departmentDao = ac.getBean(DepartmentDao.class);
             List <DepartmentPojo> deptList = departmentDao.readDepartmentAscending();
             for(DepartmentPojo dp : deptList)
             {
		 %>
		<li class="mx-3" style="display: inline;"><a style="text-decoration: none;" href="readproducts.jsp?department=<%= dp.getDepartment() %>"><%= dp.getDepartment() %></a></li>                
		<%
		     }
		%>
                        
 
 	</ul>
    </b><br><hr><br><br>
      
             <%
             
             int startIndex = 0;
             String start = request.getParameter("start");
             
             if(start != null){
             	startIndex = Integer.parseInt(start);	
             }
             
             
             ProductDao productDao = ac.getBean(ProductDao.class);
     		 Iterable<ProductPojo> itr = null;
 		
         	String search = request.getParameter("search");
         	session.setAttribute("cat", search);
         	String department = request.getParameter("department");
         	session.setAttribute("dept", department);
         	if(search == null){
         		// Opened webpage without searching
         		if(department == null || department.equals("all")){
             		itr = productDao.readAllProducts(startIndex);              			
         		}
         		else{
         			itr = productDao.readProductDepartmentWisePagination(department, startIndex);
         		}
         	}
         	else{
         		// Opened webpage using search
         		itr = productDao.readProductCategoryWisePagination(search, startIndex);
         	}
         	
         	if (search == null && department == null){
        		session.setAttribute("cat", null);
        		session.setAttribute("dept", null);
        	}
         	
         	ArrayList<ProductPojo> al = (ArrayList<ProductPojo>) itr;
      
         	
         	int index = 0; // Will be 0 on every page reload
        	int current = 0;
     		for(ProductPojo pp : al)
     		{
                   
            %> 
	<div class="table-responsive">
		<table class="table">
			<tr>
				<td class="col-lg-6">Product image</td>
				<td class="col-lg-6"><img alt="" src="admin/products/<%=pp.getProductimage() %>" alt="Product Image" height="30%" width="50%"></td>
			</tr>
			<tr>
				<td class="col-lg-6"><p>Title</p></td>
				<td class="col-lg-6"><%=pp.getTitle() %></td>
			</tr>
			<tr>
				<td class="col-lg-6"><p>Description</p></td>
				<td class="col-lg-6"><pre><%=pp.getDescription() %></pre></td>
			</tr>
			<tr>
				<td class="col-lg-6"><p>CrossPrice</p></td>
				<td class="col-lg-6"><%=pp.getCrossprice() %></td>
			</tr>
			<tr>
				<td class="col-lg-6"><p>Main Price</p></td>
				<td class="col-lg-6"><%=pp.getMainprice() %></td>
			</tr>
			<tr>
				<td class="col-lg-6"><p>Availability</p></td>
				<td class="col-lg-6"><%=pp.getAvailability() %></td>
			</tr>
			<tr>
				<td class="col-lg-6"><p>Department</p></td>
				<td class="col-lg-6"><%=pp.getDepartment() %></td>
			</tr>
			<tr>
				<td class="col-lg-6"><p>Category</p></td>
				<td class="col-lg-6"><%=pp.getCategory()%></td>
			</tr>
		</table>
	</div>

        <form action="deleteproduct" method="post">
             <input type="hidden" name="sn" value="<%=pp.getSn()%>">
             <input type="hidden" name="photoname" value="<%=pp.getProductimage() %>">
             <button class="rounded">Delete</button>
         </form>
   <b>  <button class="btn btn-primary mt-3"><a style="text-decoration: none; color:white" href="updateproduct.jsp?sn=<%=pp.getSn()%>" >Update Product</a></button></b><br><hr><br><br>
  
   <%
    current++;
	startIndex++;
 	index++;
    } %>
  
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
                    
                        		<a class="text-start" href="readproducts.jsp?department=<%= session.getAttribute("dept") %>&category=<%= session.getAttribute("cat") %>&start=<%= startIndex - 8 - current%>"><svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-arrow-left-circle-fill mx-5" viewBox="0 0 16 16">
								  	<path d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0m3.5 7.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5z"/>
								</svg></a>
                        
                        <%
                    		}
                        %>
                        
                        <%
                    		if(current == 8)
                    		{
                    	%>
                        
                        		<a class="text-end" href="readproducts.jsp?department=<%= session.getAttribute("dept") %>&category=<%= session.getAttribute("cat") %>&start=<%= startIndex%>"><svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-arrow-right-circle-fill mx-5" viewBox="0 0 16 16">
  									<path d="M8 0a8 8 0 1 1 0 16A8 8 0 0 1 8 0M4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5z"/>
								</svg></a>
                    
                    	<%
                    		}
                    	%>
                    </div>
  <br> <br> <br> <br>
  
  

</body>
</html>