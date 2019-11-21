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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<style type="text/css">
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
	
		
	
		 <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${pageContext.request.contextPath}/eeit10901/images/mt6.webp');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html"> <i class="ion-ios-arrow-forward"></i></a></span> <span>About us <i class="ion-ios-arrow-forward"></i></span></p>
           
          </div>
        </div>
      </div>
    </section>
     <h1 class="mb-3 bread" align="center" >請輸入個人資訊</h1>
 

	 

	<div align="center">


		<form:form modelAttribute="infoBean" method="POST" action="${pageContext.request.contextPath}/personal" >
			<table>
				<tr>
				<tr>
					<td>婚姻</td>
					<td>
						<form:select   path="marriage">
							<option value="1">未婚</option>
							<option value="2">已婚</option>
							<option value="3">喪偶</option>
							<option value="4">一言難盡</option>
							
							</form:select>
				</tr>

				<tr>
					<td>教育</td>
					<td><form:select name="education" path="education">
							<option value="國中">國中</option>
							<option value="高中">高中</option>
							<option value="大學">大學</option>
							<option value="碩士">碩士</option>
							<option value="博士">博士</option>
					</form:select>
				<tr>
					<td>抽菸習慣</td>
					<td><form:select name="smoking" path="smoking">
							<option value="1">從來不抽</option>
							<option value="2">偶爾抽菸</option>
							<option value="3">老菸槍</option>
					</form:select>
				<tr>
					<td>喝酒習慣</td>
					<td><form:select name="drink" path="drink">
							<option value="從來不喝">從來不喝</option>
							<option value="偶爾小酌">偶爾小酌</option>
							<option value="老酒鬼">老酒鬼</option>
					</form:select>
				<tr>
					<td>種族</td>
					<td><form:select name="ethnicity"  path="ethnicity">
							<option value="白色人種">白色人種</option>
							<option value="黑色人種">黑色人種</option>
							<option value="黃色人種">黃色人種</option>
							<option value="棕色人種">棕色人種</option>
					</form:select></td>
				<tr>
					<td>身材</td>
					<td><form:select name="bodyType" path="bodyType">
							<option value="中等">中等</option>
							<option value="纖細">纖細</option>
							<option value="壯碩">壯碩</option>
							<option value="臃腫">臃腫</option>

					</form:select>
				<tr>
					<td>宗教</td>
					<td><form:select name="religion" path="religion">
							<option value="基督教">基督教</option>
							<option value="天主教">天主教</option>
							<option value="佛教">佛教</option>
							<option value="道教">道教</option>
							<option value="伊斯蘭教">伊斯蘭教</option>
							<option value="猶太教">猶太教</option>
							<option value="印度教">印度教</option>
							<option value="其他">其他</option>
					</form:select></td>
				<tr>
					<td>薪水</td>
					<td><form:select name="salary" path="salary">
							<option value="$30,000以下">$30,000以下</option>
							<option value="$30,001~$50,000">$30,001~$50,000</option>
							<option value="$50,001~$100,000">$50,001~$100,000</option>
							<option value="$100,001~$200,000">$100,001~$200,000</option>
							<option value="$200,001以上">$200,001以上</option>
					</form:select>
<!-- 				<tr> -->

<!--                      <td>興趣 -->
<!-- 					<td><input type="checkbox" value="旅遊" name="Interest1" />旅遊</td> -->
<!--                     <td><input type="checkbox" value="電影" name="Interest2" />電影</td> -->
<!--                     <td><input type="checkbox" value="美食" name="Interest3"/>美食 </td> -->
<!--                     <td><input type="checkbox" value="運動" name="Interest4" />運動</td> -->
<!--                     <td><input type="checkbox" value="攝影" name="Interest5" />攝影</td> -->
<!--                     <td><input type="checkbox" value="農藝" name="Interest6"/>農藝</td> -->
<!--                     <td><input type="checkbox" value="寫程式" name="Interest7"/>寫程式</td> -->
                    
			</table>
		
				<input type ="submit"  value="送出" id="add">
				<input type="reset" value="清除"/>
		</form:form>

	</div>
	<a href="${pageContext.request.contextPath}/personal" class="nav-link">輸入個人喜好</a>
	<a href="${pageContext.request.contextPath}/personalInterest" class="nav-link">輸入個人興趣</a>
	<a href="${pageContext.request.contextPath}/addHope" class="nav-link">輸入個人希望條件</a>
	<a href="${pageContext.request.contextPath}/addAlbum" class="nav-link">相簿</a>
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