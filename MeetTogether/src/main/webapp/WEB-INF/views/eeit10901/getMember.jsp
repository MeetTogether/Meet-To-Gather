<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://www.springframework.org/tags"%>
<title>新增會員成功</title>
</head>
<body>
	<div align=center>
		<h2>會員資料</h2>
		<table border='1'>
			<tr bgcolor='#ffad00'>
				<th>名稱
				<th>值 <c:forEach var='member' items='${members}'>
						<p>${member.memberId}</p>
						<p>${member.memberEmail}</p>
						<p>${member.memberPassword}</p>
						<p>${member.memberName}</p>
						<p>${member.memberBirth}</p>
						<p>${member.memberSex}</p>
						<p>${member.memberCity}</p>
						<p>${member.memberDist}</p>
						<p>${member.fileName}</p>
					</c:forEach>
		</table>
</body>
</html>