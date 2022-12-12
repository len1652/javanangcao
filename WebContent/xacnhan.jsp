<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	 		 <input  class="form-control"  name="keyhd" type="text" value="" placeholder=""> 
		</form>
	</div>

<table class="table table-hover">

	
	
	  <div style="TEXT-ALIGN: center;">
	     <h2 style="font-weight: 600;">XÁC NHẬN THANH TOÁN THEO HÓA ĐƠN</h2>
	  </div>
	    
	   <button><a href="xacnhanController?">Thanh toán theo từng sách</a></button>
	
      <tr>
      	<th>STT</th>
      	<th>Ngày mua</th>
      	<th>Mã hóa đơn</th>
      	<th>Mã khách hàng</th>
      	<th>Tên khách hàng</th>
      	<th>Số lượng sách</th>
      	<th>Tổng tiền</th>
      </tr>
	<c:if test="${dsxn2 != null }">
		<c:set var = "count" value = "1"/>
		<c:forEach var="h" items="${dsxn2}" >
			<tr>
			  <td> ${count}</td>	
			  <c:set var = "count" value = '${count+1}'/>
			  <td> ${h.getNgayMua()}</td>
			  <td> ${h.getMaHoaDon()}</td>
			  <td> ${h.getMakh()}</td>
			  <td> ${h.getHoten()}</td>
			  <td> ${h.getSl()}</td>
			  <td> ${h.getTt()}</td>
			  <td> Đang chờ thanh toán</td>
		  	  <td>
			  	  <form id='${h.getMaHoaDon()}+"form"' action="xacnhanController">
			  	  	<button type="submit" name="mahd" value='${h.getMaHoaDon()}' form='${h.getMaHoaDon()}+"form"'>Thanh toán</button>
			  	  </form>
		  	  <td>
		   	</tr>
		</c:forEach>
	</c:if>
	</table>
</body>
</html>