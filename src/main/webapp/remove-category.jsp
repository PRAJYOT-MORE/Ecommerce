<%@page import="com.project.onlinegrocery.pojo.CategoryPojo"%>
<%@page import="com.project.onlinegrocery.dao.CategoryDao"%>
<%@include file="admin/authentication/admin-authentication.jsp" %>



<%@page import="com.project.onlinegrocery.pojo.DepartmentPojo"%>
<%@page import="java.util.List"%>
<%@page import="com.project.onlinegrocery.dao.DepartmentDao"%>
<%@page import="com.project.onlinegrocery.GetApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Remove Category</title>
    <style>
        body {
            margin: 0;
            font-family: 'Arial', sans-serif;
            background: linear-gradient(to right, #36D1DC, #5B86E5);
            color: #fff;
            padding: 20px;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            background:rgb(42 7 7 / 80%);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-size: 18px;
            margin-bottom: 5px;
        }

        input, select {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .add-button {
            background: #4CAF50;
            color: #fff;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
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
		
		.mb-5 {
			margin-bottom: 5rem;
			text-decoration: underline;
		}
        
        @media screen and (max-width: 768px) {
            .container {
                width: 80%;
            }
        }
    </style>
</head>
<body>

	<%!
		ApplicationContext ac = GetApplicationContext.getApplicationContext();
	%>

<h1 class="mb-5" style="color:white; text-align: center">Admin Task: Remove Category</h1>	
<div class="container">

    <button class="home-button"><a href="admintasks.jsp" style="text-decoration: none; color:white">Home</a></button>
    <h3><%@include file="messagebox/message.jsp" %></h3>
    <h2>Remove Category Form</h2>
    <form action="removecategory" method="post">
        <div class="form-group">
            <label for="category">Category:</label>
            <select id="category" name="category" required="required">
             <option value="" disabled selected>Select a Category</option>
             <%
             	CategoryDao categoryDao = ac.getBean(CategoryDao.class);
             	List <CategoryPojo> list = categoryDao.readCategory();
             	for(CategoryPojo cp : list)
             	{
             %>
                <option value="<%= cp.getCategory() %>"><%= cp.getCategory() %></option>                
             <%
             	}
             %>  
            </select>
        </div>
        <button type="submit" class="add-button">Remove</button>
    </form>
</div>

</body>
</html>