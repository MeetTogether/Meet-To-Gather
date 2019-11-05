<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員註冊</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script
	src="${pageContext.request.contextPath}/eeit10927/js/register.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/eeit10927/styles/top.css"
	type="text/css">
<c:set var="time" value="<%=new Date().getTime()%>" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/eeit10927/styles/register.css?t=${time}">
<style type="text/css">
body {
	font-family: 微軟正黑體;
	background-color: #f5f5f5;
	margin-top: 3%;
}
</style>
</head>
<body>
	<div id="regispage">
		<header>
			<nav>
<%-- 				<jsp:include page="../eeit10901/top.jsp" /> --%>
			</nav>
		</header>
		<div id="registerbox" align="center">
			<h2>請輸入會員資料</h2>
			<font size="1" color="#FF0000">${errorMsg.errTitle}</font>
			<form:form enctype="multipart/form-data" method="POST"
				modelAttribute="memberBean" id='registerForm'>
				<table>
					<tr>
						<td>帳號
						<td><form:input type="email" name="memberEmail"
								id="memberEmail" path="memberEmail" placeholder="請輸入Email作為登入帳號"
								value="${param.mEmail}" autocomplete="off" />
						<td><span id="msg_mEmail" class='msgWrong'>${errorMsg.accError}</span>
					<tr>
						<td>暱稱
						<td><form:input type="text" name="memberName" id="memberName"
								path="memberName" placeholder="請輸入暱稱" value="${param.mNickname}"
								autocomplete="off" />
						<td id="msg_mNickname"></td>
					<tr>
						<td>設定密碼
						<td><form:input type="password" name="memberPassword"
								id="memberPassword" path="memberPassword"
								placeholder="需有英/數/符號且超過6個字" value="${param.mPwd}" />
						<td><span id="msg_mPwd"></span>
					<tr>
						<td>密碼確認
						<td><form:input type="password" name="memberPassword2"
								id="memberPassword2" path="memberPassword2"
								placeholder="請再次輸入密碼"  />
						<td><span id="msg_mPwd2"></span>
					<tr>
						<td>生日
						<td><form:input type="date" name="memberBirth" id="memberBirth"
								path="memberBirth" />
						<td id="msg_mNickname"></td>
					<tr>
						<td>性別
						<td><input type="radio" name="memberSex" id="memberSex"
								path="memberSex" placeholder="請輸入性別" value="1"
								>男
							<input type="radio" name="memberSex" id="memberSex"
								path="memberSex" placeholder="請輸入性別" value="0"
								>女
						<td id="msg_mNickname"></td>
					<tr>
						<td>縣市
						<td><form:input type="text" name="memberCity" id="memberCity"
								path="memberCity" placeholder="請輸入城市　Ex:台北市" 
								autocomplete="off" />
						<td id="msg_mNickname"></td>
					<tr>
						<td>區域
						<td><form:input type="text" name="memberDist" id="memberDist"
								path="memberDist" placeholder="請輸入區域 Ex:信義區" 
								autocomplete="off" />
						<td id="msg_mNickname"></td>
					<tr>
						<td>驗證碼
						<td><form:input type="text" name="mChecksum" id="mChecksum"
								path="mChecksum" placeholder="請輸入驗證碼" autocomplete="off" />
						<td><span id="msg_mChecksum" class='msgWrong'>${errorMsg.captError}</span>
					<tr>
						<td>上傳照片
						<td><form:input type="file" name="memberImage"
								id="memberImage" path="memberImage" />
						<td><span id="msg_mPhoto"></span>
				</table>
				<input type="submit" value="會員註冊" id="regis" >
				<input type="reset" value="重新填寫">
				<input type="button" value="返回登入頁" id="backToLogin">
				 
			</form:form>
		</div>
	</div>
</body>
</html>