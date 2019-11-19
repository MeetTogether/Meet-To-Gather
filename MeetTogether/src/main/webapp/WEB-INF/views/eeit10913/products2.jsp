<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">
<link rel="stylesheet"
	href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css"
	integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX"
	crossorigin="anonymous">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons">
<style type="text/css">
html * {
	-webkit-font-smoothing: antialiased;
}

h3 {
	font-weight: 300 !important;
	font-size: 25px !important;
}

h4 {
	font-size: 18px !important;
	font-weight: 300 !important;
}

footer {
	margin-top: 100px;
	color: #555;
	background: #fff;
	padding: 25px;
	font-weight: 300;
}

.card.card-carousel {
	border: 0;
	margin-bottom: 30px;
	margin-top: 30px;
	border-radius: 6px;
	color: rgba(0, 0, 0, .87);
	background: #fff;
	width: 100%;
	box-shadow: 0 2px 2px 0 rgba(0, 0, 0, .14), 0 3px 1px -2px
		rgba(0, 0, 0, .2), 0 1px 5px 0 rgba(0, 0, 0, .12);
}

.card.card-carousel img {
	border-radius: 6px;
}

.carousel-indicators {
	position: absolute;
	right: 0;
	bottom: 10px;
	left: 0;
	z-index: 15;
	display: flex;
	justify-content: center;
	padding-left: 0;
	margin-right: 15%;
	margin-left: 15%;
	list-style: none;
}

.carousel .carousel-indicators {
	bottom: 5px;
}

.carousel .carousel-indicators li {
	display: inline-block;
	width: 10px;
	height: 10px;
	text-indent: -999px;
	cursor: pointer;
	border: 1px solid #fff;
	border-radius: 10px;
	background: #fff;
	box-shadow: 0 2px 2px 0 rgba(0, 0, 0, .14), 0 3px 1px -2px
		rgba(0, 0, 0, .12), 0 1px 5px 0 rgba(0, 0, 0, .2);
	border-radius: 2px;
}

.carousel .carousel-indicators .active {
	margin: 11px 10px;
}

.carousel .carousel-indicators li {
	margin: 11px 10px;
}

.carousel .carousel-indicators .active {
	margin-top: 10px;
	transform: scale(1.5);
	box-shadow: 0 4px 5px 0 rgba(0, 0, 0, .14), 0 1px 10px 0
		rgba(0, 0, 0, .12), 0 2px 4px -1px rgba(0, 0, 0, .2);
}

.carousel-inner {
	position: relative;
	width: 100%;
	overflow: hidden;
}

.carousel-item {
	position: relative;
	display: none;
	align-items: center;
	width: 100% !important;
	transition: transform .6s ease;
	backface-visibility: hidden;
	perspective: 1000px;
}

.carousel-item.active {
	display: block;
}

.carousel .carousel-caption {
	padding-bottom: 45px;
}

.carousel .carousel-caption .material-icons {
	position: relative;
	top: 5px;
}

.carousel .carousel-control-next .material-icons {
	z-index: 5;
	display: inline-block;
	font-size: 50px;
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	height: 50px;
	margin: auto;
}

.carousel .carousel-control-prev .material-icons {
	z-index: 5;
	display: inline-block;
	font-size: 50px;
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	height: 50px;
	margin: auto;
}

.footer p {
	margin-bottom: 0;
}

footer p a {
	color: #555;
	font-weight: 400;
}

footer p a:hover {
	color: #9f26aa;
	text-decoration: none;
}

body {
	background-color: #e7eef1;
	font-family: 微軟正黑體;
}

.point {
	cursor: pointer;
}

.hero-wrap {
	width: 100%;
	height: 300px;
	position: inherit;
	background-size: cover;
	background-repeat: no-repeat;
	background-position: top center;
}

.hero-wrap .overlay {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	content: '';
	opacity: .4;
	background: #000000;
	height: 300px;
}

