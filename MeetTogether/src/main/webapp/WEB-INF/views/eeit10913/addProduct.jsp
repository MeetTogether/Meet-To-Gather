<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<meta charset="UTF-8">
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
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<style type="text/css">
fieldset {
	border: 1px solid rgb(255, 232, 57);
	width: 600px;
	margin: auto;
}

textarea {
	resize: none;
}

body {
	font-family: 微軟正黑體;
	background-color: #f5f5f5;
	margin-top: 3%;
	background: -webkit-radial-gradient(circle, white, burlywood);
	background: -o-radial-gradient(circle, white, burlywood);
	background: -moz-radial-gradient(circle, white, burlywood);
	background: radial-gradient(circle, white, burlywood);
}

.msgWrong {
	color: red;
}
</style>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	$(document).ready(function() {
		$("#eventComment").blur(checkEmptyE);
	});
	let flag = 0;
	let errorMsg = "<span class='msgWrong'>不可空白</span>";
	function checkEmptyE() {
		if ($("#eventComment").val() == "") {
			$("#msg_eventComment").empty().append(errorMsg).focus();
			flag += 1;
		} else {
			$("#msg_eventComment").empty();
			flag = 0;
		}
	}
</script>
<title>Products</title>
</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index.html">Auto<span>road</span></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="index.html" class="nav-link">Home</a></li>
					<li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
					<li class="nav-item"><a href="pricing.html" class="nav-link">Pricing</a></li>
					<li class="nav-item active"><a href="car.html"
						class="nav-link">Our Car</a></li>
					<li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li>
					<li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<section>
		<div class="container">
			<h1 style="text-align: center">評論此活動</h1>
		</div>

	</section>

	<section>
		<div class="container">
			<div class="row">
				<div class="col-lg-2 col"></div>
				<div class="col-lg-4 col-md-6 mt-0 mt-md-5 d-flex">
					<!-- 		<fieldset> -->
					<%-- 			<form action="#" class="request-form ftco-animate "> --%>
					<!-- 						style="width:600px;height:120px;" -->

					<!-- 				<h6>123456789</h6> -->
					<%-- 			</form> --%>

					<form:form method='POST' modelAttribute="reviewBean"
						class='bg-light p-5 contact-form  '>
<!-- 						request-form ftco-animatel -->
<!-- 						<fieldset> -->
							<h2>評論此活動</h2>
							<div class="form-group" style="font-size: 16px; color: black;">
								<label >會員ID</label>
							</div>
							<div class="form-group">
								 <input type="text"
									class="form-control" value=${userId } readonly="readonly">
									<form:input path="mbId" value="${userId}" type='hidden'
								class='form:input-large' />
							</div>

							<div class="form-group">
								<label for="exampleFormControlSelect1">請選擇您的評分</label>
								<!-- 								class='control-label col-lg-2 col-lg-2' -->
								<form:select  path="eventStars" id="exampleFormControlSelect1" name="rate">
									<!-- style="width:101px"	class="col-lg-10" -->
<%-- 									<form:option value="-1">請選擇</form:option> --%>
									<form:option value="1">1</form:option>
									<form:option value="2">2</form:option>
									<form:option value="3">3</form:option>
									<form:option value="4">4</form:option>
									<form:option value="5">5</form:option>
								</form:select>
							</div>

							<div class="form-group">
								<label >分享你的活動評論</label>
							</div>
							<div class="form-group">
								<form:textarea path="eventComment" id="eventComment" cols="50"
										rows="5" style="border: 1px black solid;"></form:textarea>
									<td><span id="msg_eventComment" class='msgWrong'></span>
							</div>
							<div class="form-group">
								<input class="form-group" type="submit" value="送出評論" class="btn btn-primary py-3 px-5" />
								<!--     class="btn btn-primary py-3 px-4" -->
							</div>
							
