<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>員工資料</title>
<meta name="viewport"
	content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="UTF-8">
<style>
body {
	background: -webkit-radial-gradient(ellipse, white, aqua);
	background: -o-radial-gradient(ellipse, white, aqua);
	background: -moz-radial-gradient(ellipse, white, aqua);
	background: radial-gradient(ellipse, white, aqua);
}

.btn-link {
	border: none;
	outline: none;
	background: none;
	cursor: pointer;
	color: #0000EE;
	padding: 0;
	text-decoration: underline;
	font-family: inherit;
	font-size: inherit;
}

.btn-link:active {
	color: #FF0000;
}

td {
	text-align: center;
	vertical-align: middle;
}

tr {
	text-align: center;
	vertical-align: middle;
}

th {
	text-align: center;
	vertical-align: middle;
	white-space: nowrap;
	padding: 20px;
}

thead tr th {
	position: sticky;
	top: 0; /* 列首永遠固定於上 */
}

select {
	width: auto;
	padding: 0 5%;
}

option {
	text-align: center;
}
</style>
</head>
<body>
	<a href="#bottoms">移至底端</a>
	<div align="center">
		<h2>活 動 列 表</h2>
		<form method="get" action="fuzzyquery" enctype="multipart/form-data">
			<select name="fuzzy" onchange="submit();">
				<option value="" disabled selected hidden>--請選擇活動類型--</option>
				<c:forEach items="${cats}" var="cat">
					<option value="${cat.eventclass}">${cat.eventclass}</option>
				</c:forEach>
			</select>
		</form>
		<table border="1">
			<thead class="fixedHeader">
				<tr bgcolor="#a8fefa" class="alternateRow">
					<th>活動編號
					<th>主辦人編號
					<th>活動名稱
					<th>活動類型
					<th>活動開始時間
					<th>活動參與人數
					<th>預算
					<th>活動地點
					<th>google map地點標記
					<th>活動建立時間
					<th>評價
					<th>
			</thead>
			<tbody class="scrollContent">
				<c:forEach var='acts' items="${actBeanList}">
					<tr class="" id="my_id">
						<td><a href="actdata?getId=${acts.eventId}"><button
									type="button" class="btn-link">${acts.eventId}</button></a> <%-- 					<input type="hidden" name="eventid" value="${acts.eventId}"> --%>
						<td>${acts.memberId}
						<td>${acts.eventName}
						<td>${acts.catbean.eventClass}
						<td>${acts.eventTime}
						<td>${acts.groupNum}
						<td>${acts.budget}
						<td align='center' valign="middle">${acts.eventPlace}
						<td><iframe width="400" height="250" style="border: 0"
								src="https://www.google.com/maps/embed/v1/place?key=AIzaSyA3sRUmvTTrsDvCJWhqAVC142ehRvCXiTc&q=${acts.eventPlace}">
							</iframe>
						<td>${acts.createTime}
						<td><form method="post" action="">
								<input type="submit" value="評價" /><input type="hidden"
									name="eventid" value="">
							</form>
						<td><button type="button"
								onclick="window.location.href='index/deleteActivity?getId=${acts.eventId}'">刪除</button>

							<c:set var="count" value="${s.count}"></c:set>
				</c:forEach>

			</tbody>
		</table>
		<br> <a href='addActis'><input type="button" value="新增資料"></a>
		<h3 class="bottoms">共 ${count} 項活動文章</h3>
	</div>
</body>
</html>