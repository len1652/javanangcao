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


<table class="table table-hover">
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    
    <ul class="nav navbar-nav">
      <li class="active"><a href="adminController">Trang chủ</a></li>
      <li><a href="loaiadminController">Quản lý loại</a></li>
        <li><a href="sachadminController">Quản lý sách</a></li>
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
	
	<div style="   margin: auto ">
		<form action="sachadminController" method="post">
	 		 <input  class="form-control"  name="key" type="text" value="" placeholder="Nhập tên, tác giả, mã loại cần tìm"> 
		</form>
	</div>
	
	  <div style="TEXT-ALIGN: center;">
	     <h2 style="font-weight: 600; color: red;">Chỉnh sách</h2>
	  </div>
	    
	  <button><a href="sachadminController?add=1">Thêm sách</a></button>
	
      <tr>
      	<th>STT</th>
      	
      	<th>Mã loại</th>
      	<th>Mã sách</th>
      	<th>Tên sách</th>
      	<th>Số tập</th>
      	<th>số lượng</th>
      	<th>Giá bán</th>
      	<th>Ngày nhập</th>
      </tr>
	<c:if test="${dss != null }">
		<c:set var = "count" value = "1"/>
		<c:forEach var="h" items="${dss}" >
			<tr>
			  <td> ${count}</td>	
			  <c:set var = "count" value = '${count+1}'/>
			  
			  
			  <td> ${h.getMaloai()}</td>
			  <td> ${h.getMasach()}</td>
			  <td> ${h.getTensach()}</td>
			  <td> ${h.getSotap()}</td>
			  <td> ${h.getSoluong()}</td>
			  <td> ${h.getGia()}</td>
			  <td> ${h.getNgayNhap()}</td>

		  	  <td>
			  	  <form id='${h.getMasach()}+"form"' action="sachadminController">
			  	  	<button type="submit" name="xoa" value='${h.getMasach()}' form='${h.getMasach()}+"form"'>Xóa</button>
			  	  </form>
		  	  <td>
		  	  
		  	  <td>
			  	  <form id='${h.getMasach()}+"form"' action="sachadminController">
			  	  	<button type="submit" name="edit" value='${h.getMasach()}' form='${h.getMasach()}+"form"'>edit</button>
			  	  </form>
		  	  <td>
		   	</tr>
		</c:forEach>
	</c:if>
	</table>
</body>
</html>