<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>留言板</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/eeit10927/js/login.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/eeit10927/styles/top.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/eeit10927/styles/register.css" type="text/css">
<style>
body {
	font-family: 微軟正黑體;
	background-color: #f5f5f5;
	margin-top: 3%;
}
</style>
</head>
<body>
	<div id="loginallpage">
		<header>
			<nav>
				<jsp:include page="eeit10927/fragment/top.jsp" />
			</nav>
		</header>
		<div id="loginpage">
			<div id="loginbox" align="center">
				<h2>Welcome</h2>
				<br>
				<form:form method="POST" modelAttribute="memberBean" id="loginForm" action="./LoginServlet">
					<table>
						<tr>
							<td>請輸入Email
						<tr>
							<td><form:input type="email" name="mEmail" id="mEmail" path="memberEmail"
								value="${userEmail}" autocomplete="off" />
							<td><span id="msg_mEmail" class='msgWrong'></span>
						<tr>
							<td>請輸入密碼
						<tr>
							<td><form:input type="password" name="mPwd" id="mPwd" path="memberPassword"
								value="${userPwd}" />
							<td><span id="msg_mPwd" class='msgWrong'>${errorMsg.loginError}</span>
					</table>
					<input type="button" value="登入" id="login" />
				</form:form>
				尚未成為會員?  <a href="register">前往註冊</a>
			</div>

		</div>
	</div>
</body>
</html>