<%@page import="bo.giohangbo"%>

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
		String msx=request.getParameter("remove");
		String clear=request.getParameter("clear");
   		String n=request.getParameter("number");
		String masach=request.getParameter("masach");
		//out.print(n+":"+masach);
   		//tao biến session
		
		giohangbo gh;//= new giohangbo();
		//b1: gan session vao 1 bien
		gh=(giohangbo) session.getAttribute("gio");
		//b2: Thao tac trên bien: gh
		long nn=Long.parseLong(n);
		if(nn==0){
			gh.remove(masach);
		}
		else {
			gh.Up(masach, nn);	
		}
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
		//b3: Luu gh vao session
		session.setAttribute("gio", gh);
		//Hien thi gio
  	response.sendRedirect("htgio.jsp");
		
		out.println ("</hr>");
		String[] gtcheck=request.getParameterValues("");
		for(String ss: gtcheck){
			
		}
		
   	%>
 	
</body>

</body>
</html>