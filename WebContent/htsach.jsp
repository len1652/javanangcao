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
      <li class="active"><a href="htsach.jsp">Trang chủ</a></li>
      <li><a href="htgio.jsp">Giỏ hàng</a></li>
        <li><a href="thanhtoan.jsp">Thanh toán</a></li>
          <li><a href="lichsu.jsp">Lịch sử mua hàng: <%=session.getAttribute("ss") %></a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="thoat.jsp"><span class="glyphicon glyphicon-user"></span> Logout</a></li>
      <%if(session.getAttribute("dn")==null){ %>
      <li><a href="dangnhap.jsp">
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
           <a href="htsach.jsp?ml=<%=l.getMaloai()%>">
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
	     request.setCharacterEncoding("utf-8");
	     response.setCharacterEncoding("utf-8");
	     String ml=request.getParameter("ml");
	     String key=request.getParameter("txttk");
	     ArrayList<sachbean> dssach=sbo.getsach();
	     if(ml!=null)
	    	 dssach=sbo.TimMa(ml);
	     else
	    	 if(key!=null)
		    	 dssach=sbo.Tim(key);
	     
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
<a href="giohang.jsp?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&gia=<%=s.getGia()%>">
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
<a href="giohang.jsp?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&gia=<%=s.getGia()%>">
	              <img src="buynow.jpg">
	            </a> 

	          </td>
	          <%} %>
	          
	          </tr>
	          <%} %>
     </table>
     </td>
      <td width ="200" valign="top">
      <form action="htsach.jsp" method="post">
 		 <input  class="form-control"  name="txttk" type="text" value="" placeholder="Nhap tt"> <br>
  		 <input class="btn-primary"  name="butt" type="submit" value="Search">
		</form>
     </td>
   </tr>
</table>


</body>
</html>