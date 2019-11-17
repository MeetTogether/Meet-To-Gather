<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath}/eeit10908/assets/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Category</title>
</head>
<body>
	<%-- <form:form method="POST" modelAttribute="msgTypeBean"
		action="./SearchPostByType">
		<form:select path="typeId" onchange="this.form.submit();">
			<form:option value="-1" label="請選擇" />
			<form:options items="${msgType}" />
		</form:select>
	</form:form> --%>
	<h3>背景原文</h3>

<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalLong" >
  			新增活動
		</button>
		<div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
 		<h5 class="modal-title" id="exampleModalLongTitle" align="center">新  增  活  動</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
         </button>
      </div>
			   
		      <div class="modal-body" style="background-color: #e7eef1;">
		      	<h3>框內</h3>
		      </div>
    </div>
  </div>
</div>

</body>
</html>