<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>留言區</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script>
	$(document).ready(function() {
		$("#Postbox").hide();
		$("#Postbutton").click(function() {
			$("#Postbox").toggle("blind"); /* 展開發文表單 */
			$('html,body').animate({
				scrollTop : 0
			}); /* 返回到頁面頂端 */
		});
		$("#ViewMyPost").click(function() {
			top.location.href = "${pageContext.request.contextPath}/GetUserPostServlet?memberId=${userId}";
		});
		$("#ViewAllPost").click(function() {
			top.location.href = "${pageContext.request.contextPath}/GetAllPostServlet";
		});
		$("#SearchField").hide();
		$("#SearchPost").click(function() {
			$(this).next().toggle();
		});
		$("#Search").click(function() {
			top.location.href = "${pageContext.request.contextPath}/SearchPostServlet";
		});
		$(".expandText").hide();
		$("input.showAllText").click(function() {
			if ($(this).val() == "Open") {
				$(this).parent().parent().next().show();
				$(this).attr("value", "Close");
			} else {
				$(this).parent().parent().next().hide();
				$(this).attr("value", "Open");
			}
		});
		$("input#deletePost").click(function() {
			var c = confirm('是否確認刪除');
			if (c) {
				$(this).parent("form#deletePostForm").submit();
			} else {
				;
			}
		});
	});
