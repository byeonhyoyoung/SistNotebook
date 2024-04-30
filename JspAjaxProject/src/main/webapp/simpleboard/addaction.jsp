<%@page import="simpleboard.model.SimpleBoardDao"%>
<%@page import="simpleboard.model.SimpleBoardDto"%>
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
<%-- <%
	request.setCharacterEncoding("utf-8");
	
	// 사용자가 입력한 데이터 가져오기
	String writer=request.getParameter("writer");
	String subject=request.getParameter("subject");
	String pass=request.getParameter("pass");
	String content=request.getParameter("content");
	
	// SimpleBoardDto 객체 생성 및 데이터 설정(dto에 담기)
	SimpleBoardDto dto=new SimpleBoardDto();
	
	dto.setWriter(writer);
	dto.setSubject(subject);	
	dto.setPass(pass);
	dto.setContent(content);
	
	// SimpleBoardDao 객체 생성
	SimpleBoardDao dao=new SimpleBoardDao();
	
	// 데이터베이스에 새로운 게시물 추가
	dao.insertSimpleBoard(dto);
	
	// 게시물 추가 후, 어디론가 이동할 수 있도록 설정 (예: 목록 페이지로 이동)
	response.sendRedirect("boardlist.jsp");
	
%> --%>

<%
  request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dao" class="simpleboard.model.SimpleBoardDao"/>
<jsp:useBean id="dto" class="simpleboard.model.SimpleBoardDto"/>
<jsp:setProperty property="*" name="dto"/>
<%
  dao.insertBoard(dto);

//목록
//response.sendRedirect("boardlist.jsp");
//인서트후 내용보기로 이동하려면 방금 insert된 num값을 알아야한다
int num=dao.getMaxNum();
response.sendRedirect("contentview.jsp?num="+num);

%>
</body>
</html>