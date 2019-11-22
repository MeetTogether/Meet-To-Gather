<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>MeetTogether - 交友</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
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
<script>
	
	function getage(birth) {
		let dateNow = new Date().getTime();
		let birthTime = new Date(birth).getTime();
		let age = new Date(dateNow - birthTime);
		return age.getFullYear() - 1970;
	}

	function myInnerText() {
		
			document.getElementById("name").innerText = members.mb.memberName;
			document.getElementById("memberAge").innerText = getage(members.mb.memberBirth);
			document.getElementById("memberCity").innerText = members.mb.memberCity
					.trim();
			document.getElementById("interest").innerText = members.mil;
			var i = 1;
			var srcUrl = "${pageContext.request.contextPath}/memberPhoto/"
					+ members.mb.memberId + "/" + i;
			document.getElementById("pairImg").setAttribute("src", srcUrl);
			document
					.getElementById("pairImg")
					.addEventListener(
							"click",
							function() {
								var vip = ${vipstatus};
								i++;
								vip ? i > 5 ? i = 1 : i = i : i > 3 ? i = 1
										: i = i;
								srcUrl = "${pageContext.request.contextPath}/memberPhoto/"
										+ members.mb.memberId + "/" + i;
								document.getElementById("pairImg")
										.setAttribute("src", srcUrl);
							});
		
			
		
	}
	function binding() {
		let like = document.getElementById("like")
		let dontlike = document.getElementById("dontlike")
		like.addEventListener("click", function() {
			url = "${pageContext.request.contextPath}/insertPairList?pairid=" + members.mb.memberId
					+ "&status=1";
			console.log(url);
			let xhttp = new XMLHttpRequest();
			xhttp.open("Get", url, true);
			xhttp.setRequestHeader("Pragma", true);
			xhttp.send();
			xhttp.onreadystatechange = function(){
				if(xhttp.readyState == 4 && xhttp.status ==200){
					serachMyFriends();
					pairAjax();
					myInnerText();
				}
			}
			
		});
		dontlike.addEventListener("click", function() {
			
			url = "${pageContext.request.contextPath}/insertPairList?pairid=" + members.mb.memberId
					+ "&status=0";
			console.log(url);
			let xhttp = new XMLHttpRequest();
			xhttp.open("Get", url, true);
			xhttp.setRequestHeader("Pragma", true);
			xhttp.send();
			xhttp.onreadystatechange = function(){
				if(xhttp.readyState == 4 && xhttp.status == 200){
					serachMyFriends();
					pairAjax();
					myInnerText();
				}
			}
			
		});
	}

	function pairAjax() {
		let xhttp = new XMLHttpRequest();
		xhttp.open("POST", "${pageContext.request.contextPath}/showPairMember",
				true);
		xhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		console.log(getQueryString());
		xhttp.send(getQueryString());
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				if(xhttp.responseText){
					members = JSON.parse(xhttp.responseText);
					console.log(members);
					myInnerText();
				}else{
					$("#vipModalLong").modal("show");
				}
				
			}
		}
	}
	function getQueryString() {
		var sex = document.getElementById("sex").value;
		var city = document.getElementById("city").value;
		var age1 = document.getElementById("age1").value;
		var age2 = document.getElementById("age2").value;
		return "sex=" + sex + "&city=" + city + "&age1=" + age1 + "&age2="
				+ age2;
	}

	function chat(id) {
		window
				.open(
						"${pageContext.request.contextPath}/chat/" + id,
						"_blank",
						"toolbar=yes,scrollbars=yes,resizable=yes,top=500,left=500,width=400,height=400");
	}
	function del(){
		let ful = document.getElementById("friends");
		while (ful.firstChild) {
			ful.removeChild(ful.firstChild);
		}
	}
	
	function delAjax(to,from){
		url = "to=" + to +"&from=" + from;
		let xhttp = new XMLHttpRequest();
		xhttp.open("Get", "${pageContext.request.contextPath}/chat/del?" + url, true);
		xhttp.setRequestHeader("Pragma", true);
		xhttp.send();
		
	}

	function friendAjax() {
		
		let xhttp = new XMLHttpRequest();
		xhttp.open("Get", "${pageContext.request.contextPath}/showFriendList",
				true);
		xhttp.setRequestHeader("Pagram", true);
		xhttp.send();
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				friends = JSON.parse(xhttp.responseText);
				console.log(friends);

				for(let friend of friends){
					
					var newLi = document.createElement("li");
					newLi.setAttribute("id", friend.id);
					newLi.setAttribute("class","list-group-item d-flex justify-content-between align-items-center");
					var newLiContent = document.createTextNode(friend.name);
					newLi.appendChild(newLiContent);
					
					var newSpan = document.createElement("span");
					newSpan.setAttribute("class","badge badge-primary badge-pill");
					if(friend.unRead){
					var newSpanContent = document.createTextNode(friend.unRead);
					newSpan.appendChild(newSpanContent);}
					
					var imgsrc = "/MeetTogether/getImage?type=member&id=" + friend.id;
					var friendimg = document.createElement("img");
					friendimg.setAttribute("src", imgsrc);
					friendimg.setAttribute("class", "fimg");
					
					document.getElementById("friends").appendChild(newLi);
					newLi.appendChild(newSpan);
					newLi.appendChild(friendimg);
					
					
					document.getElementById(friend.id).addEventListener("click",
							function() {
								var id = this.id;
								var currentid = ${sessionScope.userId};
								delAjax(currentid,this.id);
								this.childNodes[1].innerText="";
								chat(id);
							});
				}
			}
		}
	}

	function serachMyFriends() {
		var fName = document.getElementById("serachFriend").value;
		let xhttp = new XMLHttpRequest();
		xhttp.open("Get",
				"${pageContext.request.contextPath}/showFriendListByName?fName="
						+ fName, true);
		xhttp.setRequestHeader("Pagram", true);
		xhttp.send();
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				del();
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
					
					document.getElementById("friends").appendChild(newLi);
					newLi.appendChild(newSpan);
					newLi.appendChild(friendimg);
					
					
					document.getElementById(serachfriend.id).addEventListener("click",
							function() {
								var id = this.id;
								var currentid = ${sessionScope.userId};
								delAjax(currentid,this.id);
								this.childNodes[1].innerText="";
								chat(id);
							});

				}
			}
		}
	}

	document.addEventListener("DOMContentLoaded", function() {
		pairAjax();
		binding();
		friendAjax();
		document.getElementById("sex").addEventListener("change", function() {
			pairAjax();
		});
		document.getElementById("city").addEventListener("change", function() {
			pairAjax();
		});
		document.getElementById("serachFriend").addEventListener("change",
				function() {
					serachMyFriends();
				});

	});
