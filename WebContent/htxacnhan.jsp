
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.ArrayList"%>
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
      <li class="active"><a href="adminController">Trang chủ</a></li>
      <li><a href="loaiadminControler">Quản lý loại</a></li>
        <li><a href="themsach2Controler">Quản lý sách</a></li>
        <li><a href="xacnhanController">Xác nhận</a></li>
        <li><a href="danhsachchuyentienController">Khách hàng chuyển tiền</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
     
      <%if(session.getAttribute("dn")==null){ %>
      <li><a href="dangnhapadminController">
      <span class="glyphicon glyphicon-log-in"></span> 
      		Login
      </a></li>
      <%}%>
    </ul>
  </div>
</nav>

	<div style="    width: 300px; margin: auto ">
		<form action="xacnhanController" method="post">
	 		 <input  class="form-control"  name="key" type="text" value="" placeholder="Nhập thứ gì đó"> 
		</form>
	</div>

<table class="table table-hover">

	
	
	  <div style="TEXT-ALIGN: center;">
	     <h2 style="font-weight: 600;">XÁC NHẬN THANH TOÁN</h2>
	  </div>
	    
	   <button><a href="xacnhanController?hd=1">Thanh toán theo hóa đơn</a></button>
	
      <tr>
      	<th>STT</th>
      	<th>Mã chi tiết hóa đơn</th>
      	<th>Tên khách hàng</th>
      	<th>Tên sách</th>
      	<th>Ngày mua</th>
      	<th>Số lượng</th>
      	<th>Đơn giá</th>
      	<th>Thanh tiền</th>
      	<th>Trạng thái</th>
      </tr>
	<c:if test="${dsxn != null }">
		<c:set var = "count" value = "1"/>
		<c:forEach var="h" items="${dsxn}" >
			<tr>
			  <td> ${count}</td>	
			  <c:set var = "count" value = '${count+1}'/>
			  <td> ${h.getMaChiTietHD()}</td>
			  <td> ${h.getHoten()}</td>
			  <td> ${h.getTensach()}</td>
			  <td> ${h.getNgayMua()}</td>
			  <td> ${h.getSoLuongMua()}</td>
			  <td> ${h.getGia()}</td>
			  <td> ${h.getThanhTien()}</td>
			  <td> Đang chờ thanh toán</td>
		  	  <td><form id='${h.getMaChiTietHD()}+"form"' action="xacnhanController">
		  	  	<button type="submit" name="matt" value='${h.getMaChiTietHD()}' form='${h.getMaChiTietHD()}+"form"'>Thanh toán</button>
		  	  </form><td>
		   	</tr>
		</c:forEach>
	</c:if>
	</table>
</body>
</html>



