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


					<form:form method="post" 
 			modelAttribute="actBean" enctype="multipart/form-data">
				<span style="float:left; " >主 辦 人:</span>
					<span style="float:left; margin-left:3%;">${actBean.memberId.memberName}</span><br><br>
		     	<span style="float:left;">活 動 名 稱:</span><br>
					<span style="float:left; margin-left:6%;" ><form:input type="text" path="eventName"/></span><br><br>
		     	<span style="float:left;">活動類型:</span><br>
				<span style="float:left; margin-left:6%;"><form:select path="eventCat">
							<form:option value="-1" label="請選擇" />
							<form:options items="${catList}" />
						</form:select></span><br><br>
				<span style="float:left;">活動開始時間:</span><br>

						<div class="input-group date form_datetime col-md-4"							
							data-date-format="yyyy-mm-dd - HH:ii p"
							data-link-field="dtp_input1">
							<form:input class="form-control" type="text" path="eventTime"/>
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-remove"></span></span> <span
								class="input-group-addon"><span
								class="glyphicon glyphicon-th"></span></span>
						</div><br>
			           <span style="float:left;">活動內容:</span><br>
					<span style="float:left; margin-left:6%;"><form:textarea type="textarea" path="actContent"  style="width:300px;height:100px;" ></form:textarea></span><br>
		     	
						
		     	<br><br><br>
		     	<span style="float:left;">活動參與人數:</span><br>
					<span style="float:left; margin-left:6%;"><form:input type="text" path="groupNum" value="" /></span><br><br>
		     	
		     	<span style="float:left;">預算:</span><br>
					<span style="float:left; margin-left:6%;"><form:input type="text" path="budget"  /></span><br><br>
		     	<span style="float:left;">活動地點:</span><br>
					<span style="float:left; margin-left:6%;"><form:input type="text" path="eventPlace" /></span><br><br>
				<span style="float:left;">活動建立時間:</span><br>
					<span style="float:left; margin-left:6%;"><form:input type="text" path="createTime" id="create" /></span><br><br>
				<span style="float:left;">活動圖片:</span><br>&emsp;&emsp;&emsp;&emsp;
					<span style="float:left; margin-left:6%;"><form:input type="file" path="actImage" value="新增圖片" align="right"/></span><br><br>
		     	
		     	
		     	
		    
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">刪  除</button>
        		   <button type="submit" class="btn btn-primary">修 改</button>
		    	</form:form>



		



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