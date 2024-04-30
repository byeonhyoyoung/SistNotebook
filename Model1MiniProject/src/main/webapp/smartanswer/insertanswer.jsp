<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- json은 다 지우기 -->
<!-- get방식하려고 엔코딩안함 contentview $.ajax확인 -->
    
<jsp:useBean id="dao" class="data.dao.SmartAnswerDao"/>
<jsp:useBean id="dto" class="data.dto.SmartAnswerDto"/>
<jsp:setProperty property="*" name="dto"/>
<%
   dao.insertAnswer(dto);
%>