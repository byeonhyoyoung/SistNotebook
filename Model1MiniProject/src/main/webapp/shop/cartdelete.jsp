<%@page import="data.dao.ShopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%
	String idx=request.getParameter("idx"); //idx읽어오기
	//Dao선언
	ShopDao dao=new ShopDao();
	//장바구니 삭제 호출
	dao.deleteCart(idx);
%>
