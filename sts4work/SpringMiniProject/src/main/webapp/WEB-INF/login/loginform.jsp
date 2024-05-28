<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<div style="margin: 50px 100px;">
	<!-- <h1>로그인폼</h1> -->
		<form action="insert" method="post" enctype="multipart/form-data" onsubmit="return check()">
        <table class="table table-bordered" style="width: 600px;">
           <caption align="top"><b>로그인폼</b></caption>
           <tr>
             <td style="width: 250px;" align="center" rowspan="4">
               <input type="file" name="myphoto" id="myphoto" style="display: none;">
             </td>
             <td>
           
             </td>
           </tr>
          
           <tr>
             <td colspan="2" align="center">
               <button type="submit" class="btn btn-info" style="width: 200px;">회원가입</button>
             </td>
           </tr>
        </table>
     </form>
</div>
</body>
</html>