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

	
					
	<div>&nbsp;</div>
	<button style="margin-left:13.5%;" type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalLong" onclick="getTodayDate()" >
  			新增活動
	</button>
	<div align="center">
		
		<h2>活 動 清 單</h2>
		<form:form method="get" modelAttribute="actBeanCat" action="index/ChangeIndexCat?eventCat=${catList.key}">
	
		<div class="dropdown">
		<form:select path="eventCat" onchange="submit();" class="btn dropbtn"  style="width:170px; align:center;">
		<span class="caret"></span>
				<div class="dropdown-content">
				<form:option value="-1" label="請選擇" />
				
				<form:options items="${catList}" />
				</div>
		
		</form:select>
		</div>
		
		</form:form>
		<p>
<!-- 		<table border="1"> -->
			
<!-- 				<tr bgcolor="#a8fefa" class="alternateRow"> -->
<!-- 					<th>活動編號 -->
<!-- 					<th>主辦人編號 -->
<!-- 					<th>活動名稱 -->
<!-- 					<th>活動類型 -->
<!-- 					<th>活動開始時間  -->
<!-- 					<th>活動參與人數 -->
<!-- 					<th>預算 -->
<!-- 					<th>活動地點 -->
<!-- 					<th>google map地點標記 -->
<!-- 					<th>活動圖片 -->
<!-- 					<th>活動建立時間 -->
<!-- 					<th>評價 -->
		<section class="ftco-section">
    	<div class="container">
    		<div class="row">
				

		<c:forEach var='acts' items="${actBeanList}">
				<div class="col-md-4">
    				<div class="car-wrap ftco-animate">
    					<div class="img d-flex align-items-end" style="background-image: url(${pageContext.request.contextPath}/getImage?id=${acts.eventId}&type=act)">
<%--     								<img width="200" height="200" src="<c:url value='/getImage?id=${acts.eventId}&type=act'/>"/> --%>
    					</div>
    					<div class="text p-4 text-center">
    						<h2 class="mb-0"><a href="car-single.html">${acts.eventName}</a></h2>
    						<span>scheduled start time:${acts.eventTime}</span>
    						
    						<c:set var="done" value="false" />
    						
    						<c:forEach items="${ActJoinBeans}" var="ActJoinBean">
								<c:if test="${acts.eventId eq ActJoinBean.eventBean.eventId}">    						
    								<c:set var="done" value="true" />	
    							</c:if>
    						</c:forEach>
    						
    						
    						<c:choose>
    						<c:when  test="${done}">
    							<p class="d-flex mb-0 d-block"><a href="javascript:void(0)" 
								class="btn btn-black btn-outline-black mr-1 isDisabled" id="joinacts" >已參加</a>
    						</c:when>
  						
    						
    						<c:otherwise>
								<p class="d-flex mb-0 d-block"><a href="${pageContext.request.contextPath}/JoinAct?getActId=${acts.eventId}" 
								class="btn btn-black btn-outline-black mr-1" id="joinact" onload="clickact(this)">參加活動</a> 
    						</c:otherwise>
    						</c:choose>
    						
    						
    						<a href="ByActivity?getId=${acts.eventId}" class="btn btn-black btn-outline-black ml-1">活動細節</a></p>
    					</div>
    				</div>
    			</div>
		

<!-- 					<tr class="" id="my_id"> -->
<%-- 						<td><a href="ByActivity?getId=${acts.eventId}"><button --%>
<%-- 									type="button" class="btn-link">${acts.eventId}</button></a> 					<input type="hidden" name="eventid" value="${acts.eventId}"> --%>
<%-- 						<td>${acts.memberId} --%>
<%-- 						<td>${acts.eventName} --%>
<%-- 						<td>${acts.catbean.eventClass} --%>
<%-- 						<td>${acts.eventTime} --%>
<%-- 						<td>${acts.groupNum} --%>
<%-- 						<td>${acts.budget} --%>
<%-- 						<td align='center' valign="middle">${acts.eventPlace} --%>
<!-- 						<td><iframe width="400" height="250" style="border: 0" -->
<%-- 								src="https://www.google.com/maps/embed/v1/place?key=AIzaSyA3sRUmvTTrsDvCJWhqAVC142ehRvCXiTc&q=${acts.eventPlace}"> --%>
<!-- 							</iframe> -->
<%-- 						<td><img width="200" height="200" src=" --%>
<%-- 														<c:url value='/getImage?id=${acts.eventId}&type=act'/>"/> --%>
<%-- 						<td>${acts.createTime} --%>
						
						
						
						
						
<%-- 						<td><form method="post" action=""> --%>
<!-- 								<input type="submit" value="評價" /><input type="hidden" -->
<!-- 									name="eventid" value=""> -->
<%-- 							</form> --%>
<!-- 						<td><button type="button" -->
<%-- 								onclick="window.location.href='index/deleteActivity?getId=${acts.eventId}'">刪除</button> --%>
						
<!-- 						<td><button type="button"  -->
<%-- 								onclick="window.location.href='actdata?getId=${acts.eventId}'">文章修改</button> --%>

							
							
							
							

				</c:forEach>
			</div>
    	</div>
    </section>
		
<!-- 		</table> -->
<!-- 		<br> <a href='addActis'><input type="button" value="新增活動"></a> -->
		
<div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
 		<h5 class="modal-title" id="exampleModalLongTitle" align="center">新  增  活  動</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
         </button>
      </div>
			   
		      <div class="modal-body" style="background-color: #e7eef1;">
		     <form:form method="post" 
 			modelAttribute="actBean" enctype="multipart/form-data">
				<span style="text-align:left;">主辦人:</span>
					${actBean.memberId.memberName}<p>
		     	活動名稱:<p>
					<form:input type="text" path="eventName"/><p>
		     	活動類型:<p>
					<form:select path="eventCat">
							<form:option value="-1" label="請選擇" />
							<form:options items="${catList}" />
						</form:select><p>
				活動開始時間:<p>

						<div class="input-group date form_datetime col-md-8"							
							data-date-format="yyyy-mm-dd - HH:ii p"
							data-link-field="dtp_input1">
							<form:input class="form-control" type="text" path="eventTime" />
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-remove"></span></span> <span
								class="input-group-addon"><span
								class="glyphicon glyphicon-th"></span></span>
						</div><p> 
			           活動內容:<p>
					<form:textarea type="textarea" path="actContent"  style="width:300px;height:100px;" ></form:textarea><p>
		     	
						
		     	活動參與人數:<p>
					<form:input type="text" path="groupNum" value="" /><p>
		     	
		     	預算:<p>
					<form:input type="text" path="budget"  /><p>
		     	活動地點:<p>
					<form:input type="text" path="eventPlace" /><p>
				活動建立時間:<p>
					<form:input type="text" path="createTime" id="create" /><p>
				活動圖片:<p>&emsp;&emsp;&emsp;&emsp;
					<form:input type="file" path="actImage" value="新增圖片" align="right"/><p>	
		     	
		     	
		     	
		    
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">取 消</button>
        		   <button type="submit" class="btn btn-primary">新 增</button>
		    	</form:form>
		      </div>
		      
		      
<!-- 		       <div class="modal-footer"> -->
        
<!--       </div> -->
    </div>
  </div>
</div>

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