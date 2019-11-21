<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>活 動 列 表</title>
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
<%-- 	<link rel="stylesheet" href='${pageContext.request.contextPath}/eeit10908/assets/css/bootstrap.min.css'> --%>
	<link rel="stylesheet" href='${pageContext.request.contextPath}/eeit10908/assets/css/bootstrap-datetimepicker.min.css'>
<%-- 	<link rel="stylesheet" href='${pageContext.request.contextPath}/eeit10908/assets/css/bootstrap.min.css'> --%>
	
	
<meta name="viewport"
	content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title> 活 動 總 表 </title>

<meta charset="UTF-8">
<script>
 	function getTodayDate() {
 		var fullDate = new Date();
 		var yyyy = fullDate.getFullYear();
 		var MM = (fullDate.getMonth() + 1) >= 10 ? (fullDate.getMonth() + 1)
 				: ("0" + (fullDate.getMonth() + 1));
 		var dd = fullDate.getDate() < 10 ? ("0" + fullDate.getDate())
 				: fullDate.getDate();
 		var hh = fullDate.getHours() < 10 ? ("0" + fullDate.getHours())
 				: fullDate.getHours();
 		var mm = fullDate.getMinutes() < 10 ? ("0" + fullDate.getMinutes())
 				: fullDate.getMinutes();
 		var today = yyyy + "/" + MM + "/" + dd + "," + hh + ":" + mm;
 		var elem = document.getElementById("create");
 		

 		elem.value = today;
 		return today;

 	}
 	
 	var VisibleMenu = ''; // 記錄目前顯示的子選單的 ID

 // 顯示或隱藏子選單
 function switchMenu( theMainMenu, theSubMenu, theEvent ){
     var SubMenu = document.getElementById( theSubMenu );
     if( SubMenu.style.display == 'none' ){ // 顯示子選單
         SubMenu.style.minWidth = theMainMenu.clientWidth; // 讓子選單的最小寬度與主選單相同 (僅為了美觀)
         SubMenu.style.display = 'block';
         hideMenu(); // 隱藏子選單
         VisibleMenu = theSubMenu;
     }
     else{ // 隱藏子選單
         if( theEvent != 'MouseOver' || VisibleMenu != theSubMenu ){
             SubMenu.style.display = 'none';
             VisibleMenu = '';
         }
     }
 }

 // 隱藏子選單
 function hideMenu(){
     if( VisibleMenu != '' ){
         document.getElementById( VisibleMenu ).style.display = 'none';
     }
     VisibleMenu = '';
 }
 $(document).ready(function() {
	 $('.mdb-select').materialSelect();
	 });
 
 function clickact(myObj){
 	 alert("活動報名成功");
	 myObj.innerHTML="已參加";
	 console.log(myObj);
 }
 

 
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
<style type="text/css">
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
.dropdown:hover .dropdown-content {
  display: block;
}
.dropdown:hover .dropbtn {background-color: #AAAAAA;}
.dropbtn {
  background-color: #DDDDDD;

}
.isDisabled {
  color: currentColor;
  cursor: not-allowed;
  opacity: 0.5;
  text-decoration: none;
  pointer-events：none;
}
</style>



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
					<li class="nav-item"><a href="/MeetTogether/pairs/" class="nav-link">交友</a></li>
					<li class="nav-item active"><a href="/MeetTogether/eeit10908" class="nav-link">活動</a></li>
					<li class="nav-item"><a
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
								class="ion-ios-arrow-forward"></i></a></span> <span>活動表 <i
							class="ion-ios-arrow-forward"></i></span>
					</p>
					<h1 class="mb-3 bread">活動清單</h1>
				</div>
			</div>
		</div>
	</section>

	
					
	<form:form method="post" 
 			modelAttribute="actBean" enctype="multipart/form-data">
					<form:input type="hidden" path="eventId" />
				<span style="float:left; " >主 辦 人:</span>
					<span style="float:left; margin-left:3%;">${actBean.memberId.memberName}</span><br><br>
<%-- 					<form:input type="hidden" path="memberId" /> --%>
		     	<span style="float:left;">活 動 名 稱:</span><br>
					<span style="float:left; margin-left:6%;" ><form:input type="text" path="eventName"/></span><br><br>
		     	<span style="float:left;">活動類型:</span><br>
				<span style="float:left; margin-left:6%;"><form:select path="eventCat">
							<form:option value="-1" label="請選擇" />
							<form:options items="${catList}" />
						</form:select></span><br><br>
				<span style="float:left;">活動開始時間:</span><br>

						<div class="input-group date form_datetime col-md-8"							
							data-date-format="yyyy-mm-dd - HH:ii p"
							data-link-field="dtp_input1">
							<form:input class="form-control" type="text" path="eventTime" />
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
				<span style="float:left;">活動圖片:</span><br>&emsp;&emsp;&emsp;&emsp;
					<span style="float:left; margin-left:6%;"><form:input type="file" path="actImage" value="新增圖片" align="right"/></span><br><br>
		     	
		     	
		     	
		    
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">刪  除</button>
        		   <button type="submit" class="btn btn-primary">修 改</button>
		    	</form:form>
  
  
 
  
<!--   ---------------------------------------- -->
  
  
  
  

	
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
<%--   <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div> --%>
	<script src="${pageContext.request.contextPath}/eeit10908/assets/jquery/jquery-1.8.3.min.js"></script>
<!-- 	123456789 -->
	<script
		src="${pageContext.request.contextPath}/eeit10908/assets/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/eeit10908/assets/css/bootstrap-datetimepicker.js"
		charset="UTF-8"></script>
	<script
		src="${pageContext.request.contextPath}/eeit10908/assets/locales/bootstrap-datetimepicker.fr.js"
		charset="UTF-8"></script>
	<script type="text/javascript">

		$('.form_datetime').datetimepicker({
	
			//language:  'fr',
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			//startView : 2,
			forceParse : 0,
 			showMeridian : 1,
		    
 			
 			
 			
 			minDate: "dateToday",
		});
	
 	</script> 

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