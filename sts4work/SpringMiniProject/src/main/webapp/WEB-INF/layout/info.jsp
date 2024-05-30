<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<body>
	<i class="bi bi-envelope-check-fill"></i> &nbsp;hyoyoung@gmail.com<br>
	<i class="bi bi-headset"></i>&nbsp;02-123-1212<br>
	<i class="bi bi-house-add-fill"></i>&nbsp;서울시 강남구<br>&nbsp;&nbsp;&nbsp;&nbsp;역삼동 한독빌딩<br>
	
	<!-- 로그아웃상태에서는 기본이미지 로그인상태는 로그인한이미지 나오게 -->
	<c:if test="${sessionScope.loginok==null }">
		<img alt="" src="${root }/image/actor.jpg" width="130" height="130"
		style="border-radius: 100px;">
	</c:if>
	
	<c:if test="${sessionScope.loginok!=null }">
		<img alt="" src="${root }/memberphoto/${sessionScope.loginphoto}" width="130" height="130"
		style="border-radius: 100px;"> <!--logincontroller에서 뭐라고 저장했는지 확인.. loginphoto -->
	</c:if>
</body>
</html>