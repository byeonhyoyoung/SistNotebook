<%@page import="data.dao.MemberDao"%>
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
<body>
<!-- loginform.jsp로 부터... -->
<%
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	String cbsave=request.getParameter("cbsave"); //체크안하면 null
	
	MemberDao dao=new MemberDao();
	boolean b=dao.isIdPass(id, pass);
	
	//id,pass비교해서 맞으면 세션3개저장 로그인메인
	if(b){ //맞으면
		session.setMaxInactiveInterval(60*60*8); //8시간동안 세션유지..생략시 30분(디폴트로 깔려있음)
		
		session.setAttribute("loginok", "yes"); //yes or ok!
		session.setAttribute("myid", id);
		session.setAttribute("saveok", cbsave==null?null:"yes"); //체크안하면 널이다 아니면?yes
				
		response.sendRedirect("../index.jsp?main=login/loginmain.jsp");
	}else{
		%>
		<script type="text/javascript">
			alert("아이디 또는 비번이 맞지않습니다");
			history.back(); //-->loginmain.jsp로 이동
		</script>
	<%}
	
%>
</body>
</html>