@media ( max-width : 991.98px) {
	.hero-wrap {
		height: 450px;
	}
	.hero-wrap .overlay {
		height: 450px;
	}
}

.hero-wrap.hero-wrap-2 {
	height: 300px !important;
	position: relative;
}

.hero-wrap.hero-wrap-2 .overlay {
	width: 100%;
	opacity: .05;
	height: 300px;
}

.hero-wrap.hero-wrap-2 .slider-text {
	height: 300px !important;
}

.ftco-section {
	padding: 2em 0;
	position: relative;
}

@media ( max-width : 767.98px) {
	.ftco-section {
		padding: 2em 0;
	}
} /* 留言左側section與上方距離，原為6em */
.mt-5, .my-5 {
	margin-top: 1em !important;
} /* 發文單篇與上方距離，原為3rem */
.reply {
	padding: 5px 10px;
	background: #e6e6e6;
	color: #000000;
	text-transform: uppercase;
	font-size: 11px;
	letter-spacing: .1em;
	font-weight: 400;
	border-radius: 4px;
}

.reply:hover {
	color: #fff;
	background: black;
}

.col-md-8 {
	-webkit-box-flex: 0;
	-ms-flex: 0 0 95%;
	flex: 0 0 95%;
	max-width: 95%;
}

.MemberPic {
	border-radius: 50%;
	height: 30px;
	margin: 8px 5px;
	display: inline-flex;
	align-items: center;
	float: left;
}

.likeBtn, .dislikeBtn, .replyBtn {
	height: 20px;
	cursor: pointer;
}

p {
	margin-bottom: 0;
}
</style>
<script type="text/javascript">
	var jQuery_1_12_4 = $.noConflict();

	jQuery_1_12_4(document)
			.ready(
					function() {
						jQuery_1_12_4("#Postbox").hide();
						jQuery_1_12_4("#Postbutton").click(function() {
							jQuery_1_12_4("#Postbox").toggle("blind"); /* 展開發文表單 */
							/* $('html,body').animate({
								scrollTop : 0
							}); 返回到頁面頂端 */
						});
						jQuery_1_12_4("#ViewMyPost")
								.click(
										function() {
											top.location.href = "${pageContext.request.contextPath}/GetUserPostServlet?memberId=${userId}";
										});
						jQuery_1_12_4("#ViewAllPost")
								.click(
										function() {
											top.location.href = "${pageContext.request.contextPath}/GetAllPostServlet";
										});
						jQuery_1_12_4("input#deletePost")
								.click(
										function() {
											var c = confirm('是否確認刪除');
											console.log(c);
											if (c) {
												jQuery_1_12_4(this).parent(
														"form#deletePostForm")
														.submit();
											} else {
											}
										});

						jQuery_1_12_4("#dialog-confirm").hide();
						jQuery_1_12_4("#vipBuyButton").click(function() {
							jQuery_1_12_4("#dialog-confirm").dialog({
								resizable : false,
								height : "auto",
								width : 420,
								modal : true,
							});
						});
					});
</script>

