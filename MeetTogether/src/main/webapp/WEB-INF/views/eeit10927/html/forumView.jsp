<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<title>MeetTogether - 討論區 - 編輯文章</title>
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
    max-width: 95%; }
.likeBtn, .dislikeBtn, .replyBtn {
	height: 20px;
	cursor: pointer;
}
p {
	margin-bottom: 0;
}
.input_tag {
	height: 52px !important;
	font-size: 18px;
	border-radius: 5px;
	width: 50%;
	padding: 0.375rem 0.75rem;
	font-weight: 400;
	line-height: 1.5;
	border: 1px solid #ced4da;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#Postbox").hide();
		$("#Postbutton").click(function() {
			jQ("#Postbox").toggle("blind"); /* 展開發文表單 */
			/* $('html,body').animate({
				scrollTop : 0
			}); 返回到頁面頂端 */
		});
		$("#ViewMyPost").click(
			function() {
				top.location.href = "${pageContext.request.contextPath}/GetUserPostServlet?memberId=${userId}";
			});
		$("#ViewAllPost").click(
			function() {
				top.location.href = "${pageContext.request.contextPath}/GetAllPostServlet";
			});
		$("input#deletePost").click(function() {
			var c = confirm('是否確認刪除');
			console.log(c);
			if (c) {
				jQ(this).parent("form#deletePostForm").submit();
			} else {
			}
		});
		
		$("#nverify").click(function() {
			top.location.href = "${pageContext.request.contextPath}/GetAllPostServlet";
		});
		$("#reupload").hide();
		$("#renewPhoto").click(function() {
			if ($(this).prop("checked") == false) {
				$("#reupload").hide();
			} else if ($(this).prop("checked") == true){
				$("#reupload").show();
			}
		});
	});
</script>
</head>
<body>
<!-- vip購買 -->
<jsp:include page="/WEB-INF/views/vip_div.jsp"/>

	<!-- nav -->
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
					<li class="nav-item"><a href="${pageContext.request.contextPath}/" class="nav-link">首頁</a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath}/pairs/" class="nav-link">交友</a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath}/eeit10908/" class="nav-link">活動</a></li>
					<li class="nav-item active"><a href="${pageContext.request.contextPath}/GetAllPostServlet" class="nav-link">討論區</a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath}/getmember" class="nav-link">會員資料</a></li>
					<li class="nav-item"><a class="nav-link"><c:if test="${!empty userId}">${userName}
						</c:if></a></li>
					<li class="nav-item"><c:if test="${!empty userId}">
						<img style="height: 40px" src='${pageContext.request.contextPath}/getImage?type=member&id=${userId}'>
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
								class="ion-ios-arrow-forward"></i></a></span> <span>討論區 <i
							class="ion-ios-arrow-forward"></i></span>
					</p>
					<h1 class="mb-3 bread">討論區</h1>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-degree-bg">
		<div class="container">
			<div class="row">
				<!-- .col-md-8 -->
				<!-- 左側選單 -->
				<jsp:include page="../fragment/sidebar_left.jsp"/>

				<!-- 右側文章 -->
				<div style="width: 66%">
					<!-- 發文 -->
					<jsp:include page="../fragment/postMsg.jsp"/>

					<!-- 一則文章 -->
