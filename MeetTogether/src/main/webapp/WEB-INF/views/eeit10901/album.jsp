<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
    href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>album</title>

</head>
<body>
    <section>
        <div>
            <div class="container" style="text-align: center" >
                <h1>個人相簿</h1>
            </div>
        </div>
    </section>
    <c:forEach items="${userList}" var="userList" >

	<!--拼接圖片回顯的的URL-->
	<img  src="${pageContext.request.contextPath }/${userList.image}"><br>
</c:forEach>
</body>
</html>
    