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
<body>

<%

	request.setCharacterEncoding("utf-8");

	String sang_name=request.getParameter("sang_name");
	String photo=request.getParameter("photo");
	int price=request.getIntHeader("price");
	String ipgoday=request.getParameter("ipgoday");
	
	QuizShopDto dto=new QuizShopDto();
	
	dto.setSang_name(sang_name);
	dto.setPhoto(photo);
	dto.setPrice(price);
	dto.setIpgoday(ipgoday);
	
	QuizShopDao dao=new QuizShopDao();
	
	dao.insertquizshop(dto);
	
	response.sendRedirect("shoplist.jsp");
	
%>
</body>
</html>