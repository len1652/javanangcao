c<%@page import="bo.giohangbo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
		String masach=request.getParameter("remove");
		String clear=request.getParameter("clear");
		giohangbo gh;
		if(session.getAttribute("gio")==null){
			gh= new giohangbo();
			session.setAttribute("gio", gh);
		}
		
		//b1: gan session vao 1 bien
		gh=(giohangbo) session.getAttribute("gio");
		//b2: Thao tac trên bien: gh
		//b3: Luu gh vao session
		session.setAttribute("gio", gh);
		//Hien thi gio
			
			if (request.getParameter("remove")!=null) {
				gh.remove(masach);
	    		response.sendRedirect("htgio.jsp");
	    		return ;	
			}
			
			if (request.getParameter("clean")!=null) {
				session.removeAttribute("gio");
	    		response.sendRedirect("htgio.jsp");
	    		return ;	
			}
		response.sendRedirect("htgio.jsp");
	%>
</body>
</html>