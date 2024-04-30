<%@page import="data.dao.AnswerGuestDao"%>
<%@page import="data.dto.AnswerGuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
  
 <%
 	request.setCharacterEncoding("utf-8");
 	//data읽어서 dto넣기
 	AnswerGuestDto dto=new AnswerGuestDto();
 	dto.setNum(request.getParameter("num"));
 	dto.setMyid(request.getParameter("myid"));
 	dto.setContent(request.getParameter("content"));
 	
 	//페이지 번호 읽기
 	String currentPage=request.getParameter("currentPage");
 	
 	//db에 저장
 	AnswerGuestDao dao=new AnswerGuestDao();
 	dao.insertAnswer(dto);
 	
 	//비동기 방식이 아니므로
 	//다시보던페이지로 이동
 	response.sendRedirect("../index.jsp?main=memberguest/guestlist.jsp?currentPage="+currentPage);
 %>
 
<%-- <jsp:useBean id="dao" class="data.dao.AnswerGuestDao"/>
<jsp:useBean id="dto" class="data.dto.AnswerGuestDto"/>
<jsp:setProperty property="*" name="dto"/> --%>

