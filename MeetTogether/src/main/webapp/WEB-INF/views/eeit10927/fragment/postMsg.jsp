<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div id="Postbox">
	<form:form method="post" action="./PostServlet" enctype="multipart/form-data" id="postForm" modelAttribute="messageBean">
		<form:input type="hidden" path="mbId" value="${userId}" />
		<table>
			<tr>
				<td>文章分類
				<form:select path="mtId" style="width: 300px">
					<form:options items="${msgType}" />
				</form:select>
			<tr>
				<td>文章標題
				<td><form:input type="text" name="msgTitle" id="msgTitle" path="msgTitle" size="110em" autocomplete="off" />
			<tr>
				<td>文章內容
				<td><form:textarea rows="7em" cols="100em" name="msgText" id="msgText" path="msgText" />
			<tr>
				<td>上傳照片
				<td><form:input type="file" name="msgImage" id="msgImage" path="msgImage" />
		</table>
		<input type="submit" value="發文" name="post" id="post" />
		<input type="reset" value="清空" name="cancel" id="cancel" />
	</form:form>
</div>