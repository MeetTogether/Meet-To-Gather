<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>MeetTogether - 新增活動評論</title>
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
	href="${pageContext.request.contextPath}/css/style2.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style type="text/css">
.likeBtn, .dislikeBtn, .replyBtn {
	height: 20px;
	cursor: pointer;
}

p {
	margin-bottom: 0;
}

.input_tag {
	height: 52px !important;
	font-size: 18px;
	border-radius: 5px;
	width: 50%;
	padding: 0.375rem 0.75rem;
	font-weight: 400;
	line-height: 1.5;
	border: 1px solid #ced4da;
}
button,
input {
    font-family: "Montserrat", "Helvetica Neue", Arial, sans-serif;
}

body{
  font-size: 14px;
  font-family: "Montserrat", "Helvetica Neue", Arial, sans-serif;

}

@font-face {
  font-family: 'Nucleo Outline';
  src: url("https://github.com/creativetimofficial/now-ui-kit/blob/master/assets/fonts/nucleo-outline.eot");
  src: url("https://github.com/creativetimofficial/now-ui-kit/blob/master/assets/fonts/nucleo-outline.eot") format("embedded-opentype");
  src: url("https://raw.githack.com/creativetimofficial/now-ui-kit/master/assets/fonts/nucleo-outline.woff2");
  font-weight: normal;
  font-style: normal;

}

h4,
h5 {
    font-weight: 400;
    font-family: "Montserrat", "Helvetica Neue", Arial, sans-serif;

}

body{
  font-size: 14px;
  font-family: "Montserrat", "Helvetica Neue", Arial, sans-serif;

}

@font-face {
  font-family: 'Nucleo Outline';
  src: url("https://github.com/creativetimofficial/now-ui-kit/blob/master/assets/fonts/nucleo-outline.eot");
  src: url("https://github.com/creativetimofficial/now-ui-kit/blob/master/assets/fonts/nucleo-outline.eot") format("embedded-opentype");
  src: url("https://raw.githack.com/creativetimofficial/now-ui-kit/master/assets/fonts/nucleo-outline.woff2");
  font-weight: normal;
  font-style: normal;

}

h4,
h5 {
    font-weight: 400;
}

a {
    color: #f96332;
}

a:hover,
a:focus {
    color: #f96332;
}

h4,
.h4 {
    font-size: 1.5em;
    line-height: 1.45em;
    margin-top: 30px;
    margin-bottom: 15px;
}

h5,
.h5 {
    font-size: 1.3em;
    line-height: 1.4em;
    margin-bottom: 15px;
    color:#FFFFFF;
}

.title {
    font-weight: 700;
    padding-top: 30px;
}

body {
    color: #2c2c2c;
    font-size: 14px;
    font-family: "Montserrat", "Helvetica Neue", Arial, sans-serif;
    overflow-x: hidden;
    -moz-osx-font-smoothing: grayscale;
    -webkit-font-smoothing: antialiased;
}

[data-toggle="collapse"][data-parent="#accordion"] i {
    -webkit-transition: transform 150ms ease 0s;
    -moz-transition: transform 150ms ease 0s;
    -o-transition: transform 150ms ease 0s;
    -ms-transition: all 150ms ease 0s;
    transition: transform 150ms ease 0s;
}

[data-toggle="collapse"][data-parent="#accordion"][aria-expanded="true"] i {
    filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=2);
    -webkit-transform: rotate(180deg);
    -ms-transform: rotate(180deg);
    transform: rotate(180deg);
}

