<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增照片</title>
  <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/eeit10927/js/login.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">

<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">

<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/ionicons.min.css">

<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">


<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">
<style>
#thumb {
	height: 40px;
}
li {
	float: left;
	width: 7em;
	color: #FFAA33;
	font-family:monospace;
}
body{
background-color:#FF8800;
}

</style>
</head>
<body >
<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
		
			<a class="navbar-brand"
				href="http://localhost:8080/MeetTogether/register">Meet <span>Together</span></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto" id="menu">
					<li class="nav-item active"><a href="index.html"
						class="nav-link">首頁</a></li>
					<li class="nav-item"><a href="about.html" class="nav-link">交友</a></li>
					<li class="nav-item"><a href="pricing.html" class="nav-link">活動</a></li>
					<li class="nav-item">
							<a href="<c:url value='/GetAllPostServlet' />"class="nav-link">討論區</a>
						</li>

					<li class="nav-item"><a href="getmember" class="nav-link">會員資料</a></li>

					<li class="nav-item"><a class="nav-link"><c:if test="${!empty userId}">${userName}
						</c:if></a></li>

					<li class="nav-item"><c:if test="${!empty userId}">
							<img id="thumb"
								src='${pageContext.request.contextPath}/getImage?type=member&id=${userId}'>
						</c:if></li>
					<li class="nav-item"><c:if test="${!empty userId}">
							<a href="<c:url value='/LogoutServlet'  />" class="nav-link">登出</a>
						</c:if></li>
				</ul>
			</div>
		</div>
	</nav>
    <!-- END nav -->
     <section class="top111 js-fullheight" style="background-image: url('images/image_1.jpg');height: 250px;width:2044px;" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>About us <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-3 bread">選擇一張照片上傳</h1>
          </div>
        </div>
      </div>
    </section>
    
    
	<div id="regispage">
		<div id="registerbox" align="center">
			<h2>新增照片</h2>
			<font size="1" color="#FF0000">${errorMsg.errTitle}</font>
			<form:form enctype="multipart/form-data" method="POST"
				modelAttribute="albumbean" id='registerForm'>
				<table>
					<tr>
						<td>id
						<td><form:input type="text" path="pk.memberId" />
					<tr>
						<td>status
						<td><form:input type="text" path="status" />
					
					<tr>
						<td>上傳照片
						<td><form:input type="file" path="albumImage" />
				</table>
				<input type="submit" value="submit">
			</form:form>
		</div>
	</div>
</body>
</html>