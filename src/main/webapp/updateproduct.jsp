<%@include file="admin/authentication/admin-authentication.jsp" %>


<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.project.onlinegrocery.pojo.CategoryPojo"%>
<%@page import="com.project.onlinegrocery.dao.CategoryDao"%>
<%@page import="com.project.onlinegrocery.pojo.DepartmentPojo"%>
<%@page import="java.util.List"%>
<%@page import="com.project.onlinegrocery.dao.DepartmentDao"%>



<%@page import="java.util.Optional"%>
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
  <title>Update Product</title>

  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 20px;
      color:White !important;
      background: linear-gradient(to right, #36D1DC, #5B86E5);
    }

    .container {
      max-width: 800px;
      margin: 20px auto;
      background-color: rgb(42 7 7 / 80%);
      padding: 20px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
    }

    form {
      display: grid;
      gap: 15px;
    }

    label {
      display: block;
      font-weight: bold;
    }

    input,
    select {
      width: 100%;
      padding: 10px;
      box-sizing: border-box;
      border: 1px solid #ccc;
      border-radius: 5px;
      margin-top: 5px;
      margin-bottom: 15px;
    }

    .file-input {
      display: flex;
      align-items: center;
    }

    .file-input input[type="file"] {
      flex-grow: 1;
      margin-right: 10px;
    }
    
    .home-button {
        background: #3498db;
        color: #fff;
        padding: 10px 20px;
        font-size: 16px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        float: right;
    }

    .btn-add {
      padding: 10px;
      background-color: #4caf50;
      color: #fff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

	.mb-5 {
		margin-bottom: 5rem;
		text-decoration: underline;
	}

    @media screen and (max-width: 600px) {
      .container {
        max-width: 100%;
        padding: 10px;
      }
    }
  </style>
  
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/admin.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
</head>
<body>


	<%!
		ApplicationContext ac = GetApplicationContext.getApplicationContext();
	%>
 
<h1 class="mb-5" style="color:white; text-align: center">Admin Task: Update Product</h1>
<div class="container">

    <button class="home-button"><a href="admintasks.jsp" style="text-decoration: none; color:white">Home</a></a></button>
    <h3><%@include file="messagebox/message.jsp" %></h3>
    <h1>Update Product Form</h1>
    
  
  <%
       int sn= Integer.parseInt( request.getParameter("sn"));
       ApplicationContext ap= GetApplicationContext.getApplicationContext();
       ProductDao pd= ap.getBean(ProductDao.class);
       
       Optional<ProductPojo> op = pd.findById(sn);
       ProductPojo pp = op.get();
  
  %>

<form action="updateproduct" method="post">
    <label for="productTitle">Product Title:</label>
    <input type="text"  value="<%=pp.getTitle()%>" id="productTitle" name="title" required>

    <label for="productDescription">Product Description:</label>
    <textarea id="productDescription" name="description" rows="4" required><%=pp.getDescription()%></textarea>

    <label for="crossPrice">Cross Price:</label>
    <input type="number" value="<%=pp.getCrossprice()%>" id="crossPrice" name="crossprice" required>

    <label for="mainPrice">Main Price:</label>
    <input type="number" value="<%=pp.getMainprice()%>" id="mainPrice" name="mainprice" required>
    
    <label for="availability">Availability:</label>
    <select name="availability" required="required">
		<option value="" disabled selected>Select</option>
		<option value="IN STOCK">IN STOCK</option>
		<option value="OUT OF STOCK">OUT OF STOCK</option>
	</select>
	
	<label for="department">Department:</label>
    <select id="department" name="department" required="required">
    	<!-- <option value="" disabled selected>Select a department</option> -->
    
    		 <%
             	DepartmentDao departmentDao = ac.getBean(DepartmentDao.class);
             	List <DepartmentPojo> list = departmentDao.readDepartment();
             	for(DepartmentPojo dp : list)
             	{
             %>
                <option value="<%= dp.getDepartment() %>"><%= dp.getDepartment() %></option>                
             <%
             	}
             %>  
    </select>
    
    <label for="category">Category:</label>
    <select id="category" name="category" required>
    	
    </select>

    <label for="productImage" class="file-input">Product Image:</label>
    <input type="file" id="productImage" name="productimage" accept="image/*" required>
   

    <button class="btn btn-primary" type="submit">Submit</button>
  </form>
 
    
	<script type="text/javascript">
         
    document.addEventListener("DOMContentLoaded", function () {
        const departmentSelect = document.getElementById("department");
        const categorySelect = document.getElementById("category");
        console.log("Department dropdown:", departmentSelect);

        // Define categories for each department
        
        
        <%
	        CategoryDao bean = ac.getBean(CategoryDao.class);
	        List<CategoryPojo> cl= bean.readCategory();	
	        
	        HashMap<String, ArrayList<String>> hm = new HashMap<String, ArrayList<String>>();
	        		
	        for(DepartmentPojo dp : list)		
	        {
	        	hm.put(dp.getDepartment(), new ArrayList<String>());
	        }
        
	    
        for(CategoryPojo c : cl)
        {
            String department=  c.getDepartment();
            String category=  c.getCategory();
            
            hm.get(department).add(category);
        }
        %>
            
        const categories = {
        	<%
        		ArrayList<String> al;
        		for (String key : hm.keySet()) 
        		{
        			al = hm.get(key);
    
        	%>
        		<%= key %> : [<%  for(int i = 0 ; i < al.size() ; i++  ) { %> '<%= al.get(i)%>', <%}%>], 
        		
        	<% 	
        		}
        	%>
        		
        	
        };

        
        function populateCategoryDropdown() {
            const selectedDepartment = departmentSelect.value;
            console.log("Selected department:", selectedDepartment);
            console.log(selectedDepartment);
            const departmentCategories = categories[selectedDepartment];

            // Clear existing options
            categorySelect.innerHTML = "";

            // Add new options based on the selected department
            departmentCategories.forEach(function (category) {
                const option = document.createElement("option");
                option.value = category;
                option.text = category;
                categorySelect.appendChild(option);
            });
        }

        // Initially populate the category dropdown
        populateCategoryDropdown();

        // Update the category dropdown when the department changes
        departmentSelect.addEventListener("change", populateCategoryDropdown);
    });
    
    </script>
 
</div>

</body>
</html>
