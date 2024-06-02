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
	.nav ul {
		list-style-type: none; /* 리스트 점 없애기 */
		display: flex;
	}
	
	.nav ul a {
	   display: block;
	   color: gray;
	   text-decoration: none;
	   font-weight: 700;
	   font-size: 25px;
	   line-height: 32px;
	   padding: 0 15px;
	}
	
	.linkgo {
	   display: flex;
	   text-decoration: none;
	   font-size: 30px;
	   align-items: center;
	}
	
	.container {
		display: flex;
		align-items: center; /* 세로 가운데 정렬 */
	}
	
	.container h2 {
        display: inline-block;
        color: black;
    }
    
    .hot {
    	color: blue;
    }
    
    .wrap_title a {
    	text-decoration: none;
    	color: black;
    	font-size: 30px;
    }
    
    .list_story li {
    	list-style-type: none;
    	font-size: 28px;
    	padding-bottom: 30px;
    }
    
    .list_story a {
    	text-decoration: none;
    	color: black;
    }
</style>
</head>
<body>
<nav class="nav" style="margin-top: 100px; margin-left: 100px;">
	<ul>
		<a class="nav-link"  href="#">홈</a>
	    <a class="nav-link" href="#">현직자 인터뷰</a>
	</ul>
</nav>


<div style="width: 1200px; margin: 50px 100px;">
	<div class="container">
        <div class="linkgo d-flex justify-content-between" style="width: 100%;">
            <a href="">
                <h2>
                    <b>실시간 전체글 ${totalCount }개<i class="bi bi-chevron-right"></i></b>
                </h2>
            </a>
            <form class="d-flex" role="search" style="margin-right: 5px;">
                <input class="form-control me-2" type="search" placeholder="다른 사람들은 어떤 이야기를 할까?" aria-label="Search"
                style="width: 300px;">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
    
	<div class="section_inner">
		<div class="wrap_title d-flex justify-content-between" style="margin-top: 70px; margin-left: 40px;">
			<a href="#">
				<b class="hot">HOT</b> 이번주 전체 인기글
			</a>
			<a href="#" style="margin-right: 50px;">더보기<i class="bi bi-chevron-right"></i></a>
		</div>
		<ul class="list_story" style="margin-top: 40px;">
			<c:forEach var="dto" items="${list }">
				<li><a href="#">${dto.sangpum }</a></li>
			</c:forEach>
		</ul>
	</div>
</div>	

<%-- <table class="table table-bordered">
   <caption align="top"><b>
     <span style="float: right;"><button type="button" class="btn btn-outline-success"
     onclick="location.href='writeform'">게시글 작성</button></span>
   </b></caption>
   
   <c:forEach var="dto" items="${list }">
      <tr>
         <td width="250" rowspan="4">
           <c:if test="${dto.photoname!='no' }">
              <c:forTokens var="pn" items="${dto.photoname }" delims="," begin="0" end="0">
                 <a href="../ipgoimage/${pn }">
                   <img alt="" src="../ipgoimage/${pn }" style="width: 150px;">
                 </a>
              </c:forTokens>
           </c:if>
           
           <c:if test="${dto.photoname=='no' }">
              <a href="../image/noimage.jpg">
               <img alt="" src="../image/noimage.jpg" style="width: 150px;">
              </a>   
           </c:if>
         </td>
         <td>
           <b>상품명: ${dto.sangpum }</b>
         </td>
      </tr>
      
      <tr>
        <td>
          <b>단가: <fmt:formatNumber value="${dto.price }" type="currency"/></b>
        </td>
      </tr>
      <tr>
        <td>
          <b>입고일: <fmt:formatDate value="${dto.ipgoday }" pattern="yyyy년 MM월 dd일"/></b>
        </td>
      </tr>
      
      <tr>
        <td>
          <button type="button" class="btn btn-outline-info"
          onclick="location.href='updateform?num=${dto.num}'">수정</button>
          <button type="button" class="btn btn-outline-info"
          onclick="location.href='delete?num=${dto.num}'">삭제</button>
        </td>
      </tr>
   </c:forEach>
</table>

</div> --%>
</body>
</html>