</head>
<body>
	<div id="dialog-confirm" title="升級為VIP會員">
		<span style="float: left; margin: 12px 12px 20px 0;"> <img
			src="${pageContext.request.contextPath}/eeit10927/images/upgrade.jpg"
			style="width: 370px; margin: auto;">
		</span> <br> Upgrade 1: 每日新增好友數20名！<br> Upgrade 2: 新增討論區文章匯出功能！<br>
		<br>
		<form:form modelAttribute="vipBean" method="POST" action="./VipBuy">
			<form:input type="hidden" path="mbId" value="${userId}" />
			<input type="submit" value="前往付款" class="reply">
		</form:form>
	</div>

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
					<%-- 					<li class="nav-item"><a href="${pageContext.request.contextPath}/register" class="nav-link">註冊</a></li> --%>
					<li class="nav-item"><a
						href="${pageContext.request.contextPath}/" class="nav-link">首頁</a></li>
					<li class="nav-item"><a href="#" class="nav-link">交友</a></li>
					<li class="nav-item"><a href="#" class="nav-link">活動</a></li>
					<li class="nav-item active"><a
						href="${pageContext.request.contextPath}/GetAllPostServlet"
						class="nav-link">討論區</a></li>
					<li class="nav-item"><a href="#" class="nav-link">會員資料</a></li>
					<li class="nav-item"><a
						href="${pageContext.request.contextPath}/LogoutServlet"
						class="nav-link">登出</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->


	<section class="hero-wrap hero-wrap-2 js-fullheight"
		style="background-image: url('${pageContext.request.contextPath}/eeit10927/images/blog00.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
				<div class="col-md-9 ftco-animate pb-5">
					<p class="breadcrumbs">
						<span class="mr-2"><a
							href="${pageContext.request.contextPath}/">首頁 <i
								class="ion-ios-arrow-forward"></i></a></span> <span>活動 <i
							class="ion-ios-arrow-forward"></i></span>
					</p>
					<h1 class="mb-3 bread">活動</h1>
				</div>
			</div>
		</div>
	</section>

	<c:forEach var='reviewBean' items='${review}'>
	<marquee onMouseOver="this.stop()" onMouseOut="this.start()" height="50" direction="right" scrolldelay="4" scrollamount="5">要跑的文字${reviewBean.member.memberId}</marquee>
	</c:forEach>
	<section class="ftco-section ftco-car-details">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-12">
					<div class="car-details">
						<div class="col-md-8 mr-auto ml-auto">

							<!-- Carousel Card -->
							<div class="card card-raised card-carousel">
								<div id="carouselExampleIndicators" class="carousel slide"
									data-ride="carousel" data-interval="3000">
									<ol class="carousel-indicators">
										<li data-target="#carouselExampleIndicators" data-slide-to="0"
											class="active"></li>
										<li data-target="#carouselExampleIndicators" data-slide-to="1"
											class=""></li>
										<li data-target="#carouselExampleIndicators" data-slide-to="2"
											class=""></li>
									</ol>
									<div class="carousel-inner">
										<div class="carousel-item active">
											<img class="d-block w-100"
												src="https://rawgit.com/creativetimofficial/material-kit/master/assets/img/bg.jpg"
												alt="First slide">
											<div class="carousel-caption d-none d-md-block">
												<h4>
													<i class="material-icons">location_on</i> Yellowstone
													National Park, United States
												</h4>
											</div>
										</div>
										<div class="carousel-item">
											<img class="d-block w-100"
												src="https://rawgit.com/creativetimofficial/material-kit/master/assets/img/bg2.jpg"
												alt="Second slide">
											<div class="carousel-caption d-none d-md-block">
												<h4>
													<i class="material-icons">location_on</i> Somewhere Beyond,
													United States
												</h4>
											</div>
										</div>
										<div class="carousel-item">
											<img class="d-block w-100"
												src="https://rawgit.com/creativetimofficial/material-kit/master/assets/img/bg3.jpg"
												alt="Third slide">
											<div class="carousel-caption d-none d-md-block">
												<h4>
													<i class="material-icons">location_on</i> Yellowstone
													National Park, United States
												</h4>
											</div>
										</div>
									</div>
									<a class="carousel-control-prev"
										href="#carouselExampleIndicators" role="button"
										data-slide="prev"> <i class="material-icons">keyboard_arrow_left</i>
										<span class="sr-only">Previous</span>
									</a> <a class="carousel-control-next"
										href="#carouselExampleIndicators" role="button"
										data-slide="next"> <i class="material-icons">keyboard_arrow_right</i>
										<span class="sr-only">Next</span>
									</a>
								</div>
							</div>
							<!-- End Carousel Card -->


						</div>
						<div class="text text-center">
							<span class="subheading">Toyota</span>
							<h2>Scosche Rigid Tacoma</h2>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services">
						<div class="media-body py-md-4">
							<div class="d-flex mb-3 align-items-center">
								<div class="icon">
									<span class="flaticon-dashboard"></span>
								</div>
								<div class="text">
									<h3 class="heading mb-0 pl-3">
										Mileage <span>40,000</span>
									</h3>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services">
						<div class="media-body py-md-4">
							<div class="d-flex mb-3 align-items-center">
								<div class="icon">
									<span class="flaticon-car-machine"></span>
								</div>
								<div class="text">
									<h3 class="heading mb-0 pl-3">
										Transmission <span>Manual</span>
									</h3>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services">
						<div class="media-body py-md-4">
							<div class="d-flex mb-3 align-items-center">
								<div class="icon">
									<span class="flaticon-car-seat"></span>
								</div>
								<div class="text">
									<h3 class="heading mb-0 pl-3">
										Seats <span>5 Adults</span>
									</h3>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services">
						<div class="media-body py-md-4">
							<div class="d-flex mb-3 align-items-center">
								<div class="icon">
									<span class="flaticon-backpack"></span>
								</div>
								<div class="text">
									<h3 class="heading mb-0 pl-3">
										Luggage <span>4 Bags</span>
									</h3>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services">
						<div class="media-body py-md-4">
							<div class="d-flex mb-3 align-items-center">
								<div class="icon">
									<span class="flaticon-diesel"></span>
								</div>
								<div class="text">
									<h3 class="heading mb-0 pl-3">
										Fuel <span>Petrol</span>
									</h3>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 pills">
					<div class="bd-example bd-example-tabs">
						<div class="d-flex justify-content-center">
							<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">

								<li class="nav-item"><a class="nav-link active"
									id="pills-description-tab" data-toggle="pill"
									href="#pills-description" role="tab"
									aria-controls="pills-description" aria-expanded="true">Features</a>
								</li>
								<li class="nav-item"><a class="nav-link"
									id="pills-manufacturer-tab" data-toggle="pill"
									href="#pills-manufacturer" role="tab"
									aria-controls="pills-manufacturer" aria-expanded="true">Description</a>
								</li>
								<li class="nav-item"><a class="nav-link"
									id="pills-review-tab" data-toggle="pill" href="#pills-review"
									role="tab" aria-controls="pills-review" aria-expanded="true">Review</a>
								</li>
							</ul>
						</div>

						<div class="tab-content" id="pills-tabContent">
							<div class="tab-pane fade show active" id="pills-description"
								role="tabpanel" aria-labelledby="pills-description-tab">
								<div class="row">
									<div class="col-md-4">
										<ul class="features">
											<li class="check"><span class="ion-ios-checkmark"></span>Airconditions</li>
											<li class="check"><span class="ion-ios-checkmark"></span>Child
												Seat</li>
											<li class="check"><span class="ion-ios-checkmark"></span>GPS</li>
											<li class="check"><span class="ion-ios-checkmark"></span>Luggage</li>
											<li class="check"><span class="ion-ios-checkmark"></span>Music</li>
										</ul>
									</div>
									<div class="col-md-4">
										<ul class="features">
											<li class="check"><span class="ion-ios-checkmark"></span>Seat
												Belt</li>
											<li class="remove"><span class="ion-ios-close"></span>Sleeping
												Bed</li>
											<li class="check"><span class="ion-ios-checkmark"></span>Water</li>
											<li class="check"><span class="ion-ios-checkmark"></span>Bluetooth</li>
											<li class="remove"><span class="ion-ios-close"></span>Onboard
												computer</li>
										</ul>
									</div>
									<div class="col-md-4">
										<ul class="features">
											<li class="check"><span class="ion-ios-checkmark"></span>Audio
												input</li>
											<li class="check"><span class="ion-ios-checkmark"></span>Long
												Term Trips</li>
											<li class="check"><span class="ion-ios-checkmark"></span>Car
												Kit</li>
											<li class="check"><span class="ion-ios-checkmark"></span>Remote
												central locking</li>
											<li class="check"><span class="ion-ios-checkmark"></span>Climate
												control</li>
										</ul>
									</div>
								</div>
							</div>

							<div class="tab-pane fade" id="pills-manufacturer"
								role="tabpanel" aria-labelledby="pills-manufacturer-tab">
								<p>Even the all-powerful Pointing has no control about the
									blind texts it is an almost unorthographic life One day however
									a small line of blind text by the name of Lorem Ipsum decided
									to leave for the far World of Grammar.</p>
								<p>When she reached the first hills of the Italic Mountains,
									she had a last view back on the skyline of her hometown
									Bookmarksgrove, the headline of Alphabet Village and the
									subline of her own road, the Line Lane. Pityful a rethoric
									question ran over her cheek, then she continued her way.</p>
							</div>

							<div class="tab-pane fade" id="pills-review" role="tabpanel"
								aria-labelledby="pills-review-tab">

								<div class="row">
									<div class="col-md-7">
										<h3 class="head">所有評論</h3>
										<%-- 										<b style="font-size:25px">目前平均分數: ${avgEventStar}</b> --%>
										<c:forEach var='reviewBean' items='${review}'>
											<div class="review d-flex" style="border: 3px #cccccc solid;">
												<!-- 												<div class="user-img" -->
												<!-- 													style="background-image: url(images/person_1.jpg)"></div> -->
												<!--使用者圖片呼叫 -->
												<%-- 													<img width='50' height='50'src="<c:url value='memberPhoto/${currentUser.memberId}'/>" /> --%>
												<img height='60'
													src='${pageContext.request.contextPath}/getImage?type=member&id=${reviewBean.member.memberId}'>

												<div class="desc">
													<h4>
														<p>
															<b style='font-size: 16px;'>會員編號:
																${reviewBean.member.memberId}</b>
														</p>
													</h4>


													<p class="star">
														<b style='font-size: 14px;'>星等:
															${reviewBean.eventStars}</b>
													</p>

													<p>
														<b style='font-size: 14px;'>評論:
															${reviewBean.eventComment}</b>
													</p>

													<p>
														<b style='font-size: 14px;'>創建時間:
															${fn:substring(reviewBean.createTime,0,16)}</b>
													</p>

													<p>
														<c:if test="${userId==reviewBean.member.memberId}">
															<a id=condition
																href="<spring:url value='/editProduct?reviewId=${reviewBean.reviewId}' />"
																class="btn btn-primary"> <span
																class="glyphicon-info-sigh glyphicon"></span>編輯資料
															</a>
														</c:if>
													</p>
												</div>
											</div>
										</c:forEach>
										<!-- 									   	-------- -->

									</div>
									<div class="col-md-5">
										<div class="rating-wrap">
											<h3 class="head">Give a Review</h3>
