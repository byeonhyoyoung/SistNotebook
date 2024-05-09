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
  <div style="margin: 50px 100px; width: 400px;">
     <form action="update" method="post"> <!-- write 중복 제거->update로 -->
     <input type="hidden" name="num" value="${dto.num }"> <!-- dto로 저장했으니까! num hidden으로 심어놔 -->
	 <table class="table table-bordered" >
		<caption align="top"><b>고객 정보 수정</b></caption>
		<tr>
			<th width="100" class="table-light">고객명</th>
			<td width="200">
				<input type="text" name="name" style="width: 120px;"
				required="required" class="form-control"
				value="${dto.name }">
			</td>
		</tr>
		<tr>
			<th class="table-light" width="100">연락처</th>
			<td width="200">
				<input type="text" name="hp" style="width: 150px;"
				required="required" class="form-control"
				value="${dto.hp }">
			</td>
		</tr>
		<tr>
			<th class="table-light" width="100">주소</th>
			<td width="200">
				<input type="text" name="addr" style="width: 250px;"
				required="required" class="form-control"
				value="${dto.addr }">
			</td>
		</tr>		
		<tr>
			<td colspan="2" align="center">
				<button type="submit" class="btn btn-outline-success">DB수정</button>
				<button type="button" class="btn btn-outline-success"
				onclick="location.href='list'">고객목록</button>
			</td>
		</tr>
	</table>
</form>
     
  </div>
</body>
</html>