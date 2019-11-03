<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(document).ready(function() {
		$("#nverify").click(function() {
			top.location.href = "./GetAllPostServlet";
		});
	});
</script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/eeit10927/styles/top.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/eeit10927/styles/admin.css">
<style>
.aPost {
	text-align: center;
}
</style>
</head>
<body>
	<div id="allpage">
		<div>
			<header id="top">
				<jsp:include page="<c:url value='/fragment/top.jsp' />" />
			</header>
		</div>
		<div id="content">
			<div id="Postbox">
				<form method="post" action="<c:url value='/UpdateUserServlet' />" enctype="multipart/form-data" id="postModify">
					<table>
						<tr>
							<td>帳號
							<td><input type="text" name="mEmail" id="mEmail"
								value="${mBean.mEmail}" readonly>
						<tr>
							<td>暱稱
							<td><input type="text" name="mNickname" id="mNickname"
								value="${mBean.mNickname}">
						<tr>
							<td>上傳照片
							<td><img height='60px' style="padding-top: 15px"
								src='${pageContext.request.contextPath}/getImage?id=${mBean.mEmail}&type=member'>
								<input type="file" name="mPhoto" id="mPhoto" class="reupload">
								<span id="msg_mPhoto"></span>
					</table>
					<br> <input type="hidden" value="${mBean.mId}"
						name="mId"> <input type="submit" value="修改"
						name="verify" id="verify" class="modifyPost"> <input
						type="button" value="返回" name="nverity" id="nverify"
						class="modifyPost">
				</form>
			</div>
		</div>
	</div>
</body>
</html>