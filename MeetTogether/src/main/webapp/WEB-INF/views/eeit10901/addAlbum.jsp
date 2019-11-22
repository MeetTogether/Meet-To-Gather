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
<style>        
        .block {
            width: 380PX;
            display: block;
            cursor: pointer;
        }
    
        .none {
            display: none;
        }
    
        .field {
            width: 380PX;
            margin: 0 auto;
            border-radius: 20PX;
        }
    
        .legend {
            text-align: center;
            font-size: larger
        }
    
        .ads {
            margin: 3PX 2PX;
            width: 60PX;
            height: 60PX;
        }
    
        .adsborder {
            margin: 3PX 2PX;
            width: 60PX;
            height: 60PX;
            border: 3px solid #ffc300;
        }
    
        .pdiv {
            width: 380PX;
            text-align: center;
        }
    
        .control {
            margin-left: 30px;
            margin-right: 30px;
            width: 40px;
            -webkit-filter: grayscale(1);
        }
    </style>
    <script> 
    
        let adImgs, adsImgs,count=0,flag=true,t;            
        
        document.addEventListener("DOMContentLoaded",function(){
            adImgs=document.querySelectorAll("img.block,img.none");
            // alert(adImgs.length);
            adsImgs=document.querySelectorAll("img.ads,img.adsborder");
            // alert(adsImgs.length);
            document.getElementById("idpauseplay").addEventListener("click",pauseplayf);
            document.getElementById("idback").addEventListener("click",backf);
            document.getElementById("idnext").addEventListener("click",nextf);
        });
        
        function show(){
            for (var i = 0; i < adImgs.size; i++) {
            	if (i == count) {
            		adImgs[count].className="block";
                    adsImgs[count].className="ads";
            	}
            	adImgs[i].className="none";
                adsImgs[i].className="adsborder";
            }
            count++;
            if(count>4)count=0;
            //adImgs[count].className="block";
            //adsImgs[count].className="adsborder";            
        }
        t=window.setInterval(show,1500);

        function backf(){
            adImgs[count].className="none";
            adsImgs[count].className="ads";
            count--;
            if(count<0)count=4;
            adImgs[count].className="block";
            adsImgs[count].className="adsborder";    
        }
        function pauseplayf(){
            if(flag){
                flag=false;
                window.clearInterval(t);
                document.getElementById("idpauseplay").src="images/play.png";
            }else{
                flag=true;
                t=window.setInterval(show,1500);
                document.getElementById("idpauseplay").src="images/pause.png";
            }
        }
        function nextf(){
            show();
        }
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
					<li class="nav-item"><a href="${pageContext.request.contextPath}/eeit10908/" class="nav-link">活動</a></li>
					<li class="nav-item active"><a href="${pageContext.request.contextPath}/GetAllPostServlet" class="nav-link">討論區</a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath}/getmember" class="nav-link">會員資料</a></li>
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
		style="background-image: url('${pageContext.request.contextPath}/eeit10901/images/mt11.webp');"
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
					
				</div>
			</div>
		</div>
	</section>
    <h1 class="mb-3 bread" >選擇一張照片上傳</h1>
    
     <fieldset class="field">
        <legend class="legend">${userName}</legend>
        <div class="pdiv">
          	<c:forEach items="${photoCount }" var="photo">
    				<hr><img class="block" width=550px height=500px  src="${pageContext.request.contextPath}/memberPhoto/${userId}/${photo}"/>
    			</c:forEach>
        </div>
    
        <div class="pdiv">
            <img id="idback" class="control"  src="${pageContext.request.contextPath}/eeit10901/images/back.png">
            <img id="idpauseplay" class="control" src="${pageContext.request.contextPath}/eeit10901/images/pause.png">
            <img id="idnext" class="control" src="${pageContext.request.contextPath}/eeit10901/images/next.png">
        </div>
    </fieldset>
    
    
    
    
    
<!--     <div> -->
<!--     	<table> -->
<!--     		<tr> -->
<%--     			<c:forEach items="${photoCount }" var="photo"> --%>
<%--     				<td><img width=300px height=300px  src="${pageContext.request.contextPath}/memberPhoto/${userId}/${photo}"/> --%>
<%--     			</c:forEach> --%>
<!--     	</table> -->
<!--     </div> -->
    
    
	<div id="regispage">
		<div id="registerbox" align="center">
			<h2>新增照片</h2>
			<font size="1" color="#FF0000">${errorMsg.errTitle}</font>
			<form:form enctype="multipart/form-data" method="POST"
				modelAttribute="albumbean" id='registerForm'>
				<table>
					<tr>
					
					<td>編號
				    <td>
<%-- 				    		</td><form:input type="text" path="pk.memberId" /> --%>
<!-- 						<td>id -->
						<td><form:input type="hidden" path="pk.memberId" value="${albumbean.pk.memberId}" />
					<tr>
						<td>配對照片顯示順序
						<td><form:input type="text" path="status" value="${photoStatus }" />
<%-- 						<td><form:input type="hidden" path="status" /> --%>
					
					<tr>
						<td>上傳照片
						<td><form:input type="file" path="albumImage" />
				</table>
				<input type="submit" value="submit">
			</form:form>
		</div>

<a href="${pageContext.request.contextPath}/personal" class="nav-link">輸入個人喜好</a>
		<a href="${pageContext.request.contextPath}/addHope"class="nav-link">輸入個人希望條件</a>
	<a href="${pageContext.request.contextPath}/personalInterest" class="nav-link">輸入個人興趣</a>
	<a href="${pageContext.request.contextPath}/memberInterest" class="nav-link">個人興趣</a>
		<a href="${pageContext.request.contextPath}/addAlbum" class="nav-link">相簿</a>
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
            <li><a href="${pageContext.request.contextPath}/" class="py-2 d-block">首頁</a></li>
            <li><a href="${pageContext.request.contextPath}/pairs/" class="py-2 d-block">交友</a></li>
            <li><a href="${pageContext.request.contextPath}/eeit10908/" class="py-2 d-block">活動</a></li>
            <li><a href="${pageContext.request.contextPath}/GetAllPostServlet" class="py-2 d-block">討論區</a></li>
            <li><a href="${pageContext.request.contextPath}/getmember" class="py-2 d-block">會員資料</a></li>
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
             <li><a href="#"><span class="icon icon-envelope"></span><span class="text">109meettogether@gmail.com</span></a></li>
           </ul>
         </div>
        </div>
      </div>
    </div>
  </div>
</footer>
</body>
</html>