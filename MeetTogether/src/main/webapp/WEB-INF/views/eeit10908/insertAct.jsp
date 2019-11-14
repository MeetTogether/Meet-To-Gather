<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.ArrayList ,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>員工資料</title>
<!--   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
<!--   <link rel="stylesheet" href="/resources/demos/style.css"> -->
<!--   <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<!--   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->

<link
	href='${pageContext.request.contextPath}/eeit10908/assets/css/bootstrap.min.css'
	rel='stylesheet' media="screen">
<link
	href='${pageContext.request.contextPath}/eeit10908/assets/css/bootstrap-datetimepicker.min.css'
	rel='stylesheet' media="screen">


<style>
body {
	background: -webkit-radial-gradient(circle, white, burlywood);
	background: -o-radial-gradient(circle, white, burlywood);
	background: -moz-radial-gradient(circle, white, burlywood);
	background: radial-gradient(circle, white, burlywood);
}
</style>

<script>
	function getTodayDate() {
		var fullDate = new Date();
		var yyyy = fullDate.getFullYear();
		var MM = (fullDate.getMonth() + 1) >= 10 ? (fullDate.getMonth() + 1)
				: ("0" + (fullDate.getMonth() + 1));
		var dd = fullDate.getDate() < 10 ? ("0" + fullDate.getDate())
				: fullDate.getDate();
		var hh = fullDate.getHours() < 10 ? ("0" + fullDate.getHours())
				: fullDate.getHours();
		var mm = fullDate.getMinutes() < 10 ? ("0" + fullDate.getMinutes())
				: fullDate.getMinutes();
		var today = yyyy + "/" + MM + "/" + dd + "," + hh + ":" + mm;
		var elem = document.getElementById("create");
		elem.value = today;
		return today;
	}
</script>


</head>
<body onload="getTodayDate()">
	<a href='/MeetTogether/eeit10908'><input type="button" value="返回"></a>
	<div align="center">
		<h2>活動發起</h2>
		<form:form method="post" 
			modelAttribute="actBean" enctype="multipart/form-data">
			<table border="1">
				<tr>
					<td>主辦人編號:
					<td><form:input type="text" path="memberId" />
					<p>
				<tr>
					<td>活動名稱:
					<td><form:input type="text" path="eventName"  />
					<p>
				<tr>
					<td>活動類型:
					<td><form:select path="eventCat">
							<form:option value="-1" label="請選擇" />
							<form:options items="${catList}" />
						</form:select>
				<tr>
					<td>活動內容:
					<td><form:input type="textarea" path="actContent"  style="width:300px;height:100px;"/>
					<p>
				<tr>
					<td>活動開始時間:
					<td width="100%">

						<div class="input-group date form_datetime col-md-5"
							data-date="2019-11-04T15:25:07Z"
							data-date-format="yyyy-mm-dd - HH:ii p"
							data-link-field="dtp_input1">
							<form:input class="form-control" type="text" path="eventTime"  />
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-remove"></span></span> <span
								class="input-group-addon"><span
								class="glyphicon glyphicon-th"></span></span>
						</div> 
				<tr>
					<td>活動參與人數:
					<td><form:input type="text" path="groupNum" value="" />
					<p>
				<tr>
					<td>預算:
					<td><form:input type="text" path="budget"  />
					<p>
				<tr>
					<td>活動地點:
					<td><form:input type="text" path="eventPlace" />
					<p>
				<tr>
					<td>活動建立時間:
					<td><form:input type="text" path="createTime" id="create" />
				<tr>
					<td>活動圖片:
					<td><form:input type="file" path="actImage" value="新增圖片" />
				
			</table>
			<input type="submit" value="送出" />
		</form:form>

	</div>

	<script	src="${pageContext.request.contextPath}/eeit10908/assets/jquery/jquery-1.8.3.min.js"></script>
	
	<script
		src="${pageContext.request.contextPath}/eeit10908/assets/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/eeit10908/assets/css/bootstrap-datetimepicker.js"
		charset="UTF-8"></script>
	<script
		src="${pageContext.request.contextPath}/eeit10908/assets/locales/bootstrap-datetimepicker.fr.js"
		charset="UTF-8"></script>
	<script type="text/javascript">
		$('.form_datetime').datetimepicker({
			//language:  'fr',
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			forceParse : 0,
			showMeridian : 1
		});
	</script>
</body>
</html>