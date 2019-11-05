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
<title>ReplyMsg</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	$(document).ready(function() {
		$("#nverify").click(function() {
			top.location.href = "./GetAllPostServlet";
		});
	});
</script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/eeit10927/styles/top.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/eeit10927/styles/forum.css">
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
				<table>
					<tr>
						<td>文章分類
						<td>${msgBean.msgType.typeName}
					<tr>
						<td>文章標題
						<td>${msgBean.msgTitle}
					<tr>
						<td>文章內容
						<td>${msgBean.msgText}
					<tr>
						<td colspan="2"><c:if test="${msgBean.msgPhoto ne null}">
								<img height='120px' class="photoshow"
									src='${pageContext.request.contextPath}/getImage?id=${msgBean.msgId}&type=message'>
							</c:if>
					<tr>
						<td colspan="2"><div class="MemberPic">
								<img src='${pageContext.request.contextPath}/getImage?id=${userId}&type=member'>
							</div>
							<form:form class="replyMsgText" method="post" style="display: inline" action="${pageContext.request.contextPath}/ReplyMsgServlet" modelAttribute="msgReBean">
								<form:input type="hidden" value="${msgBean.msgId}" path="messageId" />
								<form:input type="hidden" value="${userId}" path="memberId" />
								<form:textarea rows="2em" cols="100em" name="replyText" placeholder="leave ur message to this post" path="replyText" />
								<br>
								<input type="submit" value="留言" class="modifyPost">
								<input type="button" value="返回" name="nverity" id="nverify" class="modifyPost">
							</form:form> REPLY(${msgBean.replyCount})
							<c:choose>
								<c:when test="${likeOrNot eq '0'}">
									<img src="${pageContext.request.contextPath}/eeit10927/images/like.png"
										id="dislikeBtn" class="likeBtn">
								</c:when>
								<c:otherwise>
									<img
										src="${pageContext.request.contextPath}/eeit10927/images/dislike.png"
										id="likeBtn" class="likeBtn">
								</c:otherwise>
							</c:choose> <input type="hidden" id="msgId" value="${msgBean.msgId}">
							<span id="likeCnt">LIKE(${msgBean.likeCount})</span>
				</table>
				<table>
					<c:forEach items="${reBeans}" var="reBean">
						<tr>
							<td><div class="MemberPic">
									<img
										src='${pageContext.request.contextPath}/getImage?type=member&id=${reBean.member.memberId}'>
								</div>
							<td><input type="text" readonly value='${reBean.replyText}'>
							<td><fmt:formatDate value="${reBean.createTime}"
									pattern="yyyy-MM-dd HH:mm" />
					</c:forEach>
				</table>

			</div>

		</div>
	</div>
	<script>
		$(document).ready(function() {
			$("img[class='likeBtn']").click(function() {
				let msgIdVal = $(this).next().val();
				let info = $(this).attr("id");
				console.log(info);
				if (info == 'likeBtn') {
					$.ajax({
						url : "LikeMsgServlet",
						type : "GET",
						dataType : "JSON",
						data : {msgId : msgIdVal, userId : ${userId}},
						success : function(data) {
							let txt = 'LIKE(' + data + ')';
							$("span[id='likeCnt']").html(txt);
							console.log("data: " + data);
							$("img[class='likeBtn']").attr("id","dislikeBtn").attr("src","${pageContext.request.contextPath}/eeit10927/images/like.png");
						}
					});
				} else {
					$.ajax({
						url : "DislikeMsgServlet",
						type : "GET",
						dataType : "JSON",
						data : {msgId : msgIdVal, userId : ${userId}},
						success : function(data) {
							let txt = 'LIKE(' + data + ')';
							$("span[id='likeCnt']").html(txt);
							console.log("data: " + data);
							$("img[class='likeBtn']").attr("id","likeBtn").attr("src","${pageContext.request.contextPath}/eeit10927/images/dislike.png");
						}
					});
				}
			});
		});
		
	</script>
</body>
</html>