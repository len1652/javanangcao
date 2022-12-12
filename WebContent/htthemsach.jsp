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

  
  
  	  <div style="TEXT-ALIGN: center;">
	     <h2 style="font-weight: 600;color: red;">Thêm sách mới</h2>
	  </div>
	    
   <div style="width: 500px;    margin: auto; margin-bottom: 100px;">
   	<form method="post" action="themsachController" enctype= "multipart/form-data">
    <div class="mb-3 mt-3">
      <label for="email">Mã sách:</label>
      <input type="text" class="form-control" name="txtmasach" value="">
    </div>
    <div class="mb-3">
      <label for="pwd">Tên sách:</label>
      <input type="text" class="form-control" id="pwd" placeholder=""  name="txttensach">
    </div>
    <div class="mb-3 mt-3">
      <label for="email">Tác giả:</label>
      <input type="text" class="form-control" id="email" placeholder="" name="txttacgia">
    </div>
    <div class="mb-3">
      <label for="pwd">Giá:</label>
      <input type="number" class="form-control" id="pwd" placeholder="" name="txtgia">
    </div>
    <div class="mb-3 mt-3">
      <label for="email">Số lượng:</label>
      <input type="number" class="form-control" id="email" placeholder="" name="txtsoluong">
    </div>
    <div class="mb-3">
      <label for="pwd">Ngày nhập:</label>
      <input type="date" class="form-control" id="pwd" placeholder="" name="txtngaynhap">
    </div>
    <div class="mb-3 mt-3">
      <label for="email">Ảnh:</label>
     <!--  <input type="file" class="form-control" id="email" placeholder="" name="txtfile"> -->
      <input type='file' class="form-control" name="txtfile" id="img"/>
	  <div id="selectedBanner"></div>
    </div>
    <div class="mb-3">
      <label for="txtsotap">Số tập:</label>
      <input type="text" class="form-control" id="pwd" name="txtsotap">
    </div>
    <div class="mb-3 mt-3">
      <label for="email">Thể loại sách:</label>
      <select  class="form-control"  name="maloai" id="maloai">
	       <c:forEach var="t" items="${dsl}">
	        <option value="${t.getMaloai()}">${t.getTenloai()}</option>
	       </c:forEach>
	      </select>
    </div>
    
    <button type="submit" class="btn btn-success" style="margin-top: 10px;
    float: right;">Thêm sách</button>
  </form>
   </div>
  
  

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