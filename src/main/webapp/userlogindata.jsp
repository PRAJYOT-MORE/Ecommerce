<%@page import="java.util.ArrayList"%>


<%
	ArrayList<String> logindata = (ArrayList<String>) session.getAttribute("userlogindata");
	if(logindata == null){
		response.sendRedirect("index.jsp");
		return;
	}
%>
