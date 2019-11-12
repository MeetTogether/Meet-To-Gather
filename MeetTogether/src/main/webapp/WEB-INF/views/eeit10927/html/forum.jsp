<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<title>MeetTogether</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
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
<style type="text/css">
body {
	background-color: #e7eef1;
	font-family: 微軟正黑體;
}
.hero-wrap {
  width: 100%;
  height: 300px;
  position: inherit;
  background-size: cover;
  background-repeat: no-repeat;
  background-position: top center; }
  .hero-wrap .overlay {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    content: '';
    opacity: .4;
    background: #000000;
    height: 300px; }
  @media (max-width: 991.98px) {
    .hero-wrap {
      height: 450px; }
      .hero-wrap .overlay {
        height: 450px; } }
  .hero-wrap.hero-wrap-2 {
    height: 300px !important;
    position: relative; }
    .hero-wrap.hero-wrap-2 .overlay {
      width: 100%;
      opacity: .05;
      height: 300px; }
    .hero-wrap.hero-wrap-2 .slider-text {
      height: 300px !important; }
.ftco-section {
  padding: 2em 0;
  position: relative; }
  @media (max-width: 767.98px) {
    .ftco-section {
      padding: 2em 0; } } /* 留言左側section與上方距離，原為6em */
.mt-5,
.my-5 {
  margin-top: 1em !important; } /* 發文單篇與上方距離，原為3rem */
