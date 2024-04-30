<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  String id=request.getParameter("id");
  MemberDao dao=new MemberDao();
  int count=dao.isIdCheck(id);
  
  //여러개 가지고올때 jsonarray임
  JSONObject ob=new JSONObject();
  ob.put("count", count);
  System.out.println(count);
%>
<%=ob.toString()%>