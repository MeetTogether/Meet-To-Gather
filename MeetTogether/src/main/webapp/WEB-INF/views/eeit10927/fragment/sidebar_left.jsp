<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="col-md-4 sidebar ftco-animate">
	<div class="sidebar-box ftco-animate">
		<h3 id="Postbutton" class="point">+ 發表文章</h3>
		<h3 id="ViewMyPost" class="point">+ 看自己的文章&ensp;</h3>
		<h3 id="ViewAllPost" class="point">+ 看所有文章</h3>
		<button type="button" class="reply" data-toggle="modal" data-target="#vipModalLong">升級VIP GO!</button>
	</div>
	<div class="sidebar-box ftco-animate">
		<div class="categories">
			<h3>分類查詢</h3>
			<c:forEach items="${msgType}" var="type" varStatus="typeCnt">
				<li><a href="${pageContext.request.contextPath}/SearchPostByType?typeId=${type.key}">${type.value}
					<input type="hidden" id="msgTypeId" value="${type.key}">
					<span id="msgTypeCnt${typeCnt.count}" class="msgTypeCnt">${mtc.value }</span>
				</a></li>
			</c:forEach>
		</div>
	</div>
	<div class="sidebar-box ftco-animate">
		<h3>關鍵字查詢</h3>
		<form action="./SearchPostServlet" method="GET"
			class="search-form">
			<div class="form-group">
				<span class="icon icon-search"></span> <input type="text"
					class="form-control" name="queryString" id="queryString"
					placeholder="Type a keyword" autocomplete="off">
			</div>
		</form>
	</div>
	<div class="sidebar-box ftco-animate">
		<h3>熱門文章</h3>
		<c:forEach items="${popularMsgBeans}" var="recentMsgBean">
		<div class="block-21 mb-4 d-flex">
			<a class="blog-img mr-4"
				style="background-image: url(${pageContext.request.contextPath}/getImage?type=member&id=${recentMsgBean.member.memberId});"></a>
			<div class="text">
				<h3 class="heading">
					<a href="${pageContext.request.contextPath}/GetAllReMsgServlet?msgId=${recentMsgBean.msgId}">${recentMsgBean.msgTitle }</a>
				</h3>
				<div class="meta">
					<div>
						<span class="icon-calendar"></span>${recentMsgBean.createTimeFormat}
					</div>
					<div>
						<a href="${pageContext.request.contextPath}/GetUserPostServlet?memberId=${recentMsgBean.member.memberId}"><span class="icon-person"></span>${recentMsgBean.member.memberName}</a>
					</div>
					<div>
						<a href="${pageContext.request.contextPath}/GetAllReMsgServlet?msgId=${recentMsgBean.msgId}"><span class="icon-chat"></span>${recentMsgBean.replyCount}</a>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>

	<div class="sidebar-box ftco-animate">
		<h3>Tag Cloud</h3>
		<div class="tagcloud">
			<c:forEach items="${tagCloud}" var="singleTag">
				<a href="${pageContext.request.contextPath}/getMsgByTagName?tagname=${singleTag.key}" class="tag-cloud-link">${singleTag.key}</a>
			</c:forEach>
		</div>
	</div>
</div>