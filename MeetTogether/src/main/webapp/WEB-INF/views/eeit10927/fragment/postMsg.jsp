<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script type="text/javascript">
function oneClickData() {
	document.getElementById("msgTitle").value="走到「像家人」這步就等於結婚的信號嗎？";
	document.getElementById("msgText").value="最近身邊有對朋友，是也談蠻久的了啦\n" 
			+ "大學畢業到現在可能也有個10年了\n女孩的青春等於都給男孩了\n這對也真的就像家人一樣\n該做的都做了該見的也見了\n"
			+ "最近一起出來聚，就聊到他們\n大家一致覺得(除了我)\n都這麼像家人了，下一步就是結婚了啊\n可是我倒覺得，走到像家人這步\n"
			+ "那不就等於沒熱情了嗎？\n不也有很多案例\n是太像家人了，所以分手的？\n所以想請問一下，走到「像家人」這步\n真的就是結婚的信號嗎？";
}
</script>
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
				<script type="text/javascript">
				jQueryConflict = $.noConflict();
				function getTag(myObj) {
					jQueryConflict(myObj).autocomplete({
						source: function(request, response) {
							jQueryConflict.ajax({
								url:"getMsgtagByQuery",
								dataType:"JSON",
								data:{tagQuery:request.term},
								success:function(data) {
									console.log('data: ' + data);
									response(data);
								}
							});
						},
						minLength:0,
						select: function(event,ui) {
							jQueryConflict(myObj).val(ui.item);
			            }
			        });
				}
				</script>
				<td><div class="input_fields_wrap">
						<div><form:input type="text" path="msgTagName" placeholder="#tag here" class="input_tag" onclick="getTag(this)" autocomplete="off" />&ensp;&ensp;<button class="add_field_button">增加標籤</button></div>
					</div>
				<script type="text/javascript">
				jQueryConflict(document).ready(function() {
						var max_fields = 5;
						var wrapper = jQueryConflict(".input_fields_wrap");
						var add_button = jQueryConflict(".add_field_button");
						
						let x = 1;
						jQueryConflict(add_button).click(function(e) {
							e.preventDefault();
							if (x < max_fields) {
								x++;
								let inputId = 'msgTagName' + x.toString();
								console.log('inputId: ' + inputId);
								var appendContent = '<div><form:input type="text" path="msgTagName" placeholder="#tag here" class="input_tag" onclick="getTag(this)" autocomplete="off" />&ensp;&ensp;<a href="#" class="remove_field"><span class="icon-remove"></span></a></div>';
								jQueryConflict(wrapper).append(appendContent);
							}
						});
						jQueryConflict(wrapper).on("click", ".remove_field", function(e) {
							e.preventDefault(); jQueryConflict(this).parent('div').remove(); x--;
						});
						
						
						/* let tags = document.getElementsByClassName("input_tag");
						for (let t = 0; t < tags.length; t++) {
							jQueryConflict(tags[t]).on("focus", function() {
								jQueryConflict(tags[t]).autocomplete({
									source: function(request, response) {
										jQueryConflict.ajax({
											url:"getMsgtagByQuery",
											dataType:"JSON",
											data:{tagQuery:request.term},
											success:function(data) {
												console.log('data: ' + data);
												response(data);
											}
										});
									},
									minLength:1,
									select: function(event,ui) {
										jQueryConflict(tags[t]).val(ui.item);
						            }
						        });
							});
						} */
					});
// 						參考網址: https://dotblogs.com.tw/peterkyo/2019/02/26/100805
						
				</script>
			
		</table>
		<br>
		<input type="submit" value="發文" name="post" id="post"
			class="reply" />
		<input type="reset" value="清空" name="cancel" id="cancel"
			class="reply" />
		<button type="button" class="reply" onclick="oneClickData()">快速輸入</button>
	</form:form>
	<hr>
	<br>
</div>