<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
var formA =document.getElementById("formA");
	document.addEventListener("DOMContentLoaded", function() {
		document.getElementById("deleteFriends").addEventListener("click",
				function() {
					formA.action="";
					formA.submit();

				});
		document.getElementById("inviteFriend").addEventListener("click",
				function() {
					formA.action="";
					formA.submit();
				});
		document.getElementById("sure").addEventListener("click",
				function() {
					formA.action="";
					formA.submit();
				});
		document.getElementById("refuse").addEventListener("click",
				function() {
					formA.action="";
					formA.submit();
				});
	})
</script>
</head>
<body>





	<form action="" id="formA">
		<c:choose>
			<c:when test="${friendStatus }">
				<input type="button" value="刪除好友" id="deleteFriends">
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${addFriendsAlready }">
						<input type="button" value="已送出好友邀請" id="inviteFriend" />
					</c:when>
					<c:when test="${responseYet }">
						<input type="hidden" value="1" id="sureValue">
						<input type="hidden" value="2" id="refuseValue">
						<input type="button" value="確定" id="sure">
						<input type="button" value="拒絕" id="refuse">
					</c:when>
				</c:choose>
			</c:otherwise>
		</c:choose>
	</form>



</body>
</html>