</style>
</head>
<body>

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
					<li class="nav-item"><a href="${pageContext.request.contextPath}/" class="nav-link">Home</a></li>
					<li class="nav-item"><a href="#" class="nav-link">About</a></li>
					<li class="nav-item"><a href="#" class="nav-link">Pricing</a></li>
					<li class="nav-item"><a href="#" class="nav-link">Our Car</a></li>
					<li class="nav-item active"><a href="${pageContext.request.contextPath}/GetAllPostServlet" class="nav-link">Blog</a></li>
					<li class="nav-item"><a href="#" class="nav-link">Member Center</a></li>
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
						<span class="mr-2"><a href="${pageContext.request.contextPath}/">Home <i
								class="ion-ios-arrow-forward"></i></a></span> <span>Blog <i
							class="ion-ios-arrow-forward"></i></span>
					</p>
					<h1 class="mb-3 bread">Read our blog</h1>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-degree-bg">
		<div class="container">
			<div class="row">
				<!-- 一則發文 -->
				<c:forEach items="${msgBeans}" var="msgBean" varStatus="cnt">
				<c:set var="mId" value="${msgBean.member.memberId}" />
				<div class="col-md-8 order-md-last ftco-animate">
					<div class="about-author d-flex p-4 bg-light">
						<div class="bio mr-5">
							<a href="${pageContext.request.contextPath}/GetUserPostServlet?memberId=${msgBean.member.memberId}"><img height='60' src='${pageContext.request.contextPath}/getImage?type=member&id=${msgBean.member.memberId}'></a>
						</div>
						<div>
							<a href="${pageContext.request.contextPath}/GetUserPostServlet?memberId=${msgBean.member.memberId}">${msgBean.member.memberName}</a>
							<c:if test="${userId eq mId}">
								<form:form method="GET" action="${pageContext.request.contextPath}/ViewPostServlet" style='display: inline;' modelAttribute="messageBean">
									<form:input type="hidden" value="${msgBean.msgId}" path="msgId" />
									<input type="submit" value="修改" class="btn py-3 px-4 btn-primary" />
								</form:form>
								<form:form method="post" action="${pageContext.request.contextPath}/DeletePostServlet" style="display: inline;" modelAttribute="messageBean">
									<form:input type="hidden" value="${msgBean.msgId}" path="msgId" />
									<input type="submit" value="刪除" class="btn py-3 px-4 btn-primary" id="deletePost">
								</form:form>
							</c:if>
						</div>
					</div>
					<h2 class="mb-3 mt-5">${msgBean.msgTitle}</h2>
					<p>${msgBean.msgText}<p>
						<c:if test="${msgBean.msgPhoto ne null}">
							<img class="img-fluid" src='${pageContext.request.contextPath}/getImage?type=message&id=${msgBean.msgId}'>
						</c:if>
					</p>
					<div class="tag-widget post-tag-container mb-5 mt-5">
						<div class="tagcloud">
							<a href="#" class="tag-cloud-link">Life</a> <a href="#"
								class="tag-cloud-link">Sport</a> <a href="#"
								class="tag-cloud-link">Tech</a> <a href="#"
								class="tag-cloud-link">Travel</a>
						</div>
					</div>

					<div class="pt-5 mt-5">
						<h3 class="mb-5">6 Comments</h3>
						<ul class="comment-list">
							<li class="comment">
								<div class="vcard bio">
									<img src="images/person_1.jpg" alt="Image placeholder">
								</div>
								<div class="comment-body">
									<h3>John Doe</h3>
									<div class="meta">October 03, 2018 at 2:21pm</div>
									<p>短內容</p>
									<p>
										<a href="#" class="reply">Reply</a>
									</p>
								</div>
							</li>

							<li class="comment">
								<div class="vcard bio">
									<img src="images/person_1.jpg" alt="Image placeholder">
								</div>
								<div class="comment-body">
									<h3>John Doe</h3>
									<div class="meta">October 03, 2018 at 2:21pm</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit. Pariatur quidem laborum necessitatibus, ipsam impedit
										vitae autem, eum officia, fugiat saepe enim sapiente iste
										iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
									<p>
										<a href="#" class="reply">Reply</a>
									</p>
								</div>

								<ul class="children">
									<li class="comment">
										<div class="vcard bio">
											<img src="images/person_1.jpg" alt="Image placeholder">
										</div>
										<div class="comment-body">
											<h3>John Doe</h3>
											<div class="meta">October 03, 2018 at 2:21pm</div>
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing
												elit. Pariatur quidem laborum necessitatibus, ipsam impedit
												vitae autem, eum officia, fugiat saepe enim sapiente iste
												iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
											<p>
												<a href="#" class="reply">Reply</a>
											</p>
										</div>


										<ul class="children">
											<li class="comment">
												<div class="vcard bio">
													<img src="images/person_1.jpg" alt="Image placeholder">
												</div>
												<div class="comment-body">
													<h3>John Doe</h3>
													<div class="meta">October 03, 2018 at 2:21pm</div>
													<p>Lorem ipsum dolor sit amet, consectetur adipisicing
														elit. Pariatur quidem laborum necessitatibus, ipsam
														impedit vitae autem, eum officia, fugiat saepe enim
														sapiente iste iure! Quam voluptas earum impedit
														necessitatibus, nihil?</p>
													<p>
														<a href="#" class="reply">Reply</a>
													</p>
												</div>

												<ul class="children">
													<li class="comment">
														<div class="vcard bio">
															<img src="images/person_1.jpg" alt="Image placeholder">
														</div>
														<div class="comment-body">
															<h3>John Doe</h3>
															<div class="meta">October 03, 2018 at 2:21pm</div>
															<p>Lorem ipsum dolor sit amet, consectetur
																adipisicing elit. Pariatur quidem laborum
																necessitatibus, ipsam impedit vitae autem, eum officia,
																fugiat saepe enim sapiente iste iure! Quam voluptas
																earum impedit necessitatibus, nihil?</p>
															<p>
																<a href="#" class="reply">Reply</a>
															</p>
														</div>
													</li>
												</ul>
											</li>
										</ul>
									</li>
								</ul>
							</li>

							<li class="comment">
								<div class="vcard bio">
									<img src="images/person_1.jpg" alt="Image placeholder">
								</div>
								<div class="comment-body">
									<h3>John Doe</h3>
									<div class="meta">October 03, 2018 at 2:21pm</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit. Pariatur quidem laborum necessitatibus, ipsam impedit
										vitae autem, eum officia, fugiat saepe enim sapiente iste
										iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
									<p>
										<a href="#" class="reply">Reply</a>
									</p>
								</div>
							</li>
						</ul>
						<!-- END comment-list -->

						<div class="comment-form-wrap pt-5">
							<h3 class="mb-5">Leave a comment</h3>
							<form action="#" class="p-5 bg-light">
								<div class="form-group">
									<label for="name">Name *</label> <input type="text"
										class="form-control" id="name">
								</div>
								<div class="form-group">
									<label for="email">Email *</label> <input type="email"
										class="form-control" id="email">
								</div>
								<div class="form-group">
									<label for="website">Website</label> <input type="url"
										class="form-control" id="website">
								</div>

								<div class="form-group">
									<label for="message">Message</label>
									<textarea name="" id="message" cols="30" rows="10"
										class="form-control"></textarea>
								</div>
								<div class="form-group">
									<input type="submit" value="Post Comment"
										class="btn py-3 px-4 btn-primary">
								</div>

							</form>
						</div>
					</div>

				</div>
				</c:forEach>
				
				<!-- .col-md-8 -->
				<div class="col-md-4 sidebar ftco-animate">
					<div class="sidebar-box">
						<form action="./SearchPostServlet" method="GET" class="search-form">
							<div class="form-group">
								<span class="icon icon-search"></span>
								<input type="text" class="form-control" name="queryString" id="queryString" placeholder="Type a keyword" autocomplete="off">
							</div>
						</form>
					</div>
					<div class="sidebar-box ftco-animate">
						<div class="categories">
							<h3>依文章分類查詢</h3>
							<form:form method="POST" modelAttribute="msgTypeBean" action="./SearchPostByType">
								<form:select path="typeId" onchange="this.form.submit();">
									<form:option value="-1" label="請選擇" />
									<form:options items="${msgType}" />
								</form:select>
							</form:form>
							
							<!-- <li><a href="#">Jobs <span>(12)</span></a></li>
							<li><a href="#">Visual Assistant <span>(22)</span></a></li>
							<li><a href="#">Coffee <span>(37)</span></a></li>
							<li><a href="#">Drinks <span>(42)</span></a></li>
							<li><a href="#">Foods <span>(14)</span></a></li>
							<li><a href="#">Travel <span>(140)</span></a></li> -->
						</div>
					</div>

					<div class="sidebar-box ftco-animate">
						<h3>Recent Blog</h3>
						<div class="block-21 mb-4 d-flex">
							<a class="blog-img mr-4"
								style="background-image: url(images/image_1.jpg);"></a>
							<div class="text">
								<h3 class="heading">
									<a href="#">Even the all-powerful Pointing has no control
										about the blind texts</a>
								</h3>
								<div class="meta">
									<div>
										<a href="#"><span class="icon-calendar"></span> July 12,
											2018</a>
									</div>
									<div>
										<a href="#"><span class="icon-person"></span> Admin</a>
									</div>
									<div>
										<a href="#"><span class="icon-chat"></span> 19</a>
									</div>
								</div>
							</div>
						</div>
						<div class="block-21 mb-4 d-flex">
							<a class="blog-img mr-4"
								style="background-image: url(images/image_2.jpg);"></a>
							<div class="text">
								<h3 class="heading">
									<a href="#">Even the all-powerful Pointing has no control
										about the blind texts</a>
								</h3>
								<div class="meta">
									<div>
										<a href="#"><span class="icon-calendar"></span> July 12,
											2018</a>
									</div>
									<div>
										<a href="#"><span class="icon-person"></span> Admin</a>
									</div>
									<div>
										<a href="#"><span class="icon-chat"></span> 19</a>
									</div>
								</div>
							</div>
						</div>
						<div class="block-21 mb-4 d-flex">
							<a class="blog-img mr-4"
								style="background-image: url(images/image_3.jpg);"></a>
							<div class="text">
								<h3 class="heading">
									<a href="#">Even the all-powerful Pointing has no control
										about the blind texts</a>
								</h3>
								<div class="meta">
									<div>
										<a href="#"><span class="icon-calendar"></span> July 12,
											2018</a>
									</div>
									<div>
										<a href="#"><span class="icon-person"></span> Admin</a>
									</div>
									<div>
										<a href="#"><span class="icon-chat"></span> 19</a>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="sidebar-box ftco-animate">
						<h3>Tag Cloud</h3>
						<div class="tagcloud">
							<a href="#" class="tag-cloud-link">dish</a> <a href="#"
								class="tag-cloud-link">menu</a> <a href="#"
								class="tag-cloud-link">food</a> <a href="#"
								class="tag-cloud-link">sweet</a> <a href="#"
								class="tag-cloud-link">tasty</a> <a href="#"
								class="tag-cloud-link">delicious</a> <a href="#"
								class="tag-cloud-link">desserts</a> <a href="#"
								class="tag-cloud-link">drinks</a>
						</div>
					</div>

					<div class="sidebar-box ftco-animate">
						<h3>Paragraph</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Ducimus itaque, autem necessitatibus voluptate quod mollitia
							delectus aut, sunt placeat nam vero culpa sapiente consectetur
							similique, inventore eos fugit cupiditate numquam!</p>
					</div>
				</div>

			</div>
		</div>
	</section>
	<!-- .section -->

	<footer class="ftco-footer ftco-bg-dark ftco-section">
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

</body>
</html>