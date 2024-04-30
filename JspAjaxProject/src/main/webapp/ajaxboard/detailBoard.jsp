<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="ajaxboard.AjaxBoardDao"%>
<%@page import="ajaxboard.AjaxBoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
	//num 읽기
	String num=request.getParameter("num");
	//dao선언
	AjaxBoardDao dao=new AjaxBoardDao();
	//num에 해당하는 dto얻기
	AjaxBoardDto dto=dao.getData(num);
	
	//dto를 json으로 변환
	JSONObject ob=new JSONObject();
	//날짜타입은 문자열로 지정해주기(그렇지 않으면 오류발생)
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");
	
	//json에 데이터 추가
	ob.put("num", dto.getNum());
	ob.put("writer", dto.getWriter());
	ob.put("subject", dto.getSubject());
	ob.put("content", dto.getContent());
	ob.put("avata", dto.getAvata());
	ob.put("writeday", sdf.format(dto.getWriteday()));
	
%>

<%=ob.toString()%>
