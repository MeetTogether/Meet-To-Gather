<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div id="Postbox" class="col-md-8 order-md-last ftco-animate">
	<form:form method="post" action="./PostServlet"
		enctype="multipart/form-data" id="postForm"
		modelAttribute="messageBean">
		<form:input type="hidden" path="mbId" value="${userId}" />
		<table>
			<tr>
				<td style="width:11%">文章分類
				<td><form:select path="mtId" style="width: 100%"
						class="form-control">
						<form:options items="${msgType}" />
					</form:select>
			<tr>
				<td>文章標題
				<td><form:input type="text" name="msgTitle" id="msgTitle"
						path="msgTitle" size="65%" autocomplete="off"
						class="form-control" required="required" /> <form:errors
						path="msgTitle" class="errors"></form:errors>
			<tr>
				<td>文章內容
				<td><form:textarea rows="7em" cols="65%" name="msgText"
						id="msgText" path="msgText" class="form-control"
						required="required" /> <form:errors path="msgText"
						class="errors"></form:errors>
			<tr>
				<td>上傳照片
				<td><form:input type="file" name="msgImage" id="msgImage"
						path="msgImage" class="form-control" />
			<tr>
				<td>文章標籤(最多5個)
				<td><div class="input_fields_wrap">
						<div><form:input type="text" path="msgTagName" placeholder="#tag here" class="input_tag" />&ensp;&ensp;<button class="add_field_button">增加標籤</button></div>
					</div>
				<script type="text/javascript">
				$(document).ready(function() {
						var max_fields = 5;
						var wrapper = $(".input_fields_wrap");
						var add_button = $(".add_field_button");
						
						let x = 1;
						$(add_button).click(function(e) {
							e.preventDefault();
							if (x < max_fields) {
								x++;
								$(wrapper).append('<div><form:input type="text" path="msgTagName" class="input_tag" placeholder="#tag here" />&ensp;&ensp;<a href="#" class="remove_field">Remove</a></div>');
							}
						});
						$(wrapper).on("click", ".remove_field", function(e) {
							e.preventDefault(); $(this).parent('div').remove(); x--;
						});
					});
				</script>
			
		</table>
		<br>
		<input type="submit" value="發文" name="post" id="post"
			class="reply" />
		<input type="reset" value="清空" name="cancel" id="cancel"
			class="reply" />
	</form:form>
	<hr>
	<br>
</div>