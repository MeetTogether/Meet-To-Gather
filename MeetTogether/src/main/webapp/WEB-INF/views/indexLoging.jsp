<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MeetTogether</title>
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

</style>
</head>
<body>
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
					<li class="nav-item"><a href="./pairs" class="nav-link">交友</a></li>
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
	<div class="hero-wrap"
		style="background-image: url('images/friend.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text justify-content-start align-items-center">
				<div class="col-lg-6 col-md-6 ftco-animate d-flex align-items-end">
					<div class="text">
						<h1 class="mb-4">
							Now <span>Meet</span> <span>Together</span>
						</h1>
						<p style="font-size: 18px;">A world wide community to meet
							friends and friends</p>
							
							</div>
				</div>
				<div class="col-lg-2 col"></div>
				<div class="col-lg-4 col-md-6 mt-0 mt-md-5 d-flex">
					<div class="form-group">
<%-- 					<form:form  type="hidden" method="POST" class="request-form ftco-animate" --%>
<%-- 							modelAttribute="memberBean" id="loginForm" --%>
<%-- 							action="./LoginServlet" > --%>
<%-- 						</form:form> --%>
					</div>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section">
		<div class="container-fluid px-4">
			<div class="row justify-content-center">
				<div class="col-md-12 heading-section text-center ftco-animate mb-5">
					<span class="subheading">選擇你想參加的活動</span>
					<h2 class="mb-2">正在舉辦的熱門活動</h2>
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

	<section class="ftco-section testimony-section">
		<div class="container">
			<div class="row justify-content-center mb-5">
				<div class="col-md-7 text-center heading-section ftco-animate">
					<span class="subheading">想認識這些新朋友嗎?</span>
					<h2 class="mb-3">新加入會員</h2>
				</div>
			</div>
			<div class="row ftco-animate">
				<div class="col-md-12">
					<div class="carousel-testimony owl-carousel ftco-owl">
						<div class="item">
							<div class="testimony-wrap text-center py-4 pb-5">
								<div class="user-img mb-4"
									style="background-image: url(images/person_1.jpg)"></div>
								<div class="text pt-4">
									<p class="mb-4">Far far away, behind the word mountains,
										far from the countries Vokalia and Consonantia, there live the
										blind texts.</p>
									<p class="name">Roger Scott</p>
									<span class="position">Marketing Manager</span>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap text-center py-4 pb-5">
								<div class="user-img mb-4"
									style="background-image: url(images/person_2.jpg)"></div>
								<div class="text pt-4">
									<p class="mb-4">Far far away, behind the word mountains,
										far from the countries Vokalia and Consonantia, there live the
										blind texts.</p>
									<p class="name">Roger Scott</p>
									<span class="position">Interface Designer</span>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap text-center py-4 pb-5">
								<div class="user-img mb-4"
									style="background-image: url(images/person_3.jpg)"></div>
								<div class="text pt-4">
									<p class="mb-4">Far far away, behind the word mountains,
										far from the countries Vokalia and Consonantia, there live the
										blind texts.</p>
									<p class="name">Roger Scott</p>
									<span class="position">UI Designer</span>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap text-center py-4 pb-5">
								<div class="user-img mb-4"
									style="background-image: url(images/person_1.jpg)"></div>
								<div class="text pt-4">
									<p class="mb-4">Far far away, behind the word mountains,
										far from the countries Vokalia and Consonantia, there live the
										blind texts.</p>
									<p class="name">Roger Scott</p>
									<span class="position">Web Developer</span>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap text-center py-4 pb-5">
								<div class="user-img mb-4"
									style="background-image: url(images/person_1.jpg)"></div>
								<div class="text pt-4">
									<p class="mb-4">Far far away, behind the word mountains,
										far from the countries Vokalia and Consonantia, there live the
										blind texts.</p>
									<p class="name">Roger Scott</p>
									<span class="position">System Analyst</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center mb-5">
				<div class="col-md-7 heading-section text-center ftco-animate">
					<span class="subheading">看看大家在討論什麼</span>
					<h2>熱門文章列表</h2>
				</div>
			</div>
			<div class="row d-flex">
				<div class="col-md-4 d-flex ftco-animate">
					<div class="blog-entry justify-content-end">
						<a href="blog-single.html" class="block-20"
							style="background-image: url('images/image_1.jpg');"> </a>
						<div class="text pt-4">
							<div class="meta mb-3">
								<div>
									<a href="#">July. 24, 2019</a>
								</div>
								<div>
									<a href="#">Admin</a>
								</div>
								<div>
									<a href="#" class="meta-chat"><span class="icon-chat"></span>
										3</a>
								</div>
							</div>
							<h3 class="heading mt-2">
								<a href="#">Why Lead Generation is Key for Business Growth</a>
							</h3>
							<p>A small river named Duden flows by their place and
								supplies it with the necessary regelialia.</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 d-flex ftco-animate">
					<div class="blog-entry justify-content-end">
						<a href="blog-single.html" class="block-20"
							style="background-image: url('images/image_2.jpg');"> </a>
						<div class="text pt-4">
							<div class="meta mb-3">
								<div>
									<a href="#">July. 24, 2019</a>
								</div>
								<div>
									<a href="#">Admin</a>
								</div>
								<div>
									<a href="#" class="meta-chat"><span class="icon-chat"></span>
										3</a>
								</div>
							</div>
							<h3 class="heading mt-2">
								<a href="#">Why Lead Generation is Key for Business Growth</a>
							</h3>
							<p>A small river named Duden flows by their place and
								supplies it with the necessary regelialia.</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 d-flex ftco-animate">
					<div class="blog-entry">
						<a href="blog-single.html" class="block-20"
							style="background-image: url('images/image_3.jpg');"> </a>
						<div class="text pt-4">
							<div class="meta mb-3">
								<div>
									<a href="#">July. 24, 2019</a>
								</div>
								<div>
									<a href="#">Admin</a>
								</div>
								<div>
									<a href="#" class="meta-chat"><span class="icon-chat"></span>
										3</a>
								</div>
							</div>
							<h3 class="heading mt-2">
								<a href="#">Why Lead Generation is Key for Business Growth</a>
							</h3>
							<p>A small river named Duden flows by their place and
								supplies it with the necessary regelialia.</p>
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
							
	
	
	
	
</body>
</html>