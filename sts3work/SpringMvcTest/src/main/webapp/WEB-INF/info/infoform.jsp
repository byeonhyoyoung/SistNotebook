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
	<!-- action은 매핑주소 process끝에값만 주기 -->
	<form action="process" method="post"> <!-- post한글깨짐 web.xml에 encoding 추가해주기-->
		<table>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="name"><br>
				</td>
			</tr>
			
			<tr>
				<th>좋아하는 색상</th>
				<td>
					<input type="color"" name="color"><br>
				</td>
			</tr>
			
			<tr>
				<th>취미</th>
				<td>
					<input type="checkbox" name="hobby" value="코딩" checked>코딩
					<input type="checkbox" name="hobby" value="게임">게임
					<input type="checkbox" name="hobby" value="독서">독서
					<input type="checkbox" name="hobby" value="여행">여행
					<input type="checkbox" name="hobby" value="음악감상">음악감상<br>
				</td>
			</tr>
			
			<tr>
				<th>가장 재미있는 언어</th>
				<td>
					<select name="language">
						<option value="Java">Java</option>
						<option value="Html">Html</option>
						<option value="Ajax">Ajax</option>
						<option value="Spring">Spring</option>
					</select><br>
				</td>
			</tr>
	
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-success">서버에 전송</button>
				</td>
			</tr>	
		
		</table>
	</form>

</body>
</html>