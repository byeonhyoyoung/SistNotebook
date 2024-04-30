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
    // 한글 처리를 위한 인코딩 설정
    request.setCharacterEncoding("UTF-8");

    // 상품 등록 페이지에서 전송된 데이터 받기
    String sang_name = request.getParameter("sang_name");
    String photo = request.getParameter("photo");
    int price = Integer.parseInt(request.getParameter("price"));
    String ipgoday = request.getParameter("ipgoday");

    // 받은 데이터를 QuizShopDto에 설정
    QuizShopDto dto = new QuizShopDto();
    dto.setSang_name(sang_name);
    dto.setPhoto(photo);
    dto.setPrice(price);
    dto.setIpgoday(ipgoday);

    // QuizShopDao를 사용하여 데이터베이스에 데이터 저장
    QuizShopDao dao = new QuizShopDao();
    dao.insertquizshop(dto);

    // 상품 등록이 완료되면 상품 목록 페이지로 리다이렉트
    response.sendRedirect("shoplist.jsp");
%>
</body>
</html>