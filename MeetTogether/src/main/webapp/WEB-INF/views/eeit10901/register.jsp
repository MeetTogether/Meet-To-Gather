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
<title>會員註冊</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script
	src="${pageContext.request.contextPath}/eeit10927/js/register.js"></script>
<c:set var="time" value="<%=new Date().getTime()%>" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/eeit10927/styles/register.css?t=time">


<style>
#thumb {
	height: 40px;
}

li {
	float: left;
	width: 7em;
	color: #FFAA33;
	font-family: monospace;
}

.msgWrong {
	color: red;
}
body{
background-color:#FF8800;
}
</style>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
</head>
<body style="background-color:#FF8800">
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
					<li class="nav-item"><a
						href="<c:url value='/GetAllPostServlet' />" class="nav-link">討論區</a>
					</li>

					<li class="nav-item"><a href="blog.html" class="nav-link">會員資料</a></li>

					<li class="nav-item"><a class="nav-link"><c:if
								test="${!empty userId}">${userName}
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

	<section class="hero-wrap hero-wrap-2 js-fullheight"
		style="background-image: url('images/friend.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
				<div class="col-md-9 ftco-animate pb-5">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home <i
								class="ion-ios-arrow-forward"></i></a></span> <span>Contact <i
							class="ion-ios-arrow-forward"></i></span>
					</p>
					<h1 class="mb-3 bread">個人喜好</h1>
				</div>
			</div>
		</div>
	</section>




	<div class="row block-9 justify-content-center mb-5">
		<div class="col-md-8 mb-md-5">
			<h2 class="text-center"  style="font-weight:bold">請輸入以下資料</h2>
			<font size="1" color="#FF0000">${errorMsg.errTitle}</font>
			<form:form enctype="multipart/form-data" method="POST" modelAttribute="memberBean" id='registerForm' class="bg-light p-5 contact-form">
				<div class="form-group">
					<table>
						<tr>
							<td>帳號
							<td><form:input type="email" name="memberEmail" id="memberEmail" path="memberEmail"
									placeholder="請輸入Email作為登入帳號" value="${param.mEmail}"
									autocomplete="off" />
							<td><span id="msg_mEmail" class='msgWrong'>${errorMsg.accError}</span>
						<tr>
							<td>暱稱
							<td><form:input type="text" name="memberName" id="memberName" path="memberName"
									placeholder="請輸入暱稱" value="${param.mNickname}"
									autocomplete="off" />
							<td id="msg_mNickname"></td>
						<tr>
							<td>設定密碼
							<td><form:input type="password" name="memberPassword" id="memberPassword" path="memberPassword"
									placeholder="需有英/數/符號且超過6個字" value="${param.mPwd}" />
							<td><span id="msg_mPwd"></span>
						<tr>
							<td>密碼確認
							<td><form:input type="password" name="memberPassword2" id="memberPassword2" path="memberPassword2"
									placeholder="請再次輸入密碼" value="${param.mPwd2}" />
							<td><span id="msg_mPwd2"></span>
						<tr>
							<td>生日
							<td><form:input type="date" name="memberBirth"
									id="memberBirth" path="memberBirth" class="form-control" />
							<td id="msg_mNickname"></td>
						<tr>
							<td>性別
							<td><input type="radio" name="memberSex" id="memberSex" 
								path="memberSex" placeholder="請輸入性別" value="1" />男 <input
								type="radio" name="memberSex" id="memberSex" path="memberSex"
								placeholder="請輸入性別" value="0" />女
							<td id="msg_mNickname"></td>
						<tr>
							<td>縣市
							<td><form:input type="text" name="memberCity"
									id="memberCity" path="memberCity" placeholder="請輸入城市　Ex:台北市"
									autocomplete="off" class="form-control" />
							<td id="msg_mNickname"></td>
						<tr>
							<td>驗證碼
							<td><form:input type="text" name="mChecksum" id="mChecksum" path="mChecksum"
									placeholder="請輸入驗證碼" autocomplete="off" />
							<td><span id="msg_mChecksum" class='msgWrong'>${errorMsg.captError}</span>
							<input type="hidden" value="" id="">
						<tr>
							<td>上傳照片
							<td><form:input type="file" name="memberImage"
									id="memberImage" path="memberImage" class="form-control" />
							<td><span id="msg_mPhoto"></span>
					</table>
				</div>
				<input type="submit" value="會員註冊" id="regis">
				<input type="reset" value="重新填寫">
				<input type="button" value="返回登入頁" id="backToLogin">

			</form:form>




		</div>
	</div>
<footer class="ftco-footer ftco-bg-dark ftco-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">About MeetTogether</h2>
              <p>MeetTogether創造認識新朋友的機會，讓更多人有機會看見彼此，從線上好友的聊天互動、參與活動實際面對面、抒發心情與瀏覽文章建立一段段友誼</p>
              <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-5">
              <h2 class="ftco-heading-2">Information</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="py-2 d-block">首頁</a></li>
                <li><a href="#" class="py-2 d-block">交友</a></li>
                <li><a href="#" class="py-2 d-block">活動</a></li>
                <li><a href="#" class="py-2 d-block">討論區</a></li>
                <li><a href="#" class="py-2 d-block">會員資料</a></li>
              </ul>
            </div>
          </div>
          
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">Have a Questions?</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><span class="icon icon-map-marker"></span><span class="text">106台北市大安區復興南路一段390號 2,3號15樓</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">02 6631 6666</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@iiiedu.org.tw</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
        
      </div>
    </footer>


</body>
</html>