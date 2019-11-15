<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Enter your Hope</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/eeit10927/js/login.js"></script>



    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">

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
<style type="text/css">
td {
 color:black;
}

table{
border: 2px solid black; 
border-collapse: collapse;
background-color:#FF7744;
width: 300px; 	
   	/*自動斷行*/
   	word-wrap: break-word;
   	table-layout: fixed;
}
body{
background-color:#FF8800;
}
</style>
</head>
<body >
<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
<%-- 		<jsp:include page="eeit10927/fragment/top.jsp" /> --%>
		<div class="container">
			<a class="navbar-brand"
				href="http://localhost:8080/MeetTogether/register">註冊<span></span></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					
				       <li class="nav-item"><a href="index.jsp" class="nav-link">首頁</a></li>
	          <li class="nav-item"><a href="about.html" class="nav-link">我的資料</a></li>
	          <li class="nav-item active"><a href="album.jsp" class="nav-link">相簿</a></li>
	          <li class="nav-item"><a href="pricing.html" class="nav-link">交友</a></li>
	          <li class="nav-item"><a href="blog.html" class="nav-link">文章</a></li>
	          <li class="nav-item"><a href="contact.html" class="nav-link">與我們聯繫</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
		<div class="hero-wrap"
		style="background-image: url('images/friend.jpg');"
		data-stellar-background-ratio="0.5">
	
		 <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html"> <i class="ion-ios-arrow-forward"></i></a></span> <span>About us <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-3 bread">請輸入個人資訊</h1>
          </div>
        </div>
      </div>
    </section>
    
    
	<h2>請輸入希望對象的條件</h2>
	<font size="1" color="#FF0000"></font>
	<form:form enctype="multipart/form-data" method="POST"
		modelAttribute="personalinfobean" action="eeit10901/addPersonalInfo">

		<div align="center">

			<table>
				<tr>
				<tr>
					<td>婚姻</td>
					<td><input type="radio" name="marriage" value="已婚" />已婚 <input
						type="radio" name="no" value="未婚" />未婚</td>
				</tr>

				<tr>
					<td>教育</td>
					<td><select name="education">
							<option value="國中">國中</option>
							<option value="高中">高中</option>
							<option value="大學">大學</option>
							<option value="碩士">碩士</option>
							<option value="博士">博士</option>
					</select>
				<tr>
					<td>抽菸習慣</td>
					<td><select name="smoking">
							<option value="從來不抽">從來不抽</option>
							<option value="偶爾抽菸">偶爾抽菸</option>
							<option value="老菸槍">老菸槍</option>
					</select>
				<tr>
					<td>抽菸習慣</td>
					<td><select name="drink">
							<option value="從來不喝">從來不喝</option>
							<option value="偶爾小酌">偶爾小酌</option>
							<option value="老酒鬼">老酒鬼</option>
					</select>
				<tr>
					<td>種族</td>
					<td><select name="ethnicity">
							<option value="白色人種">白色人種</option>
							<option value="黑色人種">黑色人種</option>
							<option value="黃色人種">黃色人種</option>
							<option value="棕色人種">棕色人種</option>
					</select></td>
				<tr>
					<td>身材</td>
					<td><select name="bodyType">
							<option value="中等">中等</option>
							<option value="纖細">纖細</option>
							<option value="壯碩">壯碩</option>
							<option value="臃腫">臃腫</option>

					</select>
				<tr>
					<td>宗教</td>
					<td><select name="religion">
							<option value="基督教">基督教</option>
							<option value="天主教">天主教</option>
							<option value="佛教">佛教</option>
							<option value="道教">道教</option>
							<option value="伊斯蘭教">伊斯蘭教</option>
							<option value="猶太教">猶太教</option>
							<option value="印度教">印度教</option>
							<option value="其他">其他</option>
					</select></td>
				<tr>
					<td>薪水</td>
					<td><select name="salary">
							<option value="$30,000以下">$30,000以下</option>
							<option value="$30,001~$50,000">$30,001~$50,000</option>
							<option value="$50,001~$100,000">$50,001~$100,000</option>
							<option value="$100,001~$200,000">$100,001~$200,000</option>
							<option value="$200,001以上">$200,001以上</option>
					</select>
				<tr>
					<td>興趣1</td>
					<td><select name="interest1">
							<option value="運動">運動</option>
							<option value="音樂">音樂</option>
							<option value="閱讀">閱讀</option>
							<option value="電影">電影</option>
							<option value="旅行">旅行</option>
							<option value="攝影">攝影</option>
							<option value="種植">種植</option>
							<option value="寫程式">寫程式</option>
					</select>
				<tr>
					<td>興趣2</td>
					<td><select name="interest2">
							<option value="運動">運動</option>
							<option value="音樂">音樂</option>
							<option value="閱讀">閱讀</option>
							<option value="電影">電影</option>
							<option value="旅行">旅行</option>
							<option value="攝影">攝影</option>
							<option value="種植">種植</option>
							<option value="寫程式">寫程式</option>
					</select>
				<tr>
					<td>興趣3</td>
					<td><select name="interest3">
							<option value="運動">運動</option>
							<option value="音樂">音樂</option>
							<option value="閱讀">閱讀</option>
							<option value="電影">電影</option>
							<option value="旅行">旅行</option>
							<option value="攝影">攝影</option>
							<option value="種植">種植</option>
							<option value="寫程式">寫程式</option>
					</select>
			</table>
			<input type="submit" value="送出" /> <input type="reset" value="清除">
			
		</div>
		
	</form:form>
	</div>
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

</body>
</html>