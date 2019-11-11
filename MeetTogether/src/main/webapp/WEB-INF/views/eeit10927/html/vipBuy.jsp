<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VipBuy</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
	<div id="allpage">
		<div>
			<header id="top">
<%-- 				<jsp:include page="../fragment/top.jsp" /> --%>
			</header>
		</div>
		<div id="content">
			<form:form modelAttribute="vipBean" method="POST" action="./VipBuy">
				<form:input type="hidden" path="mbId" value="${userId}" />
				<input type="submit" value="購買">
			</form:form>
		</div>
	</div>
</body>
</html>