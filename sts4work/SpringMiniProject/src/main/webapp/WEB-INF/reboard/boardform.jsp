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
<body>
<div style="margin: 100px 100px; width: 500px;">
	<form action="insert" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${sessionScope.myid }"> <!-- id는 session에 저장해놨으니까 -->
		<input type="hidden" name="name" value="${sessionScope.loginname }">
		<input type="hidden" name="num" value="${num }"> <!-- sessionScope 말고 평상시 넘겨야하는것 5가지 -->
		<input type="hidden" name="regroup" value="${regroup }"> <!-- 넘어오는그룹이 없으면 새글 -->
		<input type="hidden" name="restep" value="${restep }"> <!-- 오름차순 정렬 -->
		<input type="hidden" name="relevel" value="${relevel }"> <!-- 들여쓰기 -->
		<input type="hidden" name="currentPage" value="${currentPage }"> <!-- 페이징있으므로 -->
		
		<!-- 폼에 입력해줄것 subject,photo,content -->
		<table class="table table-bordered">
			<tr>
				<th class="table-light" width="100">제목</th>
				<td>
					<input type="text" name="subject" class="form-control" required="required"
					value="${subject }"> <!-- ReBoardController값 가져오기 -->
				</td>
			</tr>
			<tr>
				<th class="table-light" width="100">사진</th>
				<td>
					<input type="file" name="upload" class="form-control" multiple="multiple">
				</td>
			</tr>
			<tr>
				<td colspan="2"">
					<textarea style="width: 500px; height: 150px;"
					name="content" class="form-control" required="required"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-success">저장</button>
				</td>
			</tr>
		</table>
		
	</form>
</div>
</body>
</html>