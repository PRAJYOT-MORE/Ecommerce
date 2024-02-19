<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
<%
	String msg = (String) session.getAttribute("msg");
	if(msg != null)
	{
%>   

		<%= msg%>

<%
	}
	session.removeAttribute("msg");
%> 