<!-- 						</fieldset> -->
					</form:form>


					<!-- 		</fieldset> -->
				</div>

			</div>
			<!-- row End -->

		</div>
		<!-- container End -->

	</section>


	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;">
	<!-- 	<section class="container"> -->
	<!--       三個地方要完全一樣  -->
	-->

	<%-- 		<form:form method='POST' modelAttribute="reviewBean" --%>
	<%-- 			class='form-horizontal'> --%>
	<!-- 			<fieldset> -->
	<!-- 				<div class="form-group"> -->
	<!-- 					<label class='control-label col-lg-2 col-lg-2' for="eventImage"> -->
	<!-- 						活動照片 </label> -->
	<!-- 					<div class='col-lg-10'> -->
	<%-- 						<form:input id="productImage" path="productImage" type='file' --%>
	<%-- 							class='form:input-large' /> --%>
	<!-- 					</div> -->
	<!-- 				</div> -->
	<!-- 				<div class="form-group"> -->
	<!-- 					<label class='control-label col-lg-2 col-lg-2' for="comments"> -->
	<!-- 						會員名 </label> -->
	<%-- 					<p>${userId} --%>
	<%-- 						<form:input path="mbId" value="${userId}" type='hidden' --%>
	<%-- 							class='form:input-large' /> --%>
	<!-- 				</div> -->

	<!-- 				<div class="form-group"> -->
	<!-- 					<label class='control-label col-lg-2 col-lg-2' for="comments"> -->
	<!-- 						分享你的活動評論 </label> -->
	<!-- 					<div class='form-control'> -->
	<%-- 						<form:textarea path="eventComment" id="eventComment" cols="50" --%>
	<%-- 							rows="5" style="border: 1px black solid;"></form:textarea> --%>
	<!-- 						<td><span id="msg_eventComment" class='msgWrong'></span> -->
	<!-- 					</div> -->

	<!-- 				</div> -->

	<!-- 				<div class="form-group"> -->
	<!-- 					<label for="exampleFormControlSelect1" -->
	<!-- 						class='control-label col-lg-2 col-lg-2'>請選擇</label> -->
	<%-- 					<form:select width="101px" style="width:101px" path="eventStars" --%>
	<%-- 						class="col-lg-10" id="exampleFormControlSelect1" name="rate"> --%>
	<%-- 						<form:option value="-1" label="請選擇"></form:option> --%>
	<%-- 						<form:option value="1">1</form:option> --%>
	<%-- 						<form:option value="2">2</form:option> --%>
	<%-- 						<form:option value="3">3</form:option> --%>
	<%-- 						<form:option value="4">4</form:option> --%>
	<%-- 						<form:option value="5">5</form:option> --%>
	<%-- 					</form:select> --%>
	<!-- 				</div> -->

	<!-- 				<div class="form-group"> -->
	<!-- 					<div class='col-lg-offset-2 col-lg-10'> -->
	<!-- 						<input id="btnAdd" type='submit' class='btn btn-primary' -->
	<!-- 							value="送出" /> -->
	<!-- 					</div> -->
	<!-- 				</div> -->
	<!-- 			</fieldset> -->
	<%-- 		</form:form> --%>
	<!-- 	</section> -->

	<footer class="ftco-footer ftco-bg-dark ftco-section">
		<div class="container">
			<div class="row mb-5">
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">About Autoroad</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia and Consonantia, there live the blind texts.</p>
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
							<li><a href="#" class="py-2 d-block">About</a></li>
							<li><a href="#" class="py-2 d-block">Services</a></li>
							<li><a href="#" class="py-2 d-block">Term and Conditions</a></li>
							<li><a href="#" class="py-2 d-block">Best Price
									Guarantee</a></li>
							<li><a href="#" class="py-2 d-block">Privacy &amp;
									Cookies Policy</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Customer Support</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">FAQ</a></li>
							<li><a href="#" class="py-2 d-block">Payment Option</a></li>
							<li><a href="#" class="py-2 d-block">Booking Tips</a></li>
							<li><a href="#" class="py-2 d-block">How it works</a></li>
							<li><a href="#" class="py-2 d-block">Contact Us</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Have a Questions?</h2>
						<div class="block-23 mb-3">
							<ul>
								<li><span class="icon icon-map-marker"></span><span
									class="text">203 Fake St. Mountain View, San Francisco,
										California, USA</span></li>
								<li><a href="#"><span class="icon icon-phone"></span><span
										class="text">+2 392 3929 210</span></a></li>
								<li><a href="#"><span class="icon icon-envelope"></span><span
										class="text">info@yourdomain.com</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">

					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="icon-heart color-danger" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>

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


	<script
		src="${pageContext.request.contextPath}/assets/jquery/jquery-1.8.3.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.js"
		charset="UTF-8"></script>
	<script
		src="${pageContext.request.contextPath}/assets/locales/bootstrap-datetimepicker.fr.js"
		charset="UTF-8"></script>
	<script type="text/javascript">
		$('.form_datetime').datetimepicker({
			//language:  'fr',
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			forceParse : 0,
			showMeridian : 1
		});
	</script>

</body>
</html>
