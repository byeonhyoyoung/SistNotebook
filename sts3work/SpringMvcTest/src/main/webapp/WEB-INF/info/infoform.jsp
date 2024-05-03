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
<div style="widows: 50px 100px;">
		<form action="process" method="post">
			이름: <input type="text" name="name"><br>
			좋아하는 색상: <input type="text" name="color"><br>
			취미: 
			<input type="checkbox" name="hobby" value="코딩" checked>코딩
			<input type="checkbox" name="hobby" value="게임">게임
			<input type="checkbox" name="hobby" value="독서">독서
			<input type="checkbox" name="hobby" value="여행">여행
			<input type="checkbox" name="hobby" value="음악감상">음악감상<br>
			가장 재미있는 언어: 
			<select name="language">
			<option value="java">java</option>
			<option value="html">html</option>
			<option value="ajax">ajax</option>
			<option value="spring">spring</option>
			</select><br>
			<input type="submit" value="저장" class="btn btn-success" style="text-align: center;">
		</form>
	</div>
</body>
</html>