.now-ui-icons {
    display: inline-block;
    font: normal normal normal 14px/1 'Nucleo Outline';
    font-size: inherit;
    speak: none;
    text-transform: none;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

@-webkit-keyframes nc-icon-spin {
    0% {
        -webkit-transform: rotate(0deg);
    }

    100% {
        -webkit-transform: rotate(360deg);
    }
}

@-moz-keyframes nc-icon-spin {
    0% {
        -moz-transform: rotate(0deg);
    }

    100% {
        -moz-transform: rotate(360deg);
    }
}

@keyframes nc-icon-spin {
    0% {
        -webkit-transform: rotate(0deg);
        -moz-transform: rotate(0deg);
        -ms-transform: rotate(0deg);
        -o-transform: rotate(0deg);
        transform: rotate(0deg);
    }

    100% {
        -webkit-transform: rotate(360deg);
        -moz-transform: rotate(360deg);
        -ms-transform: rotate(360deg);
        -o-transform: rotate(360deg);
        transform: rotate(360deg);
    }
}

.now-ui-icons.arrows-1_minimal-left:before {
    content: "\ea3a";
}

.now-ui-icons.arrows-1_minimal-right:before {
    content: "\ea3b";
}

img {
    max-width: 100%;
    border-radius: 1px;
}

.carousel-item.active {
    display: block;
}

.carousel .carousel-inner {
    box-shadow: 0px 10px 25px 0px #FFFFFF;
    border-radius: 0.1875rem;
}

.login-page .link {
    font-size: 10px;
    color: #FFFFFF;
    text-decoration: none;
}

.section {
    padding: 70px 0;
    position: relative;
    background: #FFFFFF;
}

[data-background-color="orange"] {
    background-color: #e95e38;
}

[data-background-color="black"] {
    background-color: #2c2c2c;
}

[data-background-color]:not([data-background-color="gray"]) {
    color: #FFFFFF;
}

[data-background-color]:not([data-background-color="gray"]) .title {
    color: #FFFFFF;
}

[data-background-color]:not([data-background-color="gray"]) h4,
[data-background-color]:not([data-background-color="gray"]) h5,
[data-background-color]:not([data-background-color="gray"]) a:not(.btn):not(.dropdown-item) {
    color: #FFFFFF;
}

footer{
    margin-top:50px;
    color: #555;
    background: #fff;
    padding: 25px;
    font-weight: 300;
    background: #f7f7f7;

}
.footer p{
    margin-bottom: 0;
}
footer p a{
    color: #555;
    font-weight: 400;
}

footer p a:hover{
    color: #e86c42;
}

}

a {
    color: #f96332;
}

a:hover,
a:focus {
    color: #f96332;
}

h4,
.h4 {
    font-size: 1.5em;
    line-height: 1.45em;
    margin-top: 30px;
    margin-bottom: 15px;
}

h5,
.h5 {
    font-size: 1.3em;
    line-height: 1.4em;
    margin-bottom: 15px;
}

.title {
    font-weight: 700;
    padding-top: 30px;
}

body {
    color: #2c2c2c;
    font-size: 14px;
    font-family: "Montserrat", "Helvetica Neue", Arial, sans-serif;
    overflow-x: hidden;
    -moz-osx-font-smoothing: grayscale;
    -webkit-font-smoothing: antialiased;
}

[data-toggle="collapse"][data-parent="#accordion"] i {
    -webkit-transition: transform 150ms ease 0s;
    -moz-transition: transform 150ms ease 0s;
    -o-transition: transform 150ms ease 0s;
    -ms-transition: all 150ms ease 0s;
    transition: transform 150ms ease 0s;
}

[data-toggle="collapse"][data-parent="#accordion"][aria-expanded="true"] i {
    filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=2);
    -webkit-transform: rotate(180deg);
    -ms-transform: rotate(180deg);
    transform: rotate(180deg);
}


