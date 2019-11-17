<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>配對</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">

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
<script>
	function getage(birth) {
		let dateNow = new Date().getTime();
		let birthTime = new Date(birth).getTime();
		let age = new Date(dateNow - birthTime);
		return age.getFullYear() - 1970;
	}

	function myInnerText() {
		if (members[num]) {
			document.getElementById("name").innerText = members[num].mb.memberName;
			document.getElementById("age").innerText = getage(members[num].mb.memberBirth);
			document.getElementById("memberCity").innerText = members[num].mb.memberCity
					.trim();
			document.getElementById("interest").innerText = members[num].mil;
			var i = 1;
			var srcUrl = "${pageContext.request.contextPath}/memberPhoto/" + members[num].mb.memberId + "/" + i;
			document.getElementById("pairImg").setAttribute("src", srcUrl);
			document.getElementById("pairImg").addEventListener(
					"click",
					function() {
						var vip = ${vipstatus};
						i++;
						vip ? i > 5 ? i = 1 : i = i : i > 3 ? i = 1 : i = i;
						srcUrl = "${pageContext.request.contextPath}/memberPhoto/" + members[num].mb.memberId
								+ "/" + i;
						document.getElementById("pairImg").setAttribute("src",
								srcUrl);
					});
		} else {
			window.location.href = "./noMore";
		}
	}
	function binding() {
		let inputs = document.getElementsByTagName("input");
		for (let a = 0; a < inputs.length; a++) {
			inputs[a].addEventListener("click", function() {
				a == 0 ? url = "insertPairList?pairid="
						+ members[num].mb.memberId + "&status=0"
						: url = "insertPairList?pairid="
								+ members[num].mb.memberId + "&status=1";
				console.log(url);
				let xhttp = new XMLHttpRequest();
				xhttp.open("Get", url, true);
				xhttp.setRequestHeader("Pragma", true);
				xhttp.send();
				num++;
				myInnerText();
			});
		}
	}

	function pairAjax() {
		let xhttp = new XMLHttpRequest();
		xhttp.open("Get", "${pageContext.request.contextPath}/showPairMember", true);
		xhttp.setRequestHeader("Pagram", true);
		xhttp.send();
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				members = JSON.parse(xhttp.responseText);
				num = 0;
				myInnerText();
				binding();
			}
		}
	}

	function chat(id) {
		window
				.open(
						"${pageContext.request.contextPath}/chat/" + id,
						"_blank",
						"toolbar=yes,scrollbars=yes,resizable=yes,top=500,left=500,width=400,height=400");
	}

	function friendAjax() {
		let xhttp = new XMLHttpRequest();
		xhttp.open("Get", "${pageContext.request.contextPath}/showFriendList", true);
		xhttp.setRequestHeader("Pagram", true);
		xhttp.send();
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				friends = JSON.parse(xhttp.responseText);
				console.log(friends);
				Object
						.keys(friends)
						.forEach(
								function(k) {
									console.log(k + ' - ' + friends[k]);
									var newLi = document.createElement("li");
									newLi.setAttribute("id", k);
									var newContent = document
											.createTextNode(friends[k]);
									newLi.appendChild(newContent);
									var imgsrc = "/MeetTogether/getImage?type=member&id="
											+ k;
									var friendimg = document
											.createElement("img");
									friendimg.setAttribute("src", imgsrc);
									friendimg.setAttribute("class", "fimg");
									document.getElementById("friends")
											.appendChild(newLi);
									newLi.appendChild(friendimg);
									document.getElementById(k)
											.addEventListener("click",
													function() {
														var id = this.id;
														chat(id);
													});
								});

			}
		}
	}

	function showfiend() {
		document.getElementById("sidebar").classList.toggle('active');
	}
	document.addEventListener("DOMContentLoaded", function() {
		pairAjax();
		friendAjax();
		document.getElementById("friendList").addEventListener("click",
				function() {
					showfiend();
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
	height: 100%;
	width: 100%;
}

.pairs {
	width: 30%;
	margin: auto;
}

.pairs inside {
	width: 100%;
}

.bd {
	border: 2px solid black;
}

.tab {
	width: 100%;
}

#sidebar {
	position: absolute;
	width: 200px;
	height: 100%;
	background: #151719;
	left: -200px;
	transition: all 500ms linear;
	z-index: 5555;
}

#sidebar.active {
	left: 0px;
}

#sidebar ul li {
	color: rgba(230, 230, 230, 0.9);
	list-style: none;
	padding: 15px 10px;
	border-bottom: 1px solid rgba(100, 100, 100, 0.3);
}

