<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>MeetTogether - 首頁</title>
<meta charset="UTF-8">
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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/eeit10927/js/login.js"></script>
<style>
.reply_a {
	padding: 5px 10px;
	/*background: #18e2eb45;*/
	background: #ffc107ab;
	color: #000000;
	text-transform: uppercase;
	font-size: 14px;
	letter-spacing: .1em;
	font-weight: 400;
	border-radius: 4px;
	width: 45%;
}
.reply {
	padding: 5px 10px;
	background: #ff07295e;
	color: black;
	text-transform: uppercase;
	font-size: 14px;
	letter-spacing: .1em;
	font-weight: 400;
	border-radius: 4px;
	width: 45%;
}
.reply_a:hover {
	color: #fff;
	/*background: #18e2ebb5;*/
	background: #fd7e14;
}
.reply:hover {
	color: white;
	background: #FF5151;
}
.reply:visited {
	color: black;
	background: #FF5151;
}
.testimony-wrap{
	/*background: #ff00000f;*/
	background: white;
}

.p-4{
	/*background: #0384f30f;
	background: #c3f3031c;
	background: #f3f2bd6b;*/
	background: white;
}
.msgWrong {
	color: red;
	font-size: 0.9em;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	autoRun();
	run();
	showModal();
	var num = 0;
	function autoRun() {
		for (var i = 1; i <= 7; i++) {
			var nDivId = '#m'+i;
			$(nDivId).css('display',"none");
		}
		if (num < 7)
			num++;
		else
			num = 1;
		var DivId = '#m'+num;
		$(DivId).css('display',"block");
	}
	function run() {
		myInterval = window.setInterval(autoRun, 2000);
	}
	function showModal() {
		var userId = document.getElementById("userId").value;
		console.log('userId: ' + userId);
		if (userId > 0) {
			$("#loginModalLong").modal('hide');
		} else {
			$("#loginModalLong").modal('show');
		}
	}
	
});
</script>
</head>
<body>
<!-- 登入視窗 -->
<div class="modal fade" id="loginModalLong" tabindex="-1" role="dialog" aria-labelledby="loginModalLongTitle" aria-hidden="true">
<div class="modal-dialog" role="document">
<div class="modal-content">
<div class="modal-header">
	<h5 class="modal-title" id="vipModalLongTitle" align="center">會員登入</h5>
	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
    <span aria-hidden="true">&times;</span>
	</button>
</div>
<div style="width:95%; text-align: center;">
	<div class="form-group">
		<form:form method="POST" 
			modelAttribute="memberBean" id="loginForm"
			action="./LoginServlet">
			<h2>Welcome</h2>
			
			<div>
				<div style="text-align: center;">
				請輸入Email<br>
				</div>
				<form:input type="email" name="mEmail" id="mEmail" path="memberEmail" value="${userEmail}" autocomplete="off" style="width:60%;" />
				<span id="msg_mEmail" class='msgWrong'></span>
			</div>
			<br>
			<div>
				<div style="text-align: center;">
				請輸入密碼<br>
				</div>
				<form:input type="password" name="mPwd" id="mPwd" path="memberPassword" value="${userPwd}" style="width:60%;" />
				<br>
				<span id="msg_mPwd" class='msgWrong'>${errorMsg.loginError}</span>
			</div>
			<br>
			<div class="form-group">
				<input type="submit" value="登入" id="login" class="btn btn-primary py-3 px-4" />
				尚未成為會員? <a href="register">前往註冊</a>
			</div>
		</form:form>
	</div>
