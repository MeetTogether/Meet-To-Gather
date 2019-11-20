<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
<title>活 動 細 節</title>
<meta name="viewport"
	content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">




<style>
body {
/* 	background: -webkit-radial-gradient(circle, white, burlywood); */
/* 	background: -o-radial-gradient(circle, white, burlywood); */
/* 	background: -moz-radial-gradient(circle, white, burlywood); */
/* 	background: radial-gradient(circle, white, burlywood); */
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
    max-width: 95%; }
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

<script>
var jQuery_1_12_4 = $.noConflict();

jQuery_1_12_4(document).ready(
	function() {
		jQuery_1_12_4("#Postbox").hide();
		jQuery_1_12_4("#Postbutton").click(function() {
			jQuery_1_12_4("#Postbox").toggle("blind"); /* 展開發文表單 */
			/* $('html,body').animate({
				scrollTop : 0
			}); 返回到頁面頂端 */
		});
		jQuery_1_12_4("#ViewMyPost").click(
			function() {
				top.location.href = "${pageContext.request.contextPath}/GetUserPostServlet?memberId=${userId}";
			});
		jQuery_1_12_4("#ViewAllPost").click(
			function() {
				top.location.href = "${pageContext.request.contextPath}/GetAllPostServlet";
			});
		jQuery_1_12_4("input#deletePost").click(function() {
			var c = confirm('是否確認刪除');
			console.log(c);
			if (c) {
				jQuery_1_12_4(this).parent("form#deletePostForm").submit();
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
<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="/MeetTogether/">Meet<span>Together</span></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
<%-- 					<li class="nav-item"><a href="${pageContext.request.contextPath}/register" class="nav-link">註冊</a></li> --%>
					<li class="nav-item"><a href="${pageContext.request.contextPath}/" class="nav-link">首頁</a></li>
					<li class="nav-item"><a href="#" class="nav-link">交友</a></li>
					<li class="nav-item active"><a href="/MeetTogether/eeit10908" class="nav-link">活動</a></li>
					<li class="nav-item "><a
						href="${pageContext.request.contextPath}/GetAllPostServlet"
						class="nav-link">討論區</a></li>
					<li class="nav-item"><a href="#" class="nav-link">會員資料</a></li>
					<li class="nav-item"><a class="nav-link"><c:if test="${!empty userId}">${userName}
						</c:if></a></li>
					<li class="nav-item"><c:if test="${!empty userId}">
						<img style="height: 40px; border-radius: 50%;" src='${pageContext.request.contextPath}/getImage?type=member&id=${userId}'>
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
								class="ion-ios-arrow-forward"></i></a></span> <span>討論區 <i
							class="ion-ios-arrow-forward"></i></span>
					</p>
					<h1 class="mb-3 bread">討論區</h1>
				</div>
			</div>
		</div>
	</section>







<!-- 	<div align="center"> -->
<!-- 		<h2>活 動 資 訊</h2>  -->
		<form:form method="post" modelAttribute="actdata">
		

				
		<section class="ftco-section ftco-car-details">
      <div class="container" align="center">
      	<div class="row justify-content-center">
      		<div class="col-md-12">
      			<div class="car-details">
      				<div class="img" style="background-image: url(${pageContext.request.contextPath}/getImage?id=${actdata.eventId}&type=act);"></div>
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
	              	<div class="icon"><span class="flaticon-dashboard"></span></div>
	              	<div class="text">
		                <h3 class="heading mb-0 pl-3">
		                	主 辦 人
		                	<span>${member.memberName}</span>
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
	              	<div class="icon"><span class="flaticon-car-machine"></span></div>
	              	<div class="text">
		                <h3 class="heading mb-0 pl-3">
		                	活動開始時間
		                	<span>${actdata.eventTime}</span>
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
	              	<div class="icon"><span class="flaticon-car-seat"></span></div>
	              	<div class="text">
		                <h3 class="heading mb-0 pl-3">
		                	活動參與人數
		                	<span>${actdata.groupNum}</span>
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
	              	<div class="icon"><span class="flaticon-backpack"></span></div>
	              	<div class="text">
		                <h3 class="heading mb-0 pl-3">
		                	天氣
		                	<span>晴天</span>
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
	              	<div class="icon"><span class="flaticon-diesel"></span></div>
	              	<div class="text">
		                <h3 class="heading mb-0 pl-3">
		                	活動地點
		                	<span>${actdata.eventPlace}</span>
		                </h3>
	                </div>
                </div>
              </div>
            </div>      
          </div>
      	</div>
      	
      	<h3>活動內容</h3>
		    <div>${actdata.actContent}</div><p>
		    
		 
		<h3>google地點</h3>    
		<iframe width="1000" height="500" style="border: 0" 
 								src="https://www.google.com/maps/embed/v1/place?key=AIzaSyA3sRUmvTTrsDvCJWhqAVC142ehRvCXiTc&q=${actdata.eventPlace}"> --%>
		</iframe>
		<div class="row">
      		<div class="col-md-12 pills">
						<div class="bd-example bd-example-tabs">
							<div class="d-flex justify-content-center">
							  <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">

							    <li class="nav-item">
							      <a class="nav-link active" id="pills-description-tab" data-toggle="pill" href="#pills-description" role="tab" aria-controls="pills-description" aria-expanded="true">Features</a>
							    </li>
							    <li class="nav-item">
							      <a class="nav-link" id="pills-manufacturer-tab" data-toggle="pill" href="#pills-manufacturer" role="tab" aria-controls="pills-manufacturer" aria-expanded="true">Description</a>
							    </li>
							    <li class="nav-item">
							      <a class="nav-link" id="pills-review-tab" data-toggle="pill" href="#pills-review" role="tab" aria-controls="pills-review" aria-expanded="true">Review</a>
							    </li>
							  </ul>
							</div>

<!-- 						  <div class="tab-content" id="pills-tabContent"> -->
<!-- 						  	<div class="col-md-8 mr-auto ml-auto"> -->

<!-- 							Carousel Card -->
<!-- 							<div class="card card-raised card-carousel"> -->
<!-- 								<div id="carouselExampleIndicators" class="carousel slide" -->
<!-- 									data-ride="carousel" data-interval="3000"> -->
<!-- 									<ol class="carousel-indicators"> -->
<!-- 										<li data-target="#carouselExampleIndicators" data-slide-to="0" -->
<!-- 											class="active"></li> -->
<!-- 										<li data-target="#carouselExampleIndicators" data-slide-to="1" -->
<!-- 											class=""></li> -->
<!-- 										<li data-target="#carouselExampleIndicators" data-slide-to="2" -->
<!-- 											class=""></li> -->
<!-- 									</ol> -->
<!-- 									<div class="carousel-inner"> -->
<!-- 									<a href="http://localhost:8080/MeetTogether/ByActivity?getId=2"> -->
<!-- 										<div class="carousel-item active"> -->
											
<!-- 												<img class="d-block w-100" -->
<!-- 												src="https://rawgit.com/creativetimofficial/material-kit/master/assets/img/bg.jpg" -->
<!-- 												alt="First slide"> -->
											
<!-- 											<div class="carousel-caption d-none d-md-block"> -->
<!-- 												<h4> -->
<!-- 													<i class="material-icons">location_on</i> Yellowstone -->
<!-- 													National Park, United States -->
<!-- 												</h4> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 										</a> -->
<!-- 										<div class="carousel-item"> -->
<!-- 											<img class="d-block w-100" -->
<!-- 												src="https://rawgit.com/creativetimofficial/material-kit/master/assets/img/bg2.jpg" -->
<!-- 												alt="Second slide"> -->
<!-- 											<div class="carousel-caption d-none d-md-block"> -->
<!-- 												<h4> -->
<!-- 													<i class="material-icons">location_on</i> Somewhere Beyond, -->
<!-- 													United States -->
<!-- 												</h4> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 										<div class="carousel-item"> -->
<!-- 											<img class="d-block w-100" -->
<!-- 												src="https://rawgit.com/creativetimofficial/material-kit/master/assets/img/bg3.jpg" -->
<!-- 												alt="Third slide"> -->
<!-- 											<div class="carousel-caption d-none d-md-block"> -->
<!-- 												<h4> -->
<!-- 													<i class="material-icons">location_on</i> Yellowstone -->
<!-- 													National Park, United States -->
<!-- 												</h4> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<a class="carousel-control-prev" -->
<!-- 										href="#carouselExampleIndicators" role="button" -->
<!-- 										data-slide="prev"> <i class="material-icons">keyboard_arrow_left</i> -->
<!-- 										<span class="sr-only">Previous</span> -->
<!-- 									</a> <a class="carousel-control-next" -->
<!-- 										href="#carouselExampleIndicators" role="button" -->
<!-- 										data-slide="next"> <i class="material-icons">keyboard_arrow_right</i> -->
<!-- 										<span class="sr-only">Next</span> -->
<!-- 									</a> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							End Carousel Card -->


<!-- 						</div> -->
<!-- -------------------------- -->
<!-- 						    <div class="tab-pane fade show active" id="pills-description" role="tabpanel" aria-labelledby="pills-description-tab"> -->
<!-- 						    	<div class="row"> -->
<!-- 						    		<div class="col-md-4"> -->
<!-- 						    			<ul class="features"> -->
<!-- 						    				<li class="check"><span class="ion-ios-checkmark"></span>Airconditions</li> -->
<!-- 						    				<li class="check"><span class="ion-ios-checkmark"></span>Child Seat</li> -->
<!-- 						    				<li class="check"><span class="ion-ios-checkmark"></span>GPS</li> -->
<!-- 						    				<li class="check"><span class="ion-ios-checkmark"></span>Luggage</li> -->
<!-- 						    				<li class="check"><span class="ion-ios-checkmark"></span>Music</li> -->
<!-- 						    			</ul> -->
<!-- 						    		</div> -->
<!-- 						    		<div class="col-md-4"> -->
<!-- 						    			<ul class="features"> -->
<!-- 						    				<li class="check"><span class="ion-ios-checkmark"></span>Seat Belt</li> -->
<!-- 						    				<li class="remove"><span class="ion-ios-close"></span>Sleeping Bed</li> -->
<!-- 						    				<li class="check"><span class="ion-ios-checkmark"></span>Water</li> -->
<!-- 						    				<li class="check"><span class="ion-ios-checkmark"></span>Bluetooth</li> -->
<!-- 						    				<li class="remove"><span class="ion-ios-close"></span>Onboard computer</li> -->
<!-- 						    			</ul> -->
<!-- 						    		</div> -->
<!-- 						    		<div class="col-md-4"> -->
<!-- 						    			<ul class="features"> -->
<!-- 						    				<li class="check"><span class="ion-ios-checkmark"></span>Audio input</li> -->
<!-- 						    				<li class="check"><span class="ion-ios-checkmark"></span>Long Term Trips</li> -->
<!-- 						    				<li class="check"><span class="ion-ios-checkmark"></span>Car Kit</li> -->
<!-- 						    				<li class="check"><span class="ion-ios-checkmark"></span>Remote central locking</li> -->
<!-- 						    				<li class="check"><span class="ion-ios-checkmark"></span>Climate control</li> -->
<!-- 						    			</ul> -->
<!-- 						    		</div> -->
<!-- 						    	</div> -->
<!-- 						    </div> -->

						    <div class="tab-pane fade" id="pills-manufacturer" role="tabpanel" aria-labelledby="pills-manufacturer-tab">
						      <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
									<p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>
						    </div>

						    <div class="tab-pane fade" id="pills-review" role="tabpanel" aria-labelledby="pills-review-tab">
						      <div class="row">
							   		<div class="col-md-7">
							   				<h3 class="head">所有評論</h3>
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
																${reviewBean.member.memberName}</b>
														</p>
													</h4>


													<p class="star">
														<b style='font-size: 14px;'>星等:
															${reviewBean.eventStars}</b>
													</p>
<!-- 													<p> -->
<%-- 													<input type="hidden" name="eventId"value="${reviewBean.event.eventId} }"> --%>
<!-- 													</p> -->

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
							   		</div>
							   		<div class="col-md-5">
							   			<div class="rating-wrap">
								   			<h3 class="head"><a href="${pageContext.request.contextPath}/addProduct?eventId=${actdata.eventId}">Give a Review</a></h3>
								   			<div class="wrap">
									   			<p class="star">
									   				<span>
									   					<i class="ion-ios-star"></i>
									   					<i class="ion-ios-star"></i>
									   					<i class="ion-ios-star"></i>
									   					<i class="ion-ios-star"></i>
									   					<i class="ion-ios-star"></i>
									   					(98%)
								   					</span>
								   					<span>20 Reviews</span>
									   			</p>
									   			<p class="star">
									   				<span>
									   					<i class="ion-ios-star"></i>
									   					<i class="ion-ios-star"></i>
									   					<i class="ion-ios-star"></i>
									   					<i class="ion-ios-star"></i>
									   					<i class="ion-ios-star"></i>
									   					(85%)
								   					</span>
								   					<span>10 Reviews</span>
									   			</p>
									   			<p class="star">
									   				<span>
									   					<i class="ion-ios-star"></i>
									   					<i class="ion-ios-star"></i>
									   					<i class="ion-ios-star"></i>
									   					<i class="ion-ios-star"></i>
									   					<i class="ion-ios-star"></i>
									   					(70%)
								   					</span>
								   					<span>5 Reviews</span>
									   			</p>
									   			<p class="star">
									   				<span>
									   					<i class="ion-ios-star"></i>
									   					<i class="ion-ios-star"></i>
									   					<i class="ion-ios-star"></i>
									   					<i class="ion-ios-star"></i>
									   					<i class="ion-ios-star"></i>
									   					(10%)
								   					</span>
								   					<span>0 Reviews</span>
									   			</p>
									   			<p class="star">
									   				<span>
									   					<i class="ion-ios-star"></i>
									   					<i class="ion-ios-star"></i>
									   					<i class="ion-ios-star"></i>
									   					<i class="ion-ios-star"></i>
									   					<i class="ion-ios-star"></i>
									   					(0%)
								   					</span>
								   					<span>0 Reviews</span>
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
<!-- 			<table border="1"> -->
<!-- 				<tr> -->
<!-- 					<td>活動編號 -->
<%-- 					<td>${actdata.eventId} --%>
						
<!-- 				<tr> -->
<!-- 					<td>主辦人編號: -->
<%-- 					<td>${actdata.memberId} --%>
						
<!-- 				<tr> -->
<!-- 					<td>活動名稱: -->
<%-- 					<td>${actdata.eventName} --%>
						
<!-- 				<tr> -->
<!-- 					<td>活動類型: -->
<%-- 					<td>${actdata.catbean.eventClass} --%>
						
<!-- 				<tr> -->
<!-- 					<td>活動開始時間: -->
<%-- 					<td>${actdata.eventTime}		 --%>
<!-- 				<tr> -->
<!-- 					<td>活動參與人數: -->
<%-- 					<td>${actdata.groupNum} --%>
						
<!-- 				<tr> -->
<!-- 					<td>預算: -->
<%-- 					<td>${actdata.budget}				 --%>
<!-- 				<tr> -->
<!-- 					<td>活動地點: -->
<%-- 					<td>${actdata.eventPlace} --%>
<!-- 				<tr> -->
<!-- 					<td>創立時間: -->
<%-- 					<td>${actdata.createTime} --%>
<!-- 			</table> -->
		</form:form>
<!-- 		<p> -->
<!-- 		<div align="center"> -->
<!-- 			<input type="button" value="參加" style="margin-right:10px;" > -->
<!-- 			<input type="button" onclick="history.back()" value="返回"> -->
<!-- 		</div> -->
<!-- 	</div> -->



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