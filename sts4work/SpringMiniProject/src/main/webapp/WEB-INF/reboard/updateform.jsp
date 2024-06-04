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
<div style="margin: 100px 100px;">
	<form action="update" method="post" enctype="multipart/form-data">
		<input type="hidden" name="num" value="${dto.num }">
		<input type="hidden" name="currentPage" value="${currentPage }">
		
		<table class="table table-bordered" style="width: 600px;">
			<tr>
				<td colspan="2">
					<h3><b>글수정</b></h3>
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="subject" value="${dto.subject }" class="form-control">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" class="form-control" rows="10">${dto.content}</textarea></td>
			</tr>
			<tr>
				<td>파일</td>
				<td>
					<input type="file" name="upload" multiple class="form-control">
					<c:if test="${dto.photo!='no' }">
						<br>
						현재 사진: 
						<c:forTokens var="photo" items="${dto.photo}" delims=",">
							<img alt="" src="../boardphoto/${photo}" width="100" class="img-thumbnail">
						</c:forTokens>
					</c:if>
				</td>
			</tr>
		</table>
		<button type="submit" class="btn btn-outline-info">수정</button>
		<button type="button" class="btn btn-outline-info" onclick="history.back();">취소</button>
	</form>
</div>
</body>
</html>