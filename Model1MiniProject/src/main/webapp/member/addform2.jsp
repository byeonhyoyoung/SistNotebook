<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
   $(function(){
      
      //아이디 중복체크
      $("#btnidcheck").click(function(){
         
         //id읽기
         var id=$("#id").val();
         //alert(id);
         
      })
   })
</script>
</head>
<body>
<div style="margin: 100px 200px; width: 500px;">
   <form action="member/addaction.jsp" method="post" onsubmit="return check(this)">
      <table class="table table bordered">
         <caption align="top"><b>회원가입</b></caption>
         <tr>
            <th width="100" class="table-success">아이디</th>
            <td>
               <div class="d-inline-flex">
                  <input type="text" name="id" id="id" maxlength="8" class="form-control"
                  required="required" style="width: 120px">
                  <button type="button" class="btn btn-danger" id="btnidcheck"
                  style="margin-left: 10px;">중복체크</button>
                  <span class="idsucess" style="color: blue; margin-left: 10px;"></span>
               </div>
            </td>
         </tr>
         
         <tr>
            <th width="100" class="table-success">비밀번호</th>
            <td>
               <div class="d-inline-flex">
                  <input type="password" name="pass" class="form-control"
                  required="required" style="width: 130px" placeholder="비밀번호">
                  <input type="password" name="pass2" class="form-control"
                  required="required" style="width: 130px; margin-left: 5px;" placeholder="비밀번호확인">
               </div>
            </td>
         </tr>
         
         <tr>
            <th width="100" class="table-success">이름</th>
            <td>
               <input type="text" name="name" class="form-control" required="required" style="width: 120px;">
            </td>
         </tr>
         <tr>
            <th width="100" class="table-success">핸드폰</th>
            <td>
               <input type="text" name="hp" class="form-control" required="required" style="width: 180px;">
            </td>
         </tr>
         <tr>
            <th width="100" class="table-success">주소</th>
            <td>
               <input type="text" name="addr" class="form-control" required="required" style="width: 330px;">
            </td>
         </tr>
         <tr>
            <th width="100" class="table-success">이메일</th>
            <td>
               <div class="d-inline-flex">
               <input type="text" name="email1" class="form-control" required="required" 
               style="width: 80px;">
               <b style="margin-left: 5px;">@</b>
               <input type="text" name="email2" class="form-control" required="required"
               style="width: 120px; margin-left: 10px;">
               <select id="selemail" class="form-control" style="margin-left: 10px;">
                  <option value="-">직접입력</option>
                  <option value="naver.com">네이버</option>
                  <option value="nate.com">네이트</option>
                  <option value="gmail.com">구글</option>
                  <option value="daum.net">다음</option>
               </select>
               </div>
            </td>
         </tr>
      </table>
   </form>
</div>
</body>
</html>