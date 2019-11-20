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
/* The radio */
.radio {
	display: block;
	position: relative;
	padding-left: 30px;
	margin-bottom: 12px;
	cursor: pointer;
	font-size: 20px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none
}

/* Hide the browser's default radio button */
.radio input {
	position: absolute;
	opacity: 0;
	cursor: pointer;
}

/* Create a custom radio button */
.checkround {
	position: absolute;
	top: 6px;
	left: 0;
	height: 20px;
	width: 20px;
	background-color: #fff;
	border-color: #f8204f;
	border-style: solid;
	border-width: 2px;
	border-radius: 50%;
}

/* When the radio button is checked, add a blue background */
.radio input:checked ~ .checkround {
	background-color: #fff;
}

/* Create the indicator (the dot/circle - hidden when not checked) */
.checkround:after {
	content: "";
	position: absolute;
	display: none;
}

/* Show the indicator (dot/circle) when checked */
.radio input:checked ~ .checkround:after {
	display: block;
}

/* Style the indicator (dot/circle) */
.radio .checkround:after {
	left: 2px;
	top: 2px;
	width: 12px;
	height: 12px;
	border-radius: 50%;
	background: #f8204f;
}

/* The check */
.check {
	display: block;
	position: relative;
	padding-left: 25px;
	margin-bottom: 12px;
	padding-right: 15px;
	cursor: pointer;
	font-size: 18px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

/* Hide the browser's default checkbox */
.check input {
	position: absolute;
	opacity: 0;
	cursor: pointer;
}

/* Create a custom checkbox */
.checkmark {
	position: absolute;
	top: 3px;
	left: 0;
	height: 18px;
	width: 18px;
	background-color: #fff;
	border-color: #f8204f;
	border-style: solid;
	border-width: 2px;
}

/* When the checkbox is checked, add a blue background */
.check input:checked ~ .checkmark {
	background-color: #fff;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
	content: "";
	position: absolute;
	display: none;
}

/* Show the checkmark when checked */
.check input:checked ~ .checkmark:after {
	display: block;
}

/* Style the checkmark/indicator */
.check .checkmark:after {
	left: 5px;
	top: 1px;
	width: 5px;
	height: 10px;
	border: solid;
	border-color: #f8204f;
	border-width: 0 3px 3px 0;
	-webkit-transform: rotate(45deg);
	-ms-transform: rotate(45deg);
	transform: rotate(45deg);
}

.cust-btn {
	margin-bottom: 10px;
	background-color: #f8204f;
	border-width: 2px;
	border-color: #f8204f;
	color: #fff;
}

.cust-btn:hover {
	border-color: #f8204f;
	background-color: #fff;
	color: #f8204f;
	border-radius: 20px;
	transform-style: 2s;
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
	<h1 class="mb-3 bread" align="center">請輸入個人興趣</h1>




	<div align="center">


		<form method="POST"
			action="${pageContext.request.contextPath}/personalInterest">
			

			<div class="col-md-12 row">
				<div class="col-md-6">

						<label class="check ">
					<input type="checkbox"
						checked="checked" name="旅遊" value="102"> 旅遊 <span class="checkmark"></span>
					</label> 
					<label class="check ">
					<input type="checkbox" value="103"
						name="電影"> 電影<span class="checkmark"></span>
					</label> 
					<label class="check ">
					<input type="checkbox" value="104"
						name="美食"> 美食<span class="checkmark"></span>
					</label> 
					<label class="check ">
					<input type="checkbox" value="105"
						name="攝影"> 攝影<span class="checkmark"></span>
					</label>
					
				</div>
				<div class="col-md-6">

					<label class="check ">
					<input type="checkbox" value="106"
						name="農藝"> 農藝<span class="checkmark"></span>
					</label> 
					
					<label class="check ">
					<input type="checkbox" value="108"
						name="音樂"> 音樂<span class="checkmark"></span>
					</label> 
					<label class="check ">
					<input type="checkbox" value="109"
						name="閱讀"> 閱讀<span class="checkmark"></span>
					</label> 
				
					<label class="check ">
					<input type="checkbox" value="107"
						name="寫程式"> 寫程式<span class="checkmark"></span>
					</label> 
					
				</div>



			</div>

			<input type="submit" value="送出" id="add" > <input type="reset"
				value="清除" />
		</form>

	</div>
	<a href="${pageContext.request.contextPath}/personal" class="nav-link">輸入個人喜好</a>
	<a href="${pageContext.request.contextPath}/personalInterest"
		class="nav-link">輸入個人興趣</a>
	<a href="${pageContext.request.contextPath}/addHope" class="nav-link">輸入個人希望條件</a>
	<a href="${pageContext.request.contextPath}/addAlbum" class="nav-link">相簿</a>

</body>
</html>