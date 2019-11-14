<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#dialog-confirm").hide();
		$("#vipBuyButton").click(function() {
			$("#dialog-confirm").dialog({
				resizable : false,
				height : "auto",
				width : 400,
				modal : true,
			});
	    });
	});
</script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>

	<div id="dialog-confirm" title="升級為VIP會員">
		<span style="float: left; margin: 12px 12px 20px 0;">
			<img src="${pageContext.request.contextPath}/eeit10927/images/upgrade.jpg" style="width:370px; margin:auto;">
		</span>
		<br>
		Upgrade 1: 每日新增好友數20名！<br>
		Upgrade 2: 新增討論區文章匯出功能！<br><br>
		<form:form modelAttribute="vipBean" method="POST" action="./VipBuy">
			<form:input type="hidden" path="mbId" value="${userId}" />
			<input type="submit" value="前往付款" class="reply">
		</form:form>
	</div>
	<input id="vipBuyButton" type="submit" value="升級VIP GO!" class="reply">

</body>
</html>