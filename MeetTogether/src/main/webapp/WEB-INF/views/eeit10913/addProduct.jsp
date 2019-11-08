<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<style type="text/css">
fieldset {
	border: 1px solid rgb(255, 232, 57);
	width: 600px;
	margin: auto;
}

textarea {
	resize: none;
}

body {
	font-family: 微軟正黑體;
	background-color: #f5f5f5;
	margin-top: 3%;
}
.msgWrong {
	color: red;
}


</style>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
$(document).ready(function() {
	$("#eventComment").blur(checkEmptyE);
});
let flag = 0;
let errorMsg = "<span class='msgWrong'>不可空白</span>";
function checkEmptyE() {
	if($("#eventComment").val()=="") {
		$("#msg_eventComment").empty().append(errorMsg).focus();
		flag += 1;
	} else { 
		$("#msg_eventComment").empty();
		flag = 0;
	}
}



</script>
<title>Products</title>
</head>
<body>
	<section>
		<div class="container">
			<h1 style="text-align: center">評論此活動</h1>
		</div>
	</section>
	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;">
	<section class="container">
		<!--       三個地方要完全一樣  -->
		<form:form method='POST' modelAttribute="reviewBean"
			class='form-horizontal'>
			<fieldset>
<!-- 				<div class="form-group"> -->
<%-- 					<form:input id="eventId" path="reviewId" type='hidden' --%>
<%-- 						class='form:input-large' /> --%>
<!-- 				</div> -->

<!-- 				<div class="form-group"> -->
<%-- 					<form:input id="userId" path="memberId" value="${userId}" --%>
<%-- 						type='hidden' class='form:input-large' /> --%>
<!-- 				</div> -->

<!-- 				<div class="form-group"> -->
<!-- 					<label class="control-label col-lg-2 col-lg-2" for='eventName'> -->
<!-- 						活動名 </label> -->
<!-- 					<div class="col-lg-10"> -->
<%-- 						<form:input id="title" path="eventId" type='text' --%>
<%-- 							class='form:input-large' /> --%>
<!-- 					</div> -->
<!-- 				</div> -->


<!-- 				<div class="form-group"> -->
<!-- 					<label class='control-label col-lg-2 col-lg-2' for="eventImage"> -->
<!-- 						活動照片 </label> -->
<!-- 					<div class='col-lg-10'> -->
<%-- 						<form:input id="productImage" path="productImage" type='file' --%>
<%-- 							class='form:input-large' /> --%>
<!-- 					</div> -->
<!-- 				</div> -->


				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="comments">
						分享你的活動評論 </label>
					<div class='col-lg-10'>
						<form:textarea path="eventComment" id="eventComment" cols="50" rows="5"
							style="border: 1px black solid;"></form:textarea>
							<td><span id="msg_eventComment" class='msgWrong'></span>
					</div>

				</div>

				<div class="form-group">
					<label for="exampleFormControlSelect1"
						class='control-label col-lg-2 col-lg-2'>請選擇</label>
					<form:select width="101px" style="width:101px" path="eventStars" class="col-lg-10"
						id="exampleFormControlSelect1" name="rate">
						<form:option value="-1" label="請選擇"></form:option>
						<form:option value="1">1</form:option>
						<form:option value="2">2</form:option>
						<form:option value="3">3</form:option>
						<form:option value="4">4</form:option>
						<form:option value="5">5</form:option>
					</form:select>
				</div>

				<div class="form-group">
					<div class='col-lg-offset-2 col-lg-10'>
						<input id="btnAdd" type='submit' class='btn btn-primary'
							value="送出" />
					</div>
				</div>
			</fieldset>
		</form:form>
	</section>
</body>
</html>
