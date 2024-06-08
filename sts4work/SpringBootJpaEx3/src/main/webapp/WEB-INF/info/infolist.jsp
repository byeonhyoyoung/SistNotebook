<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">

   .stuimg{
      width: 40px;
      height: 40px;
      border-radius: 100px;
   }
</style>
</head>
<body>
  <div style="margin: 100px 100px;">
    <button type="button" class="btn btn-warning"
    onclick="location.href='addform'">학생정보입력</button>
    
    <br><br>
    <h5 class="alert alert-warning">${count }명의 학생정보가 있습니다</h5>
    
    <table class="table table-bordered" style="width: 1000px;">
       <tr class="table-success">
          <th width="80">번호</th>
          <th width="150">학생명</th>
          <th width="180">사진</th>
          <th width="280">연락처</th>
          <th width="380">주소</th>
          <th width="180">편집</th>
       </tr>
      
      <!-- var 속성은 현재 요소를 참조할 변수를 지정한다 -->
      <!-- items 속성은 반복할 컬렉션을 지정한다 -->
      <!-- varStatus 속성은 반복 상태를 저장할 변수를 지정한다 -->
      <c:forEach  var="dto" items="${list }" varStatus="i">
         <tr>
           <td>${i.count }</td>
           <td>${dto.stuname }</td>
           <td>
              <img alt="" src="../${dto.stuphoto }" class="stuimg">
           </td>
           <td>${dto.stuhp }</td>
           <td>${dto.stuaddr }</td>
           <td>
           	<button type="button" class="btn btn-outline-info btn-sm" 
             onclick="location.href='updateform?num=${dto.num}'">수정</button>
             <button type="button" class="btn btn-outline-danger btn-sm" 
             onclick="location.href='delete?num=${dto.num}'">삭제</button>
           </td>
         </tr>
      </c:forEach>
    </table>
  </div>
</body>
</html>

<!-- 

c:forEach 태그 설명

items="${list}":
이 부분에서 list는 컨트롤러에서 모델에 추가된 list 데이터를 의미합니다. 즉, List<InfoDto> 객체를 참조합니다.
JSP 페이지가 렌더링될 때, 모델에 추가된 list 객체가 c:forEach 태그의 items 속성으로 전달됩니다.

var="dto":
dto는 반복 중인 현재 요소를 참조하는 변수입니다. list에 있는 각 InfoDto 객체를 dto 변수에 할당합니다.

varStatus="i":
i는 반복 상태를 저장하는 변수입니다. 현재 반복의 인덱스나 상태를 추적하는 데 사용됩니다. 

요약

컨트롤러에서 데이터 준비:
컨트롤러에서 list라는 이름으로 List<InfoDto> 객체를 모델에 추가합니다.
ModelAndView 객체를 통해 뷰 이름과 함께 데이터를 반환합니다.

JSP에서 데이터 사용:
c:forEach 태그를 사용하여 모델에 추가된 list 데이터를 반복 처리합니다.
각 InfoDto 객체는 dto 변수에 할당되고, 반복 상태는 i 변수에 저장됩니다.
따라서, JSP 페이지에서 items="${list}"는 컨트롤러에서 모델에 추가한 list 데이터를 반복하여 출력하는 것입니다. 
이 방식으로 컨트롤러와 뷰 사이에서 데이터를 주고받을 수 있습니다.

-->