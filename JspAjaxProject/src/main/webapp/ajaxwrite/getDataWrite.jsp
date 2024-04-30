<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="ajaxwrite.model.AjaxWriteDto"%>
<%@page import="ajaxwrite.model.AjaxWriteDao"%>
<%@page import="ajaxboard.AjaxBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//num읽기
	String num=request.getParameter("num");
	//dao선언
	AjaxWriteDao dao=new AjaxWriteDao();
	//num에 해당하는 dto얻기
	AjaxWriteDto dto=dao.getData(num);
	//날짜타입은 문자열로 지정해주기
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	//dto를 json으로 변환
	JSONObject ob=new JSONObject();
	
	
	//json에 데이터 추가
	ob.put("num", dto.getNum());
	ob.put("writer", dto.getWriter());
	ob.put("subject", dto.getSubject());
	ob.put("story", dto.getStory());
	ob.put("image", dto.getImage());
	ob.put("likes", dto.getLikes());
	ob.put("writeday", sdf.format(dto.getWriteday()));
	
	/* mainPage.jsp s+="<td num="+elt.num+">"+elt.subject+"</td>"; */
	
%>

<%=ob.toString()%>