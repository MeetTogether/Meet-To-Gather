<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Category</title>
</head>
<body>
	<form:form method="POST" modelAttribute="msgTypeBean" action="./SearchPostByType">
		<form:select path="typeId" onchange="this.form.submit();">
			<form:option value="-1" label="請選擇" />
			<form:options items="${msgType}" />
		</form:select>
	</form:form>
</body>
</html>