.now-ui-icons {
    display: inline-block;
    font: normal normal normal 14px/1 'Nucleo Outline';
    font-size: inherit;
    speak: none;
    text-transform: none;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

@-webkit-keyframes nc-icon-spin {
    0% {
        -webkit-transform: rotate(0deg);
    }

    100% {
        -webkit-transform: rotate(360deg);
    }
}

@-moz-keyframes nc-icon-spin {
    0% {
        -moz-transform: rotate(0deg);
    }

    100% {
        -moz-transform: rotate(360deg);
    }
}

@keyframes nc-icon-spin {
    0% {
        -webkit-transform: rotate(0deg);
        -moz-transform: rotate(0deg);
        -ms-transform: rotate(0deg);
        -o-transform: rotate(0deg);
        transform: rotate(0deg);
    }

    100% {
        -webkit-transform: rotate(360deg);
        -moz-transform: rotate(360deg);
        -ms-transform: rotate(360deg);
        -o-transform: rotate(360deg);
        transform: rotate(360deg);
    }
}

.now-ui-icons.arrows-1_minimal-left:before {
    content: "\ea3a";
}

.now-ui-icons.arrows-1_minimal-right:before {
    content: "\ea3b";
}

img {
    max-width: 100%;
    border-radius: 1px;
}

.carousel-item.active {
    display: block;
}

.carousel .carousel-inner {
    box-shadow: 0px 10px 25px 0px rgba(0, 0, 0, 0.3);
    border-radius: 0.1875rem;
}

.login-page .link {
    font-size: 10px;
    color: #FFFFFF;
    text-decoration: none;
}

.section {
    padding: 70px 0;
    position: relative;
    background: #FFFFFF;
}

[data-background-color="orange"] {
    background-color: #e95e38;
}

[data-background-color="black"] {
    background-color: #2c2c2c;
}

[data-background-color]:not([data-background-color="gray"]) {
    color: #FFFFFF;
}

[data-background-color]:not([data-background-color="gray"]) .title {
    color: #FFFFFF;
}

[data-background-color]:not([data-background-color="gray"]) h4,
[data-background-color]:not([data-background-color="gray"]) h5,
[data-background-color]:not([data-background-color="gray"]) a:not(.btn):not(.dropdown-item) {
    color: #FFFFFF;
}

footer{
    margin-top:50px;
    color: #555;
    background: #fff;
    padding: 25px;
    font-weight: 300;
    background: #f7f7f7;

}
.footer p{
    margin-bottom: 0;
}
footer p a{
    color: #555;
    font-weight: 400;
}

footer p a:hover{
    color: #e86c42;
}
.bodys{

	background: -webkit-radial-gradient(ellipse, white, mediumslateblue);
	background: -o-radial-gradient(ellipse, white, mediumslateblue);
	background: -moz-radial-gradient(ellipse, white, mediumslateblue);
	background: radial-gradient(ellipse, white, mediumslateblue);

}
</style>
<script type="text/javascript">
	jQueryConflict = $.noConflict();
	jQueryConflict(document)
			.ready(
					function() {
						jQueryConflict("#Postbox").hide();
						jQueryConflict("#Postbutton").click(function() {
							jQueryConflict("#Postbox").toggle("blind"); /* 展開發文表單 */
							/* $('html,body').animate({
								scrollTop : 0
							}); 返回到頁面頂端 */
						});
						jQueryConflict("#ViewMyPost")
								.click(
										function() {
											top.location.href = "${pageContext.request.contextPath}/GetUserPostServlet?memberId=${userId}&pageNo=1";
										});
						jQueryConflict("#ViewAllPost")
								.click(
										function() {
											top.location.href = "${pageContext.request.contextPath}/GetAllPostServlet";
										});
						jQueryConflict("input#deletePost")
								.click(
										function() {
											var c = confirm('是否確認刪除');
											console.log(c);
											if (c) {
												jQueryConflict(this).parent(
														"form#deletePostForm")
														.submit();
											} else {
											}
										});

					});
</script>

</head>
<body>
	<!-- vip購買 -->
	<jsp:include page="/WEB-INF/views/vip_div.jsp" />

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
					<li class="nav-item"><a
						href="${pageContext.request.contextPath}/" class="nav-link">首頁</a></li>
					<li class="nav-item"><a
						href="${pageContext.request.contextPath}/pairs/" class="nav-link">交友</a></li>
					<li class="nav-item"><a
						href="${pageContext.request.contextPath}/friends" class="nav-link">好友紀錄</a></li>
					<li class="nav-item"><a
						href="${pageContext.request.contextPath}/eeit10908/"
						class="nav-link">活動</a></li>
					<li class="nav-item"><a
						href="${pageContext.request.contextPath}/GetAllPostServlet"
						class="nav-link">討論區</a></li>
					<li class="nav-item"><a
						href="${pageContext.request.contextPath}/getmember"
						class="nav-link"> <c:if test="${vipTag eq true }">
								<span class="icon-diamond"></span>
							</c:if> <c:if test="${!empty userId}">${userName}
						</c:if>
					</a></li>
					<li class="nav-item"><c:if test="${!empty userId}">
							<img style="height: 40px; border-radius: 50%;"
								src='${pageContext.request.contextPath}/getImage?type=member&id=${userId}'>
						</c:if></li>
					<li class="nav-item"><c:if test="${!empty userId}">
							<a href="<c:url value='/LogoutServlet'  />" class="nav-link">登出</a>
						</c:if></li>
					<li class="nav-item"><c:if test="${empty userId}">
							<a href="<c:url value='/LoginServlet' />" class="nav-link"
								data-toggle="modal" data-target="#loginModalLong">登入/註冊</a>
						</c:if></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->

	<section class="hero-wrap hero-wrap-2 js-fullheight"
		style="background-image: url('${pageContext.request.contextPath}/eeit10927/images/write.jpg');"
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
					<h1 class="mb-3 bread">活動內容</h1>
				</div>
			</div>
		</div>
	</section>







	<!-- 	<div align="center"> -->
	<!-- 		<h2>活 動 資 訊</h2>  -->
	<form:form method="post" modelAttribute="actdata">

		<!-- -----fb button----- -->
		<!-- 		<div id="fb-root"></div> -->
		<!-- <script async defer crossorigin="anonymous" src="https://connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v5.0"></script> -->
		<%-- <H2>${pageContext.request.contextPath}/eeit10908/ByActivity?${queryString }</H2> --%>
		<%-- 		<div class="fb-like" data-href="${pageContext.request.contextPath}/eeit10908/ByActivity?${queryString }" data-width="" data-layout="button_count" data-action="recommend" data-size="large" data-show-faces="true" data-share="true"></div> --%>
		<!-- 		-----fb button end----- -->
		<section class="ftco-section ftco-car-details">
			<div class="container" align="center">
				<div class="row justify-content-center">
					<div class="col-md-12">
						<div class="car-details">
							<div class="img"
								style="background-image: url(${pageContext.request.contextPath}/getImage?id=${actdata.eventId}&type=act);"></div>
							<div class="text text-center">
								<span class="subheading">${actdata.catbean.eventClass}</span>
								<h2>${actdata.eventName}</h2>
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
											主 辦 人 <span><a
												href="${pageContext.request.contextPath}/getmember/${actdata.memberId.memberId}">${actdata.memberId.memberName}</a></span>
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
											活動開始時間 <span style="font-size:15px;">${actdata.eventTime}</span>
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
											活動人數上限 <span>${actdata.groupNum}</span>
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
											已參加人數 <span>${actdata.actjoinPeople}</span>
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
											活動地點 <span>${actdata.eventPlace}</span>
										</h3>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<h3>已參加者</h3>
			<section class="ftco-section">	
				<div class="container">
					<div class="row">
					
					<c:set var="done" value="false" />
					
					<c:forEach var='actjoins' items="${actjoinBean}">
						<div class="col-md-4">
    						<div class="car-wrap ftco-animate">
								   						
    							
   
    							
    							
    							<c:if test="${actdata.eventId eq actjoins.eventBean.eventId}">
									<c:set var="done" value="true"/>
								</c:if>
										
										
													
								<c:choose>
    							<c:when test="${done}">			
										<span>
										<img style="height: 40px; border-radius: 50%;" src='${pageContext.request.contextPath}/getImage?type=member&id=${userId}'>
										<a href="${pageContext.request.contextPath}/getmember" class="nav-link">
										${actjoins.memberbean.memberName}</a></span>	
								</c:when>
								
								</c:choose>		
								
												
						
								
							</div>
						</div>
							
					
					</c:forEach>
					
					
					
					
					</div>
				</div>
			</section>	
				
				<h3>活動內容</h3>
				<div style="font-size:20px; text-align:justify; ">${actdata.actContent}</div><br>
				<p>
				<h3>google活動地點</h3>
				<iframe width="1000" height="500" style="border: 0"
					src="https://www.google.com/maps/embed/v1/place?key=AIzaSyA3sRUmvTTrsDvCJWhqAVC142ehRvCXiTc&q=${actdata.eventPlace}">
					--%> </iframe>
				<div class="row">
					<div class="col-md-12 pills">
						<div class="bd-example bd-example-tabs">
							<div class="d-flex justify-content-center">
								<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">

									<li class="nav-item"><a class="nav-link active"
										id="pills-description-tab" data-toggle="pill"
										href="#pills-description" role="tab"
										aria-controls="pills-description" aria-expanded="true">精選活動</a>
									</li>

									<li class="nav-item"><a class="nav-link"
										id="pills-review-tab" data-toggle="pill" href="#pills-review"
										role="tab" aria-controls="pills-review" aria-expanded="true">評論</a>
									</li>
								</ul>
							</div>
							<div class="tab-content" id="pills-tabContent">
								<div class="tab-pane fade show active" id="pills-description"
									role="tabpanel" aria-labelledby="pills-description-tab">
									<div class="row">
										<div class="col-lg-8 col-md-12" style="margin: 5px auto">
											<div id="carouselExampleIndicators" class="carousel slide"
												data-ride="carousel">
												<ol class="carousel-indicators">
													<li data-target="#carouselExampleIndicators"
														data-slide-to="0" class="active"></li>
													<li data-target="#carouselExampleIndicators"
														data-slide-to="1" class=""></li>
													<li data-target="#carouselExampleIndicators"
														data-slide-to="2" class=""></li>
												</ol>
												<div class="carousel-inner" role="listbox">

													<div class="carousel-item active">
														<img class="d-block" 
															src="${pageContext.request.contextPath}/images/FotoJet.jpg">
														<div class="carousel-caption d-none d-md-block">
															<a
																href="http://localhost:8080/MeetTogether/ByActivity?getId=6"><h5>柴犬狗狗來聚會</h5></a>
														</div>
													</div>
													<!-- 				     -->
													<div class="carousel-item">
														<img class="d-block"
															src="${pageContext.request.contextPath}/images/joker.jpg"
															alt="Second slide">
														<div class="carousel-caption d-none d-md-block">
															<a
																href="http://localhost:8080/MeetTogether/ByActivity?getId=5"><h5>小丑電影賞析會</h5></a>
														</div>
													</div>
													<div class="carousel-item">
														<img class="d-block"
															src="${pageContext.request.contextPath}/images/newyork.jpg"
															alt="Third slide">
														<div class="carousel-caption d-none d-md-block">
															<a
																href="http://localhost:8080/MeetTogether/ByActivity?getId=2"><h5>紐約自由行</h5></a>
														</div>
													</div>
												</div>
												<a class="carousel-control-prev"
													href="#carouselExampleIndicators" role="button"
													data-slide="prev"> <i
													class="now-ui-icons arrows-1_minimal-left"></i>
												</a> <a class="carousel-control-next"
													href="#carouselExampleIndicators" role="button"
													data-slide="next"> <i
													class="now-ui-icons arrows-1_minimal-right"></i>
												</a>
											</div>
										</div>
									</div>
								</div>

								<div class="tab-pane fade" id="pills-review" role="tabpanel"
									aria-labelledby="pills-review-tab">
									<div class="row">
										<div class="col-md-7">
											<h3 class="head">所有評論</h3>
											<c:forEach var='reviewBean' items='${review}'>
												<div class="review d-flex"
													style="border: 3px #cccccc solid;">
													<!-- 												<div class="user-img" -->
													<!-- 													style="background-image: url(images/person_1.jpg)"></div> -->
													<!--使用者圖片呼叫 -->
													<%-- 													<img width='50' height='50'src="<c:url value='memberPhoto/${currentUser.memberId}'/>" /> --%>
													<img height='60'
														src='${pageContext.request.contextPath}/getImage?type=member&id=${reviewBean.member.memberId}'>

													<div class="desc">
														<h4>
															<p align="left">
																<b style='font-size: 16px;'>會員姓名: <a
																	href="${pageContext.request.contextPath}/getmember/${reviewBean.member.memberId}">${reviewBean.member.memberName}</a></b>
															</p>
														</h4>


														<p class="star" align="left">
															<b style='font-size: 14px;'>星等:
																${reviewBean.eventStars}</b>
														</p>
														<br>

														<p align="left">
															<b style='font-size: 14px; ' >評論:
																${reviewBean.eventComment}</b>
														</p>
														<br>
														<p align="left">
															<b style='font-size: 14px;'>創建時間:
																${fn:substring(reviewBean.createTime,0,16)}</b>
														</p>

														<p align="right">
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
										</div>
										<div class="col-md-5">
											<div class="rating-wrap">
												<h3 class="head">
													<a
														href="${pageContext.request.contextPath}/addProduct?eventId=${actdata.eventId}">Give
														a Review</a>
												</h3>
												<div class="wrap">
													<b style="font-size: 25px">目前平均分數: ${avgEventStar}/5分</b>
													<p class="star" align="left">
														<span> <i class="ion-ios-star"></i> <i
															class="ion-ios-star"></i> <i class="ion-ios-star"></i> <i
															class="ion-ios-star"></i> <i class="ion-ios-star"></i>


														</span> <span> ${five}個評論</span>
													</p>
													<p class="star" align="left">
														<span> <i class="ion-ios-star"></i> <i
															class="ion-ios-star"></i> <i class="ion-ios-star"></i> <i
															class="ion-ios-star"></i>


														</span> <span>${four}個評論</span>
													</p>
													<p class="star" align="left">
														<span> <i class="ion-ios-star"></i> <i
															class="ion-ios-star"></i> <i class="ion-ios-star"></i>

														</span> <span>${three}個評論</span>
													</p>
													<p class="star" align="left">
														<span> <i class="ion-ios-star"></i> <i
															class="ion-ios-star"></i>

														</span> <span>${two}個評論</span>
													</p>
													<p class="star" align="left">
														<span> <i class="ion-ios-star"></i>

														</span> <span>${one}個評論</span>
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

	</form:form>




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


	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/jquery.waypoints.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/jquery.stellar.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/aos.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/jquery.animateNumber.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/bootstrap-datepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/jquery.timepicker.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="${pageContext.request.contextPath}/js/google-map.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>