</div>
</div>
</div>
</div>
<!-- 登入後將userId放在這兒 -->
<input type="hidden" value="${userId }" id="userId">

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
					<li class="nav-item active"><a href="${pageContext.request.contextPath}/" class="nav-link">首頁</a></li>
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
					<li class="nav-item"><c:if test="${!empty userId}">
						<img style="height: 40px; border-radius: 50%;" src='${pageContext.request.contextPath}/getImage?type=member&id=${userId}'>
						</c:if></li>
					<li class="nav-item"><c:if test="${!empty userId}">
						<a href="<c:url value='/LogoutServlet'  />" class="nav-link">登出</a>
						</c:if></li>
					<li class="nav-item"><c:if test="${empty userId}">
						<a href="<c:url value='/LoginServlet' />" class="nav-link" data-toggle="modal" data-target="#loginModalLong" >登入/註冊</a>
						</c:if></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->
	
	<div class="hero-wrap hero-wrap-2 js-fullheight" id="m1"
		style="background-image: url('${pageContext.request.contextPath}/eeit10927/images/bg09.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
				<div class="col-md-9 ftco-animate pb-5">
					<p class="breadcrumbs">
						<span class="mr-2"><a
							href="${pageContext.request.contextPath}/">首頁 <i
								class="ion-ios-arrow-forward"></i></a></span>
					</p>
					<h1 class="mb-3 bread">首頁</h1>
				</div>
			</div>
		</div>
	</div>
	<div class="hero-wrap hero-wrap-2 js-fullheight" id="m2"
		style="background-image: url('${pageContext.request.contextPath}/eeit10927/images/bg02.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
				<div class="col-md-9 ftco-animate pb-5">
					<p class="breadcrumbs">
						<span class="mr-2"><a
							href="${pageContext.request.contextPath}/">首頁 <i
								class="ion-ios-arrow-forward"></i></a></span>
					</p>
					<h1 class="mb-3 bread">首頁</h1>
				</div>
			</div>
		</div>
	</div>
	<div class="hero-wrap hero-wrap-2 js-fullheight" id="m3"
		style="background-image: url('${pageContext.request.contextPath}/eeit10927/images/bg05.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
				<div class="col-md-9 ftco-animate pb-5">
					<p class="breadcrumbs">
						<span class="mr-2"><a
							href="${pageContext.request.contextPath}/">首頁 <i
								class="ion-ios-arrow-forward"></i></a></span>
					</p>
					<h1 class="mb-3 bread">首頁</h1>
				</div>
			</div>
		</div>
	</div>
	<div class="hero-wrap hero-wrap-2 js-fullheight" id="m4"
		style="background-image: url('${pageContext.request.contextPath}/eeit10927/images/bg07.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
				<div class="col-md-9 ftco-animate pb-5">
					<p class="breadcrumbs">
						<span class="mr-2"><a
							href="${pageContext.request.contextPath}/">首頁 <i
								class="ion-ios-arrow-forward"></i></a></span>
					</p>
					<h1 class="mb-3 bread">首頁</h1>
				</div>
			</div>
		</div>
	</div>
	<div class="hero-wrap hero-wrap-2 js-fullheight" id="m5"
		style="background-image: url('${pageContext.request.contextPath}/eeit10927/images/bg08.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
				<div class="col-md-9 ftco-animate pb-5">
					<p class="breadcrumbs">
						<span class="mr-2"><a
							href="${pageContext.request.contextPath}/">首頁 <i
								class="ion-ios-arrow-forward"></i></a></span>
					</p>
					<h1 class="mb-3 bread">首頁</h1>
				</div>
			</div>
		</div>
	</div>
	<div class="hero-wrap hero-wrap-2 js-fullheight" id="m6"
		style="background-image: url('${pageContext.request.contextPath}/eeit10927/images/bg01.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
				<div class="col-md-9 ftco-animate pb-5">
					<p class="breadcrumbs">
						<span class="mr-2"><a
							href="${pageContext.request.contextPath}/">首頁 <i
								class="ion-ios-arrow-forward"></i></a></span>
					</p>
					<h1 class="mb-3 bread">首頁</h1>
				</div>
			</div>
		</div>
	</div>
	<div class="hero-wrap hero-wrap-2 js-fullheight" id="m7"
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
								class="ion-ios-arrow-forward"></i></a></span>
					</p>
					<h1 class="mb-3 bread">首頁</h1>
				</div>
			</div>
		</div>
	</div>
	
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
					<c:forEach var='newMember' items="${newMembers}">
						<div class="item">
							<div class="testimony-wrap text-center py-4 pb-5">
								<div class="user-img mb-4"
									style="background-image: url(${pageContext.request.contextPath}/getImage?id=${newMember.memberId}&type=member)"></div>
								<div class="text pt-4">
									<p class="name">${newMember.memberName }</p>
									<p class="mb-4">居住城市：${newMember.memberCity }<br>生日：${newMember.memberBirth }</p>
									<p style="text-align: center;">
									<c:choose>
										<c:when test="${userId eq null }">
											<a href="###" class="reply" data-toggle="modal" data-target="#loginModalLong">送出好友邀請</a>&ensp;&ensp;
										</c:when>
										<c:otherwise>
											<a href="invite?fid=${newMember.memberId }" class="reply">送出好友邀請</a>
										</c:otherwise>
									</c:choose>
									</p>
								</div>
							</div>
						</div>
					</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<section class="ftco-section">
		<div class="container-fluid px-4">
			<div class="row justify-content-center">
				<div class="col-md-12 heading-section text-center ftco-animate mb-5">
					<span class="subheading">選擇你想參加的活動</span>
					<h2 class="mb-2">正在舉辦的熱門活動</h2>
				</div>
			</div>
			<div class="row">
			<c:forEach var='acts' items="${actBeanList}">
				<div class="col-md-3">
					<div class="car-wrap ftco-animate">
						<div class="img d-flex align-items-end"
							style="background-image: url(${pageContext.request.contextPath}/getImage?id=${acts.eventId}&type=act);">
						</div>
						<div class="text p-4 text-center">
							<h2 class="mb-0">
								<a href="#">${acts.eventName}</a>
							</h2>
							<span>scheduled time<br>${acts.eventTime}</span>
							<p style="text-align: center;">
								<c:choose>
									<c:when test="${userId eq null }">
										<a href="###" class="reply_a" data-toggle="modal" data-target="#loginModalLong">活動細節</a>&ensp;&ensp;
									</c:when>
									<c:otherwise>
										<a href="ByActivity?getId=${acts.eventId}" class="reply_a">活動細節</a>
									</c:otherwise>
								</c:choose>
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
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
			<c:forEach var='popMsg' items="${popMsgs}">
				<div class="col-md-4 d-flex ftco-animate">
					<div class="blog-entry justify-content-end">
						<a class="block-20"
							style="background-image: url(${pageContext.request.contextPath}/getImage?id=${popMsg.msgId}&type=message);"> </a>
						<div class="text pt-4">
							<div class="meta mb-3">
								<div>
									<a>${popMsg.createTimeFormat}</a>
								</div>
								<div>
									<c:choose>
										<c:when test="${userId eq null }">
											<a href="#" data-toggle="modal" data-target="#loginModalLong"><span class="icon-person"></span>${popMsg.member.memberName}</a>
										</c:when>
										<c:otherwise>
											<a href="${pageContext.request.contextPath}/GetUserPostServlet?memberId=${popMsg.member.memberId}"><span class="icon-person"></span>${popMsg.member.memberName}</a>
										</c:otherwise>
									</c:choose>
								</div>
								<div>
									<c:choose>
										<c:when test="${userId eq null }">
											<a href="#" data-toggle="modal" data-target="#loginModalLong"><span class="icon-chat"></span>${popMsg.replyCount}</a>
										</c:when>
										<c:otherwise>
											<a href="${pageContext.request.contextPath}/GetAllReMsgServlet?msgId=${popMsg.msgId}"><span class="icon-chat"></span>${popMsg.replyCount}</a>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							
							<h3 class="heading mt-2"><a href="${pageContext.request.contextPath}/GetAllReMsgServlet?msgId=${popMsg.msgId}">${popMsg.msgTitle }</a></h3>
							<p>${popMsg.msgTextShort }
							<p>
							<c:choose>
								<c:when test="${userId eq null }">
									<a href="#" data-toggle="modal" data-target="#loginModalLong">閱讀更多<span class="icon-long-arrow-right"></span></a>
								</c:when>
								<c:otherwise>
									<a href="${pageContext.request.contextPath}/GetAllReMsgServlet?msgId=${popMsg.msgId}">閱讀更多<span class="icon-long-arrow-right"></span></a>
								</c:otherwise>
							</c:choose>
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
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