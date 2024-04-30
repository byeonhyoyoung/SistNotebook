<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="quizshop.model.QuizShopDao"%>
<%@page import="quizshop.model.QuizShopDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>

<%
	QuizShopDao dao=new QuizShopDao();
	List<QuizShopDto>list=dao.getAllDatas();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>
<body>
<div style="margin: 50px 50px; width: 800px;">
	<h3 class="alert alert-info">QuizShop 입고목록</h3>
	<br>
	<button type="button" class="btn btn-info">상품추가</button>
	<br>
	<table class="table table-bordered">
		<tr class="table-info" align="center">
			<th width="60">번호</th>
			<th width="200">상품명</th>
			<th width="180">상품이미지</th>
			<th width="160">가격</th>
			<th width="160">입고일</th>
		</tr>
		
		<%
			for(int i=0; i<list.size(); i++)
			{
				QuizShopDto dto=list.get(i);
				%>
				<tr>
					<td align="center"><%=i+1 %></td>
					<td><%=dto.getSang_name() %></td>
					<td><%=dto.getPhoto() %></td>
					<td><%=dto.getPrice() %></td>
					<td><%=dto.getIpgoday() %></td>
					<td><%=sdf.format(dto.getWriteday()) %></td>
					<td>
						<input type="button" class="btn btn-outline-info btn-sm"
						onclick="location.href='updateform.jsp?num=<%=dto.getNum()%>'" value="수정">
						<input type="button" class="btn btn-outline-danger btn-sm"
						onclick="funcDel(<%=dto.getNum()%>)" value="삭제">
					</td>
				</tr>
				
				
			<%}
		%>
	</table>
</div>
</body>
</html>