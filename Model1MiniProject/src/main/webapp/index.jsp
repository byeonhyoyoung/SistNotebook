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
<style type="text/css">
	div.layout{
		border: 0px solid gray;
		position: absolute;		
	}
	
	div.title{
		width: 100%;
		height: 80px;
		line-height: 80px;
		font-size: 30pt;
		font-family: 'Noto Sans KR';
		text-align: center;
		top: 0px;
		
	}
	
	div.menu{
		width: 100%;
		height: 80px;
		line-height: 80px;
		font-size: 20px;
		font-family: 'Noto Sans KR';
		text-align: center;
		top: 160px;
	}
	
	div.info{
		width: 230px;
		height: 300px;
		line-height: 10px;
		font-size: 10pt;
		font-family: 'Noto Sans KR';
		left: 50px;
		top: 300px;
		border: 5px groove purple;
		border-radius: 30px;
		padding: 20px 20px;
		
	}
	
	div.main{
		width: 2000px;
		height: 700px;
		font-size: 15pt;
		font-family: 'Noto Sans KR';
		left: 300px;
		top: 300px;
		
	}
</style>
</head>
<%
  String mainPage="layout/main.jsp"; //기본페이지
  
  //url을 통해서 main값을 읽어서 메인페이지에 출력한다
  if(request.getParameter("main")!=null)
  {
	  mainPage=request.getParameter("main"); //body로 쓰면..
  }
%>
<body>
<div class="layout title">
   <jsp:include page="layout/title.jsp"/>
</div>
<div class="layout menu">
   <jsp:include page="layout/menu.jsp"/>
</div>
<div class="layout info">
   <jsp:include page="layout/info.jsp"/> <!-- 정적 -->
</div>
<div class="layout main">
   <jsp:include page="<%=mainPage %>"/> <!-- 동적인 방식 -->
   
   <!-- mainPage변수는 URL파라미터를 통해 받아온 값을 저장하고 있으므로,
   사용자의 요청에 따라 동적으로 다른 페이지를 포함시킬 수 있음 -->
</div>
</body>
</html>