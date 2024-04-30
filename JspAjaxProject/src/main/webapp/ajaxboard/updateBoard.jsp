<%@page import="ajaxboard.AjaxBoardDao"%>
<%@page import="ajaxboard.AjaxBoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String num=request.getParameter("unum");
	String subject=request.getParameter("usubject");
	String avata=request.getParameter("uavata");
	String content=request.getParameter("ucontent");
	String writeday=request.getParameter("uwriteday");
	
	
	//dto
	AjaxBoardDto dto=new AjaxBoardDto();
	dto.setNum(num);
	dto.setSubject(subject);
	dto.setAvata(avata);
	dto.setContent(content);
	dto.setAvata(avata);
	
	//dao
	AjaxBoardDao dao=new AjaxBoardDao();
	dao.updateBoard(dto);
	
%>