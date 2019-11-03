<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		$("input#deleteAcc").click(function() {
			var c = confirm('是否確認刪除');
			if (c) {
				$(this).parent("form#deleteAccForm").submit();
			} else {
				;
			}
		});
		$("input#renewAcc").click(function() {
			var c = confirm('是否確認還原');
			if (c) {
				$(this).parent("form#renewAccForm").submit();
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
						<input type="text" style="height: 2.1em;" name="SearchBar" placeholder="search post..." autocomplete="off"><input
							type="image" style="height: 20px;" src="${pageContext.request.contextPath}/eeit10927/images/search.png"
							id="Search">
					</form>
				</div>
			</header>
		</div>
		<div id="content">
			<jsp:include page="<c:url value='/eeit10927/fragment/post.jsp' />" />
			<div id="ViewPost">
				<c:forEach items="${mBeans}" var="mBean" varStatus="cnt">
					<c:set var="count" value="${cnt.count}" scope="request" />
				</c:forEach>
				<c:if test="${empty count}">
					<div align="center">
						<h4>查無資料</h4><br>
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
						<th>帳號
						<th>暱稱
						<th>照片
						<th>註冊時間
						<th>被刪除
						<th>修改
						<th>刪除
						<th>還原
					</tr>
					<c:forEach items="${mBeans}" var="mBean">
						<tr>
							<td>#${mBean.mId}
							<td><a href="${pageContext.request.contextPath}/GetUserPostServlet?mEmail=${mBean.mEmail}">${mBean.mEmail}</a>
							<td><a href="${pageContext.request.contextPath}/GetUserPostServlet?mEmail=${mBean.mEmail}">${mBean.mNickname}</a>
							<td><img height='40px' style="padding-top: 15px"
								src='${pageContext.request.contextPath}/getImage?id=${mBean.mEmail}&type=member'>
							<td><fmt:formatDate value="${mBean.createTime}" pattern="yyyy-MM-dd HH:mm" />
							<td>${mBean.deleteTag}
							<td>
								<form method="post" action="<c:url value='/ViewUserServlet' />">
									<input type="hidden" value="${mBean.mId}" name="mId">
									<input type="submit" value="修改" class="modifyPost">
								</form>
							<td>
								<form method="post" action="<c:url value='/DeleteUserServlet' />" id="deleteAccForm">
									<input type="hidden" value="${mBean.mId}" name="mId">
									<input type="button" value="刪除" class="modifyPost" id="deleteAcc">
								</form>
							<td>
								<form method="post"
									action="<c:url value='/RenewUserServlet' />" id="renewAccForm">
									<input type="hidden" value="${mBean.mId}" name="mId">
									<input type="button" value="還原" class="modifyPost" id="renewAcc">
								</form>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>