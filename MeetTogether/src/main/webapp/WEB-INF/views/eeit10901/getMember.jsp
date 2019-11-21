<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<script type="text/javascript">

	var jQuery_1_12_4 = $.noConflict();
	jQuery_1_12_4(document).ready(function() {
		jQuery_1_12_4("#sex").val('${member.memberSex}');
		// 	jQuery_1_12_4("#updata").click(function(){
		// 		jQuery_1_12_4("#updataMmber").attr('action','updateMmeber');
		// 		jQuery_1_12_4("#updataMmber").submit();
	})
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

	jQuery_1_12_4);
</script>

</head>
<body>
	<!-- 	<div id="dialog-confirm" title="升級為VIP會員"> -->
	<!-- 		<span style="float: left; margin: 12px 12px 20px 0;"> <img -->
	<%-- 			src="${pageContext.request.contextPath}/eeit10927/images/upgrade.jpg" --%>
	<!-- 			style="width: 370px; margin: auto;"> -->
	<!-- 		</span> <br> Upgrade 1: 每日新增好友數20名！<br> Upgrade 2: 新增討論區文章匯出功能！<br> -->
	<!-- 		<br> -->
	<%-- 		<form:form modelAttribute="vipBean" method="POST" action="./VipBuy"> --%>
	<%-- 			<form:input type="hidden" path="mbId" value="${userId}" /> --%>
	<!-- 			<input type="submit" value="前往付款" class="reply"> -->
	<%-- 		</form:form> --%>
	<!-- 	</div> -->

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
					<li class="nav-item"><a
						href="${pageContext.request.contextPath}/" class="nav-link">首頁</a></li>
					<li class="nav-item"><a href="#" class="nav-link">交友</a></li>
					<li class="nav-item"><a href="#" class="nav-link">活動</a></li>
					<li class="nav-item active"><a
						href="${pageContext.request.contextPath}/GetAllPostServlet"
						class="nav-link">討論區</a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath}/getmember" class="nav-link">會員資料</a></li>
					<li class="nav-item"><a class="nav-link"><c:if
								test="${!empty userId}">${userName}
						</c:if></a></li>
					<li class="nav-item"><c:if test="${!empty userId}">
							<img style="height: 40px"
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

	<section class="hero-wrap hero-wrap-2 js-fullheight"
		style="background-image: url('${pageContext.request.contextPath}/eeit10901/images/mt1.jpg');"
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
	<div align=center>
		<h2>個人基本資料</h2>

		<table border='1'>
			<tr>
			<td  colspan="2">
				<img style="height: 450px"
					src='${pageContext.request.contextPath}/getImage?type=member&id=${userId}' />
</td>
				<!-- 					<tr bgcolor='#ffad00'> -->
			<tr>
				<td>編號
				<td>${member.memberId}</td>
			<tr>
				<td>mail
				<td>${member.memberEmail}</td>
<!-- 			<tr> -->
<!-- 				<td>密碼 -->
<%-- 				<td><input type="password" value="${member.memberPassword}" --%>
<!-- 					disabled="true"></td> -->
			<tr>
				<td>暱稱
				<td>${member.memberName}</td>
			<tr>
				<td>生日
				<td>${member.memberBirth}</td>
			<tr>
				<td>性別</td>

				<td>
						<c:choose>
							<c:when test="${member.memberSex == 1 }">
								男
							</c:when>
							<c:otherwise>
								女
							</c:otherwise>
						</c:choose>


				</td>
			<tr>
				<td>縣市
				<td>${member.memberCity}</td>
		</table>
		<c:choose>
			<c:when test="${member.memberId == userId}">
				<a class="btn btn-secondary" href="${pageContext.request.contextPath}/upadateInfo/${member.memberId}">修改資料</a>
			</c:when>
		</c:choose>
	</div>
	<jsp:include page="/WEB-INF/views/eeit10936/friendOption.jsp"/>

	<c:choose>
			<c:when test="${member.memberId == userId}">
		
	<a href="${pageContext.request.contextPath}/personal" class="nav-link">輸入個人喜好</a>
	<a href="${pageContext.request.contextPath}/personalInterest" class="nav-link">輸入個人興趣</a>
	<a href="${pageContext.request.contextPath}/addHope"class="nav-link">輸入個人希望條件</a>
	<a href="${pageContext.request.contextPath}/addAlbum" class="nav-link">相簿</a>
	
		</c:when>
	</c:choose>
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
            <li><a href="${pageContext.request.contextPath}/" class="py-2 d-block">首頁</a></li>
            <li><a href="${pageContext.request.contextPath}/pairs/" class="py-2 d-block">交友</a></li>
            <li><a href="${pageContext.request.contextPath}/eeit10908/" class="py-2 d-block">活動</a></li>
            <li><a href="${pageContext.request.contextPath}/GetAllPostServlet" class="py-2 d-block">討論區</a></li>
            <li><a href="${pageContext.request.contextPath}/getmember" class="py-2 d-block">會員資料</a></li>
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
             <li><a href="#"><span class="icon icon-envelope"></span><span class="text">109meettogether@gmail.com</span></a></li>
           </ul>
         </div>
        </div>
      </div>
    </div>
  </div>
</footer>
</body>
</html>