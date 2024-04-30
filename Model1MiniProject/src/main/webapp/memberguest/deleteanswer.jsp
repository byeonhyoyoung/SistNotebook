<%@page import="data.dao.AnswerGuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%
	String idx=request.getParameter("idx");
	AnswerGuestDao dao=new AnswerGuestDao();
	dao.deleteAnswer(idx);
	
	
	//이동안하니까 response 놉
%>
