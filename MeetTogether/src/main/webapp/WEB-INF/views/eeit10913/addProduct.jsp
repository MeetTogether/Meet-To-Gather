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
<link rel="stylesheet"
	href='${pageContext.request.contextPath}/eeit10908/assets/css/bootstrap-datetimepicker.min.css'>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style2.css">
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

fieldset {
	border: 1px solid rgb(255, 232, 57);
	width: 600px;
	margin: auto;
}

textarea {
	resize: none;
}

body {
	font-family: 微軟正黑體;
	background-color: #f5f5f5;
	margin-top: 3%;
	background: -webkit-radial-gradient(circle, white, burlywood);
	background: -o-radial-gradient(circle, white, burlywood);
	background: -moz-radial-gradient(circle, white, burlywood);
	background: radial-gradient(circle, white, burlywood);
}

.msgWrong {
	color: red;
}
</style>
<script type="text/javascript">
	var jQuery_1_12_4 = $.noConflict();

	jQuery_1_12_4(document)
			.ready(
					function() {
						jQuery_1_12_4("#Postbox").hide();
						jQuery_1_12_4("#Postbutton").click(function() {
							jQuery_1_12_4("#Postbox").toggle("blind"); /* 展開發文表單 */
							/* $('html,body').animate({
								scrollTop : 0
							}); 返回到頁面頂端 */
						});
						jQuery_1_12_4("#ViewMyPost")
								.click(
										function() {
											top.location.href = "${pageContext.request.contextPath}/GetUserPostServlet?memberId=${userId}";
										});
						jQuery_1_12_4("#ViewAllPost")
								.click(
										function() {
											top.location.href = "${pageContext.request.contextPath}/GetAllPostServlet";
										});
						jQuery_1_12_4("input#deletePost")
								.click(
										function() {
											var c = confirm('是否確認刪除');
											console.log(c);
											if (c) {
												jQuery_1_12_4(this).parent(
														"form#deletePostForm")
														.submit();
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

	<script src="http://code.jquery.com/jquery-1.12.4.min.js">

	$(document).ready(function() {
		$("#eventComment").blur(checkEmptyE);
	});
	let flag = 0;
	let errorMsg = "<span class='msgWrong'>不可空白</span>";
	function checkEmptyE() {
		if ($("#eventComment").val() == "") {
			$("#msg_eventComment").empty().append(errorMsg).focus();
			flag += 1;
		} else {
			$("#msg_eventComment").empty();
			flag = 0;
		}
	}
</script>
<script type="text/javascript">
	function wordsTotal() {

		var total = document.getElementById('userInput').value.length;

		document.getElementById('display').innerHTML = total;

	}
</script>
</head>
<body>



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
								class="ion-ios-arrow-forward"></i></a></span> <span>活動 <i
							class="ion-ios-arrow-forward"></i></span>
					</p>
					<h1 class="mb-3 bread">留下您對此活動的評論</h1>
				</div>
			</div>
		</div>
	</section>

	<section>
		<div class="container">
			<h1 style="text-align: center">評論此活動</h1>
		</div>

	</section>

	<section>
		<div class="container">
			<div class="row">
				<div class="col-lg-2 col"></div>
				<div class="col-lg-4 col-md-6 mt-0 mt-md-5 d-flex">


					<form:form method='POST' modelAttribute="reviewBean"
						class='bg-light p-5 contact-form '>

						<h2>評論此活動</h2>
						<div class="form-group" style="font-size: 16px; color: black;">
							<label>會員姓名</label>
						</div>
						<div class="form-group">

							<form:input path="mbId" value="${userId}" type='hidden'
								class='form:input-large' />
						</div>
						<div class="form-group">
							<input type="text" class="form-control" value=${userName }
								readonly="readonly">
							<form:input path="mbId" value="${userName}" type='hidden'
								class='form:input-large' />
						</div>

						<div class="form-group">
							<label for="exampleFormControlSelect1">請選擇您的評分</label>
							<form:select path="eventStars" id="exampleFormControlSelect1"
								name="rate">
								<form:option value="1">1</form:option>
								<form:option value="2">2</form:option>
								<form:option value="3">3</form:option>
								<form:option value="4">4</form:option>
								<form:option value="5">5</form:option>
							</form:select>
						</div>

						<div class="form-group">
							<label>分享你的活動評論</label>
						</div>
						<div class="form-group">
							<form:textarea  placeholder="輸入您對此活動的想法吧!"  path="eventComment"
								id="eventComment" cols="50" rows="5"
								style="border: 1px black solid;"></form:textarea>
							
							<td><span id="msg_eventComment" class='msgWrong'></span>
						</div>

						<div class="form-group">
							<input class="form-group" type="submit" value="送出評論"
								class="btn btn-primary py-3 px-5" />
						</div>
					</form:form>



				</div>

			</div>
			<!-- row End -->
		</div>
		<!-- container End -->
	</section>


	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;">

	<jsp:include page="/WEB-INF/views/footer.jsp" />

	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
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


	<script
		src="${pageContext.request.contextPath}/assets/jquery/jquery-1.8.3.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.js"
		charset="UTF-8"></script>
	<script
		src="${pageContext.request.contextPath}/assets/locales/bootstrap-datetimepicker.fr.js"
		charset="UTF-8"></script>
	<script type="text/javascript">
		$('.form_datetime').datetimepicker({
			//language:  'fr',
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			forceParse : 0,
			showMeridian : 1
		});
	</script>

</body>
</html>
