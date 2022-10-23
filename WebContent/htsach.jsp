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
      <li class="active"><a href="htsachController">Trang chủ</a></li>
      <li><a href="htgioController">Giỏ hàng</a></li>
        <li><a href="thanhtoanController">Thanh toán</a></li>
          <li><a href="lichsuController">Lịch sử mua hàng: <%=session.getAttribute("ss") %></a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="thoat.jsp"><span class="glyphicon glyphicon-user"></span> Logout</a></li>
      <%if(session.getAttribute("dn")==null){ %>
      <li><a href="ktdnController">
      <span class="glyphicon glyphicon-log-in"></span> 
      		Login
      </a></li>
      <%}else{ %>
      <li><a href="#">
      <span class="glyphicon glyphicon-log-in"></span> 
      		Hi: <%=session.getAttribute("dn") %>
      </a></li>
      <%} %>
    </ul>
  </div>
</nav>

<%loaibo lbo=new loaibo();
  sachbo sbo=new sachbo();
%>
<table width ="1000" align="center">
   <tr>
     <td width ="200" valign="top">
       <table class="table table-hover">
         <%for(loaibean l: lbo.getloai()){ %>
         <tr><td>
           <a href="htsachController?ml=<%=l.getMaloai()%>">
               <%=l.getTenloai() %>
            </a>
           </td>
           </tr>
           <%} %>
       </table>
     </td>
      <td width ="600" valign="top">
      <table class="table table-hover">
	     <%
	    
	     ArrayList<sachbean> dssach=(ArrayList<sachbean>)request.getAttribute("dssach");
	       int n=dssach.size();
	        for(int i=0;i<n;i++){
	        	sachbean s=dssach.get(i);
	          %>
	          <tr>
	          <td>
	            <img src="<%=s.getAnh() %>"><br>
	              <%=s.getTensach() %> <br>
	              <%=s.getTacgia() %> <br>
	              <%=s.getGia() %> <br>
					<a href="giohangController?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&gia=<%=s.getGia()%>">
	              <img src="buynow.jpg">
	            </a> 

	          </td>
	          <%i++;
	          if(i<n){
	          s=dssach.get(i);
	          %>
	          <td>
	            <img src="<%=s.getAnh() %>"><br>
	              <%=s.getTensach() %> <br>
	              <%=s.getTacgia() %> <br>
	              <%=s.getGia() %> <br>
					<a href="giohangController?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&gia=<%=s.getGia()%>">
	              <img src="buynow.jpg">
	            </a> 

	          </td>
	          <%} %>
	          
	          </tr>
	          <%} %>
     </table>
     </td>
      <td width ="200" valign="top">
      <form action="htsachController" method="post">
 		 <input  class="form-control"  name="txttk" type="text" value="" placeholder="Nhap tt"> <br>
  		 <input class="btn-primary"  name="butt" type="submit" value="Search">
		</form>
     </td>
   </tr>
</table>


</body>
</html>