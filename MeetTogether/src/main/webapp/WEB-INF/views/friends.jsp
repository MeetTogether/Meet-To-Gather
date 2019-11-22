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
			console.log(responseFriends);
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
					sureBt.setAttribute("value","確定");
					
					var refuseBt = document.createElement("input");
					var rid ="rrb"+k;
					refuseBt.setAttribute("id",rid);
					refuseBt.setAttribute("type","button");
					refuseBt.setAttribute("value","拒絕");
					
					document.getElementById("responsefriends").appendChild(newLi);
					newLi.appendChild(friendimg);
					newLi.appendChild(sureBt);
					newLi.appendChild(refuseBt);
					
					document.getElementById(sid).addEventListener("click",function(){
						var fid = (this.id).substring(3);
						YoN(1,fid);
						document.getElementById(rsi).remove();
					});
					
					
					document.getElementById(rid).addEventListener("click",function(){
						var fid = (this.id).substring(3);
						YoN(0,fid);
						document.getElementById(rsi).remove();
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
			console.log(serachFriends);
			for(let serachfriend of serachFriends){
				
				var newLi = document.createElement("li");
				newLi.setAttribute("id", serachfriend.id);
				newLi.setAttribute("class","list-group-item d-flex justify-content-between align-items-center");
				var newLiContent = document.createTextNode(serachfriend.name);
				newLi.appendChild(newLiContent);
				
				var newSpan = document.createElement("span");
				newSpan.setAttribute("class","badge badge-primary badge-pill");
				if(serachfriend.unRead){
				var newSpanContent = document.createTextNode(serachfriend.unRead);
				newSpan.appendChild(newSpanContent);}
				
				var imgsrc = "/MeetTogether/getImage?type=member&id=" + serachfriend.id;
				var friendimg = document.createElement("img");
				friendimg.setAttribute("src", imgsrc);
				friendimg.setAttribute("class", "fimg");
				
				var delBt = document.createElement("input");
				var did ="del"+serachfriend.id;
				delBt.setAttribute("id",did);
				delBt.setAttribute("type","button");
				delBt.setAttribute("value","刪除好友");
				
				document.getElementById("friends").appendChild(newLi);
				newLi.appendChild(newSpan);
				newLi.appendChild(friendimg);
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
					console.log(e.target);
					console.log(this);
						if (e.target == this){
							var id = this.id;
							window.location.href="${pageContext.request.contextPath}/getmember/"+id;
						}
							
						});

			}
		}
	}
}
document.addEventListener("DOMContentLoaded", function() {
	serachMyFriends();
	responseAjax();
	document.getElementById("serachFriend").addEventListener("change",
			function() {
				serachMyFriends();
			});
	
});

</script>
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
					<li class="nav-item"><a
						href="${pageContext.request.contextPath}/" class="nav-link">首頁</a></li>
					<li class="nav-item"><a
						href="${pageContext.request.contextPath}/pairs/" class="nav-link">交友</a></li>
					<li class="nav-item active"><a 
						href="${pageContext.request.contextPath}/friends" class="nav-link">好友</a></li>					
					<li class="nav-item"><a
						href="${pageContext.request.contextPath}/eeit10908/"
						class="nav-link">活動</a></li>
					<li class="nav-item"><a
						href="${pageContext.request.contextPath}/GetAllPostServlet"
						class="nav-link">討論區</a></li>
					<li class="nav-item"><a
						href="${pageContext.request.contextPath}/getmember"
						class="nav-link">會員資料</a></li>
					<li class="nav-item"><a class="nav-link"><c:if
								test="${!empty userId}">${userName}
						</c:if></a></li>
					<li class="nav-item"><c:if test="${!empty userId}">
							<img style="height: 40px; border-radius: 50%;"
								src='${pageContext.request.contextPath}/getImage?type=member&id=${userId}'>
						</c:if></li>
					<li class="nav-item"><c:if test="${!empty userId}">
							<a href="<c:url value='/LogoutServlet'  />" class="nav-link">登出</a>
						</c:if></li>
					<li class="nav-item"><c:if test="${empty userId}">
							<a href="<c:url value='/LoginServlet' />" class="nav-link"
								data-toggle="modal" data-target="#loginModalLong">登入</a>
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
								class="ion-ios-arrow-forward"></i></a></span> <span>交友 <i
							class="ion-ios-arrow-forward"></i></span>
					</p>
					<h1 class="mb-3 bread">交友</h1>
				</div>
			</div>
		</div>
	</section>

	<div class="container">
		<label>好友要求</label>
		<div class="" style="padding: 20px; overflow: scroll; height: 300px;">
			<ul class="" id="responsefriends">
			</ul>
		</div>




		<label>好友列表</label>
		<!-- 						<span class="">好友列表</span><br> -->
		<input type="text" class="" placeholder="搜尋好友，開始聊天" autocomplete="off"
			id="serachFriend">
		<div class="" style="padding: 20px; overflow: scroll; height: 300px;">
			<ul class="" id="friends">
			</ul>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/footer.jsp" />


</body>
</html>