#sidebar .toggle-btn {
	position: absolute;
	left: 230px;
	top: 20px;
}

#sidebar .toggle-btn span {
	display: block;
	width: 30px;
	height: 5px;
	background: #151719;
	margin: 5px 0px;
}
</style>
</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<span class="navbar-brand">配對</span>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span>
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a href="${pageContext.request.contextPath}/LoginServlet"
						class="nav-link">首頁</a></li>
					<li class="nav-item"><a href="about.html" class="nav-link">我的資料</a></li>
					<li class="nav-item"><a href="pricing.html" class="nav-link">活動</a></li>
					<li class="nav-item"><span class="nav-link" id="friendList">好友列表</span></li>
					<li class="nav-item"><a href="blog.html" class="nav-link">文章</a></li>
					<li class="nav-item"><a href="contact.html" class="nav-link">與我們聯繫</a></li>

				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->
	<section 
		style="background-image: url('${pageContext.request.contextPath}/eeit10927/images/galaxy.jpg');
				border: 1px solid black;"
		data-stellar-background-ratio="0.5">
		<h2>${currentUser.memberBasic.memberId }</h2>
		<h2>${currentUser.memberBasic.memberName }</h2>
		<h2>Vip:${vipstatus}</h2>
	</section>
	<section class="contact-section" style="border: 1px solid black;">
		<div id="sidebar">
			<ul id="friends">
				<li>好友列表</li>
			</ul>
		</div>
		<div class="container">
			<h2 class="text-center">配對</h2>
			<div class="pairs">
				<div id="container" class="bd" style="width: 100%;">
					<div id="imgContainer" class="bd">
						<img id="pairImg" class="pairImg" />
					</div>
					<table class="tab">
						<tr>
							<td>姓名:</td>
							<td id="name"></td>
							<td>年齡:</td>
							<td id="age"></td>
						</tr>
						<tr>
							<td>城市</td>
							<td id="memberCity"></td>
							<td>興趣:</td>
							<td id="interest"></td>
						</tr>
						<tr>
							<td><input type="button" value="不喜歡" id="dontlike"></td>
							<td></td>
							<td><input type="button" value="喜歡" id="like"></td>
							<td></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</section>
	<footer class="ftco-footer ftco-bg-dark" style="margin-top:50px;">
		<div class="container">
			<div class="row mb-5">
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">About Autoroad</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia and Consonantia, there live the blind texts.</p>
						<ul
							class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
							<li class="ftco-animate"><a href="#"><span
									class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4 ml-md-5">
						<h2 class="ftco-heading-2">Information</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">About</a></li>
							<li><a href="#" class="py-2 d-block">Services</a></li>
							<li><a href="#" class="py-2 d-block">Term and Conditions</a></li>
							<li><a href="#" class="py-2 d-block">Best Price
									Guarantee</a></li>
							<li><a href="#" class="py-2 d-block">Privacy &amp;
									Cookies Policy</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Customer Support</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">FAQ</a></li>
							<li><a href="#" class="py-2 d-block">Payment Option</a></li>
							<li><a href="#" class="py-2 d-block">Booking Tips</a></li>
							<li><a href="#" class="py-2 d-block">How it works</a></li>
							<li><a href="#" class="py-2 d-block">Contact Us</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Have a Questions?</h2>
						<div class="block-23 mb-3">
							<ul>
								<li><span class="icon icon-map-marker"></span><span
									class="text">203 Fake St. Mountain View, San Francisco,
										California, USA</span></li>
								<li><a href="#"><span class="icon icon-phone"></span><span
										class="text">+2 392 3929 210</span></a></li>
								<li><a href="#"><span class="icon icon-envelope"></span><span
										class="text">info@yourdomain.com</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">

					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="icon-heart color-danger" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
		
	</footer>



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

</body>
</html>