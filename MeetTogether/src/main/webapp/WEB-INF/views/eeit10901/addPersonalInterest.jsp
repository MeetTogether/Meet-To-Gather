<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>MeetTogether</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/animate.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/magnific-popup.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/aos.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/ionicons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap-datepicker.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/jquery.timepicker.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/icomoon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<style>
body {
	height: 100vh;
	padding: 0;
	margin: 0;
}

.bg {
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
}

.span_pseudo, .chiller_cb span:before, .chiller_cb span:after {
	content: "";
	display: inline-block;
	background: #fff;
	width: 0;
	height: 0.2rem;
	position: absolute;
	transform-origin: 0% 0%;
}

.chiller_cb {
	position: relative;
	height: 2rem;
	display: flex;
	align-items: center;
}

.chiller_cb input {
	display: none;
}

.chiller_cb input:checked ~ span {
	background: #fd2727;
	border-color: #fd2727;
}

.chiller_cb input:checked ~ span:before {
	width: 1rem;
	height: 0.15rem;
	transition: width 0.1s;
	transition-delay: 0.3s;
}

.chiller_cb input:checked ~ span:after {
	width: 0.4rem;
	height: 0.15rem;
	transition: width 0.1s;
	transition-delay: 0.2s;
}

.chiller_cb input:disabled ~ span {
	background: #ececec;
	border-color: #dcdcdc;
}

.chiller_cb input:disabled ~ label {
	color: #dcdcdc;
}

.chiller_cb input:disabled ~ label:hover {
	cursor: default;
}

.chiller_cb label {
	padding-left: 2rem;
	position: relative;
	z-index: 2;
	cursor: pointer;
	margin-bottom: 0;
}

.chiller_cb span {
	display: inline-block;
	width: 1.2rem;
	height: 1.2rem;
	border: 2px solid #ccc;
	position: absolute;
	left: 0;
	transition: all 0.2s;
	z-index: 1;
	box-sizing: content-box;
}

.chiller_cb span:before {
	transform: rotate(-55deg);
	top: 1rem;
	left: 0.37rem;
}

.chiller_cb span:after {
	transform: rotate(35deg);
	bottom: 0.35rem;
	left: 0.2rem;
}
</style>
</head>
<body>

	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="/">Meet<span>Together</span></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a
						href="${pageContext.request.contextPath}/" class="nav-link">首頁</a></li>
					<li class="nav-item"><a href="#" class="nav-link">交友</a></li>
					<li class="nav-item"><a href="#" class="nav-link">活動</a></li>
					<li class="nav-item active"><a
						href="${pageContext.request.contextPath}/GetAllPostServlet"
						class="nav-link">討論區</a></li>
					<li class="nav-item"><a
						href="${pageContext.request.contextPath}/getmember"
						class="nav-link">會員資料</a></li>
					<li class="nav-item"><a class="nav-link"><c:if
								test="${!empty userId}">${userName}
						</c:if></a></li>
					<li class="nav-item"><c:if test="${!empty userId}">
							<img style="height: 40px"
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
		style="background-image: url('${pageContext.request.contextPath}/eeit10901/images/mt6.webp');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
				<div class="col-md-9 ftco-animate pb-5">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html"> <i
								class="ion-ios-arrow-forward"></i></a></span> <span>About us <i
							class="ion-ios-arrow-forward"></i></span>
					</p>

				</div>
			</div>
		</div>
	</section>
	<h1 class="mb-3 bread" align="center">請輸入興趣至少三樣</h1>

	<div class="bg">

	<div>

			<div class="chiller_cb">
				<input id="myCheckbox1" type="checkbox" value="102" name="Interest1">
				<label for="myCheckbox1">旅遊</label> <span></span>
			</div>
			
			<div class="chiller_cb">
				<input id="myCheckbox2" type="checkbox" value="103" name="Interest2">
				<label for="myCheckbox2">電影 </label> <span></span>
			</div>
			
			<div class="chiller_cb">
				<input id="myCheckbox3" type="checkbox" value="104" name="Interest3">
				<label for="myCheckbox3">美食</label> <span></span>
			</div>
			<div class="chiller_cb">
				<input id="myCheckbox4" type="checkbox" value="105" name="Interest4">
				<label for="myCheckbox4">運動</label> <span></span>
			</div>
			<div class="chiller_cb">
				<input id="myCheckbox5" type="checkbox" value="106" name="Interest5">
				<label for="myCheckbox5">攝影</label> <span></span>
			</div>
			<div class="chiller_cb">
				<input id="myCheckbox6" type="checkbox" value="107" name="Interest6">
				<label for="myCheckbox6">農藝</label> <span></span>
			</div>
			<div class="chiller_cb">
				<input id="myCheckbox7" type="checkbox" value="108" name="Interest7">
				<label for="myCheckbox7">寫程式</label> <span></span>
			</div>
		</div>
		</div>
	


	<!-- 	<div align="center"> -->


	<%-- 		<form method="POST" action="${pageContext.request.contextPath}/personalInterest" > --%>
	<!-- 			<table> -->
	<!-- 				<tr> -->

	<!--                      <td>興趣 -->
	<!-- 					<td><input type="checkbox" value="102" name="Interest1" />旅遊</td> -->
	<!--                     <td><input type="checkbox" value="103" name="Interest2" />電影</td> -->
	<!--                     <td><input type="checkbox" value="104" name="Interest3"/>美食 </td> -->
	<!--                     <td><input type="checkbox" value="105" name="Interest4" />運動</td> -->
	<!--                     <td><input type="checkbox" value="106" name="Interest5" />攝影</td> -->
	<!--                     <td><input type="checkbox" value="107" name="Interest6"/>農藝</td> -->
	<!--                     <td><input type="checkbox" value="108" name="Interest7"/>寫程式</td> -->

	<!-- 			</table> -->

	<!-- 				<input type ="submit"  value="add" id="add"> -->
	<!-- 				<input type="reset" value="清除"/> -->
	<%-- 		</form> --%>

	<!-- 	</div> -->

</body>
</html>