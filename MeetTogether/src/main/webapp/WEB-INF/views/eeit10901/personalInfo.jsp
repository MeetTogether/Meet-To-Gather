<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>MeetTogether - 會員資料</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.theme.default.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/aos.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ionicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.timepicker.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/flaticon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/icomoon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style2.css">
</head>
<body>

	<!-- nav -->
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/">Meet<span>Together</span></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="${pageContext.request.contextPath}/" class="nav-link">首頁</a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath}/pairs/" class="nav-link">交友</a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath}/friends" class="nav-link">好友紀錄</a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath}/eeit10908/" class="nav-link">活動</a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath}/GetAllPostServlet" class="nav-link">討論區</a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath}/getmember" class="nav-link">
						<c:if test="${vipTag eq true }"><span class="icon-diamond"></span>
						</c:if>
						<c:if test="${!empty userId}">${userName}
						</c:if>
						</a></li>
					<li class="nav-item active"><c:if test="${!empty userId}">
							<img style="height: 40px; border-radius: 50%;" src='${pageContext.request.contextPath}/getImage?type=member&id=${userId}'>
						</c:if></li>
					<li class="nav-item"><c:if test="${!empty userId}">
							<a href="<c:url value='/LogoutServlet'  />" class="nav-link">登出</a>
						</c:if></li>
					<li class="nav-item"><c:if test="${empty userId}">
						<a href="<c:url value='/LoginServlet' />" class="nav-link" data-toggle="modal" data-target="#loginModalLong">登入/註冊</a>
						</c:if></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->

	<section class="hero-wrap hero-wrap-2 js-fullheight"
		style="background-image: url('${pageContext.request.contextPath}/eeit10927/images/bg03.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
				<div class="col-md-9 ftco-animate pb-5">
					<p class="breadcrumbs">
						<span class="mr-2"><a
							href="${pageContext.request.contextPath}/">首頁 <i
								class="ion-ios-arrow-forward"></i></a></span> <span>會員資料 <i
							class="ion-ios-arrow-forward"></i></span>
					</p>
					<h1 class="mb-3 bread">會員資料</h1>
				</div>
			</div>
		</div>
	</section>
	
	<section class="ftco-section ftco-degree-bg">
		<div class="row block-9 justify-content-center mb-5">
			<div class="col-md-8 mb-md-5" align="center">	
				<h2>個人資訊</h2>
				<div style="width: 30%; float: left;">
					<a class="nav-link"
						href="${pageContext.request.contextPath}/upadateInfo/${userId}">修改會員資料</a>
					<a id="bookmark1"
						href="${pageContext.request.contextPath}/memberInterest"
						class="nav-link">個人興趣</a>
					<a href="${pageContext.request.contextPath}/personalInterest"
						class="nav-link">編輯個人興趣</a>
					<a href="${pageContext.request.contextPath}/personal"
						class="nav-link">編輯個人資訊</a>
					<a href="${pageContext.request.contextPath}/addHope"
						class="nav-link">編輯配對希望條件</a>
					<a href="${pageContext.request.contextPath}/addAlbum"
						class="nav-link">個人相簿</a>
				</div>
				
				<div style="width: 60%;">
					<table>
						<tr>
							<td rowspan="8"><img style="width: 300px" src='${pageContext.request.contextPath}/getImage?type=member&id=${userId}' />
							<td style="text-align: center; width: 150px; font-weight: bolder;">婚姻
							<td>
								<c:choose>
									<c:when test="${infoBean.marriage == 1 }">未婚</c:when>
									<c:when test="${infoBean.marriage == 2 }">已婚</c:when>
									<c:when test="${infoBean.marriage == 3 }">喪偶</c:when>
									<c:otherwise>一言難盡</c:otherwise>
								</c:choose>
						<tr>
							<td style="text-align: center; width: 150px; font-weight: bolder;">教育
							<td>${infoBean.education}</td>
						<tr>
							<td style="text-align: center; width: 150px; font-weight: bolder;">抽菸習慣
							<td>
								<c:choose>
									<c:when test="${infoBean.smoking == 1 }">從來不抽</c:when>
									<c:when test="${infoBean.smoking == 2 }">偶爾抽菸</c:when>
									<c:otherwise>老菸槍</c:otherwise>
								</c:choose>
						<tr>
							<td style="text-align: center; width: 150px; font-weight: bolder;">喝酒習慣
							<td>${infoBean.drink}</td>
						<tr>
							<td style="text-align: center; width: 150px; font-weight: bolder;">種族
							<td>${infoBean.ethnicity}</td>
						<tr>
							<td style="text-align: center; width: 150px; font-weight: bolder;">身材
							<td>${infoBean.bodyType}</td>
						<tr>
							<td style="text-align: center; width: 150px; font-weight: bolder;">宗教
							<td>${infoBean.religion}</td>
						<tr>
							<td style="text-align: center; width: 150px; font-weight: bolder;">薪水
							<td>${infoBean.salary}</td>
					</table>
				</div>
			</div>
		</div>
	</section>

	<!-- footer引入 -->
	<jsp:include page="/WEB-INF/views/footer.jsp"/>


	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.stellar.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/aos.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.animateNumber.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap-datepicker.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.timepicker.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="${pageContext.request.contextPath}/js/google-map.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
	
</body>
</html>