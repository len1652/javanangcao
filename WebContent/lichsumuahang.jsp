<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="bean.sachbean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.sachbo"%>
<%@page import="bo.loaibo"%>
<%@page import="bean.loaibean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    
    <ul class="nav navbar-nav">
      <li><a href="htsachController">Trang chủ</a></li>
      <li><a href="htgioController">Giỏ hàng</a></li>
        <li><a href="dathangController">Thanh toán</a></li>
          <li><a href="lichsuController">Lịch sử mua hàng: <%=session.getAttribute("ss") %></a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      
      <c:if test = "${taikhoan == null}">
     
         <li><a href="ktdnController">
      		<span class="glyphicon glyphicon-log-in"></span> 
      		Login
      </a></li>
      </c:if>
      <c:if test="${taikhoan != null}">
      <li><a href="htsachController?logout=out"><span class="glyphicon glyphicon-user"></span> Logout</a></li>
      		<li><a href="#">
      <span class="glyphicon glyphicon-log-in"></span> 
      		Hi: ${taikhoan.getHoten()}
      </a></li>
      </c:if>
      
    </ul>
  </div>
</nav>
<table class="table table-hover">
      <tr>
		   		
			   	<td>Mã sách</td>
			   	<td>Tên sách</td>
			 
			   	<td>Số lượng 	</td>
			   	<td>Trạng thái	</td>
			   
			   	
		</tr>
	    
	   
	   	
	   	<c:forEach var ="h" items = "${dsdathang}">
		   		<tr>
		   		
			   		
				   	
				   	
				   	<c:if test="${h.isDamua()==true }">
				   		<%--<form action="dathangController?kt=${h.getMaChiTietHD() }" method="post">
				   			<td><input  name="butthanhtoan" type="submit" value="Thanh toán"></td>
				   			
				   		</form>--%>
				   		<td> ${h.getMaSach() } 	</td>
				   		<td> ${h.getTensach() } 	</td>
				   		<td> ${h. getSoLuongMua() } 	</td>
				   		<td> Đã thanh toán	</td>
				   	</c:if>
				   	
			 </tr>
		   	<c:set var = "i" scope = "session" value = "${i+1}"/>
	   </c:forEach>
	   	
		
     </table>
</body>
</html>