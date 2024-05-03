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
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<h2 class="alert alert-info">결과 출력</h2>
	&nbsp;이름: ${name }<br>
	&nbsp;좋아하는 색상: ${color }<br>
	&nbsp;취미: 
	<c:choose>
        <c:when test="${empty hobby}">없음</c:when>
        <c:otherwise>${hobby}</c:otherwise>
    </c:choose><br>
	&nbsp;가장 재미있는 언어: ${language }<br>
</body>
</html>