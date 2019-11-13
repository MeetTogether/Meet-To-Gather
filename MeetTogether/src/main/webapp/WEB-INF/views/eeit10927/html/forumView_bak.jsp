<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ForumModify</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	$(document).ready(function() {
		$("#nverify").click(function() {
			top.location.href = "${pageContext.request.contextPath}/GetAllPostServlet";
		});
		$(".reupload").hide();
		$("#renewPhoto").click(function() {
			if ($(this).prop("checked") == false) {
				$(".reupload").hide();
			} else if ($(this).prop("checked") == true){
				$(".reupload").show();
			}
		});
	});
	
</script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/eeit10927/styles/top.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/eeit10927/styles/forum.css">
</head>
<body>
	<div id="allpage">
		<div>
			<header id="top">
				<jsp:include page="../fragment/top.jsp" />
			</header>
		</div>
		<div id="content">
			<div id="Postbox">
				<form:form method="POST" action="${pageContext.request.contextPath}/UpdatePostServlet" enctype="multipart/form-data" id="postModify" modelAttribute="msgBean">
					<table>
						<tr>
							<td>文章分類
							<td><form:select path="mtName" style="width: 300px">
								<c:forEach var="mt" items="${msgType}">
									<c:choose>
									<c:when test="${msgBean.msgType.typeName eq mt.value}">
										<form:option value="${mt.value}" selected="true" />
									</c:when>
									<c:otherwise>
										<form:option value="${mt.value}" />
									</c:otherwise>
									</c:choose>
								</c:forEach>
								</form:select>
						<tr>
							<td>文章標題
							<td><form:input type="text" name="msgTitle" id="msgTitle" path="msgTitle"
								size="110em" value="${msgBean.msgTitle}" autocomplete="off" />
								<br><form:errors path="msgTitle" class="errors"></form:errors>
						<tr>
							<td>文章內容
							<td><c:set var="msgText" value="${msgBean.msgText}"/>
								<form:textarea rows="7em" cols="100em" name="msgText"
									id="msgText" path="msgText" value="${msgText}" />
								<br><form:errors path="msgText" class="errors"></form:errors>
						<tr>
							<td>上傳照片
							<td><c:if test="${msgBean.msgPhoto ne null}">
								 <img
									height='120px' class="photoshow" 
									src='${pageContext.request.contextPath}/getImage?id=${msgBean.msgId}&type=message'>
								</c:if>
								<label><input type="checkbox" name="renewPhoto" value="renew" id="renewPhoto">重新上傳照片</label>
								<form:input type="file" name="msgImage" id="msgImage" path="msgImage" class="reupload" />
								<span id="msg_mPhoto"></span>
								
					</table><br>
					<input type="hidden" value="${msgBean.msgId}" name="msgId">
					<input type="submit" value="修改" name="verify" id="verify" class="modifyPost">
					<input type="button" value="返回" name="nverity" id="nverify" class="modifyPost">
				</form:form>
			</div>
			
		</div>
	</div>
</body>
</html>