</script>
<style>
.fimg {
	float: right;
	max-width: 40px;
	max-height: 100%;
	width: 100%;
	margin-right: 20px;
	border-radius: 50%;
}

.pairImg {
	height: 300px;
	width: 500px;
}
td{
	width:125px;
/* 	border-bottom: 1px solid #ddd; */
}
.reply {
	padding: 5px 10px;
	background: #ff07295e;
	color: #000000;
	text-transform: uppercase;
	font-size: 14px;
	letter-spacing: .1em;
	font-weight: 400;
	border-radius: 4px;
	width: 45%;
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
	width: 45%;
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
					<li class="nav-item"><a
						href="${pageContext.request.contextPath}/" class="nav-link">首頁</a></li>
					<li class="nav-item active"><a
						href="${pageContext.request.contextPath}/pairs/" class="nav-link">交友</a></li>
					<li class="nav-item"><a 
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
	<!--VIP -->
	<jsp:include page="/WEB-INF/views/vip_div.jsp"/>
	
	<section class="ftco-section testimony-section">
		<div class="container">
			<div class="row ftco-animate">
				
				<div style="width: 60%">
					<div id="Postbox" class="col-md-8 order-md-last ftco-animate">
<!-- 						<h2 class="text-center">配對</h2> -->
						<div class="form-row">
							<div class="col">
								<label for="sex">性別</label> 
								<select
									class="form-control" id="sex">
									<option value="3">全部</option>
									<option value="1">男</option>
									<option value="2">女</option>
								</select>
							</div>
							<div class="col">
								<label for="city">城市</label> 
								<select
									class="form-control" id="city">
									<option value="everyCity">全部</option>
									<option value="基隆市">基隆市</option>
									<option value="台北市">台北市</option>
									<option value="台北縣">台北縣</option>
									<option value="桃園縣">桃園市</option>
									<option value="新竹市">新竹市</option>
									<option value="新竹縣">新竹縣</option>
									<option value="苗栗縣">苗栗縣</option>
									<option value="台中市">台中市</option>
									<option value="彰化縣">彰化縣</option>
									<option value="南投縣">南投縣</option>
									<option value="雲林縣">雲林縣</option>
									<option value="嘉義市">嘉義市</option>
									<option value="嘉義縣">嘉義縣</option>
									<option value="台南市">台南市</option>
									<option value="高雄市">高雄市</option>
									<option value="屏東縣">屏東縣</option>
									<option value="台東縣">台東縣</option>
									<option value="花蓮縣">花蓮縣</option>
									<option value="宜蘭縣">宜蘭縣</option>
									<option value="澎湖縣">澎湖縣</option>
									<option value="金門縣">金門縣</option>
									<option value="連江縣">連江縣</option>
								</select>
							</div>
							<div class="col">
								<p>
									<label for="age">年齡</label>
									<input type="text" class="form-control" id="age" readonly style="border: 0; color: #f6931f; font-weight: bold;">
										<input type="hidden" id="age1" value="18">
										<input type="hidden" id="age2" value="99">
								</p>
								<div id="slider-range"></div>
							</div>
						</div>
						<br>
						<div style="text-align: center;">
							<img id="pairImg" class="pairImg" />
							<div style="width: 500px; margin: auto;">
							<table align="center">
								<tr>
									<td>姓名</td>
									<td id="name"></td>
									<td>年齡</td>
									<td id="memberAge"></td>
								</tr>
								<tr>
									<td>城市</td>
									<td id="memberCity"></td>
									<td>興趣</td>
									<td id="interest"></td>
								</tr>
								<tr>
									<td colspan="2"><input type="button" value="SKIP" id="dontlike" class="reply_n" /></td>
									
									<td colspan="2"><input type="button" value="LIKE" id="like" class="reply" /></td>
									
								</tr>
							</table>
							</div>
						</div>
					</div>
				</div>
				<!-- .col-md-8 -->
				<!-- 右側選單 -->
				<div class="col-md-4 sidebar ftco-animate list-group">
				<label>好友列表</label>
<!-- 						<span class="">好友列表</span><br> -->
						<input type="text" class="form-control" placeholder="搜尋好友，開始聊天" autocomplete="off" id="serachFriend">
						<div class="sidebar-box ftco-animate" style="padding:0; overflow:scroll; height: 300px;" >
							<ul class="list-group" id="friends">
							</ul>						
						</div>
				</div>
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