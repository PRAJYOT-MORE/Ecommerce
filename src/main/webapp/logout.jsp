<%

	session.removeAttribute("userlogindata");
	session.setAttribute("msg", "Logged out successfully!");
	response.sendRedirect("index.jsp");

%>