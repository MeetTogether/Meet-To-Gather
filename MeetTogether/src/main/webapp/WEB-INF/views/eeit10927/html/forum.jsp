<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix ="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>MeetTogether - 討論區</title>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style2.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style type="text/css">
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
jQueryConflict = $.noConflict();
jQueryConflict(document).ready(function() {
	jQueryConflict("#Postbox").hide();
	jQueryConflict("#Postbutton").click(function() {
		jQueryConflict("#Postbox").toggle("blind"); /* 展開發文表單 */
			/* $('html,body').animate({
				scrollTop : 0
			}); 返回到頁面頂端 */
		});
	jQueryConflict("#ViewMyPost").click(
			function() {
				top.location.href = "${pageContext.request.contextPath}/GetUserPostServlet?memberId=${userId}&pageNo=1";
			});
	jQueryConflict("#ViewAllPost").click(
			function() {
				top.location.href = "${pageContext.request.contextPath}/GetAllPostServlet";
			});
	jQueryConflict("input#deletePost").click(function() {
			var c = confirm('是否確認刪除');
			console.log(c);
			if (c) {
				jQueryConflict(this).parent("form#deletePostForm").submit();
			} else {
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
					<li class="nav-item"><a href="${pageContext.request.contextPath}/friends" class="nav-link">好友紀錄</a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath}/eeit10908/" class="nav-link">活動</a></li>
					<li class="nav-item active"><a href="${pageContext.request.contextPath}/GetAllPostServlet" class="nav-link">討論區</a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath}/getmember" class="nav-link">會員資料</a></li>
					<li class="nav-item"><a class="nav-link">
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
		style="background-image: url('${pageContext.request.contextPath}/eeit10927/images/blog03.jpg');"
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
					<c:forEach items="${msgBeans}" var="msgBean" varStatus="cnt">
						<c:set var="mId" value="${msgBean.member.memberId}" />
						<div class="col-md-8 order-md-last ftco-animate">
							<div class="about-author d-flex p-4 bg-light">
								<div class="bio mr-5">
									<a
										href="${pageContext.request.contextPath}/GetUserPostServlet?memberId=${msgBean.member.memberId}"><img
										height='60'
										src='${pageContext.request.contextPath}/getImage?type=member&id=${msgBean.member.memberId}'></a>
								</div>
								<div>
									<a
										href="${pageContext.request.contextPath}/GetUserPostServlet?memberId=${msgBean.member.memberId}">${msgBean.member.memberName}<span>&emsp;&emsp;</span></a>
									<c:if test="${userId eq mId}">
										<form:form method="GET"
											action="${pageContext.request.contextPath}/ViewPostServlet"
											style='display: inline;' modelAttribute="messageBean">
											<form:input type="hidden" value="${msgBean.msgId}"
												path="msgId" />
											<input type="submit" value="編輯文章內容" class="reply" />
										</form:form>
										<form:form id="deletePostForm" method="post"
											action="${pageContext.request.contextPath}/DeletePostServlet"
											style="display: inline;" modelAttribute="messageBean">
											<form:input type="hidden" value="${msgBean.msgId}"
												path="msgId" />
											<input type="button" value="刪除此篇文章" class="reply"
												id="deletePost">
										</form:form>
										<c:choose>
											<c:when test="${vipTag eq true }">
												<a href="${pageContext.request.contextPath}/message/${msgBean.member.memberId}/${msgBean.msgId}.pdf">
												<input type="button" value="匯出文章" class="reply" id="exportPost"></a>
											</c:when>
											<c:otherwise>
												<a data-toggle="modal" data-target="#vipModalLong">
												<input type="button" value="匯出文章" class="reply" id="exportPost"></a>
											</c:otherwise>
										</c:choose>
									</c:if>
									<p>發文：<fmt:formatDate value="${msgBean.createTime}" pattern="yyyy-MM-dd HH:mm" />
									<c:if test="${msgBean.updateTime ne null}">
									&ensp;更新：<fmt:formatDate value="${msgBean.updateTime}" pattern="yyyy-MM-dd HH:mm" />
									</c:if></p>
									<a href='${pageContext.request.contextPath}/GetAllReMsgServlet?msgId=${msgBean.msgId}'>
									<span class="icon-chat"></span>&ensp;REPLY(${msgBean.replyCount})</a>&ensp;
									<c:set var="done" value="false" />
									<c:forEach items="${mlBeans}" var="mlBean">
										<c:if test="${mlBean.message.msgId eq msgBean.msgId}">
											<c:set var="done" value="true" />
										</c:if>
									</c:forEach>
									<c:choose>
										<c:when test="${!done}">
											<img
												src="${pageContext.request.contextPath}/eeit10927/images/dislike.png"
												id="likeBtn" class="likeBtn">
										</c:when>
										<c:otherwise>
											<img
												src="${pageContext.request.contextPath}/eeit10927/images/like.png"
												id="dislikeBtn" class="likeBtn">
										</c:otherwise>
									</c:choose>
									<input type="hidden" id="msgId" name="msgId" value="${msgBean.msgId}">
									<span id="likeCnt${cnt.count}" class="likeNumber" onmouseover="showMsgLike(this)" onclick="hideMsgLike(this)">LIKE(${msgBean.likeCount})</span>
									<div id="msgLikeModalLong" style="text-align: center;"></div>
									<script type="text/javascript">
										function hideMsgLike(likeObj) {
											jQueryConflict(likeObj).next().hide();
										}
// 									jQueryConflict(".likeNumber").mouseout(function() {
// 										jQueryConflict("#msgLikeModalLong").hide();
// 									});
										function showMsgLike(likeObj) {
											var messageId = jQueryConflict(likeObj).prev('input[name=msgId]').val();
											console.log("messageId: " + messageId);
											jQueryConflict.ajax({
												url:"findMsglikeByMessage",
												dataType:"JSON",
												data:{msgId:messageId},
												success:function(data) {
													console.log('msg like data: ' + data);
													var memberInfoSet = "<table>";
													jQueryConflict.each(data, function(key, value) {
														memberInfoSet += "<tr><td>";
														memberInfoSet += "<img style='height: 40px; border-radius: 50%;' src='${pageContext.request.contextPath}/getImage?type=member&id="+key+"'>";
														memberInfoSet += "<td><a href='${pageContext.request.contextPath}/getmember/"+key+"'>"+value+"</a>";
													});
													console.log(memberInfoSet);
													jQueryConflict(likeObj).next().html(memberInfoSet);
													jQueryConflict(likeObj).next().show();
												}
											});
										}
										
									</script>
								</div>
							</div>
							<h2 class="mb-3 mt-5" >
								<a href="${pageContext.request.contextPath}/SearchPostByType?typeId=${msgBean.msgType.typeId}">[${msgBean.msgType.typeName}]</a>
								&ensp;${msgBean.msgTitle}
							</h2>
							<div style="width:50%; float:left;">
							<p>${msgBean.msgTextShort}</p>
							<p>
								<a href="${pageContext.request.contextPath}/GetAllReMsgServlet?msgId=${msgBean.msgId}" class="btn-custom">
								閱讀更多 <span class="icon-long-arrow-right"></span></a>
							</div>
							<div>
							<c:if test="${msgBean.msgPhoto ne null}">
								<img height="200px"
									src='${pageContext.request.contextPath}/getImage?type=message&id=${msgBean.msgId}'>
							</c:if>
							</div>
							
							<div class="tag-widget post-tag-container mb-5 mt-5">
								<div class="tagcloud">
								<c:forEach items="${msgBean.msgtag }" var="tags">
									<a href="${pageContext.request.contextPath}/getMsgByTagName?tagname=${tags.tagName}" class="tag-cloud-link">${tags.tagName }</a>
								</c:forEach>
								</div>
							</div>
						<hr>
						</div>
						
					</c:forEach>
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
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>
	

<script>
jQueryConflict(document).ready(function() {
		let imgs = document.getElementsByClassName("likeBtn");
		for (let i = 0; i < imgs.length; i++) {
			let imgId = 'likeBtn' + i;
			jQueryConflict(imgs[i]).click(function() {
				let msgIdVal = $(this).next().val();
				let spanId = 'likeCnt' + (i + 1);
				console.log('msgIdVal:' + msgIdVal + ', spanId:' + spanId + ', userId:' + ${userId});
				let info = $(this).attr("id");
				console.log(info);
				if (info == 'likeBtn') {
					jQueryConflict.ajax({
						url : "LikeMsgServlet",
						type : "GET",
						dataType : "JSON",
						data : {msgId : msgIdVal, userId : ${userId}},
						success : function(data) {
							let txt = 'LIKE(' + data + ')';
							let txt2 = 'span[id=' + spanId + ']';
							jQueryConflict(txt2).html(txt);
							console.log("data: " + data);
							jQueryConflict(imgs[i]).attr("id","dislikeBtn").attr("src","${pageContext.request.contextPath}/eeit10927/images/like.png");
						}
					});
				} else {
					jQueryConflict.ajax({
						url : "DislikeMsgServlet",
						type : "GET",
						dataType : "JSON",
						data : {msgId : msgIdVal, userId : ${userId}},
						success : function(data) {
							let txt = 'LIKE(' + data + ')';
							let txt2 = 'span[id=' + spanId + ']';
							jQueryConflict(txt2).html(txt);
							console.log("data: " + data);
							jQueryConflict(imgs[i]).attr("id","likeBtn").attr("src","${pageContext.request.contextPath}/eeit10927/images/dislike.png");
						}
					});
				}
				
			});
		}
		
		let types = document.getElementsByClassName("msgTypeCnt");
		for (let j = 0; j < types.length; j++) {
// 			$(types[j]).load(function() {
				let typeIdVal = $(types[j]).prev().val();
				let typeSpanId = 'msgTypeCnt' + (j + 1);
				console.log('typeIdVal:' + typeIdVal + ', typeSpanId:' + typeSpanId);
				jQueryConflict.ajax({
					url : "getMsgTypeCnt",
					type : "GET",
					dataType : "JSON",
					data : {typeId : typeIdVal},
					success : function(data) {
						let txt = '(' + data + ')';
						let txt2 = 'span[id=' + typeSpanId + ']';
						jQueryConflict(txt2).html(txt);
						console.log("data: " + data);
					}
				});
// 			});
		}
	});
	
</script>
</body>
</html>