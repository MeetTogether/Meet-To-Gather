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
</style>
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
		<!--       三個地方要完全一樣 -->
		<form:form method='POST' modelAttribute="ReviewBean"
			class='form-horizontal'>
			<fieldset>
				<div class="form-group">
					
					
						<form:input id="eventId" path="eventId" type='hidden'
							class='form:input-large' />
					
				</div>
				
					<div class="form-group">
					
					
						<form:input id="userId" path="memberId" value="${userId}" type='hidden'
							class='form:input-large' />
					
				</div>
			
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='eventName'>
						活動名 </label>
					<div class="col-lg-10">
						<form:input id="title" path="title" type='text'
							class='form:input-large' />
					</div>
				</div>


				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="eventImage">
						活動照片 </label>
					<div class='col-lg-10'>
						<form:input id="productImage" path="productImage" type='file'
							class='form:input-large' />
					</div>
				</div>


				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="price">
						分享你的活動評論 </label>
					<textarea id=price cols="50" rows="5"
						style="border: 1px black solid;">
			
					</textarea>
				</div>



				<tr>
					<td>評分：<br>&nbsp;
					</td>
					<td><form:select path="hobby.id">
							<form:option value="-1" label="請挑選" />
							<form:options items="${hobbyList}" itemLabel='name'
								itemValue='id' />
						</form:select><br>&nbsp; <form:errors path="hobby" cssClass="error" /></td>
				</tr>


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
