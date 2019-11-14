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

</head>
<body>
	<div id="regispage">
		<div id="registerbox" align="center">
			<h2>個人資料</h2>
			<font size="1" color="#FF0000">${errorMsg.errTitle}</font>
			<form:form enctype="multipart/form-data" method="POST"
				modelAttribute="ma" id='registerForm'>
				<table>
					<tr>
						<td>id
						<td><form:input type="text" path="pk.memberId" />
					<tr>
						<td>status
						<td><form:input type="text" path="status" />
					<tr>
						<td>deleteTag
						<td><form:input type="text" path="deleteTag" />
					<tr>
						<td>上傳照片
						<td><form:input type="file" path="memberImage" />
				</table>
				<input type="submit" value="submit">
			</form:form>
		</div>
	</div>
</body>
</html>