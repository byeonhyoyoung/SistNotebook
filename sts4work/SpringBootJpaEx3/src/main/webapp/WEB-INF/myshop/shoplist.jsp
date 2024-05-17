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
<style type="text/css">
	.box{
	width: 30px;
	height: 30px;
	border-radius: 100px;
	
	}
</style>
</head>
<body>
	<div style="margin: 100px 100px; width: 1000px">
		<button type="button" class="btn btn-outline-info"
		onclick="location.href='writeform'">상품입력</button>
		<br><br>
		<h3 class="alert alert-success">
			<b>총 ${totalcount }개의 상품정보가 있습니다</b>
		</h3>
		
		<table class="table table-bordered">
			<tr class="table-success">
				<th width="80">번호</th>
				<th width="280">상품명</th>
				<th width="180">색상</th>
				<th width="230">가격</th>
				<th width="180">입고일</th>
				<th width="200">등록일</th>
				<th width="280">편집</th>
			</tr>
		
			<c:forEach var="dto" items="${list }" varStatus="i">
				<tr>
					<td align="center">${i.count }</td>
					<td>${dto.sangname }</td>
					<td align="center">
						<div class="box" style="background-color: ${dto.sangcolor}"></div>
					</td>
					<td align="center">
						<fmt:formatNumber value="${dto.sangprice }" type="currency"/>
					</td>
					<td>${dto.sangipgo }</td>
					<td>
						<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH시"/>
					</td>
					<td>
						<button type="button" class="btn btn-outline-info btn-sm"
						onclick="location.herf='updateform?num=${dto.num}'">수정</button>
						<button type="button" class="btn btn-outline-danger btn-sm"
						onclick="location.herf='delete?num=${dto.num}'">삭제</button>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>