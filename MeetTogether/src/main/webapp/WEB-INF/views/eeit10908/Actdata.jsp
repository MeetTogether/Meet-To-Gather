<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.ArrayList ,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>員工資料</title>

<link
	href='${pageContext.request.contextPath}/assets/css/bootstrap.min.css'
	rel='stylesheet' media="screen">
<link
	href='${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.min.css'
	rel='stylesheet' media="screen">


<style>
body {
	background: -webkit-radial-gradient(circle, white, burlywood);
	background: -o-radial-gradient(circle, white, burlywood);
	background: -moz-radial-gradient(circle, white, burlywood);
	background: radial-gradient(circle, white, burlywood);
}
</style>


</head>
<body>
	<a href='/'><input type="button" value="返回"></a>
	<div align="center">
		<h2>活 動 資 訊</h2>
		<form:form method="post" modelAttribute="actdata">
			<table border="1">
				<tr>
					<td>活動編號
					<td><form:input type="text" path="eventId" value="${actdata.eventId}" />
						<p>
				<tr>
					<td>主辦人編號:
					<td><form:input type="text" path="memberId" value="${actdata.memberId}" />
						<p>
				<tr>
					<td>活動名稱:
					<td><form:input type="text" path="eventName" value="${actdata.eventName}"/>
						<p>
				<tr>
					<td>活動類型:
					<td><form:select path="eventCat">
							<form:option value="-1" label="${actdata.catbean.eventClass}" />
							<form:options items="${catList}" />
						</form:select>
				<tr>
					<td>活動開始時間:
					<td width="100%">

						<div class="input-group date form_datetime col-md-5"
							data-date="2019-11-04T15:25:07Z"
							data-date-format="yyyy-mm-dd - HH:ii p"
							data-link-field="dtp_input1">
							<form:input class="form-control" type="text" path="eventTime" 
							value="${actdata.eventTime}" />
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-remove"></span></span> <span
								class="input-group-addon"><span
								class="glyphicon glyphicon-th"></span></span>
						</div>
				<tr>
					<td>活動參與人數:
					<td><form:input type="text" path="groupNum" value="${actdata.groupNum}" />
						<p>
				<tr>
					<td>預算:
					<td><form:input type="text" path="budget" value="${actdata.budget}"/>
						<p>
				<tr>
					<td>活動地點:
					<td><form:input type="text" path="eventPlace" value="${actdata.eventPlace}"/>
						<p>
				<tr>
					<td>創立時間:
					<td><form:input type="text" path="createTime" value="${actdata.createTime}"/>
						<p>
			</table>
			<input type="submit" value="送出" />
		</form:form>

	</div>

	<script
		src="${pageContext.request.contextPath}/assets/jquery/jquery-1.8.3.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.js"
		charset="UTF-8"></script>
	<script
		src="${pageContext.request.contextPath}/assets/locales/bootstrap-datetimepicker.fr.js"
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