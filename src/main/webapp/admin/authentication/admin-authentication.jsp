<%
	String token = (String) session.getAttribute("token");
	if(token == null){
		response.sendRedirect("adminlogin.jsp");
		return;
	}
%>