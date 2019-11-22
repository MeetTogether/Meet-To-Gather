<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>MeetTogether - 註冊會員</title>
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
<script	src="${pageContext.request.contextPath}/eeit10927/js/register.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/eeit10927/styles/register.css?t=${time}">
<style type="text/css">
.regisButton {
  background-color: #fc983c;
  color: white;
  padding: 8px 8px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
</style>
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
					<li class="nav-item"><a href="${pageContext.request.contextPath}/getmember" class="nav-link">會員資料</a></li>
					<li class="nav-item"><a class="nav-link">
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
					<li class="nav-item active"><c:if test="${empty userId}">
						<a href="<c:url value='/LoginServlet' />" class="nav-link" data-toggle="modal" data-target="#loginModalLong" >登入/註冊</a>
						</c:if></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->

	<section class="hero-wrap hero-wrap-2 js-fullheight"
		style="background-image: url('${pageContext.request.contextPath}/eeit10927/images/bg04.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
				<div class="col-md-9 ftco-animate pb-5">
					<p class="breadcrumbs">
						<span class="mr-2"><a
							href="${pageContext.request.contextPath}/">首頁 <i
								class="ion-ios-arrow-forward"></i></a></span> <span>會員註冊 <i
							class="ion-ios-arrow-forward"></i></span>
					</p>
					<h1 class="mb-3 bread">會員註冊</h1>
				</div>
			</div>
		</div>
	</section>

	<div class="row block-9 justify-content-center mb-5">
		<div class="col-md-8 mb-md-5" align="center">
			<h2 class="text-center" style="font-weight: bold">請輸入以下資料</h2>
			<font size="1" color="#FF0000">${errorMsg.errTitle}</font>
			<div align="center">
				<form:form enctype="multipart/form-data" method="POST" modelAttribute="memberBean" id='registerForm' class="bg-light p-5 contact-form">
					<div class="form-group">
						<table>
							<tr>
								<td style="width: 25%">帳號
								<td><form:input type="email" name="memberEmail" id="memberEmail" path="memberEmail" placeholder="請輸入Email作為登入帳號" value="${param.mEmail}" autocomplete="off" class="form-control" />
								<td><span id="msg_mEmail" class='msgWrong'>${errorMsg.accError}</span>
							<tr>
								<td>暱稱
								<td><form:input type="text" name="memberName" id="memberName" path="memberName" placeholder="請輸入暱稱" value="${param.mNickname}" autocomplete="off" class="form-control" />
								<td id="msg_mNickname"></td>
							<tr>
								<td>設定密碼
								<td><form:input type="password" name="memberPassword" id="memberPassword" path="memberPassword" placeholder="需有英/數/符號且超過6個字" value="${param.mPwd}" class="form-control" />
								<td><span id="msg_mPwd"></span>
							<tr>
								<td>密碼確認
								<td><form:input type="password" name="memberPassword2" id="memberPassword2" path="memberPassword2" placeholder="請再次輸入密碼" value="${param.mPwd2}" class="form-control" />
								<td><span id="msg_mPwd2"></span>
							<tr>
								<td>生日
								<td><form:input type="date" name="memberBirth" id="memberBirth" path="memberBirth" class="form-control" />
								<td id="msg_mNickname"></td>
							<tr>
								<td>性別
								<td><input type="radio" name="memberSex" id="memberSex" path="memberSex" placeholder="請輸入性別" value="1" />男
									<input type="radio" name="memberSex" id="memberSex" path="memberSex" placeholder="請輸入性別" value="0" />女
								<td id="msg_mNickname"></td>
							<tr>
<!-- 								<td>縣市 -->
<%-- 								<td><form:input type="text" name="memberCity" id="memberCity" path="memberCity" placeholder="請輸入城市　Ex:台北市" autocomplete="off" class="form-control" /> --%>
<!-- 								<td id="msg_mNickname"></td> -->
								
								<td>縣市 <td><form:select name="memberCity" id="memberCity" path="memberCity" class="form-control">
							 
										<option value="基隆市">基隆市</option>
										<option value="台北市">台北市</option>
										<option value="台北縣">台北縣</option>
										<option value="桃園縣">桃園縣</option>
										<option value="新竹市">新竹市</option>
										<option value="新竹縣">新竹縣</option>
										<option value="苗栗縣">苗栗縣</option>
										<option value="台中市">台中市</option>
										<option value="台中縣">台中縣</option>
										<option value="彰化縣">彰化縣</option>
										<option value="南投縣">南投縣</option>
										<option value="雲林縣">雲林縣</option>
										<option value="嘉義市">嘉義市</option>
										<option value="嘉義縣">嘉義縣</option>
										<option value="台南市">台南市</option>
										<option value="台南縣">台南縣</option>
										<option value="高雄市">高雄市</option>
										<option value="高雄縣">高雄縣</option>
										<option value="屏東縣">屏東縣</option>
										<option value="台東縣">台東縣</option>
										<option value="花蓮縣">花蓮縣</option>
										<option value="宜蘭縣">宜蘭縣</option>
										<option value="澎湖縣">澎湖縣</option>
										<option value="金門縣">金門縣</option>
										<option value="連江縣">連江縣</option>
								</form:select>
								<td id="msg_memberCity"></td>
								
								
							<tr>
								<td>驗證碼
								<td><form:input type="text" name="mChecksum" id="mChecksum" path="mChecksum" placeholder="請輸入驗證碼" autocomplete="off" />
								<td><span id="msg_mChecksum" class='msgWrong'>${errorMsg.captError}</span>
							<tr>
								<td>上傳照片
								<td><form:input type="file" name="memberImage" id="memberImage" path="memberImage" class="form-control" />
								<td><span id="msg_mPhoto"></span>
						</table>
					</div>
					<input type="submit" value="會員註冊" class="regisButton" >
					<input type="reset" value="重新填寫" class="regisButton" >
					<a href="${pageContext.request.contextPath}/"><input type="button" value="返回登入頁" class="regisButton" ></a>

				</form:form>
			</div>
		</div>
	</div>


	<!-- footer引入 -->
	<jsp:include page="/WEB-INF/views/footer.jsp" />


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