<!-- 											<a id=condition -->
<%-- 												href="<spring:url value='/editProduct?reviewId=${reviewBean.reviewId}' />" --%>
<!-- 												class="btn btn-primary"> <span -->
<!-- 												class="glyphicon-info-sigh glyphicon"></span>Give a Review -->
<!-- 											</a> -->
											<div class="wrap">
												<b style="font-size: 25px">目前平均分數: ${avgEventStar}/5</b>
												<p class="star">
													<span> <i class="ion-ios-star"></i> <i
														class="ion-ios-star"></i> <i class="ion-ios-star"></i> <i
														class="ion-ios-star"></i> <i class="ion-ios-star"></i>
														(98%)
													</span> <span>20 Reviews</span>
												</p>
												<p class="star">
													<span> <i class="ion-ios-star"></i> <i
														class="ion-ios-star"></i> <i class="ion-ios-star"></i> <i
														class="ion-ios-star"></i> <i class="ion-ios-star"></i>
														(85%)
													</span> <span>10 Reviews</span>
												</p>
												<p class="star">
													<span> <i class="ion-ios-star"></i> <i
														class="ion-ios-star"></i> <i class="ion-ios-star"></i> <i
														class="ion-ios-star"></i> <i class="ion-ios-star"></i>
														(70%)
													</span> <span>5 Reviews</span>
												</p>
												<p class="star">
													<span> <i class="ion-ios-star"></i> <i
														class="ion-ios-star"></i> <i class="ion-ios-star"></i> <i
														class="ion-ios-star"></i> <i class="ion-ios-star"></i>
														(10%)
													</span> <span>0 Reviews</span>
												</p>
												<p class="star">
													<span> <i class="ion-ios-star"></i> <i
														class="ion-ios-star"></i> <i class="ion-ios-star"></i> <i
														class="ion-ios-star"></i> <i class="ion-ios-star"></i>
														(0%)
													</span> <span>0 Reviews</span>
												</p>
											</div>

										</div>

									</div>

								</div>

							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-no-pt">
		<div class="container-fluid px-4">
			<div class="row justify-content-center">
				<div class="col-md-12 heading-section text-center ftco-animate mb-5">
					<span class="subheading">Choose Car</span>
					<h2 class="mb-2">Related Cars</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3">
					<div class="car-wrap ftco-animate">
						<div class="img d-flex align-items-end"
							style="background-image: url(images/car-1.jpg);">
							<div class="price-wrap d-flex">
								<span class="rate">$25</span>
								<p class="from-day">
									<span>From</span> <span>/Day</span>
								</p>
							</div>
						</div>
						<div class="text p-4 text-center">
							<h2 class="mb-0">
								<a href="#">Mercedes Grand Sedan</a>
							</h2>
							<span>Audi</span>
							<p class="d-flex mb-0 d-block">
								<a href="#" class="btn btn-black btn-outline-black mr-1">Book
									now</a> <a href="#" class="btn btn-black btn-outline-black ml-1">Details</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="car-wrap ftco-animate">
						<div class="img d-flex align-items-end"
							style="background-image: url(images/car-2.jpg);">
							<div class="price-wrap d-flex">
								<span class="rate">$25</span>
								<p class="from-day">
									<span>From</span> <span>/Day</span>
								</p>
							</div>
						</div>
						<div class="text p-4 text-center">
							<h2 class="mb-0">
								<a href="#">Mercedes Grand Sedan</a>
							</h2>
							<span>Ford</span>
							<p class="d-flex mb-0 d-block">
								<a href="#" class="btn btn-black btn-outline-black mr-1">Book
									now</a> <a href="#" class="btn btn-black btn-outline-black ml-1">Details</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="car-wrap ftco-animate">
						<div class="img d-flex align-items-end"
							style="background-image: url(images/car-3.jpg);">
							<div class="price-wrap d-flex">
								<span class="rate">$25</span>
								<p class="from-day">
									<span>From</span> <span>/Day</span>
								</p>
							</div>
						</div>
						<div class="text p-4 text-center">
							<h2 class="mb-0">
								<a href="#">Mercedes Grand Sedan</a>
							</h2>
							<span>Cheverolet</span>
							<p class="d-flex mb-0 d-block">
								<a href="#" class="btn btn-black btn-outline-black mr-1">Book
									now</a> <a href="#" class="btn btn-black btn-outline-black ml-1">Details</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="car-wrap ftco-animate">
						<div class="img d-flex align-items-end"
							style="background-image: url(images/car-4.jpg);">
							<div class="price-wrap d-flex">
								<span class="rate">$25</span>
								<p class="from-day">
									<span>From</span> <span>/Day</span>
								</p>
							</div>
						</div>
						<div class="text p-4 text-center">
							<h2 class="mb-0">
								<a href="#">Mercedes Grand Sedan</a>
							</h2>
							<span>Mercedes</span>
							<p class="d-flex mb-0 d-block">
								<a href="#" class="btn btn-black btn-outline-black mr-1">Book
									now</a> <a href="#" class="btn btn-black btn-outline-black ml-1">Details</a>
							</p>
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="car-wrap ftco-animate">
						<div class="img d-flex align-items-end"
							style="background-image: url(images/car-5.jpg);">
							<div class="price-wrap d-flex">
								<span class="rate">$25</span>
								<p class="from-day">
									<span>From</span> <span>/Day</span>
								</p>
							</div>
						</div>
						<div class="text p-4 text-center">
							<h2 class="mb-0">
								<a href="#">Mercedes Grand Sedan</a>
							</h2>
							<span>Audi</span>
							<p class="d-flex mb-0 d-block">
								<a href="#" class="btn btn-black btn-outline-black mr-1">Book
									now</a> <a href="#" class="btn btn-black btn-outline-black ml-1">Details</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="car-wrap ftco-animate">
						<div class="img d-flex align-items-end"
							style="background-image: url(images/car-6.jpg);">
							<div class="price-wrap d-flex">
								<span class="rate">$25</span>
								<p class="from-day">
									<span>From</span> <span>/Day</span>
								</p>
							</div>
						</div>
						<div class="text p-4 text-center">
							<h2 class="mb-0">
								<a href="#">Mercedes Grand Sedan</a>
							</h2>
							<span>Ford</span>
							<p class="d-flex mb-0 d-block">
								<a href="#" class="btn btn-black btn-outline-black mr-1">Book
									now</a> <a href="#" class="btn btn-black btn-outline-black ml-1">Details</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="car-wrap ftco-animate">
						<div class="img d-flex align-items-end"
							style="background-image: url(images/car-7.jpg);">
							<div class="price-wrap d-flex">
								<span class="rate">$25</span>
								<p class="from-day">
									<span>From</span> <span>/Day</span>
								</p>
							</div>
						</div>
						<div class="text p-4 text-center">
							<h2 class="mb-0">
								<a href="#">Mercedes Grand Sedan</a>
							</h2>
							<span>Cheverolet</span>
							<p class="d-flex mb-0 d-block">
								<a href="#" class="btn btn-black btn-outline-black mr-1">Book
									now</a> <a href="#" class="btn btn-black btn-outline-black ml-1">Details</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="car-wrap ftco-animate">
						<div class="img d-flex align-items-end"
							style="background-image: url(images/car-8.jpg);">
							<div class="price-wrap d-flex">
								<span class="rate">$25</span>
								<p class="from-day">
									<span>From</span> <span>/Day</span>
								</p>
							</div>
						</div>
						<div class="text p-4 text-center">
							<h2 class="mb-0">
								<a href="#">Mercedes Grand Sedan</a>
							</h2>
							<span>Mercedes</span>
							<p class="d-flex mb-0 d-block">
								<a href="#" class="btn btn-black btn-outline-black mr-1">Book
									now</a> <a href="#" class="btn btn-black btn-outline-black ml-1">Details</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<footer class="ftco-footer ftco-bg-dark ftco-section">
		<div class="container">
			<div class="row mb-5">
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">About MeetTogether</h2>
						<p>MeetTogether創造認識新朋友的機會，讓更多人有機會看見彼此，從線上好友的聊天互動、參與活動實際面對面、抒發心情與瀏覽文章建立一段段友誼</p>
						<ul
							class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
							<li class="ftco-animate"><a href="#"><span
									class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
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
								<li><span class="icon icon-map-marker"></span><span
									class="text">106台北市大安區復興南路一段390號 2,3號15樓</span></li>
								<li><a href="#"><span class="icon icon-phone"></span><span
										class="text">02 6631 6666</span></a></li>
								<li><a href="#"><span class="icon icon-envelope"></span><span
										class="text">info@iiiedu.org.tw</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>

		</div>
	</footer>



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/jquery.timepicker.min.js"></script>
	<script src="js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>
	<script>
		
	</script>


</body>
</html>
