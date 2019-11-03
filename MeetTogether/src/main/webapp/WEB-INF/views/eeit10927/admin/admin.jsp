<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者權限</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
			top.location.href = "./GetUserPostServlet";
		});
		$("#ViewAllPost").click(function() {
			top.location.href = "./GetAllPostServlet";
		});
		$("#ViewAllUser").click(function() {
			top.location.href = "./GetAllUserServlet";
		});
		$("#SearchField").hide();
		$("#SearchPost").click(function() {
			$(this).next().toggle();
		});
		$("#Search").click(function() {
			top.location.href = "./SearchPostServlet";
		});
		$(".extraText").hide();
		$("input#openExtraText").click(function() {
			if ($(this).val() == "展開") {
				$(this).parent().parent().next().show();
				$(this).attr("value", "收合");
			} else {
				$(this).parent().parent().next().hide();
				$(this).attr("value", "展開");
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
		$("input#renewPost").click(function() {
			var c = confirm('是否確認還原');
			if (c) {
				$(this).parent("form#renewPostForm").submit();
			} else {
				;
			}
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
				<jsp:include page="<c:url value='/eeit10927/fragment/top.jsp' />" />
				<button id="Postbutton">Post</button>
				<button id="ViewAllPost">View All Post</button>
				<button id="ViewAllUser">View All User</button>
				<button id="SearchPost">Search</button>
				<div id="SearchField" style="display: inline-block; height: 30px;">
					<form method="post" action="./SearchPostServlet">
						<input type="text" style="height: 2.1em;" name="SearchBar"
							placeholder="search post..." autocomplete="off"><input
							type="image" style="height: 20px;"
							src="${pageContext.request.contextPath}/eeit10927/images/search.png" id="Search">
					</form>
				</div>
			</header>
		</div>
		<div id="content">
			<jsp:include page="<c:url value='/fragment/post.jsp' />" />
			<div id="ViewPost">
				<c:forEach items="${msgBeans}" var="msgBean" varStatus="cnt">
					<c:set var="count" value="${cnt.count}" scope="request" />
				</c:forEach>
				<c:if test="${empty count}">
					<div align="center">
						<h4>查無資料</h4>
						<br>
					</div>
				</c:if>
				<c:if test="${!empty count}">
					<div align="right">
						<h4>共有${count}筆資料</h4>
					</div>
				</c:if>
				<table class="aPost" border='1'>
					<tr>
						<th>No.
						<th>發文者
						<th>文章分類
						<th>文章標題
						<th>發文/更新時間
						<th>被刪除
						<th>修改
						<th>刪除
						<th>還原
						<th>展開
					</tr>
					<c:forEach items="${msgBeans}" var="msgBean" varStatus="cnt">
						<c:forEach items="${mBeans}" var="mBean" begin="${cnt.index}"
							end="${cnt.index}">
							<tr id="openNextRow">
								<td>#${msgBean.msgId}
								<td><a
									href="${pageContext.request.contextPath}/GetUserPostServlet?mEmail=${mBean.mEmail}">${mBean.mNickname}</a>
								<td>${msgBean.msgType}
								<td>${msgBean.msgTitle}
								<td><fmt:formatDate value="${msgBean.createTime}"
										pattern="yyyy-MM-dd HH:mm" /><br> <fmt:formatDate
										value="${msgBean.updateTime}" pattern="yyyy-MM-dd HH:mm" />
								<td>${msgBean.deleteTag}
								<td>
									<form method="post" action="<c:url value='/ViewPostServlet' />">
										<input type="hidden" value="${msgBean.msgId}" name="msgId">
										<input type="submit" value="修改" class="modifyPost">
									</form>
								<td>
									<form method="post" action="<c:url value='/DeletePostServlet' />" id="deletePostForm">
										<input type="hidden" value="${msgBean.msgId}" name="msgId">
										<input type="button" value="刪除" class="modifyPost"
											id="deletePost">
									</form>
								<td>
									<form method="post"
										action="<c:url value='/RenewPostServlet' />"
										id="renewPostForm">
										<input type="hidden" value="${msgBean.msgId}" name="msgId">
										<input type="button" value="還原" class="modifyPost"
											id="renewPost">
									</form>
								<td><input type="button" value="展開" class="modifyPost"
									id="openExtraText">
							<tr class="extraText">
								<td colspan="6" style="text-align: left;">${msgBean.msgText}
								<td colspan="4"><c:if test="${msgBean.msgPhoto ne null}">
										<img height='120px' class="photoshow"
											src='${pageContext.request.contextPath}/getImage?id=${msgBean.msgId}&type=message'>
									</c:if>
						</c:forEach>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>