<%-- 				<c:forEach items="${msgBeans}" var="msgBean" varStatus="cnt"> --%>
<%-- 					<c:set var="mId" value="${msgBean.member.memberId}" /> --%>
						<div class="col-md-8 order-md-last ftco-animate">
							<div class="about-author d-flex p-4 bg-light">
								<div>
									<form:form method="POST" action="${pageContext.request.contextPath}/UpdatePostServlet" enctype="multipart/form-data" id="postModify" modelAttribute="msgBean">
										<table>
											<tr>
												<td style="width:11%">文章分類
												<td><form:select path="mtName" style="width: 100%" class="form-control">
													<c:forEach var="mt" items="${msgType}">
														<c:choose>
														<c:when test="${msgBean.msgType.typeName eq mt.value}">
															<form:option value="${mt.value}" selected="true" />
														</c:when>
														<c:otherwise>
															<form:option value="${mt.value}" />
														</c:otherwise>
														</c:choose>
													</c:forEach>
													</form:select>
											<tr>
												<td>文章標題
												<td><form:input type="text" name="msgTitle" id="msgTitle" path="msgTitle" class="form-control" 
													size="65%" value="${msgBean.msgTitle}" autocomplete="off" />
													<form:errors path="msgTitle" class="errors"></form:errors>
											<tr>
												<td>文章內容
												<td><c:set var="msgText" value="${msgBean.msgText}"/>
													<form:textarea rows="7em" cols="65%" name="msgText"  class="form-control"
														id="msgText" path="msgText" value="${msgText}" />
													<form:errors path="msgText" class="errors"></form:errors>
											<tr>
												<td>上傳照片
												<td><c:if test="${msgBean.msgPhoto ne null}">
													 <img
														height='120px' class="photoshow" 
														src='${pageContext.request.contextPath}/getImage?id=${msgBean.msgId}&type=message'>
													</c:if>
													<label><input type="checkbox" name="renewPhoto" value="renew" id="renewPhoto">重新上傳照片</label>
													<form:input type="file" name="msgImage" id="reupload" path="msgImage" class="form-control" />
													<span id="msg_mPhoto"></span>
											<br>
											<tr>
												<td>文章標籤(最多5個)
												<td><div class="input_fields_wrap_verify">
													<c:forEach items="${msgBean.msgtag }" var="tags" varStatus="cnt">
														<div><form:input type="text" path="msgTagName" class="input_tag" value="${tags.tagName}" />&ensp;&ensp;<a href="#" class="remove_field">Remove</a></div>
														<c:set var="countTag" value="${cnt.count}" />
													</c:forEach>
													<input type="hidden" name="tagCnt" id="tagCnt" value="${countTag}">
													<button class="add_field_button_verify" id="tagButton">增加標籤</button>
													</div>
													<script type="text/javascript">
													$(document).ready(function() {
														var max_fields = 5;
														var wrapper_verify = $(".input_fields_wrap_verify");
														var add_button_verify = $(".add_field_button_verify");
														
														var x_verify = document.getElementById("tagCnt").value;
														console.log(x_verify);
														$(add_button_verify).click(function(e) {
															e.preventDefault();
															if (x_verify < max_fields) {
																x_verify++;
																$(wrapper_verify).append('<div><form:input type="text" path="msgTagName" class="input_tag" placeholder="#tag here" />&ensp;&ensp;<a href="#" class="remove_field">Remove</a></div>');
															}
														});
														$(wrapper_verify).on("click", ".remove_field", function(e) {
															e.preventDefault(); $(this).parent('div').remove(); x_verify--;
														});
													});
													</script>
											<br>
											
													
										</table><br>
										<input type="hidden" value="${msgBean.msgId}" name="msgId" />
										<input type="hidden" value="${msgBean.member.memberId}" name="mbId" />
										<input type="submit" value="修改" name="verify" id="verify" class="reply" >
										<input type="button" value="返回" name="nverity" id="nverify" class="reply" >
									</form:form>
								</div>
							</div>
						<hr>
						</div>
						
<%-- 					</c:forEach> --%>
				</div>
			</div>
		</div>

	</section>
	<!-- .section -->

	<!-- footer引入 -->
	<jsp:include page="/WEB-INF/views/footer.jsp"/>


	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
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

<script>
	$(document).ready(function() {
		let imgs = document.getElementsByClassName("likeBtn");
		for (let i = 0; i < imgs.length; i++) {
			let imgId = 'likeBtn' + i;
			$(imgs[i]).click(function() {
				let msgIdVal = $(this).next().val();
				let spanId = 'likeCnt' + (i + 1);
				console.log('msgIdVal:' + msgIdVal + ', spanId:' + spanId + ', userId:' + ${userId});
				let info = $(this).attr("id");
				console.log(info);
				if (info == 'likeBtn') {
					$.ajax({
						url : "LikeMsgServlet",
						type : "GET",
						dataType : "JSON",
						data : {msgId : msgIdVal, userId : ${userId}},
						success : function(data) {
							let txt = 'LIKE(' + data + ')';
							let txt2 = 'span[id=' + spanId + ']';
							$(txt2).html(txt);
							console.log("data: " + data);
							$(imgs[i]).attr("id","dislikeBtn").attr("src","${pageContext.request.contextPath}/eeit10927/images/like.png");
						}
					});
				} else {
					$.ajax({
						url : "DislikeMsgServlet",
						type : "GET",
						dataType : "JSON",
						data : {msgId : msgIdVal, userId : ${userId}},
						success : function(data) {
							let txt = 'LIKE(' + data + ')';
							let txt2 = 'span[id=' + spanId + ']';
							$(txt2).html(txt);
							console.log("data: " + data);
							$(imgs[i]).attr("id","likeBtn").attr("src","${pageContext.request.contextPath}/eeit10927/images/dislike.png");
						}
					});
				}
				
			});
		}
		
		let types = document.getElementsByClassName("msgTypeCnt");
		for (let j = 0; j < types.length; j++) {
			let typeIdVal = $(types[j]).prev().val();
			let typeSpanId = 'msgTypeCnt' + (j + 1);
			console.log('typeIdVal:' + typeIdVal + ', typeSpanId:' + typeSpanId);
			$.ajax({
				url : "getMsgTypeCnt",
				type : "GET",
				dataType : "JSON",
				data : {typeId : typeIdVal},
				success : function(data) {
					let txt = '(' + data + ')';
					let txt2 = 'span[id=' + typeSpanId + ']';
					$(txt2).html(txt);
					console.log("data: " + data);
				}
			});
		}
	});
	
</script>
</body>
</html>