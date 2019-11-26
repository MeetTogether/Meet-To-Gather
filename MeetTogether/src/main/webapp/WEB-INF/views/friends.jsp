<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>好友列表</title>
<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
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
<script type="text/javascript">

function del(){
	let ful = document.getElementById("friends");
	while (ful.firstChild) {
		ful.removeChild(ful.firstChild);
	}
}


function YoN(yn,fid){
	let xhttp = new XMLHttpRequest();
	xhttp.open("Get",
			"${pageContext.request.contextPath}/yon?yon="+yn+"&fid="+fid, true);
	xhttp.setRequestHeader("Pagram", true);
	xhttp.send();
	xhttp.onreadystatechange = function () {
		if(xhttp.readyState == 4 && xhttp.status == 200){
			serachMyFriends();
		}
		
	}
}

function responseAjax(){
	let xhttp = new XMLHttpRequest();
	xhttp.open("Get",
			"${pageContext.request.contextPath}/respAjax", true);
	xhttp.setRequestHeader("Pagram", true);
	xhttp.send();
	xhttp.onreadystatechange = function(){
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			responseFriends = JSON.parse(xhttp.responseText);
			console.log("好友邀請："+responseFriends);
			for(var k in responseFriends) {
				   console.log(k, responseFriends[k]);
				   var newLi = document.createElement("li");
				   	var rsi ="rs"+k;
					newLi.setAttribute("id", rsi);
					newLi.setAttribute("class","list-group-item d-flex justify-content-between align-items-center");
					var newLiContent = document.createTextNode(responseFriends[k]);
					newLi.appendChild(newLiContent);
					
					var imgsrc = "/MeetTogether/getImage?type=member&id=" + k;
					var friendimg = document.createElement("img");
					friendimg.setAttribute("src", imgsrc);
					friendimg.setAttribute("class", "fimg");
					
					var sureBt = document.createElement("input");
					var sid ="rsb"+k;
					sureBt.setAttribute("id",sid);
					sureBt.setAttribute("type","button");
					sureBt.setAttribute("class","reply_n");
					sureBt.setAttribute("value","接受");
					
					var refuseBt = document.createElement("input");
					var rid ="rrb"+k;
					refuseBt.setAttribute("id",rid);
					refuseBt.setAttribute("type","button");
					refuseBt.setAttribute("class","reply");
					refuseBt.setAttribute("value","拒絕");
					
					document.getElementById("responsefriends").appendChild(newLi);
					newLi.appendChild(friendimg);
					newLi.appendChild(sureBt);
					newLi.appendChild(refuseBt);
					
					document.getElementById(sid).addEventListener("click",function(){
						var fid = (this.id).substring(3);
						YoN(1,fid);
						document.getElementById(rsi).remove();
						serachMyFriends();
						});
					
					
					document.getElementById(rid).addEventListener("click",function(){
						var fid = (this.id).substring(3);
						YoN(0,fid);
						document.getElementById(rsi).remove();
						serachMyFriends();
					});
					
					newLi.addEventListener("click",
							function(e) {
					
						
						if (e.target == this){
							var id=(this.id).substring(2);
							console.log(id);
							window.location.href="${pageContext.request.contextPath}/getmember/"+id;
						}
						});

				}
		}
		
		
	}
	
}