</script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/eeit10927/styles/top.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/eeit10927/styles/forum.css">
<style>
input[type=submit] {
	width: 60px;
	background-color: #2894ff;
	color: white;
	padding: 8px 8px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #84c1ff;
}
</style>
</head>
<body>
	<div id="allpage">
		<div>
			<header id="top">
				<jsp:include page="../fragment/top.jsp" />
				<button id="Postbutton">Post</button>
				<button id="ViewAllPost">View All Post</button>
				<button id="ViewMyPost">View My Post</button>
				<button id="SearchPost">Search</button>
				<div id="SearchField" style='display: inline-block; height: 30px;'>
					<form method="post" action="./SearchPostServlet">
						<input type="text" style='height: 2.1em;' name="queryString" id="queryString" placeholder="search post..." autocomplete="off" />
						<input type="image" src="${pageContext.request.contextPath}/eeit10927/images/search.png" id="Search" style="height: 20px;" />
					</form>
				</div>
			</header>
		</div>
		<div id="content">
 			<jsp:include page="../fragment/postMsg_bak.jsp"/>
			<div id="ViewPost">
				<c:forEach items="${msgBeans}" var="msgBean" varStatus="cnt">
					<c:set var="count" value="${cnt.count}" scope="request" />
				</c:forEach>
				<c:if test="${empty totalCnt}">
					<div align="center">
						<h4>查無資料</h4>
					</div>
				</c:if>
				<c:if test="${!empty totalCnt}">
					<div align="right">
						<h4>共有${totalCnt}筆資料</h4>
					</div>
				</c:if>
				<c:if test="${pageNo > 1 }">
					<span>
						<a href="<c:url value='/DisplayPageMessage?pageNo=1' />">第一頁&nbsp</a>
					</span>
					<span>
						<a href="<c:url value='/DisplayPageMessage?pageNo=${pageNo-1}' />">上一頁&nbsp</a>
					</span>
				</c:if>
				<c:if test="${pageNo != totalPages }">
					<span>
						<a href="<c:url value='/DisplayPageMessage?pageNo=${pageNo+1}' />">下一頁&nbsp</a>
					</span>
					<span>
						<a href="<c:url value='/DisplayPageMessage?pageNo=${totalPages}' />">最末頁&nbsp</a>
					</span>
				</c:if>
				<c:if test="${param.pageNo eq null }">
					<c:set var="pageNo" value="1" />
				</c:if>
				<span>第${pageNo}頁/ 共${totalPages }頁
				</span>
				<a href="${pageContext.request.contextPath}/SearchPostByType">以分類查詢</a>
				<c:forEach items="${msgBeans}" var="msgBean" varStatus="cnt">
					<table class="aPost">
						<c:set var="mId" value="${msgBean.member.memberId}" />
						<tr>
							<td rowspan="5" width="15%" class="accPhoto"><font color="#4E96CC">
								<a href="${pageContext.request.contextPath}/GetUserPostServlet?memberId=${msgBean.member.memberId}">${msgBean.member.memberName}</a></font><br>
								<a href="${pageContext.request.contextPath}/GetUserPostServlet?memberId=${msgBean.member.memberId}"><img height='60' src='${pageContext.request.contextPath}/getImage?type=member&id=${msgBean.member.memberId}'></a>
								<br>
								<c:if test="${userId eq mId}">
									<form:form method="GET" action="${pageContext.request.contextPath}/ViewPostServlet" style='display: inline;' modelAttribute="messageBean">
										<form:input type="hidden" value="${msgBean.msgId}" path="msgId" />
										<input type="submit" value="修改" class="modifyPost" />
									</form:form>
									<form:form method="post" action="${pageContext.request.contextPath}/DeletePostServlet" style="display: inline;" modelAttribute="messageBean">
										<form:input type="hidden" value="${msgBean.msgId}" path="msgId" />
										<input type="submit" value="刪除" class="modifyPost" id="deletePost">
									</form:form>
								</c:if>
							<td rowspan="5" width="1%">
							<td width="12%">#${msgBean.msgId}
							<td>發文：<fmt:formatDate value="${msgBean.createTime}" pattern="yyyy-MM-dd HH:mm" />
								<c:if test="${msgBean.updateTime ne null}">
								; 更新：<fmt:formatDate value="${msgBean.updateTime}" pattern="yyyy-MM-dd HH:mm" />
								</c:if>
							<td><a href='${pageContext.request.contextPath}/GetAllReMsgServlet?msgId=${msgBean.msgId}'>
								<img src="${pageContext.request.contextPath}/eeit10927/images/pencil.png" class="replyBtn">REPLY(${msgBean.replyCount})</a>
								<c:set var="done" value="false" />
								<c:forEach items="${mlBeans}" var="mlBean">
									<c:if test="${mlBean.message.msgId eq msgBean.msgId}">
										<c:set var="done" value="true" />
									</c:if>
								</c:forEach>
								<c:choose>
									<c:when test="${!done}">
										<img
											src="${pageContext.request.contextPath}/eeit10927/images/dislike.png"
											id="likeBtn" class="likeBtn">
									</c:when>
									<c:otherwise>
										<img
											src="${pageContext.request.contextPath}/eeit10927/images/like.png"
											id="dislikeBtn" class="likeBtn">
									</c:otherwise>
								</c:choose>
								<input type="hidden" id="msgId" value="${msgBean.msgId}">
								<span id="likeCnt${cnt.count}">LIKE(${msgBean.likeCount})</span>
						<tr>
							<td>文章分類
							<td colspan="4">${msgBean.msgType.typeName}
						<tr>
							<td>文章標題
							<td width="50%">${msgBean.msgTitle}
							<td align="right"><input type="button" class="showAllText"
								value="Open">
						<tr class="expandText">
							<td>文章內容
							<td colspan="2">${msgBean.msgText}<br>
								<c:if test="${msgBean.msgPhoto ne null}">
									<img height='200px' src='${pageContext.request.contextPath}/getImage?type=message&id=${msgBean.msgId}'>
								</c:if>
						<%-- <tr>
							<td>
							<td><c:forEach items="${reBeans}" var="reBean">
									<div class="replyMsgPic">
										<img src='${pageContext.request.contextPath}/getImage?type=member&id=${reBean.mEmail}'>
									</div>${reBean.replyText}
								</c:forEach> --%>
					</table>
				</c:forEach>

			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			let imgs = document.getElementsByClassName("likeBtn");
			for (let i = 0; i < imgs.length; i++) {
				let imgId = 'likeBtn' + i;
				$(imgs[i]).click(function() {
					let msgIdVal = $(this).next().val();
					let spanId = 'likeCnt' + (i + 1);
					console.log('msgIdVal:' + msgIdVal + ', spanId:' + spanId + ', userId:' + ${userId});
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
								let txt2 = 'span[id=' + spanId + ']';
								$(txt2).html(txt);
								console.log("data: " + data);
								$(imgs[i]).attr("id","dislikeBtn").attr("src","${pageContext.request.contextPath}/eeit10927/images/like.png");
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
								let txt2 = 'span[id=' + spanId + ']';
								$(txt2).html(txt);
								console.log("data: " + data);
								$(imgs[i]).attr("id","likeBtn").attr("src","${pageContext.request.contextPath}/eeit10927/images/dislike.png");
							}
						});
					}
					
				});
			}
		});
		
	</script>
</body>
</html>