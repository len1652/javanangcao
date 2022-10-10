
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
  <form action="thu.jsp" method="post">
 		 <input   name="txtn" type="text" value="" placeholder="Nhap tt"> <br>
  		 <input   name="butt" type="submit" value="Tong">
  </form>
  <%
     String nn= request.getParameter("txtn");
      //Cap cho nguoi dung 1 bien session
      //Neu chua cap session
      if(session.getAttribute("ss")==null)
    	  session.setAttribute("ss",(int) 0);
      
  	 if(nn!=null){
  		 int n= Integer.parseInt(nn);
  		 //b1: Lay gia tri cua bien session luu vao bien
  		 int s=(int)session.getAttribute("ss");
  		 //b2: Thay doi gia tri cua bien
  		 s=s+n;
  		 //b3: Luu bien vao session
  		 session.setAttribute("ss", s);
  		 out.print("Tong: "+ s);
  	 }
  	 
  %>
  <a href="htsach.jsp"> Mo trang chu </a>
</body>
</html>
