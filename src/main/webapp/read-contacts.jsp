<%@include file="admin/authentication/admin-authentication.jsp" %>

<%@page import="com.project.onlinegrocery.pojo.ContactPojo"%>
<%@page import="java.util.List"%>
<%@page import="com.project.onlinegrocery.dao.ContactDao"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="com.project.onlinegrocery.GetApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Read Messages</title>

<style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 20px;
      color:White;
      background: linear-gradient(to right, #36D1DC, #5B86E5);
    }

    .container {
      max-width: 1300px;
      margin: 20px auto;
      background-color: white;
      padding: 20px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
    }
    
    .message-container {
      max-width: 1200px;
      margin: 20px auto;
      background-color: #EEEEEE;
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
	
	.color-black, .color-black * {
		color:black;
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

	.table {
        width: 100%;
    }
    .table th, .table td {
        border: 1px solid black;
        padding: 8px;
    }
    .text-align-left {
    	text-align: left;
    }
    .name-column {
        width: 16.67%; /* 2 parts out of 12 */
    }
    .email-column {
        width: 16.67%; /* 2 parts out of 12 */
    }
    .message-column {
        width: 33.33%; /* 4 parts out of 12 */
    }
    .date-column {
        width: 25%; /* 3 parts out of 12 */
    }
    .form-column {
        width: 8.33%; /* 1 part out of 12 */
    }

    @media screen and (max-width: 600px) {
      .container {
        max-width: 100%;
        padding: 10px;
      }
    }
  </style>
</head>
<body>

	<%!
		ApplicationContext ac = GetApplicationContext.getApplicationContext();
	%>
 
	<h1 class="mb-5" style="color:white; text-align: center">Admin Task: Read Messages</h1>
	<div class="container">

	
    <button class="home-button"><a href="admintasks.jsp" style="text-decoration: none; color:white">Home</a></a></button>
    <h3><%@include file="messagebox/message.jsp" %></h3>
    <h1 class="color-black">User Messages</h1>
    <div class="message-container color-black table-responsive">
    	<table class="table">
	    	<thead>
		    	<tr>
					<th class="name-column text-align-left">Name</th>
					<th class="email-column text-align-left">Email</th>
					<th class="message-column text-align-left">Message</th>
					<th class="date-column text-align-left">Datetime</th>
					<th class="form-column text-align-left"></th>
				<tr>
			</thead>
			<tbody>
   
				<%
					ContactDao bean = ac.getBean(ContactDao.class);
					List<ContactPojo> list = bean.readContacts();
					
					for(ContactPojo cp : list)
					{
				%>		
				<tr>
					<td><%= cp.getName() %></td>
					<td><%= cp.getEmail() %></td>
					<td><%= cp.getMessage() %></td>
					<td><%= cp.getDatetime() %></td>
					<td>
						<form action="deletecontact" method="post">
							<input type="hidden" name="sn" value="<%= cp.getSn()%>">
							<button><span style="color: red">Delete</span></button>
						</form>
					</td>
				</tr>
	<%
		}
	%>	
				</tbody>
			</table>
		</div>
    </div>
</body>
</html>