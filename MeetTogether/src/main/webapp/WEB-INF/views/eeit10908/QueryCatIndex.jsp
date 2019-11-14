<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
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


<title>員工資料</title>
<meta name="viewport"
	content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="UTF-8">
<style>
body {
/* 	background: -webkit-radial-gradient(ellipse, white, aqua); */
/* 	background: -o-radial-gradient(ellipse, white, aqua); */
/* 	background: -moz-radial-gradient(ellipse, white, aqua); */
/* 	background: radial-gradient(ellipse, white, aqua); */
	background-color: #e7eef1;
    font-family: 微軟正黑體;
}

.btn-link {
	border: none;
	outline: none;
	background: none;
	cursor: pointer;
	color: #0000EE;
	padding: 0;
	text-decoration: underline;
	font-family: inherit;
	font-size: inherit;
}

.btn-link:active {
	color: #FF0000;
}

td {
	text-align: center;
	vertical-align: middle;
}

tr {
	text-align: center;
	vertical-align: middle;
}

th {
	text-align: center;
	vertical-align: middle;
	white-space: nowrap;
	padding: 20px;
}

thead tr th {
	position: sticky;
	top: 0; /* 列首永遠固定於上 */
}

select {
	width: auto;
	padding: 0 5%;
}

option {
	text-align: center;
}
</style>
</head>
<body onload="getCatClass()">

<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="index.html">Auto<span>road</span></a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item"><a href="index.html" class="nav-link">Home</a></li>
	          <li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
	          <li class="nav-item active"><a href="pricing.html" class="nav-link">Pricing</a></li>
	          <li class="nav-item"><a href="car.html" class="nav-link">Our Car</a></li>
	          <li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li>
	          <li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
	        </ul>
	      </div>
	    </div>
	  </nav>
	  
	  <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${pageContext.request.contextPath}/eeit10908/images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Pricing <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-3 bread">Car Rates Pricing</h1>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section ftco-cart">
			<div class="container">
				<div class="row">
    			<div class="col-md-12 ftco-animate">
    				
    			</div>
    		</div>
			</div>
	</section>


	<div align="center">
		<h2>${catclass} 類 型 列 表</h2>

		<form method="get" action="/MeetTogether/index/ChangeIndexCat">
				<select name="eventCat" onchange="submit();">
						<option value="" disabled selected hidden >${catclass}</option>
						<c:forEach items="${catList}" var="cat">
								<option value="${cat.key}">${cat.value}</option>
						</c:forEach>
						
				</select>
		</form>

<p>
		<a href="/MeetTogether/eeit10908" style="color:black">回到總表</a>
		<p>
<!-- 		<table border="1"> -->
<!-- 				<tr bgcolor="#a8fefa" class="alternateRow"> -->
<!-- 					<th>活動編號 -->
<!-- 					<th>主辦人編號 -->
<!-- 					<th>活動名稱 -->
<!-- 					<th>活動類型 -->
<!-- 					<th>活動開始時間 -->
<!-- 					<th>活動參與人數 -->
<!-- 					<th>預算 -->
<!-- 					<th>活動地點 -->
<!-- 					<th>google map地點標記 -->
<!-- 					<th>活動建立時間 -->
<!-- 					<th>評價 -->
<!-- 					<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 					<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
			<section class="ftco-section">
    			<div class="container">
    				<div class="row">
			
				<c:forEach var='acts' items="${actBeanCat}">
				<div class="col-md-4">
    				<div class="car-wrap ftco-animate">
    					<div class="img d-flex align-items-end" style="background-image: url(${pageContext.request.contextPath}/getImage?id=${acts.eventId}&type=act)">
<%--     								<img width="200" height="200" src="<c:url value='/getImage?id=${acts.eventId}&type=act'/>"/> --%>
    					</div>
    					<div class="text p-4 text-center">
    						<h2 class="mb-0"><a href="car-single.html">${acts.eventName}</a></h2>
    						<span>scheduled start tine:${acts.eventTime}</span>
    						<p class="d-flex mb-0 d-block"><a href="#" class="btn btn-black btn-outline-black mr-1">參加活動</a> <a href="ByActivity?getId=${acts.eventId}" class="btn btn-black btn-outline-black ml-1">活動細節</a></p>
    					</div>
    				</div>
    			</div>
<!-- 					<tr class="" id="my_id"> -->
<%-- 						<td><a href="ByActivity?getId=${acts.eventId}"><button --%>
<%-- 									type="button" class="btn-link">${acts.eventId}</button></a> 					<input type="hidden" name="eventid" value="${acts.eventId}"> --%>
<%-- 						<td>${acts.memberId} --%>
<%-- 						<td>${acts.eventName} --%>
<%-- 						<td>${acts.catbean.eventClass}</td> --%>
<%-- 						<td>${acts.eventTime} --%>
<%-- 						<td>${acts.groupNum} --%>
<%-- 						<td>${acts.budget} --%>
<%-- 						<td align='center' valign="middle">${acts.eventPlace} --%>
<!-- 						<td><iframe width="400" height="250" style="border: 0" -->
<%-- 								src="https://www.google.com/maps/embed/v1/place?key=AIzaSyA3sRUmvTTrsDvCJWhqAVC142ehRvCXiTc&q=${acts.eventPlace}"> --%>
<!-- 							</iframe> -->
<%-- 						<td>${acts.createTime} --%>
<%-- 						<td><form method="post" action=""> --%>
<!-- 								<input type="submit" value="評價" /><input type="hidden" -->
<!-- 									name="eventid" value=""> -->
<%-- 							</form> --%>
<!-- 						<td><button type="button" -->
<%-- 								onclick="window.location.href='index/deleteActivity?getId=${acts.eventId}'">刪除</button> --%>
<!-- 						<td><button type="button"  -->
<%-- 								onclick="window.location.href='actdata?getId=${acts.eventId}'">文章修改</button>		 --%>

<%-- 							<c:set var="count" value="${s.count}"></c:set> --%>
				</c:forEach>
			</div>
    	</div>
    </section>
			
<!-- 		</table> -->
		<br> <a href='addActis'><input type="button" value="新增活動"></a>
	
	</div>
	<footer class="ftco-footer ftco-bg-dark ftco-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">About Autoroad</h2>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
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
                <li><a href="#" class="py-2 d-block">About</a></li>
                <li><a href="#" class="py-2 d-block">Services</a></li>
                <li><a href="#" class="py-2 d-block">Term and Conditions</a></li>
                <li><a href="#" class="py-2 d-block">Best Price Guarantee</a></li>
                <li><a href="#" class="py-2 d-block">Privacy &amp; Cookies Policy</a></li>
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
	                <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">

            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart color-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
          </div>
        </div>
      </div>
    </footer>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


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
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="${pageContext.request.contextPath}/js/google-map.js"></script>
  <script src="${pageContext.request.contextPath}/js/main.js"></script>
    
</body>
</html>