function serachMyFriends() {
	del();

	var fName = document.getElementById("serachFriend").value;
	let xhttp = new XMLHttpRequest();
	xhttp.open("Get",
			"${pageContext.request.contextPath}/showFriendListByName?fName="
					+ fName, true);
	xhttp.setRequestHeader("Pagram", true);
	xhttp.send();
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			serachFriends = JSON.parse(xhttp.responseText);
			console.log("好友：" + serachFriends);
			for(let serachfriend of serachFriends){
				
				var newLi = document.createElement("li");
				newLi.setAttribute("id", serachfriend.id);
				newLi.setAttribute("class","list-group-item d-flex justify-content-between align-items-center");
				var newLiContent = document.createTextNode(serachfriend.name);
				
				
				var newSpan = document.createElement("span");
				newSpan.setAttribute("class","icon-wechat");
				
				
				var imgsrc = "/MeetTogether/getImage?type=member&id=" + serachfriend.id;
				var friendimg = document.createElement("img");
				friendimg.setAttribute("src", imgsrc);
				friendimg.setAttribute("class", "fimg");
				
				var delBt = document.createElement("input");
				var did ="del"+serachfriend.id;
				delBt.setAttribute("id",did);
				delBt.setAttribute("type","button");
				delBt.setAttribute("class","reply");
				delBt.setAttribute("value","刪除好友");
				
				document.getElementById("friends").appendChild(newLi);
				
				newLi.appendChild(friendimg);
				newLi.appendChild(newLiContent);
				newLi.appendChild(newSpan);
				newLi.appendChild(delBt);
				
				document.getElementById(did).addEventListener("click",function(){
					var fid = (this.id).substring(3);
					let xhttp = new XMLHttpRequest();
					xhttp.open("Get",
							"${pageContext.request.contextPath}/delaj?fid="+fid, true);
					xhttp.setRequestHeader("Pagram", true);
					xhttp.send();
					xhttp.onreadystatechange = function() {
						if (xhttp.readyState == 4 && xhttp.status == 200) {
							serachMyFriends();
						}
					}
					
					
				});
				newLi.addEventListener("click",
						function(e) {
						if (e.target == this){
							var id = this.id;
							window.location.href="${pageContext.request.contextPath}/getmember/"+id;
						}
						});
				newSpan.addEventListener("click",function(){
					
					window
					.open(
							"${pageContext.request.contextPath}/chat/" + serachfriend.id,
							"_blank",
							"toolbar=yes,scrollbars=yes,resizable=yes,top=500,left=500,width=400,height=400");
				});

			}
		}
	}
}
document.addEventListener("DOMContentLoaded", function() {
	serachMyFriends();
	responseAjax();
	
	
	document.getElementById("serachFriend").addEventListener("keyup",
			function() {
				serachMyFriends();
			});
	
});

</script>
<style type="text/css">
.fimg {
	float: right;
	max-width: 40px;
	max-height: 100%;
	width: 100%;
	margin-right: 20px;
	border-radius: 50%;
}
/* 	border-bottom: 1px solid #ddd; */

.reply {
	padding: 5px 10px;
	background: #ff07295e;
	color: #000000;
	text-transform: uppercase;
	font-size: 14px;
	letter-spacing: .1em;
	font-weight: 400;
	border-radius: 4px;
	width: 15%;
}
.reply_n {
	padding: 5px 10px;
	background: #ACD6FF;
	color: #000000;
	text-transform: uppercase;
	font-size: 14px;
	letter-spacing: .1em;
	font-weight: 400;
	border-radius: 4px;
	width: 15%;
}
.reply_a:hover {
	color: #fff;
	/*background: #18e2ebb5;*/
	background: #fd7e14;
}
.reply:hover {
	color: #fff;
	background: #FF5151;
}
.reply_n:hover {
	color: #fff;
	background: #2894FF;
}
</style>
</head>
<body>
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
					<li class="nav-item active"><a href="${pageContext.request.contextPath}/friends" class="nav-link">好友紀錄</a></li>					
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

	<section class="hero-wrap hero-wrap-2 js-fullheight"
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
								class="ion-ios-arrow-forward"></i></a></span> <span>好友紀錄 <i
							class="ion-ios-arrow-forward"></i></span>
					</p>
					<h1 class="mb-3 bread">好友紀錄</h1>
				</div>
			</div>
		</div>
	</section>
	
	<section>
		<div class="container">
			<label>好友要求</label>
			<div class=""
				style="padding: 20px; overflow: scroll; height: 100px;">
				<ul class="list-group" id="responsefriends">
				</ul>
			</div>

			<label>好友列表</label>
			<!-- 						<span class="">好友列表</span><br> -->
			<input type="text" class="" placeholder="搜尋好友，開始聊天"
				autocomplete="off" id="serachFriend">
			<div class=""
				style="padding: 20px; overflow: scroll; height: 300px;">
				<ul class="list-group" id="friends">
				</ul>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/footer.jsp"/>



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="${pageContext.request.contextPath}/js/google-map.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="${pageContext.request.contextPath}/js/slider.js"></script>

</body>
</html>