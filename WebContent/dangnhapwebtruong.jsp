<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
</head>
<body bgcolor="#ABD9FF">
	<table class = bang  width = 100% align = "center">
		<tr>
			<td class= bentrai width=50% align="center">
           		<div class=bangbentrai>
           			
           			<img alt="" src="Logo-ko-nen.png" width=120px><br>
           			
           			<img alt="" src="anhnen.png" >
           		</div>
			</td>
			<td width=50% >
           		
           		<form action="/Account/Login" method="post" class="hitec-form-signin"  >
                    <input name="__RequestVerificationToken" type="hidden"  />
                    <img  src="logonho.png" alt="">
                    <h2 class="form-signin-heading" style=" color: #006eb7;">SINH VIÊN</h2>
                    <div class="form-group">
                        <label style="font-weight: bold; for="loginID" class = tkmk  >Mã sinh viên:</label><br>
                        <input  width=100% type="text" id="loginID" name="loginID" class="form-control input-lg" placeholder="Mã sinh viên" required autofocus value=""/>
                    </div>
                    <div class="form-group">
                        <label style="font-weight: bold; width: 100% ; for="password" class=tkmk >Mật khẩu:</label><br>
                        <input  width=100% type="password" id="password" name="password" class="form-control input-lg" placeholder="Mật khẩu" required value="" />
                    </div>
                    <div class="form-group">
                        <span class="text-danger"></span>
                    </div>
                    <button width=100%; class="btn-custom" type="submit">Đăng nhập</button>
                </form>
           	</td>
     	</tr>
			
		<tr >
			<td class=banquyen colspan="2">
				Trường Đại học Khoa học, Đại học Huế<br>
				77 Nguyễn Huệ, Thành phố Huế, Tỉnh Thừa Thiên Huế, Việt Nam<br>
				Điện thoại: (+84) 0234.3823290 – Fax: (+84) 0234.382490<br>
			</td>
			
			
		</tr>
	</table>
</body>
</html>