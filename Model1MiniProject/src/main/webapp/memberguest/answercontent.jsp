<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.AnswerGuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!-- idx를 읽어와서 해당하는 메모를 db로 부터 얻어서 json 형태로 반환 -->

<%
	String idx=request.getParameter("idx"); //프론트로부터 얻은
	AnswerGuestDao dao=new AnswerGuestDao(); //db로부터
	String content=dao.getContent(idx); //db로부터
	
	JSONObject ob=new JSONObject();
	ob.put("idx", idx);
	ob.put("story", content);
	
%>
<%=ob.toString() %>
