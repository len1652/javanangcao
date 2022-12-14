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

  

 <body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    
    <ul class="nav navbar-nav">
      <li class="active"><a href="htsachController">Trang chủ</a></li>
      <li><a href="htgioController">Giỏ hàng</a></li>
        <li><a href="thanhtoanController">Thanh toán</a></li>
          <li><a href="lichsuController">Lịch sử mua hàng: <%=session.getAttribute("ss") %></a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="thoat.jsp"><span class="glyphicon glyphicon-user"></span> Logout</a></li>
      <li><a href="dangnhap.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>

<table width ="1000" align="center">
   <tr>
      <td width ="200" valign="top">
       <table class="table table-hover">
         <c:forEach var ="l" items = "${dsloai}">
         <tr>
         	<td>
         		<a href="htsachController?ml=${l.getMaloai()}">
         			${l.getTenloai() }
         		</a>
         	</td>
         </tr>
         </c:forEach>
       </table>
     </td>
      <td width ="600" valign="top">
      <table class="table table-hover">
	    	<tr  class="col-md-9" align="center"  height="200" >
              
                	<div class="row carousel-holder" align="center">
                    <div class="col-md-12">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="item active">
                                    <img class="slide-image" src="hear1.jpg" alt="">

                                </div>
                                <div class="item">
                                    <img class="slide-image" src="hear2.jpg" alt="" >
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="hear3.jpg" alt="" >
                                </div>


                            </div>
                            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                            </a>
                        </div>
                    </div>
                </div>
       
             </tr>
             <tr  class="col-md-9" align="center"  height="200" >
             		<form action="ktdnController?kt=1" method="post">
    	
							<h3 style="text-align:center">ĐĂNG NHẬP</h3>
              
			                <input  class="form-control"  name="txtun" type="text" value=""  placeholder="Tài khoản"> <br>
			                
							<input  class="form-control"  name="txtpass" type="text" value=""  placeholder="Mật khẩu"> <br>
							<c:if test = "${ktra ==1}">
						         	<h4 style="color: red;"> tài khoản hoặc mật khẩu sai</h4>
						    </c:if>
							
				  			<input class="btn btn-primary"  name="butdn" type="submit" value="Đăng nhập">  
				  			
                       						
												                       
					</form>
             	
                    
             </tr>
    			
	          
     </table>
     </td>
      <td width ="200" valign="top">
      <form action="htsachController" method="post">
    	
			<input  class="form-control"  name="txttk" type="text" value=""  placeholder="Nhap tt"> <br>
  			<input class="btn-primary"  name="butt" type="submit" value="Search">                   						
								                       
	</form>
     </td>
   </tr>
</table>

</body>
</body>
</html>