<%@page import="mem_gaip.model.MemgaipDao"%>
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
<%
	//num, pass 둘 다 받기
	String m_num=request.getParameter("m_num");
	  String m_pass=request.getParameter("m_pass");
	  
	  MemgaipDao dao=new MemgaipDao();
	  
	  boolean check=dao.isEqualPass(m_num, m_pass);
	  
	  //맞으면 삭제후 목록 틀리면 경고창
	  if(check)
	  {
		  dao.deleteMemgaip(m_num);
		  response.sendRedirect("memList.jsp");
	  }else{%>
		  <script type="text/javascript">
		    alert("비밀번호가 맞지않습니다");
		    history.back();
		  </script>
			
	  <%}
	
	
%>
<body>
</body>
</html>