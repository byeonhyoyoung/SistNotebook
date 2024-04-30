<%@page import="mem_gaip.model.MemgaipDto"%>
<%@page import="mem_gaip.model.MemgaipDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
<%
	//파일 업로드를 위한 경로 설정과 용량 제한을 설정
	String realPath=getServletContext().getRealPath("/upload");
	System.out.println(realPath);
	int uploadSize=1024*1024*5; //5mb(파일 업로드 최대크기 설정)
	
	//MultipartRequest 객체를 사용하여 멀티파트 요청을 처리
	//이 객체를 생성하면 웹 어플리케이션에서 파일 업로드를 포함한 폼데이터를 처리할 수 있음
	MultipartRequest multi=null;
	
	//DefaultFileRenamePolicy: 파일 이름이 충돌하는 경우 자동으로 파일 이름을 변경하기 위해 사용
	multi=new MultipartRequest(request,realPath,uploadSize,"utf-8",new DefaultFileRenamePolicy());
	
	//dao
	MemgaipDao dao=new MemgaipDao();
	//dto 객체 생성
	MemgaipDto dto=new MemgaipDto();
	
	//폼에서 전달된 m_id파라미터값을 가져와서 dto객체의 m_id필드에 설정
	dto.setM_id(multi.getParameter("m_id")); //한번에!
	dto.setM_pass(multi.getParameter("m_pass"));
	dto.setM_hp(multi.getParameter("m_hp"));
	dto.setM_name(multi.getParameter("m_name"));
	dto.setM_num(multi.getParameter("m_num"));
	
		String photo =multi.getFilesystemName("m_photo");
		//dto.setM_photo(photo); //photo file 없으면 null값으로....
		
		if(photo==null)
        	dto.setM_photo("../image/연예인사진/noimage.png"); //사진선택 안한경우
        else
        	dto.setM_photo("../upload/"+photo); //사진선택한경우 
        //dto.setM_photo(photo); //이렇게하면 list if주석부분
        
        dao.insertMemgaip(dto);
        //성공후 목록페이지로 이동
        response.sendRedirect("memList.jsp");
		
%>
</body>
</html>