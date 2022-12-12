<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
</head>
<body>
  
  
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

  
  
  	  <div style="TEXT-ALIGN: center;">
	     <h2 style="font-weight: 600;color: red;">Sửa sách</h2>
	  </div>
	 <c:if test="${sach!=null}">
	    
   <div style="width: 500px;    margin: auto; margin-bottom: 100px;">
   	<form method="post" action="themsachController?edit=1&old_img=${sach.getAnh()}" enctype= "multipart/form-data">
    <div class="mb-3 mt-3">
      <label for="email">Mã sách:</label>
      <input type="text" class="form-control" name="txtmasach" value="${sach.getMasach()} " readonly>
    </div>
    <div class="mb-3">
      <label for="pwd">Tên sách:</label>
      <input type="text" class="form-control" id="pwd" value="${sach.getTensach()}"  name="txttensach">
    </div>
    <div class="mb-3 mt-3">
      <label for="email">Tác giả:</label>
      <input type="text" class="form-control" id="email" value="${sach.getTacgia()}" name="txttacgia">
    </div>
    <div class="mb-3">
      <label for="pwd">Giá:</label>
      <input type="number" class="form-control" id="pwd" value="${sach.getGia()}" name="txtgia">
    </div>
    <div class="mb-3 mt-3">
      <label for="email">Số lượng:</label>
      <input type="number" class="form-control" id="email" value="${sach.getSoluong()}" name="txtsoluong">
    </div>
    <div class="mb-3">
      <label for="pwd">Ngày nhập:</label>
      <input type="date" class="form-control" id="pwd" value="${sach.getNgayNhap()}" name="txtngaynhap">
    </div>
    <div class="mb-3 mt-3">
      <label for="email">Ảnh:</label>
      <input type='file' class="form-control" name="txtfile" id="img"/>
	  <div id="selectedBanner">
	  <img src="${sach.getAnh()}"  height="200px"></div>
    </div>
    <div class="mb-3">
      <label for="txtsotap">Số tập:</label>
      <input type="text" class="form-control" id="pwd" value="${sach.getSotap()}" name="txtsotap">
    </div>
    <div class="mb-3 mt-3">
      <label for="email">Thể loại sách:</label>
      <select  class="form-control"  name="maloai" id="maloai">
	       <c:forEach var="t" items="${dsl}">
	       <c:choose>
			  <c:when test="${t.getMaloai()== sach.getMaloai()}">
			   	<option value="${t.getMaloai()}" selected >${t.getTenloai()}</option>
			  </c:when>
			  <c:otherwise>
			    <option value="${t.getMaloai()}" >${t.getTenloai()}</option>
			  </c:otherwise>
			</c:choose>
	        
	       </c:forEach>
	      </select>
    </div>
    <button type="submit" class="btn btn-primary" style="margin-top: 10px;
    float: right;">Lưu thay đổi</button>
  </form>
   </div>
	 </c:if>
    
    
  
  

</body>
 <script
      src="https://code.jquery.com/jquery-3.6.0.min.js"
      integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
      crossorigin="anonymous"
    ></script>
 <script>
      var selDiv = "";
      var storedFiles = [];
      $(document).ready(function () {
        $("#img").on("change", handleFileSelect);
        selDiv = $("#selectedBanner");
      });

      function handleFileSelect(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);
        filesArr.forEach(function (f) {
          if (!f.type.match("image.*")) {
            return;
          }
          storedFiles.push(f);

          var reader = new FileReader();
          reader.onload = function (e) {
            var html =
              '<img src="' +
              e.target.result +
              "\" data-file='" +
              f.name +
              "alt='Category Image' height='200px'>";
            selDiv.html(html);
          };
          reader.readAsDataURL(f);
        });
      }
    </script>


</html>