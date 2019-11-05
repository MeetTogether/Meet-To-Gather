<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<ul id="menu">
	<li><c:if test="${!empty userId}">
			<span>Hi, ${userName}</span>
		</c:if></li>

	<li><c:if test="${!empty userId}">
			<img id="thumb"
				src='${pageContext.request.contextPath}/getImage?type=member&id=${userId}'>
		</c:if></li>

	<li class="toplink"><c:if test="${!empty userId}">
			<a href="<c:url value='/GetAllPostServlet' />">留言板</a>
		</c:if></li>
	
	<li class="toplink"><c:if test="${admin eq '1'}">
			<a href="<c:url value='/GetAllPostServlet' />">管理者權限</a>
		</c:if></li>


	<li class="toplink"><c:if test="${!empty userId}">
			<a href="<c:url value='/LogoutServlet' />">登出</a>
		</c:if></li>

</ul>