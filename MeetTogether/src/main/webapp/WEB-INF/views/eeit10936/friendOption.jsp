<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function() {
		formA = document.getElementById("formA");
		if(document.getElementById("deleteFriends")){
			document.getElementById("deleteFriends").addEventListener("click",
					function() {
						formA.action = "${pageContext.request.contextPath}/del";
						formA.submit();

					});
		}
		if(document.getElementById("inviteFriendStatus")){
			document.getElementById("inviteFriendStatus").addEventListener("click",
					function() {
						formA.action = "";
						formA.submit();
					});
			
		}
		if(document.getElementById("sure")){
			document.getElementById("sure").addEventListener("click", function() {
				document.getElementById("sureOrRefuse").value="1";
				formA.action = "${pageContext.request.contextPath}/response";
				formA.submit();
			});
		}
		if(document.getElementById("refuse")){
			document.getElementById("refuse").addEventListener("click", function() {
				document.getElementById("sureOrRefuse").value="2";
				formA.action = "${pageContext.request.contextPath}/response";
				formA.submit();
			});
		}
		if(document.getElementById("add")){
			document.getElementById("add").addEventListener("click", function() {
				formA.action = "${pageContext.request.contextPath}/invite";
				console.log("${pageContext.request.contextPath}");

				formA.submit();
			});
		}
		
	})
</script>
</head>
<body>
	<c:choose>
		<c:when test="${member.memberId == userId}">

		</c:when>
		<c:otherwise>

			<form action="" id="formA" method="get">
				<input type="hidden" value="${member.memberId}" name="fid"/>
				<c:choose>
					<c:when test="${friendStatus }">
						<input type="button" value="刪除好友" id="deleteFriends">
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${addFriendsAlready }">
								<input type="button" value="已送出好友邀請" id="inviteFriendStatus" />
							</c:when>
							<c:when test="${responseYet }">
								<input type="hidden" value="1" id="sureOrRefuse" name="sureOrRefuse">
								<input type="button" value="確定" id="sure">
								<input type="button" value="拒絕" id="refuse">
							</c:when>
							<c:otherwise>
								<input type="button" value="邀請好友" id="add">
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</form>
		</c:otherwise>
	</c:choose>


</body>
</html>